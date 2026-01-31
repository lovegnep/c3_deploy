





x418675_var_FileId 		= 418675 

x418675_var_LevelMin		=	1

x418675_g_ItemID =12030985




function x418675_ProcEventEntry( varMap, varPlayer, varBagIdx )
	
	local num = GetBagSpace(varMap, varPlayer, 0)
	if num < 4 then
		Msg2Player( varMap,varPlayer, "背包剩余空间不足！", 8, 2)
	  Msg2Player( varMap,varPlayer, "背包剩余空间不足！", 8, 3)
		return
	end
	local bCplay =  DelItemByIndexInBag(varMap, varPlayer, varBagIdx, 1)
	if bCplay == 1 then
		local name = GetName(varMap,varPlayer)
		itemid1 = 12030094
		count1 = 5
		itemid2 = 11970023
		count2 = 2
		itemid3 = 11000949
		count3 = 1
		itemid4 = 11000304
		count4 = 1
		local ran = random(1,100)
	  StartItemTask(varMap)
   	ItemAppendBind( varMap, itemid1, count1 )	
	 	ItemAppendBind( varMap, itemid2, count2 )	
	 	ItemAppendBind( varMap, itemid3, count3 )
	 	if ran == 1 then
		ItemAppendBind( varMap, itemid4, count4 )
	 	 	
	 	end	
	 	local ret = StopItemTask(varMap,varPlayer)
   	if ret > 0 then 
   	DeliverItemListSendToPlayer(varMap,varPlayer)	
	 	--GamePlayScriptLog( varMap, varPlayer, 3070+tempmark)
	 	Msg2Player(varMap,varPlayer,format("打开奇货可居礼包获得：#G金砂5个"),4,3)
	 	Msg2Player(varMap,varPlayer,format("打开奇货可居礼包获得：#G黄金乱世符2个"),4,3)
	 	Msg2Player(varMap,varPlayer,format("打开奇货可居礼包获得：#G优质地中海尖凿1个"),4,3)
	 	if ran == 1 then
	 	Msg2Player(varMap,varPlayer,format("你获得了@item_%d", itemid3),4,3)
	 	LuaAllScenceM2Wrold( varMap,"恭喜玩家"..name.."打开奇货可居礼包，获得残破的神兵之魂", 5, 1 )
	 	end
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end	
end






function x418675_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418675_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418675_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418675_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418675_ProcActivateOnce( varMap, varPlayer, varImpact )


	
	


	

end







function x418675_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
