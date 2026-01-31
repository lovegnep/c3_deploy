





x414031_var_FileId 		= 414031 

x414031_var_LevelMin		=	1






function x414031_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x414031_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x414031_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x414031_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x414031_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x414031_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x414031_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
	  local nValue = 10000
		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + nValue
		SetShengWang( varMap, varPlayer, varShengWang )	
		Msg2Player(varMap,varPlayer,format("您获得了%d点声望", 10000),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了%d点声望", 10000),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x414031_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
