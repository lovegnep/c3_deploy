


















x430003_var_Buf1 = 9012 




function x430003_ProcEventEntry( varMap, varPlayer, varBagIdx )
	
	return 0;


end






function x430003_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430003_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x430003_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x430003_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer) > 0) then
		return 1;
	end
	return 0;
end








function x430003_ProcActivateOnce( varMap, varPlayer )
	local haveImpact  = IsHaveSpecificImpact(varMap, varPlayer, 9011)
  local haveImpact1 = IsHaveSpecificImpact(varMap, varPlayer, 9013)
	if(haveImpact > 0) then
		DispelSpecificImpact( varMap, varPlayer, 9011 )
	else if(haveImpact1 > 0) then
		DispelSpecificImpact( varMap, varPlayer, 9013 )
	end
end
	
	if(-1~=x430003_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x430003_var_Buf1, 0);
		GamePlayScriptLog( varMap, varPlayer, 2643)
	end
	return 1;
end







function x430003_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
