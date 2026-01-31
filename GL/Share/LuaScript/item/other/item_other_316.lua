





x418316_var_FileId 		= 418316

x418316_var_LevelMin		=	1






function x418316_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418316_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418316_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418316_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418316_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418316_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418316_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12050272, 1 )	--金甲年兽降世符

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开血与沙代言人大礼包，获得“沙城代言人”称号和1个金甲年兽降世符")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			AwardTitle(varMap,varPlayer,150) --“沙城代言人”称号
			Msg2Player(varMap, varPlayer, "获得#G沙城代言人#o称号", 8, 2)
			Msg2Player(varMap, varPlayer, "获得#G沙城代言人#o称号", 8, 3)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足，需要1个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418316_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
