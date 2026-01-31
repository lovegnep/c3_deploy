





x430008_var_FileId = 430008
x430008_var_impactId = 9014
x430008_var_impactTime = 30*60*1000 






function x430008_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x430008_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430008_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x430008_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x430008_ProcDeplete( varMap, varPlayer )
	return 1;
end








function x430008_ProcActivateOnce( varMap, varPlayer, varImpact )

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		if( IsHaveSpecificImpact( varMap, varPlayer, x430008_var_impactId ) > 0 ) then
			local lastContinuance = GetImpactContinuanceByDataIndex(varMap, varPlayer, x430008_var_impactId) - GetImpactContinuanceElapsed(varMap, varPlayer, x430008_var_impactId) 
			if lastContinuance >= 0 then
				SetImpactContinuanceByDataIndex( varMap, varPlayer, x430008_var_impactId, lastContinuance + x430008_var_impactTime )
				ResetImpactContinuanceElapsed(varMap, varPlayer, x430008_var_impactId)
				RefreshImpactByDataIndex(varMap, varPlayer,x430008_var_impactId)
			end
		else
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x430008_var_impactId, 0)
		end
	end
	
	
end







function x430008_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
