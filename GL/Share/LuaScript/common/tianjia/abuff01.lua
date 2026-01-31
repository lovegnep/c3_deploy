













x587200_var_FileId = 587200 


x587200_var_Buf1 = 22462




function x587200_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )
	if varOpType == 0 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x587200_var_Buf1, 0);
	end
end

