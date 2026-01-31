













x403103_var_FileId = 403103 




x403103_var_Buf1 = 8103 
x403103_var_Buf2 = -1 




function x403103_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x403103_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x403103_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x403103_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x403103_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x403103_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x403103_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x403103_var_Buf1, 0);
	end
	return 1;
end







function x403103_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
