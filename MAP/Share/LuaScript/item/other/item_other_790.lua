






x418790_var_FileId = 418790 
x418790_var_ItemList = {
                         [12032017] = {      
                         							{ varId = 12500323, varName = "豪华将星卡礼盒" 	    , varNum = 1  , probability = 500 , Isbroadcast = 1 },
                                      { varId = 12030775, varName = "掌门牌碎片"          , varNum = 1  , probability = 70  , Isbroadcast = 1 },
                                      { varId = 11970023, varName = "黄金乱士符" 			    , varNum = 10 , probability = 40  , Isbroadcast = 1 },
                                      { varId = 11970023, varName = "黄金乱士符" 			    , varNum = 5  , probability = 160 , Isbroadcast = 0 },
                                      { varId = 11970023, varName = "黄金乱士符" 			    , varNum = 1  , probability = 800 , Isbroadcast = 0 },
                                      { varId = -1,       varName = "战车荣誉"            , varNum = 600, probability = 10  , Isbroadcast = 1 },
        															{ varId = -1,       varName = "战车荣誉"            , varNum = 300, probability = 100 , Isbroadcast = 0 },
        															{ varId = -1,       varName = "战车荣誉"            , varNum = 200, probability = 1000, Isbroadcast = 0 }, 
        															{ varId = 11011485, varName = "烈焰纹样·狂暴" 		  , varNum = 1  , probability = 3   , Isbroadcast = 1 },
        															{ varId = 11011486, varName = "烈焰纹样·精准" 			, varNum = 1  , probability = 3   , Isbroadcast = 1 },
        															{ varId = 11011487, varName = "烈焰纹样·疾影" 			, varNum = 1  , probability = 3   , Isbroadcast = 1 },       
                                      { varId = 11000906, varName = "传说级洗石剂·莲华"   , varNum = 1  , probability = 10  , Isbroadcast = 1 },      
                                      { varId = 12035252, varName = "魔君附身石（5分钟）" , varNum = 1  , probability = 17  , Isbroadcast = 1 },     
                                      { varId = 12035253, varName = "魔君附身石（10分钟）", varNum = 1  , probability = 10  , Isbroadcast = 1 },      
                                    },                                            
                         [12032019] = {         
                                      { varId = 12500323, varName = "豪华将星卡礼盒" 	    , varNum = 1  , probability = 500 , Isbroadcast = 1 },
                                      { varId = 12030775, varName = "掌门牌碎片"          , varNum = 1  , probability = 70  , Isbroadcast = 1 },
                                      { varId = 11970023, varName = "黄金乱士符" 			    , varNum = 10 , probability = 40  , Isbroadcast = 1 },
                                      { varId = 11970023, varName = "黄金乱士符" 			    , varNum = 5  , probability = 160 , Isbroadcast = 0 },
                                      { varId = 11970023, varName = "黄金乱士符" 			    , varNum = 1  , probability = 800 , Isbroadcast = 0 },
                                      { varId = -1,       varName = "战车荣誉"            , varNum = 600, probability = 10  , Isbroadcast = 1 },
        															{ varId = -1,       varName = "战车荣誉"            , varNum = 300, probability = 100 , Isbroadcast = 0 },
        															{ varId = -1,       varName = "战车荣誉"            , varNum = 200, probability = 1000, Isbroadcast = 0 }, 
        															{ varId = 11011485, varName = "烈焰纹样·狂暴" 		  , varNum = 1  , probability = 3   , Isbroadcast = 1 },
        															{ varId = 11011486, varName = "烈焰纹样·精准" 			, varNum = 1  , probability = 3   , Isbroadcast = 1 },
        															{ varId = 11011487, varName = "烈焰纹样·疾影" 			, varNum = 1  , probability = 3   , Isbroadcast = 1 },       
                                      { varId = 11000906, varName = "传说级洗石剂·莲华"   , varNum = 1  , probability = 10  , Isbroadcast = 1 },      
                                      { varId = 12035252, varName = "魔君附身石（5分钟）" , varNum = 1  , probability = 17  , Isbroadcast = 1 },     
                                      { varId = 12035253, varName = "魔君附身石（10分钟）", varNum = 1  , probability = 10  , Isbroadcast = 1 },                                                                              
                                    },                                  
}                                                                    
x418790_var_ItemId =  12032017
x418790_var_ItemIdG =  12032019
                                                                     
                                                                     



function x418790_ProcEventEntry( varMap, varPlayer, varBagIdx )        
if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此道具", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此道具", 0, 3)
		return
	end		
		x418790_ProcAddItemByRandom(varMap, varPlayer,varBagIdx)
end                                                                  
                                                                     





function x418790_ProcIsSpellLikeScript( varMap, varPlayer)        
	

         
	return 0
end






function x418790_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418790_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418790_ProcDeplete( varMap, varPlayer )
	return 1;
end



function x418790_ProcAddItemByRandom(varMap, varPlayer, varBagIdx)
	local i0 = random(1,500)
	local Min = 1
	local Max = 1
	local item = 0
	local varName = nil 
	local num = nil
	local broadcast  = 0
	
	local Useitem = GetItemIDByIndexInBag( varMap, varPlayer, varBagIdx)
	if Useitem ~= x418790_var_ItemId and Useitem ~= x418790_var_ItemIdG then
		return
	end	
	local probability = random(1,10000)
	
	for varI,iter in x418790_var_ItemList[Useitem] do
		Max = Max + iter.probability
		if probability >= Min and probability < Max then
				item = iter.varId
				varName = iter.varName
				num = iter.varNum
				broadcast =iter.Isbroadcast
				break
		end
	end	

	x418790_ProcAddItem( varMap, varPlayer, item, varName, num, broadcast, varBagIdx, Useitem ) 
end

function x418790_ProcAddItem(varMap, varPlayer, varItem, iname, varNum, broadcast, varBagIdx, useItem)                               
	local Useitem = GetItemIDByIndexInBag( varMap, varPlayer, varBagIdx)
	
	if ( varItem > 0 ) then
		StartItemTask(varMap)
			if IsItemBind(varMap, varPlayer, varBagIdx) == 0 then
				ItemAppend( varMap, varItem, varNum )	
			else
				ItemAppendBind( varMap, varItem, varNum )
			end	
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
			if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) == 1 then
				StartTalkTask(varMap)
				local varStr =format( "您使用了1个@item_%d#cffcf00，获得了%d个@item_%d", Useitem, varNum, varItem)
				if broadcast == 1 then
					local varName = GetName(varMap,varPlayer)
					if varName == nil then
						varName = "Errorname"
					end
					local varMsg1 =format(varName.."使用#{_ITEM%d}获得%d个"..iname,Useitem,varNum)
					LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
				end
				TalkAppendString(varMap,varStr)
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				DeliverItemListSendToPlayer(varMap,varPlayer)
				if ( useItem == x418790_var_ItemId ) then
					AddMoney(varMap, varPlayer, 3, 500)
					Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", 500),4,3)	
				end
	      
	      GamePlayScriptLog( varMap, varPlayer, 3838)			
			end
	
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	elseif ( varItem == -1 ) then
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) == 1 then
			StartTalkTask(varMap)
			local varStr =format( "您使用了1个@item_%d#cffcf00，获得了%d点%s", Useitem, varNum, iname)
			if broadcast == 1 then
				local varName = GetName(varMap,varPlayer)
				if varName == nil then
					varName = "Errorname"
				end
				local varMsg1 =format(varName.."使用#{_ITEM%d}获得%d点"..iname,Useitem,varNum)
				LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
			end
			TalkAppendString(varMap,varStr)
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			--DeliverItemListSendToPlayer(varMap,varPlayer)
			AddPlayerChariotHonour(varMap, varPlayer, varNum)
			if ( useItem == x418790_var_ItemId ) then
				AddMoney(varMap, varPlayer, 3, 500)
				Msg2Player(varMap,varPlayer,format("使用#{_ITEM%d}，你获得了#{_MONEY%d}金卡", Useitem, 500),4,3)	
			end
      
      GamePlayScriptLog( varMap, varPlayer, 3838)			
		end
	elseif ( varItem == 0 ) then
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) == 1 then
			if ( useItem == x418790_var_ItemId ) then
				AddMoney(varMap, varPlayer, 3, 500)
				Msg2Player(varMap,varPlayer,format("使用#{_ITEM%d}，你获得了#{_MONEY%d}金卡", Useitem, 500),4,3)	
			elseif ( useItem == x418790_var_ItemIdG ) then
				local perMsg = {
													"你感到一阵冰爽畅快，忍不住还想吃一根",
													"炎热的夏天来个奶油冰棍真是无上的享受",
											 }
				Msg2Player(varMap,varPlayer,perMsg[random(1,getn(perMsg))],4,3)	
			end
      
      GamePlayScriptLog( varMap, varPlayer, 3838)			
		end
	end
	
end








function x418790_ProcActivateOnce( varMap, varPlayer, varImpact )   
	
end







function x418790_ProcActivateEachTick( varMap, varPlayer)
	return 1
end
