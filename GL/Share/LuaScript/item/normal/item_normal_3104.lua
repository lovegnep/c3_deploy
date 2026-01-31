













x403104_var_FileId = 403104 




x403104_var_Buf1 = 8104 
x403104_var_Buf2 = -1 




function x403104_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403104_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403104_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403104_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403104_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403104_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403104_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403104_var_Buf1, 0);
	end
	return 1;
end







function x403104_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
