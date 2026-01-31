
x601005_var_FileId = 601005
x601005_var_Exp	=	15000;


function x601005_ProcIntervalOverEvent( varMap, varPlayer )
end


function x601005_ProcActiveEvent( varMap, varPlayer )
	AddExp(varMap, varPlayer, x601005_var_Exp);
	hf_DisplayAwardInfo(varMap, varPlayer, -1, -1, -1, -1, 0, x601005_var_Exp, -1, 0);
end


function x601005_ProcFadeOutEvent( varMap, varPlayer )
end
