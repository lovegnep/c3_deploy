





x430038_var_FileId 		= 430038 

x430038_var_LevelMin		=	1






function x430038_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x430038_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430038_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x430038_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x430038_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x430038_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x430038_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local nPVP2V2Mark = 100
		AddPVP2V2Mark(varMap, varPlayer, nPVP2V2Mark)
		Msg2Player(varMap,varPlayer,format("您获得了%d战场积分的奖励。", nPVP2V2Mark),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了%d战场积分的奖励。", nPVP2V2Mark),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x430038_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
