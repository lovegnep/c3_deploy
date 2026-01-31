













x403006_var_FileId = 403006 




x403006_var_Buf1 = 8006 
x403006_var_Buf2 = -1 




function x403006_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403006_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403006_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403006_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403006_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403006_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403006_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403006_var_Buf1, 0);
	end
	return 1;
end







function x403006_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
