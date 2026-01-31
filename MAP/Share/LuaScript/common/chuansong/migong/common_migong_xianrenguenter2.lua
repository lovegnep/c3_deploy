




x550311_var_FileId = 550311
x550311_var_TransPos="xianrenguentertwo"



function x550311_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550311_var_TransPos)
end


function x550311_ProcMapTimerTick( varMap, monsterobjid )

end


function x550311_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550311_ProcEventEntry( varMap, monsterobjid )

end

