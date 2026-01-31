





x930184_var_FileId 		= 930184

x930184_var_LevelMin		=	1
x930184_var_Nummabi		=	10000






function x930184_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x930184_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x930184_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x930184_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x930184_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x930184_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x930184_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
        local warlevel = GetPlayerGameData(varMap, varPlayer, MD_612BAOXIAN_FIRWEEK1[1], MD_612BAOXIAN_FIRWEEK1[2], MD_612BAOXIAN_FIRWEEK1[3])
        --保存最新
        SetPlayerGameData(varMap, varPlayer, MD_612BAOXIAN_FIRWEEK1[1], MD_612BAOXIAN_FIRWEEK1[2], MD_612BAOXIAN_FIRWEEK1[3],warlevel+x930184_var_Nummabi)
        Msg2Player(varMap,varPlayer,format("您获得了%d点万族征伐录经验", x930184_var_Nummabi),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了%d点万族征伐录经验", x930184_var_Nummabi),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x930184_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
