





x320011_var_FileId 		= 320011 

x320011_var_LevelMin		=	1






function x320011_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x320011_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x320011_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x320011_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x320011_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x320011_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x320011_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local Level = GetLevel(varMap,varPlayer)
	local ExpBonus = 0
	if Level < 75 then
		ExpBonus = Level*4800
	elseif Level >= 75 then
		ExpBonus = Level*7000
	end

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		AddExp(varMap, varPlayer, ExpBonus);
		Msg2Player(varMap,varPlayer,format("您获得了%d点经验", ExpBonus),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了%d点经验", ExpBonus),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x320011_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
