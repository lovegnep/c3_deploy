













x417003_var_FileId = 417003 


x417003_var_Buf1 = 7044 




function x417003_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )
	if varOpType == 0 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x417003_var_Buf1, 0);
	end
end

