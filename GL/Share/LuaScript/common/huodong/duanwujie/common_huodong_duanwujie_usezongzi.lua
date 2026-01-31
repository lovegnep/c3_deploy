






x302525_var_FileId = 302525 
x302525_var_ItemList = {
                         [12110213] = { 
                                      { varId = 12110215, varName="雄黄酒" 		    	, probability =50  ,Isbroadcast = 0  },      
                                      { varId = 12030044, varName="金砂"          	, probability =250 ,Isbroadcast = 0  },      
                                      { varId = 12030046, varName="金元宝"        	, probability =50  ,Isbroadcast = 0},      
                                      { varId = 12030047, varName="金砖"        		, probability =50  ,Isbroadcast = 0},      
                                      { varId = 11970023, varName="黄金乱士符" 			, probability =45  ,Isbroadcast = 0},      
                                      { varId = 11000306, varName="烈焱碎片" 				, probability =5   ,Isbroadcast = 1},    
        															{ varId = 12500323, varName="豪华将星卡礼盒" 	, probability =50  ,Isbroadcast = 0},    
                                    },                                            
                         [12110214] = {   
                                      { varId = 12110215, varName="雄黄酒" 		    	, probability =50  ,Isbroadcast = 0 },      
                                      { varId = 12030044, varName="金砂"          	, probability =247 ,Isbroadcast = 0 },      
                                      { varId = 12030046, varName="金元宝"        	, probability =50  ,Isbroadcast = 0},      
                                      { varId = 12030047, varName="金砖"        		, probability =50  ,Isbroadcast = 0},      
                                      { varId = 11970023, varName="黄金乱士符" 			, probability =45  ,Isbroadcast = 0},      
                                      { varId = 11000306, varName="烈焱碎片" 				, probability =5   ,Isbroadcast = 1},    
        															{ varId = 12500323, varName="豪华将星卡礼盒" 	, probability =50  ,Isbroadcast = 0}, 
        															{ varId = 12050315, varName="金翅飞虎降世符" 	, probability =3   ,Isbroadcast = 1},                                                                              
                                    },
                         [12110218] = { 
                                      { varId = 12030044, varName="金砂"          	, probability =250 ,Isbroadcast = 0  },      
                                      { varId = 12030046, varName="金元宝"        	, probability =50  ,Isbroadcast = 0},      
                                      { varId = 12030047, varName="金砖"        		, probability =100  ,Isbroadcast = 0},      
                                      { varId = 11970023, varName="黄金乱士符" 			, probability =45  ,Isbroadcast = 0},      
                                      { varId = 11000306, varName="烈焱碎片" 				, probability =5   ,Isbroadcast = 1},    
        															{ varId = 12500323, varName="豪华将星卡礼盒" 	, probability =50  ,Isbroadcast = 0},    
                                    },                                                                                                      
}                                                                    
x302525_var_ItemId =  12110213
x302525_var_ItemIdG =  12110214
x302525_var_ItemId1 =  12110218                                                                     
                                                                     



function x302525_ProcEventEntry( varMap, varPlayer, varBagIdx )        
if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此道具", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此道具", 0, 3)
		return
	end		
		x302525_ProcAddItemByRandom(varMap, varPlayer,varBagIdx)
end                                                                  
                                                                     





function x302525_ProcIsSpellLikeScript( varMap, varPlayer)        
	

         
	return 0
end






function x302525_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x302525_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x302525_ProcDeplete( varMap, varPlayer )
	return 1;
end



function x302525_ProcAddItemByRandom(varMap, varPlayer,varBagIdx)
	local i0 = random(1,500)
	local Min = 1
	local Max = 1
	local item = nil
	local varName = nil 
	local broadcast  = 0
	local Useitem = GetItemIDByIndexInBag( varMap, varPlayer, varBagIdx)
	if Useitem ~= x302525_var_ItemId and Useitem ~= x302525_var_ItemIdG and Useitem ~= x302525_var_ItemId1 then
		return
	end	
	local probability = random(1,500)
	
	for varI,iter in x302525_var_ItemList[Useitem] do
		Max = Max + iter.probability
		if probability >= Min and probability < Max then
				item = iter.varId
				varName = iter.varName
				broadcast =iter.Isbroadcast
				break
		end
	end	

	x302525_ProcAddItem(varMap, varPlayer, item ,varName,broadcast,varBagIdx) 
end

function x302525_ProcAddItem(varMap, varPlayer, varItem ,iname,broadcast,varBagIdx)                               
	local Useitem = GetItemIDByIndexInBag( varMap, varPlayer, varBagIdx)
	StartItemTask(varMap)   
	if IsItemBind(varMap,varPlayer,varBagIdx) == 0 then
		ItemAppend( varMap,varItem, 1 )	
	else
		ItemAppendBind( varMap,varItem, 1 )
	end	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) == 1 then
			StartTalkTask(varMap)
			local varStr =format( "您开启了1个@item_%d#cffcf00，获得了1个@item_%d", Useitem,varItem)
			if broadcast == 1 then
				local varName = GetName(varMap,varPlayer)
				if varName == nil then
					varName = "Errorname"
				end
				local varMsg1 =format(varName.."使用#{_ITEM%d}获得1个"..iname,Useitem)
				LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
			end
			TalkAppendString(varMap,varStr)
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
      
      GamePlayScriptLog( varMap, varPlayer, 2503)			
		end

	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	
end








function x302525_ProcActivateOnce( varMap, varPlayer, varImpact )   
	
end







function x302525_ProcActivateEachTick( varMap, varPlayer)
	return 1
end
