













x403108_var_FileId = 403108 




x403108_var_Buf1 = 8108 
x403108_var_Buf2 = -1 




function x403108_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403108_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403108_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403108_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403108_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403108_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403108_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403108_var_Buf1, 0);
	end
	return 1;
end







function x403108_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
