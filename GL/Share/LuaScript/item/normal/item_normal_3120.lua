













x403120_var_FileId = 403120 




x403120_var_Buf1 = 9016 
x403120_var_Buf2 = -1 




function x403120_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403120_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403120_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403120_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403120_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403120_ProcActivateOnce( varMap, varPlayer )
	if(-1==x403120_var_Buf1) then
		return 0;
	end

	if( IsHaveSpecificImpact( varMap, varPlayer, x403120_var_Buf1 ) > 0 ) then
		local ImpactContinuance = GetImpactContinuanceByDataIndex(varMap, varPlayer, x403120_var_Buf1)
		local lastContinuance = ImpactContinuance - GetImpactContinuanceElapsed(varMap, varPlayer, x403120_var_Buf1)

		if 2147483647 - lastContinuance < ImpactContinuance then
			ImpactContinuance = 2147483647 - lastContinuance
		end
		
		if lastContinuance >= 0 then
			SetImpactContinuanceByDataIndex( varMap, varPlayer, x403120_var_Buf1, lastContinuance+15*60*1000 )
			ResetImpactContinuanceElapsed(varMap, varPlayer, x403120_var_Buf1)
			RefreshImpactByDataIndex(varMap, varPlayer,x403120_var_Buf1)

		end
	else
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403120_var_Buf1, 0);
	end
	return 1;
end








function x403120_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
