





x418667_var_FileId 		= 418667 

x418667_var_LevelMin		=	1

x418667_g_ItemID =12030977




function x418667_ProcEventEntry( varMap, varPlayer, varBagIdx )
	
	local num = GetBagSpace(varMap, varPlayer, 0)
	if num < 3 then
		Msg2Player( varMap,varPlayer, "背包剩余空间不足！", 8, 2)
	  Msg2Player( varMap,varPlayer, "背包剩余空间不足！", 8, 3)
		return
	end
	local bCplay =  DelItemByIndexInBag(varMap, varPlayer, varBagIdx, 1)
	if bCplay == 1 then
		local name = GetName(varMap,varPlayer)
		itemid1 = 12030094
		count1 = 1
		itemid2 = 12030013
		count2 = 1
		itemid3 = 11000300
		count3 = 1
		local ran = random(1,30)
	  StartItemTask(varMap)
   	ItemAppendBind( varMap, itemid1, count1 )	
	 	ItemAppendBind( varMap, itemid2, count2 )	
	 	if ran == 1 then
	 	ItemAppendBind( varMap, itemid3, count3 )
	 	 	
	 	end	
	 	local ret = StopItemTask(varMap,varPlayer)
   	if ret > 0 then 
   	DeliverItemListSendToPlayer(varMap,varPlayer)	
	 	--GamePlayScriptLog( varMap, varPlayer, 3070+tempmark)
	 	Msg2Player(varMap,varPlayer,format("打开每日豪华礼包获得了：#G芝华士1个"),4,3)
	 	Msg2Player(varMap,varPlayer,format("打开每日豪华礼包获得了：#G金砂1个"),4,3)
	 	if ran == 1 then
	 	Msg2Player(varMap,varPlayer,format("打开每日豪华礼包获得了：@item_%d", itemid3),4,3)
	 	LuaAllScenceM2Wrold( varMap,"恭喜玩家"..name.."打开每日豪华礼包，获得灵魂印", 5, 1 )
	 	end
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end	
end






function x418667_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418667_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418667_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418667_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418667_ProcActivateOnce( varMap, varPlayer, varImpact )


	
	


	

end







function x418667_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
