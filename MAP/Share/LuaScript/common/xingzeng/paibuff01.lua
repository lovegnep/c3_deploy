













x588010_var_FileId = 588010 


x588010_var_Buf1 = 22673




function x588010_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )
	if varOpType == 0 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x588010_var_Buf1, 0);
	end
end

