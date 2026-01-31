













x403119_var_FileId = 403119 




x403119_var_Buf1 = 9015 
x403119_var_Buf2 = -1 




function x403119_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403119_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403119_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403119_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403119_ProcDeplete( varMap, varPlayer )
		return 1;
end








function x403119_ProcActivateOnce( varMap, varPlayer )
	if(-1==x403119_var_Buf1) then
		return 0;
	end

	if( IsHaveSpecificImpact( varMap, varPlayer, x403119_var_Buf1 ) > 0 ) then
		local ImpactContinuance = GetImpactContinuanceByDataIndex(varMap, varPlayer, x403119_var_Buf1)
		local lastContinuance = ImpactContinuance - GetImpactContinuanceElapsed(varMap, varPlayer, x403119_var_Buf1)
		
		if lastContinuance + 15*60*1000 > 2147483647 then
			Msg2Player(varMap, varPlayer, "天赋时间已达上限！", 8, 2)
			Msg2Player(varMap, varPlayer, "天赋时间已达上限！", 8, 3)
			return 
		end

		if 2147483647 - lastContinuance < ImpactContinuance then
			ImpactContinuance = 2147483647 - lastContinuance
		end
		
		if lastContinuance >= 0 then
			if(DepletingUsedItem(varMap, varPlayer)) == 1 then
				SetImpactContinuanceByDataIndex( varMap, varPlayer, x403119_var_Buf1, lastContinuance+15*60*1000 )
				ResetImpactContinuanceElapsed(varMap, varPlayer, x403119_var_Buf1)
				RefreshImpactByDataIndex(varMap, varPlayer,x403119_var_Buf1)
			end
		end
	else
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then     
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403119_var_Buf1, 0);
		end
	end
	return 1;
end








function x403119_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
