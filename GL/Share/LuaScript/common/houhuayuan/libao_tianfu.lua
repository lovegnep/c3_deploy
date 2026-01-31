





x320013_var_FileId 		= 320013 

x320013_var_LevelMin		=	1






function x320013_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x320013_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x320013_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x320013_ProcConditionCheck( varMap, varPlayer )

	local Level = GetLevel(varMap, varPlayer)
	if Level < 80 then
		Msg2Player(varMap,varPlayer,"等级不足80级无法获得天赋奖励",4,3)
		Msg2Player(varMap,varPlayer,"等级不足80级无法获得天赋奖励",4,2)		
		return 0
	end	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x320013_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x320013_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x320013_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local refixtf = AddInherenceExp( varMap, varPlayer, 998805)
		Msg2Player(varMap,varPlayer,format("您获得了%d点天赋", refixtf),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了%d点天赋", refixtf),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x320013_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
