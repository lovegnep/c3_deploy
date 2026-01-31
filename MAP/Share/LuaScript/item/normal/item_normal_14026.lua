





x414026_var_FileId 		= 414026 

x414026_var_LevelMin		=	20






function x414026_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x414026_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x414026_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x414026_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x414026_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x414026_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x414026_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local varLevel = GetLevel( varMap, varPlayer)
		local xp = varLevel*2625
		AddExp(varMap, varPlayer, xp)
		Msg2Player(varMap,varPlayer,format("你获得了%d点经验", xp),4,3)
		Msg2Player(varMap,varPlayer,format("你获得了%d点经验", xp),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x414026_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
