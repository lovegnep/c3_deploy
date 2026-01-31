





x418789_var_FileId 		= 418789

x418789_var_LevelMin		=	1






function x418789_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418789_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418789_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418789_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418789_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418789_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetBagSpace(varMap, varPlayer) <1 then
		Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位。", 0, 2)
		Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位", 0, 3)
		return 0
	end
	
	

	StartItemTask(varMap)
	
		ItemAppendBind( varMap, 12032018, 1 )						
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			GamePlayScriptLog( varMap, varPlayer, 3839)
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开获得5两银卡和七彩冰棍1个。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			AddMoney(varMap, varPlayer, 1, 5000)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包剩余空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418789_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
