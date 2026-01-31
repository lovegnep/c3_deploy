





x418119_var_FileId 		= 418119 
x418119_var_LevelMin		=	55
x418119_var_Givemoney		=	25000	






function x418119_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418119_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418119_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418119_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418119_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418119_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418119_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足，无法使用！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then

		AddMoney(varMap, varPlayer, 3, x418119_var_Givemoney,101)
		
		StartTalkTask(varMap)
		local DoneMSG = format("恭喜您，您获得了金卡%d两！",x418119_var_Givemoney/1000)	
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







function x418119_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
