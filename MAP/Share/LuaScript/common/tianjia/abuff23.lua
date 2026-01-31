













x587222_var_FileId = 587222 


x587222_var_Buf1 = 6802




function x587222_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )
	if varOpType == 0 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x587222_var_Buf1, 0);
	end
end

