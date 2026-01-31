













x403109_var_FileId = 403109 




x403109_var_Buf1 = 8109 
x403109_var_Buf2 = -1 




function x403109_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403109_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403109_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403109_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403109_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403109_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403109_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403109_var_Buf1, 0);
	end
	return 1;
end







function x403109_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
