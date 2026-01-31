






x418828_var_FileId = 418828 
x418828_var_ItemList = {
                         							{ varId = 11970023, varName = "黄金乱士符", varNum = 10  , probability = 400 , Isbroadcast = 0 },
                                      { varId = 11970023, varName = "黄金乱士符", varNum = 5  , probability = 1600  , Isbroadcast = 0 },
                                      { varId = 11970023, varName = "黄金乱士符", varNum = 1 , probability = 8000  , Isbroadcast = 0 },
                                      { varId = 11000552, varName = "完美星辰", varNum = 1  , probability = 7000 , Isbroadcast = 0 },
                                      { varId = 10310002, varName = "掌门牌：小四喜(永不磨损)", varNum = 1  , probability = 30 , Isbroadcast = 1 },
                                      { varId = 11000306, varName = "烈焱碎片", varNum = 1, probability = 100  , Isbroadcast = 0 },
        															{ varId = 11000163, varName = "红龙镂玉钻", varNum = 1, probability = 30 , Isbroadcast = 1 },
        															{ varId = 11000164, varName = "橙龙镂玉钻", varNum = 1, probability = 20, Isbroadcast = 1 }, 
        															{ varId = 12052354, varName = "骑术宝典：四级无双", varNum = 1  , probability = 50   , Isbroadcast = 1 },
        															{ varId = 12052364, varName = "骑术宝典：四级无畏", varNum = 1  , probability = 50   , Isbroadcast = 1 },       
                                      { varId = 12052067, varName = "骑术秘笈：七级闪避", varNum = 1  , probability = 25  , Isbroadcast = 1 },      
                                      { varId = 12052087, varName = "骑术秘笈：七级暴击", varNum = 1  , probability = 25  , Isbroadcast = 1 },     
                                      { varId = 12052437, varName = "骑术秘笈：七级强韧", varNum = 1  , probability = 25  , Isbroadcast = 1 }, 
                                      { varId = 12052077, varName = "骑术秘笈：七级命中", varNum = 1  , probability = 25  , Isbroadcast = 1 },
                                      { varId = 12052447, varName = "骑术秘笈：七级杀伤", varNum = 1  , probability = 25  , Isbroadcast = 1 },                                         
                                      { varId = 11990122, varName = "明亮的彩钻", varNum = 1  , probability = 8000  , Isbroadcast = 0 },
}                                                                    
x418828_var_ItemId =  12035341
                              
                                                                     



function x418828_ProcEventEntry( varMap, varPlayer, varBagIdx )        
if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此道具", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此道具", 0, 3)
		return
	end		
		x418828_ProcAddItemByRandom(varMap, varPlayer,varBagIdx)
end                                                                  
                                                                     





function x418828_ProcIsSpellLikeScript( varMap, varPlayer)        
	

         
	return 0
end






function x418828_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418828_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418828_ProcDeplete( varMap, varPlayer )
	return 1;
end



function x418828_ProcAddItemByRandom(varMap, varPlayer,varBagIdx)
	local i0 = random(1,500)
	local Min = 1
	local Max = 1
	local item = 0
	local varName = nil 
	local num = nil
	local broadcast  = 0
	

	local probability = random(1,100000)
	
	for varI,iter in x418828_var_ItemList do
		Max = Max + iter.probability
		if probability >= Min and probability < Max then
				item = iter.varId
				varName = iter.varName
				num = iter.varNum
				broadcast =iter.Isbroadcast
				break
		end
	end	

	x418828_ProcAddItem( varMap, varPlayer, item, varName, num, broadcast, varBagIdx, Useitem ) 
end

function x418828_ProcAddItem(varMap, varPlayer, varItem, iname, varNum, broadcast, varBagIdx, useItem)                               
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
				if ( Useitem == x418828_var_ItemId ) then
					AddMoney(varMap, varPlayer, 3, 500)
					Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", 500),8,3)	
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
			if ( Useitem == x418828_var_ItemId ) then
				AddMoney(varMap, varPlayer, 3, 500)
				Msg2Player(varMap,varPlayer,format("使用#{_ITEM%d}，你获得了#{_MONEY%d}金卡", Useitem, 500),8,3)	
			end
      
      GamePlayScriptLog( varMap, varPlayer, 3838)			
		end
	elseif ( varItem == 0 ) then
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) == 1 then
			if ( Useitem == x418828_var_ItemId ) then
				AddMoney(varMap, varPlayer, 3, 500)
				Msg2Player(varMap,varPlayer,format("使用#{_ITEM%d}，你获得了#{_MONEY%d}金卡", Useitem, 500),8,3)	
			end
      
      GamePlayScriptLog( varMap, varPlayer, 3838)			
		end
	end
	
end








function x418828_ProcActivateOnce( varMap, varPlayer, varImpact )   
	
end







function x418828_ProcActivateEachTick( varMap, varPlayer)
	return 1
end
