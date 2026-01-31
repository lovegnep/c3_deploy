













x404886_var_FileId = 404886 




x404886_var_Buf1 = -1 
x404886_var_Buf2 = -1 




function x404886_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404886_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404886_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404886_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404886_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404886_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x404886_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x404886_var_Buf1, 0);
	end

    AddExp( varMap, varPlayer, 10000)
	return 1;
end







function x404886_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
