













x587240_var_FileId = 587240 


x587240_var_Buf1 = 6820




function x587240_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )
	if varOpType == 0 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x587240_var_Buf1, 0);
	end
end

