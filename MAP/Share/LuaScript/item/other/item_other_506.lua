
--真爱告白大礼包





x418506_var_FileId = 418506 
x418506_var_ItemID = 12041245

x418506_var_ItemList = 
                                                                            
                                    {                                             
                    
                                           
                                      { varId = 12030511, varName="掌门牌碰碰胡（7天）礼包"   , probability =20 },     
                                      { varId = 12030031, varName="神行符"            			  , probability =70 },     
                                      
                                      { varId = 12030503, varName="掌门牌：平胡（7天）礼包"   , probability =20 },     
                                      { varId = 12030202, varName="江湖请柬"              		, probability =20 },                                        
                                           
                                      { varId = 12010021, varName="中生命清露"        			  , probability =80 },     
                                      { varId = 12030258, varName="全福月饼"              		, probability =80 },     
                                      { varId = 11000552, varName="完美星辰"        			    , probability =50 },     
                                      { varId = 12240002, varName="优质符文布"              	, probability =50 },     
                                      { varId = 11000304, varName="残破的神兵之魂"        		, probability =3  },     
                                      { varId = 11970023, varName="黄金乱士符"              	, probability =7  },     
                                      { varId = 11000948, varName="普通地中海尖凿"        		, probability =50 },    
                                      { varId = 11990110, varName="募集券"              			, probability =50 }, 
                                      { varId = 11000902, varName="高级洗石剂"          			, probability =50 },    
                                      { varId = 12030200, varName="小喇叭"        			      , probability =80 },
                                      { varId = 11010001, varName="一级皇家秘银"        			, probability =60 },
                                      { varId = 11000501, varName="紫檀木炭"            			, probability =80 },
                                      { varId = 12054300, varName="还童书"              			, probability =80 },
                                      { varId = 12035002, varName="魔君部将召唤符"      			, probability =20 },
                                      { varId = 11000550, varName="微瑕星辰"            			, probability =50 }, 
                                      { varId = 10310003, varName="大三元(永不磨损)"          , probability =80 }      
                               
                                       
                                    }                                  
                                                                    

                                                                     
                                                                     



function x418506_ProcEventEntry( varMap, varPlayer, varBagIdx )         

end                                                                  
                                                                     





function x418506_ProcIsSpellLikeScript( varMap, varPlayer)                 
	return 1; 
end






function x418506_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418506_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418506_ProcDeplete( varMap, varPlayer )
	return 1;
end




function x418506_ProcAddItemByRandom(varMap, varPlayer)

	local Min = 1
	local Max = 1
	local item = nil
	local varName = nil         
   	local i0 = random(1,1000)     
	  if i0<=10 then
 
    local allitem1 = x418506_var_ItemList
		local probability = random(1,1000)
	  for varI, iter in allitem1 do
        Max = Max + iter.probability
        if probability >= Min and probability < Max then
            item = iter.varId
            varName = iter.varName
            break
        end
    end
		end

    x418506_ProcAddItem(varMap, varPlayer, item ,varName) 

	end
	


function x418506_ProcAddItem(varMap, varPlayer, varItem ,iname)                               
  local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)

	StartItemTask(varMap)   
	if IsItemBind(varMap,varPlayer,varBagIdx) == 0 then
		ItemAppend( varMap,12041014, 5 ) --四象神力丸
		ItemAppend( varMap,12041024, 5 ) --四象魔道丸
		ItemAppend( varMap,12041034, 5 ) --四象仙火丸
		ItemAppend( varMap,11990051, 2 ) --回魂丹
		ItemAppend( varMap,12030016, 2 ) --队伍召集令
		if varItem ~=nil then
			ItemAppend( varMap,varItem, 1 )	
		end
	
	else
		ItemAppendBind( varMap,12041014, 5 ) --四象神力丸
		ItemAppendBind( varMap,12041024, 5)  --四象魔道丸
		ItemAppendBind( varMap,12041034, 5 ) --四象仙火丸
		ItemAppendBind( varMap,11990051, 2 ) --回魂丹
		ItemAppendBind( varMap,12030016, 2 ) --队伍召集令
		if varItem ~=nil then	
			ItemAppendBind( varMap,varItem, 1 )
		end
	end	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			local varStr =format( "您开启了1个@item_%d#cffcf00，",12041245 )
			if varItem ~=nil then	
				 varStr =format( "您开启了1个@item_%d#cffcf00，获得了1个@item_%d",12041245 ,varItem)
			end
		for varI, itemnum in x418506_var_ItemList do
			 if varItem == itemnum.varId then
				local varName = GetName(varMap,varPlayer)
				if varName == nil then
					varName = "Errorname"
				end
			
				local varMsg1 =format(varName.."使用真爱告白大礼包获得1个"..iname)
				LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
			 end
		end
			TalkAppendString(varMap,varStr)
			
      
 			
		end
      StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)

			DeliverItemListSendToPlayer(varMap,varPlayer)
			Msg2Player( varMap,varPlayer,"打开礼包，获得四象神力丸5个",8,3) ;
		  Msg2Player( varMap,varPlayer,"打开礼包，获得四象魔道丸5个",8,3) ;
			Msg2Player( varMap,varPlayer,"打开礼包，获得四象仙火丸5个",8,3) ;
	   	Msg2Player( varMap,varPlayer,"打开礼包，获得回魂丹2个",8,3) ;
			Msg2Player( varMap,varPlayer,"打开礼包，获得队伍召集令2个",8,3) ;
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有6个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	
end








function x418506_ProcActivateOnce( varMap, varPlayer, varImpact )   
	if GetBagSpace(varMap, varPlayer) <= 5 then
		Msg2Player(varMap, varPlayer, "背包已满，无法使用物品！您需要至少有6个背包空间！", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法使用物品！您需要至少有6个背包空间！", 0, 3)
		return
	end		
		x418506_ProcAddItemByRandom(varMap, varPlayer)
	
end







function x418506_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
