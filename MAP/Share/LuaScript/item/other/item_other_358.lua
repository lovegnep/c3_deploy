





x418358_var_FileId 		= 418358 

x418358_var_LevelMin		=	1






function x418358_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418358_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418358_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418358_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418358_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418358_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418358_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local varLevel = GetLevel( varMap, varPlayer)
		local varXp = 1
		varXp = varLevel*240000							
			
		AddExp(varMap, varPlayer, varXp)
		GamePlayScriptLog(varMap, varPlayer, 2513)
		Msg2Player(varMap,varPlayer,format("你获得了%d点经验", varXp),4,3)
		Msg2Player(varMap,varPlayer,format("你获得了%d点经验", varXp),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418358_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
