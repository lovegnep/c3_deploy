













x404832_var_FileId = 404832 




x404832_var_Buf1 = 9832 
x404832_var_Buf2 = -1 




function x404832_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404832_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404832_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404832_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404832_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404832_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404832_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404832_var_Buf1, 0);
	end
	return 1;
end







function x404832_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
