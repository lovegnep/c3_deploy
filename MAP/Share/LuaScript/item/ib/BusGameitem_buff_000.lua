











x430500_var_FileId = 430500 



x430500_var_Buf = 7043

x430500_var_AddImpact = 7045



function x430500_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )
	
		
	
			

end






function x430500_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430500_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x430500_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x430500_ProcDeplete( varMap, varPlayer )
	
		
	
	return 1;
end








function x430500_ProcActivateOnce( varMap, varPlayer )

end







function x430500_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
