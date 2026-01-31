













x587250_var_FileId = 587250 


x587250_var_Buf1 = 6830




function x587250_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )
	if varOpType == 0 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x587250_var_Buf1, 0);
	end
end

