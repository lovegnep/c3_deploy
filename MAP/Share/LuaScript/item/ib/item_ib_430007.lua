



















x430007_var_Buf1 = 9013 





function x430007_ProcEventEntry( varMap, varPlayer, varBagIdx )
	
	return 0;


end






function x430007_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430007_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x430007_ProcConditionCheck( varMap, varPlayer )
	

	local haveImpact = IsHaveSpecificImpact(varMap, varPlayer, 9011)
	local haveImpact1 = IsHaveSpecificImpact(varMap, varPlayer, 9012)
	if(haveImpact > 0 or haveImpact1 > 0 ) then
		StartTalkTask(varMap)
			TalkAppendString(varMap, "你已经拥有更强大的请柬")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		
		return 0
	end
	return 1; 
end







function x430007_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer) > 0) then
		return 1;
	end
	return 0;
end








function x430007_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x430007_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x430007_var_Buf1, 0);
		GamePlayScriptLog( varMap, varPlayer, 2644)
		LuaCallNoclosure(300824, "CancelWaiguaDati", varMap, varPlayer);
	end
	return 1;
end







function x430007_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
