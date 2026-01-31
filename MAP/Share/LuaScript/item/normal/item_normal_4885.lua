













x404885_var_FileId = 404885 




x404885_var_Buf1 = 8001 
x404885_var_Buf2 = -1 




function x404885_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404885_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404885_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






 function x404885_ProcConditionCheck( varMap, varPlayer )
	
	 if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	local varTalknpc = GetTargetObjID(varMap, varPlayer)
	if(0<=varTalknpc) then
		




		
		
		
		
		
		




		








return 1;
	end

	return 0; 
end







function x404885_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end








function x404885_ProcActivateOnce( varMap, varPlayer, varImpact )
	if(-1~=x404885_var_Buf1) then
		local varTalknpc = GetTargetObjID(varMap, varPlayer)
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varTalknpc, varImpact, 0);
	end
	return 1;
end







function x404885_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
