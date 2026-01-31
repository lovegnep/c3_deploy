













x403010_var_FileId = 403010 




x403010_var_Buf1 = 8010 
x403010_var_Buf2 = -1 




function x403010_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403010_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403010_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403010_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403010_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403010_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403010_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403010_var_Buf1, 0);
	end
	return 1;
end







function x403010_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
