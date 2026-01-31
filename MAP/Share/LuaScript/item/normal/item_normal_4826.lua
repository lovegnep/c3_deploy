













x404826_var_FileId = 404826 




x404826_var_Buf1 = 9826 
x404826_var_Buf2 = -1 




function x404826_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404826_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404826_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404826_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404826_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404826_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404826_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404826_var_Buf1, 0);
	end
	return 1;
end







function x404826_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
