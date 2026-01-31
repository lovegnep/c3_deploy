













x403112_var_FileId = 403112 




x403112_var_Buf1 = 9002 
x403112_var_Buf2 = -1 




function x403112_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403112_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403112_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403112_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403112_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403112_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403112_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403112_var_Buf1, 0);
	end
	return 1;
end







function x403112_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
