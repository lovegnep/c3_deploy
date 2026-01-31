--装备转职脚本

--DECLARE_QUEST_INFO_START--

x570045_var_FileId = 570045




x570045_CostInfo = {
                            { needItem=11000599, money=10000 }, --原有70级1对1装备转职消耗
                            { needItem=12240014, money=10000 }, --全职装备转职删除源装备消耗
                            { needItem=12240015, money=10000 }, --全职装备转职不删源装备消耗
                   }

-- 职业转换对照表
x570045_ProfessionTable = {
                            { professionA = 0, professionB = 6  }, 
                            { professionA = 1, professionB = 7  }, 
                            { professionA = 2, professionB = 8  }, 
                            { professionA = 3, professionB = 9  }, 
                            { professionA = 4, professionB = 10 }, 
                            { professionA = 5, professionB = 11 }, 
                          }


x570045_var_QuestName="装备转换"

--DECLARE_QUEST_INFO_STOP--



function x570045_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x570045_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x570045_var_FileId,x570045_var_QuestName,3);
end


function x570045_ProcItemWanfa( varMap, varPlayer, varWanfaType )

        local wanfaDataTable = GetItemWanfaData( varMap )
		local dataCount = getn( wanfaDataTable )
		
		if dataCount ~= 6 then
				WriteLog( 1, format("x570045_ProcItemWanfa param count invalid! varMap=%d,PlayerGUID=%X,paramCount=%d",varMap,GetGUID(varMap,varPlayer),dataCount));			
				return
		end
		
		------------------------------------------
		local itemSerial = wanfaDataTable[1] --物品序列
		local itemServer = wanfaDataTable[2] --物品MapServerId
		local itemWorld = wanfaDataTable[3]  --物品WorldId
		local nMode = wanfaDataTable[4]      --模式，1 = 老式1v1转换， 2 = 新式全职转换删源装备 3 = 新式全职转换不删源装备
		local bagPos = wanfaDataTable[5];    --装备位置	
		local nTargetProfession = wanfaDataTable[6] --目标职业，全职转换才用
		------------------------------------------
		
		if nMode ~= 1 and nMode ~= 2 and nMode ~= 3 then
		    WriteLog( 1, format("x570045_ProcItemWanfa nMode invalid! varMap=%d,PlayerGUID=%X,nMode=%d",varMap,GetGUID(varMap,varPlayer),nMode));			
			return		
		end
		
		local cost = x570045_CostInfo[ nMode ] 
		
		--检查物品是否合法
		if IsItemValid( varMap, varPlayer, bagPos ) == 0 then
				WriteLog( 1, format("x570045_ProcItemWanfa item invalid! varMap=%d,PlayerGUID=%X, bagPos=%d",varMap,GetGUID(varMap,varPlayer),bagPos));			
				return
		end
		
		--检查物品SNID是否和客户端发过来的一致
		local serial,server,world = GetItemProperty( varMap, varPlayer, bagPos, "SNID" );
		if serial ~= itemSerial or server ~= itemServer or itemWorld ~= world then
				WriteLog( 1, format("x570045_ProcItemWanfa item snid invalid! varMap=%d,PlayerGUID=%X,C1=%d,C2=%d,C3=%d,S1=%d,S2=%d,S3=%d",varMap,GetGUID(varMap,varPlayer),itemSerial,itemServer,itemWorld,serial,server,world) );			
				return
		end
		
		--检查物品是否是装备
		local itemClass = GetItemProperty( varMap, varPlayer, bagPos, "ItemClass" );
		if itemClass ~= ICLASS_EQUIP then
			 return
		end
		
		--全职转职只能转换已绑定装备
        if nMode == 2 or nMode == 3 then
            
            if GetItemProperty( varMap, varPlayer, bagPos, "ItemBindType" ) == 0 then
                Msg2Player( varMap, varPlayer, "这里只能转换已绑定装备！", 0, 3 )
		        Msg2Player( varMap, varPlayer, "这里只能转换已绑定装备！", 0, 2 )
		        return        
            end
        
        end
        
        --不删源装备模式下不能转换戒指手镯
        if nMode == 3 then
            local EquipPoint = GetEquipProperty( varMap, varPlayer, bagPos, "EquipPoint" )
            if EquipPoint >= 10 and EquipPoint <= 13 then
                Msg2Player( varMap, varPlayer, "该模式下不能转换戒指和手镯！", 0, 3 )
    		    Msg2Player( varMap, varPlayer, "该模式下不能转换戒指和手镯！", 0, 2 )
                return
            end
        end
        
        
        -- 背包剩余空间
        if GetBagSpace(varMap, varPlayer) <= 0 then
        	Msg2Player( varMap, varPlayer, "背包剩余空间不足", 0, 3 )
        	Msg2Player( varMap, varPlayer, "背包剩余空间不足", 0, 2 )
            return
        end
	    
	    --找到装备对应职业 
	    local nEquipProfession = GetEquipProperty( varMap, varPlayer, bagPos, "Profession" )
	    if nEquipProfession < 0 or nEquipProfession > 11 then
	        Msg2Player( varMap, varPlayer, "该装备不能转换！", 0, 3 )
			Msg2Player( varMap, varPlayer, "该装备不能转换！", 0, 2 )
    		return        
	    end
	    
	    if nMode == 1 then
    	    for i, item in x570045_ProfessionTable do
    	        if item.professionA == nEquipProfession then
                    nTargetProfession = item.professionB
    	            break;
    	        elseif item.professionB == nEquipProfession then
    	            nTargetProfession = item.professionA
    	            break;
    	        end
    	    end
    	end
    	
    	if( nTargetProfession < 0 or nTargetProfession > 11 ) then
    	      WriteLog(1, format("x570045_ProcItemWanfa nTargetProfession Invalid! varMap=%d,PlayerGUID=%X,nTargetProfession=%d",varMap,GetGUID(varMap,varPlayer),nTargetProfession) )
    	      return
    	end
    	
    	if nEquipProfession == nTargetProfession then
    	    WriteLog(1, format("x570045_ProcItemWanfa nTargetProfession same to src! varMap=%d,PlayerGUID=%X,nTargetProfession=%d",varMap,GetGUID(varMap,varPlayer),nTargetProfession) );
    	    return
    	end
    	
    	
    	 --消耗道具   
	    if DelItem( varMap, varPlayer, cost.needItem, 1) <= 0 then
			 Msg2Player( varMap, varPlayer, "删除@item_"..cost.needItem.."#cffcf00失败！", 0, 3 );
			 Msg2Player( varMap, varPlayer, "删除@item_"..cost.needItem.."#cffcf00失败！", 0, 2 );
			 return
		end
		
		--消耗金钱
		local varRet, varType = SpendMoney( varMap, varPlayer, cost.money )
    	if varRet <= 0  then
    		Msg2Player( varMap, varPlayer, "银两不够！", 0, 3 )
			Msg2Player( varMap, varPlayer, "银两不够！", 0, 2 )
    		return
    	end
	    
	   
	   local bDeleteSrc = 1
	   local bDeletetNewEquipGem = 0
	   local bWriteSwitchFlag = 1
	   if nMode == 1 then
	      bWriteSwitchFlag = 0
	      
	   elseif nMode == 2 then
	        
	   elseif nMode == 3 then
	        bDeleteSrc = 0
	        bDeletetNewEquipGem = 1
	   end
	   
	   
	   --最后3个参数意思为：是否删除源装备，是否新装备删除宝石，是否写转换过标志
	    local newBagPos = EquipSwitch( varMap, varPlayer, bagPos, nTargetProfession, bDeleteSrc, bDeletetNewEquipGem, bWriteSwitchFlag )
	    if  newBagPos >= 0 then
	    
	        Msg2Player( varMap, varPlayer, "装备转换完成！", 0, 3 )
		    Msg2Player( varMap, varPlayer, "装备转换完成！", 0, 2 )
		    NotifyItemInfo( varMap, varPlayer, newBagPos )
	        NotifyItemWanfa( varMap, varPlayer, varWanfaType, 1 )
	    else
            
            Msg2Player( varMap, varPlayer, "装备转换失败！", 0, 3 )
		    Msg2Player( varMap, varPlayer, "装备转换失败！", 0, 2 )
		    
		    WriteLog(1, string.format( "x570045_ProcItemWanfa EquipSwitch Failed! varMap=%d,varPlayer=%X",
		                varMap, GetGUID(varMap, varPlayer) ) )
            	    
	   end
end
