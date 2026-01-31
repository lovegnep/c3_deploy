x800144_var_ScriptId = 800144

--任务文本描述
x800144_var_MissionName="扑克铭刻"




--道具消耗表
--probability1 出1张牌的权重， probability2 出2张牌的权重
x800144_var_CostTable = {
                            { itemid=11970018, itemname="浮世印", probability1=60,   probability2=40,   needmoney=58000 },
                            
                 
                        }


--扑克牌型花色随机表
--value --对应值，花色（0，表示红桃；1表示黑桃；2表示方块；3表示梅花）
--probability --权重
x800144_var_PokerCardColorTable = {
                                    { value = 0, probability = 3 },
                                    { value = 1, probability = 3 },
                                    { value = 2, probability = 3 },
                                    { value = 3, probability = 3 },
                                  } 
                                  
--扑克牌型数字随机表
--数字（1，表示A；2表示2.。。。13表示K）
--probability --权重
x800144_var_PokerCardNumTable =    {
                                   { value = 1, probability = 2 },
                                    { value = 2, probability = 2 },
                                    { value = 3, probability = 2 },
                                    { value = 4, probability = 2 },
                                    { value = 5, probability = 2 },
                                    { value = 6, probability = 2 },
                                    { value = 7, probability = 2 },
                                    { value = 8, probability = 2 },
                                    { value = 9, probability = 2 },
                                    { value = 10, probability = 2 },
                                    { value = 11, probability = 2 },
                                    { value = 12, probability = 2 },
                                    { value = 13, probability = 2 }
                                }
          
x800144_var_PokerCardColorMaxRandNum = nil 
x800144_var_PokerCardNumMaxRandNum = nil

x800144_var_PokerRandAttrTableCount = nil
x800144_var_PokerRandAttrTable = nil

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x800144_ProcEventEntry( varMap, varPlayer, targetId )	--点击该任务后执行此脚本
end

--**********************************
--列举事件
--**********************************
function x800144_ProcEnumEvent( varMap, varPlayer, targetId, MissionId )
	TalkAppendButton(varMap,x800144_var_ScriptId,x800144_var_MissionName,3);
end


function x800144_ProcItemWanfa( varMap, varPlayer, varWanfaType )
		
		local wanfaDataTable = GetItemWanfaData( varMap )
		local dataCount = getn( wanfaDataTable )
		
		if dataCount ~= 5 then
				WriteLog( 1, format("x800144_ProcItemWanfa param count invalid! varMap=%d,PlayerGUID=%X,paramCount=%d",varMap,GetGUID(varMap,varPlayer),dataCount));			
				return
		end
		
		------------------------------------------
		local itemSerial = wanfaDataTable[1] --物品序列
		local itemServer = wanfaDataTable[2] --物品MapServerId
		local itemWorld = wanfaDataTable[3]  --物品WorldId
		local bagPos = wanfaDataTable[4];    --装备位置	
		local needitemid = wanfaDataTable[5]; --消耗道具id
		------------------------------------------
		
		--检查物品是否合法
		if IsItemValid( varMap, varPlayer, bagPos ) == 0 then
				WriteLog( 1, format("x800144_ProcItemWanfa item invalid! varMap=%d,PlayerGUID=%X, bagPos=%d",varMap,GetGUID(varMap,varPlayer),bagPos));			
				return
		end
		
		--检查物品SNID是否和客户端发过来的一致
		local serial,server,world = GetItemProperty( varMap, varPlayer, bagPos, "SNID" );
		if serial ~= itemSerial or server ~= itemServer or itemWorld ~= world then
				WriteLog( 1, format("x800144_ProcItemWanfa item snid invalid! varMap=%d,PlayerGUID=%X,C1=%d,C2=%d,C3=%d,S1=%d,S2=%d,S3=%d",varMap,GetGUID(varMap,varPlayer),itemSerial,itemServer,itemWorld,serial,server,world) );			
				return
		end
		
		--检查物品是否是装备
		local itemClass = GetItemProperty( varMap, varPlayer, bagPos, "ItemClass" );
		if itemClass ~= ICLASS_EQUIP then
			 return
		end
		
		--检查物品是否可以扑克铭刻
	
        --1. 手镯，戒指，携带等级不小于100级
        --2，披风，徽章携带等级不小于75级
        --3. 除时装，掌门牌，玉佩，护身符其他装备点，携带等级不小于110级
		local equipPoint = GetEquipProperty( varMap, varPlayer, bagPos, "EquipPoint" );
		local nEquipLevel = GetEquipProperty( varMap, varPlayer, bagPos, "NeedLevel" )
		
        local bEquipCanPokerBind = 0
            
        if equipPoint == HEQUIP_RING1 or equipPoint == HEQUIP_RING2 or equipPoint == HEQUIP_ADORN1 or
            equipPoint == HEQUIP_ADORN2 then
            
            if  nEquipLevel >=100 then
                bEquipCanPokerBind = 1         
            end
        
        elseif equipPoint == HEQUIP_SHOULDER or equipPoint == HEQUIP_NECK then
            if  nEquipLevel >= 75 then
                bEquipCanPokerBind = 1  
            end
        elseif( equipPoint < HEQUIP_ADORN2 ) then
		     if nEquipLevel >= 110 then
		         bEquipCanPokerBind = 1  
		     end
		end
		 
		 if bEquipCanPokerBind == 0 then
		    NotifyItemWanfa( varMap, varPlayer, varWanfaType, -1 )
		    return
		 end
		
		--检查玩家是否有消耗材料
		local costInfo = nil
		for i, item in x800144_var_CostTable do
		    if item.itemid == needitemid then
		        costInfo = item
		        break;
		    end	
		end
		
		if costInfo == nil then
		     NotifyItemWanfa( varMap, varPlayer, varWanfaType, -2 )
		     --Msg2Player( varMap, varPlayer, "非法道具！", 0, 3 )
			 --Msg2Player( varMap, varPlayer, "非法道具！", 0, 2 )
			 return
		end
		
		
		if HaveItemInBagNew( varMap, varPlayer, costInfo.itemid ) <= 0 then
			 --Msg2Player( varMap, varPlayer, "@item_"..costInfo.itemid.."#cffcf00不足！", 0, 3 );
			 --Msg2Player( varMap, varPlayer, "@item_"..costInfo.itemid.."#cffcf00不足！", 0, 2 );
			 NotifyItemWanfa( varMap, varPlayer, varWanfaType, -3 )
			 return
		end
		
		--钱是否足够
    	if costInfo.needmoney > 0 and IsEnoughMoney( varMap, varPlayer, costInfo.needmoney ) == 0 then
		     --Msg2Player( varMap, varPlayer, "金钱不足！", 0, 3 )
			 --Msg2Player( varMap, varPlayer, "金钱不足！", 0, 2 )
			 NotifyItemWanfa( varMap, varPlayer, varWanfaType, -4 )
			 return
	    end
		
		
		--随机扑克牌个数
		local pokerCount = 0
		local maxRandNum = costInfo.probability1 + costInfo.probability2
		local rand = random( 1, maxRandNum )
		if rand <= costInfo.probability1 then
		    pokerCount = 1
		else
		    pokerCount = 2
		end
		
		
		local nEquipType = GetEquipProperty( varMap, varPlayer, bagPos, "EquipType" )
		
		
		
		--随机扑克牌牌型 和 属性
		local Cards = { { -1, -1, -1, -1 },{-1,-1,-1,-1} }
		
		for i = 1, pokerCount do
    	    Cards[i][1], Cards[i][2] = x800144_RandCard()
		    if Cards[i][2] ~= nil then
    	        Cards[i][3],Cards[i][4] = x800144_RandAttr( nEquipType, Cards[i][2] );
    	    end
    	end
			
	          
	    --验证随机出来数据是否正确             
	    for i = 1, pokerCount do
	        
	        for j = 1, 4 do
    	        if Cards[i][j] == -1 then
        	            
        	           WriteLog( 1, format("x800144_ProcItemWanfa Result Error! CardCount=%d,Card1=%d,%d,%d,%d,Card2=%d,%d,%d,%d",
    	                 pokerCount,Cards[1][1],Cards[1][2],Cards[1][3],Cards[1][4],
    	                 Cards[2][1],Cards[2][2],Cards[2][3],Cards[2][4] ) );
    	                
    	                return
        	    end
	        end
	    end
	        
	    --for debug
	    --  WriteLog( 1, format("x800144_ProcItemWanfa Result ! CardCount=%d,Card1=%d,%d,%d,%d,Card2=%d,%d,%d,%d",
    	--                 pokerCount,Cards[1][1],Cards[1][2],Cards[1][3],Cards[1][4],
    	--                Cards[2][1],Cards[2][2],Cards[2][3],Cards[2][4] ) );
		
		--计算完毕，先消耗物品
		if DelItem( varMap, varPlayer, costInfo.itemid, 1) == 0 then
			 --Msg2Player( varMap, varPlayer, "扑克铭刻失败！", 0, 3 );
			 NotifyItemWanfa( varMap, varPlayer, varWanfaType, -5 )
			 WriteLog(1, format("x800144_ProcItemWanfa DelItem failed! varMap=%d,PlayerGUID=%X",varMap,GetGUID(varMap,varPlayer) ))
			 return
		end
		
		--消耗金钱
		local varRet, varType = SpendMoney( varMap, varPlayer, costInfo.needmoney )
    	if varRet == -1 then
    		--Msg2Player( varMap, varPlayer, "扑克铭刻失败！", 0, 3 );
    		NotifyItemWanfa( varMap, varPlayer, varWanfaType, -5 )
    		WriteLog(1, format("x800144_ProcItemWanfa SpendMoney failed! varMap=%d,PlayerGUID=%X",varMap,GetGUID(varMap,varPlayer) ))
    		return
    	end
		
		--设置物品属性
		local result = 0
		result = ClearEquipPoker( varMap, varPlayer, bagPos )
		if result == 1 then
    		result = SetEquipPokerCount( varMap, varPlayer, bagPos, pokerCount )
    		for i = 1, pokerCount do
    		    if result == 1 then
    		        result = SetEquipPokerData( varMap, varPlayer, bagPos, i-1, Cards[i][1],Cards[i][2],Cards[i][3],Cards[i][4] )
    		    end
     		end
        end
		
		
		if result == 0 then
			 --Msg2Player( varMap, varPlayer, "扑克铭刻失败！", 0, 3 );
			 NotifyItemWanfa( varMap, varPlayer, varWanfaType, -5 )
			 WriteLog(1, format("x800144_ProcItemWanfa SetEquipPokerData failed! varMap=%d,PlayerGUID=%X",varMap,GetGUID(varMap,varPlayer) ))
			 return
		end
		
		
		BindItem( varMap, varPlayer, bagPos ) --设置装备为绑定
		
		--刷新客户端
		NotifyItemInfo( varMap, varPlayer, bagPos )
		
		
		for i = 1, 2 do
            for j = 1, 4 do
    	        if Cards[i][j] == -1 then
           	          Cards[i][j] = 0
        	    end
	        end
	    end
		local wanfa_result = pokerCount * 1000000 + Cards[1][1] * 100000 + Cards[1][2] * 1000 + Cards[2][1] * 100 + Cards[2][2]
		
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, wanfa_result )
		
		--Msg2Player( varMap, varPlayer, "扑克铭刻成功！", 0, 3 );
		--Msg2Player( varMap, varPlayer, "扑克铭刻成功！", 0, 2 );
		
end


--随机得到扑克牌
function x800144_RandCard()

    if x800144_var_PokerCardColorMaxRandNum == nil then
    
        x800144_var_PokerCardColorMaxRandNum = 0
        for i, item in x800144_var_PokerCardColorTable do
            x800144_var_PokerCardColorMaxRandNum = x800144_var_PokerCardColorMaxRandNum + item.probability
        end
    
    end
     
    if x800144_var_PokerCardNumMaxRandNum == nil then
        
        x800144_var_PokerCardNumMaxRandNum = 0
        for i, item in x800144_var_PokerCardNumTable do
            x800144_var_PokerCardNumMaxRandNum = x800144_var_PokerCardNumMaxRandNum + item.probability
        end
    end
    
    
    local card_color = -1
    local card_num = -1
    
    --随机花色
    local rand = random( 1, x800144_var_PokerCardColorMaxRandNum )
    local range = 0
    for i, item in x800144_var_PokerCardColorTable do
    
        if rand > range and rand <= range + item.probability then
            
            card_color = item.value
            break
        
        end
        
        range = range + item.probability
        
    end
        
    
    --随机牌型
    rand = random( 1, x800144_var_PokerCardNumMaxRandNum )
    range = 0
    for i, item in x800144_var_PokerCardNumTable do
    
        if rand > range and rand <= range + item.probability then
        
            card_num = item.value;
            break;
        
        end
    
        range = range + item.probability
    end
    
    
    return card_color, card_num

end


--随机得到扑克牌附属属性
function x800144_RandAttr( nEquipType, nCardNum )

    if x800144_var_PokerRandAttrTableCount == nil then
        x800144_var_PokerRandAttrTableCount = GetTableRecordCount( TAB_FILE_POKER_ATTR_RAND )
    end
    
    if x800144_var_PokerRandAttrTable == nil then
       x800144_var_PokerRandAttrTable = {}
       for i = 1, x800144_var_PokerRandAttrTableCount do
            x800144_var_PokerRandAttrTable[i] = GetTableRecordByIndex( TAB_FILE_POKER_ATTR_RAND, i - 1 )
       end
    end


    local randMax = 0
    local validAttrMap = {}
    local strTargetStr = format("|%d|",nEquipType)
    for i, item in x800144_var_PokerRandAttrTable do
        local s,repCount = gsub( tostring(item[2]), strTargetStr,  "" )
         
        if( repCount == 0 ) then
            validAttrMap[i] = 1    
            randMax = randMax + item[3]            
        else
            validAttrMap[i] = 0        
        end
    end

    if randMax == 0 then
        return -1, -1
    end

    local randNum = random(1,randMax)
    local selIndex = -1
    
    local range = 0
    for i, item in x800144_var_PokerRandAttrTable do
        
        if randNum > range and randNum <= range + item[3] then
            
            selIndex = i;
            break;
             
        end
        
        range = range + item[3]
    
    end
    
    
    if selIndex == -1 then
        return -1, -1
    end
    
    
    local attrId = x800144_var_PokerRandAttrTable[selIndex][1]
    local attrValue = x800144_var_PokerRandAttrTable[selIndex][3+nCardNum]
    
    return attrId, attrValue
    
end


