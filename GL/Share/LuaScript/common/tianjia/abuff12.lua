













x587211_var_FileId = 587211 


x587211_var_Buf1 = 22512




function x587211_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )
	if varOpType == 0 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x587211_var_Buf1, 0);
	end
end

