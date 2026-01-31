





x581001_var_FileId 		= 581001 
x581001_var_LevelMin		=	60
x581001_var_GameId	= 1049






function x581001_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x581001_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x581001_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x581001_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x581001_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x581001_ProcActivateOnce( varMap, varPlayer, varImpact )
	if GetQMoneyToggle() <= 0 then
		Msg2Player(varMap, varPlayer, "此活动目前不开放", 0, 3)
		return
	end
	
	if GetLevel(varMap, varPlayer)< x581001_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足，无法使用！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1001,1 )
	

end







function x581001_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
