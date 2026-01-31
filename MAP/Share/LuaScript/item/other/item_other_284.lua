





x418284_var_FileId 		= 418284

x418284_var_LevelMin		=	1






function x418284_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418284_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418284_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418284_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418284_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418284_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418284_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + 100000
		SetShengWang( varMap, varPlayer, varShengWang )
		Msg2Player(varMap,varPlayer,format("你获得了%d点声望", 100000),4,3)
		Msg2Player(varMap,varPlayer,format("你获得了%d点声望", 100000),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418284_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
