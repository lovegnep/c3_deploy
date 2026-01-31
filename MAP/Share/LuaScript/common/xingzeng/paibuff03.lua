













x588012_var_FileId = 588012 


x588012_var_Buf1 = 22675




function x588012_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )
	if varOpType == 0 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x588012_var_Buf1, 0);
	end
end

