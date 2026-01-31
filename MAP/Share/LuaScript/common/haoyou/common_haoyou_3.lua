
x601003_var_FileId = 601003
x601003_var_Exp	=	8000;


function x601003_ProcIntervalOverEvent( varMap, varPlayer )
end


function x601003_ProcActiveEvent( varMap, varPlayer )
	AddExp(varMap, varPlayer, x601003_var_Exp);
	hf_DisplayAwardInfo(varMap, varPlayer, -1, -1, -1, -1, 0, x601003_var_Exp, -1, 0);
end


function x601003_ProcFadeOutEvent( varMap, varPlayer )
end
