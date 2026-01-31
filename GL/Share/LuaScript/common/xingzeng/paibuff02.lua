













x588011_var_FileId = 588011 


x588011_var_Buf1 = 22674




function x588011_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )
	if varOpType == 0 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x588011_var_Buf1, 0);
	end
end

