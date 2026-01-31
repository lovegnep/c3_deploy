













x587221_var_FileId = 587221 


x587221_var_Buf1 = 6801




function x587221_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )
	if varOpType == 0 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x587221_var_Buf1, 0);
	end
end

