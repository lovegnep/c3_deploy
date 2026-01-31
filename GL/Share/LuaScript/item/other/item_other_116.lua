





x418116_var_FileId 		= 418116 
x418116_var_LevelMin		=	25
x418116_var_Givemoney		=	10000	






function x418116_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418116_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418116_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418116_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418116_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418116_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418116_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足，无法使用！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then

		AddMoney(varMap, varPlayer, 3, x418116_var_Givemoney,101)
		
		StartTalkTask(varMap)
		local DoneMSG = format("恭喜您，您获得了金卡%d两！",x418116_var_Givemoney/1000)	
		TalkAppendString(varMap,DoneMSG)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418116_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
