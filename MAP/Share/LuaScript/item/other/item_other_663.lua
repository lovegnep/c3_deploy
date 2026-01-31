





x418663_var_FileId 		= 418663 

x418663_var_LevelMin		=	1

x418663_g_ItemID =12030973




function x418663_ProcEventEntry( varMap, varPlayer, varBagIdx )

	local num = GetBagSpace(varMap, varPlayer, 0)
	if num < 3 then
		Msg2Player( varMap,varPlayer, "背包剩余空间不足,无法获得", 8, 2)
	  Msg2Player( varMap,varPlayer, "背包剩余空间不足,无法获得", 8, 3)
		return
	end
	 
	local bCplay =  DelItemByIndexInBag(varMap, varPlayer, varBagIdx, 1)
	if bCplay == 1 then
		local name = GetName(varMap,varPlayer)
		itemid1 = 12030011
		count1 = 2
		itemid2 = 12030094
		count2 = 1
		itemid3 = 11000500
		count3 = 1
		itemid4 = 11000502
		count4 = 1
		itemid5 = 11000503
		count5 = 1
		itemid6 = 11000504
		count6 = 1
		local ran = random(1,120)
	  StartItemTask(varMap)
   	ItemAppendBind( varMap, itemid1, count1 )	
	 	ItemAppendBind( varMap, itemid2, count2 )	
	 	if ran == 1 then
	 	ItemAppendBind( varMap, itemid3, count3 )
	 	elseif ran == 2 then
	 	ItemAppendBind( varMap, itemid4, count4 )
	 	elseif ran == 3 then
	 	ItemAppendBind( varMap, itemid5, count5 )
	 	elseif ran == 4 then
	 	ItemAppendBind( varMap, itemid6, count6 )
	 	
	 	end	
	 	local ret = StopItemTask(varMap,varPlayer)
   	if ret > 0 then 
   	DeliverItemListSendToPlayer(varMap,varPlayer)	
	 	--GamePlayScriptLog( varMap, varPlayer, 3070+tempmark)
	 	Msg2Player(varMap,varPlayer,format("打开每日豪华礼包获得了：#G杰克丹尼2个"),4,3)
	 	Msg2Player(varMap,varPlayer,format("打开每日豪华礼包获得了：#G金砂1个"),4,3)
	 	if ran <= 4 then
	 	Msg2Player(varMap,varPlayer,format("打开每日豪华礼包获得了：@item_%d", itemid3),4,3)
	 	LuaAllScenceM2Wrold( varMap,"恭喜玩家"..name.."打开每日豪华礼包，获得装备鎏金水银", 5, 1 )
	 	end
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end	
end






function x418663_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418663_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418663_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418663_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418663_ProcActivateOnce( varMap, varPlayer, varImpact )


	
	


	

end







function x418663_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
