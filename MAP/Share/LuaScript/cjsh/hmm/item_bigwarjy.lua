





x930181_var_FileId 		= 930181

x930181_var_LevelMin		=	1
x930181_var_Nummabi		=	100000






function x930181_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x930181_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x930181_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x930181_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x930181_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x930181_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x930181_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
        local warlevel = GetPlayerGameData(varMap, varPlayer, MD_GETBUFF_DAY1[1], MD_GETBUFF_DAY1[2], MD_GETBUFF_DAY1[3])
        --保存最新
        SetPlayerGameData(varMap, varPlayer, MD_GETBUFF_DAY1[1], MD_GETBUFF_DAY1[2], MD_GETBUFF_DAY1[3],warlevel+x930181_var_Nummabi)
        Msg2Player(varMap,varPlayer,format("您获得了%d点战神经验", x930181_var_Nummabi),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了%d点战神经验", x930181_var_Nummabi),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x930181_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
