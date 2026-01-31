
x601001_var_FileId = 601001
x601001_var_Exp	=	3000;


function x601001_ProcIntervalOverEvent( varMap, varPlayer )
end


function x601001_ProcActiveEvent( varMap, varPlayer )
	AddExp(varMap, varPlayer, x601001_var_Exp);
	hf_DisplayAwardInfo(varMap, varPlayer, -1, -1, -1, -1, 0, x601001_var_Exp, -1, 0);
end


function x601001_ProcFadeOutEvent( varMap, varPlayer )
end
