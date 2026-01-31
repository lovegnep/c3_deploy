
x601002_var_FileId = 601002
x601002_var_Exp	=	5000;


function x601002_ProcIntervalOverEvent( varMap, varPlayer )
end


function x601002_ProcActiveEvent( varMap, varPlayer )
	AddExp(varMap, varPlayer, x601002_var_Exp);
	hf_DisplayAwardInfo(varMap, varPlayer, -1, -1, -1, -1, 0, x601002_var_Exp, -1, 0);
end


function x601002_ProcFadeOutEvent( varMap, varPlayer )
end
