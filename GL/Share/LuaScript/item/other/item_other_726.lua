--冲级赛礼包（60级）





x418726_var_FileId 		= 418726

x418726_var_LevelMin		=	1




function x418726_ProcEventEntry( varMap, varPlayer, varBagIdx )
	if GetBagSpace(varMap, varPlayer) < 2 then
		Msg2Player(varMap,varPlayer, "至少需要两个背包空间,才能使用此道具",4,3)
		return
	end
	StartItemTask(varMap)
		ItemAppendBind( varMap, 10306084, 1)	--梦魇战甲
 		ItemAppendBind( varMap, 12500323, 10)  --豪华将星卡

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DelItem(varMap, varPlayer,12035273 ,1)) == 1 then
				Msg2Player(varMap, varPlayer, "恭喜您获得一件#G梦魇战甲（30天）#cffcc00", 8, 3)
				Msg2Player(varMap, varPlayer, "恭喜您获得一件#G梦魇战甲（30天）#cffcc00", 8, 2)
				Msg2Player(varMap, varPlayer, "恭喜您获得10个#G豪华将星卡礼盒#cffcc00", 8, 3)
				Msg2Player(varMap, varPlayer, "恭喜您获得10个#G豪华将星卡礼盒#cffcc00", 8, 2)
				AddMoney(varMap, varPlayer, 1, 1000000)
				AddMoney(varMap, varPlayer, 3, 100000)
   		--GamePlayScriptLog( varMap, varPlayer, 3740)
   		DeliverItemListSendToPlayer( varMap, varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	
end






function x418726_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418726_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418726_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418726_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418726_ProcActivateOnce( varMap, varPlayer, varImpact )

end







function x418726_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
