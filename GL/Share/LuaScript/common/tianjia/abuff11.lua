













x587210_var_FileId = 587210 


x587210_var_Buf1 = 22511




function x587210_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )
	if varOpType == 0 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x587210_var_Buf1, 0);
	end
end

