
x601004_var_FileId = 601004
x601004_var_Exp	=	10000;


function x601004_ProcIntervalOverEvent( varMap, varPlayer )
end


function x601004_ProcActiveEvent( varMap, varPlayer )
	AddExp(varMap, varPlayer, x601004_var_Exp);
	hf_DisplayAwardInfo(varMap, varPlayer, -1, -1, -1, -1, 0, x601004_var_Exp, -1, 0);
end


function x601004_ProcFadeOutEvent( varMap, varPlayer )
end
