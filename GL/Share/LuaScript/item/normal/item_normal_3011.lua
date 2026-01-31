













x403011_var_FileId = 403011 




x403011_var_Buf1 = 8201 
x403011_var_Buf2 = -1 




function x403011_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403011_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403011_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403011_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403011_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403011_ProcActivateOnce( varMap, varPlayer )

	if(-1~=x403011_var_Buf1) then

		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403011_var_Buf1, 0);
	end
	return 1;
end







function x403011_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
