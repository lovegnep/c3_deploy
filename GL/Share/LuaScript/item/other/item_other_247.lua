





x418247_var_FileId 		= 418247 

x418247_var_LevelMin		=	60






function x418247_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418247_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418247_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418247_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418247_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418247_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418247_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local varLevel = GetLevel( varMap, varPlayer)
		local varXp = 1
		if varLevel < 70 then
			varXp = varLevel*3600000
		elseif varLevel < 80 then
			varXp = varLevel*6480000
		elseif varLevel < 90 then
			varXp = varLevel*12960000		
		elseif 	varLevel < 120 then
			varXp = varLevel*16848000
		else
			varXp = 120*16848000	
		end								
			
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







function x418247_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
