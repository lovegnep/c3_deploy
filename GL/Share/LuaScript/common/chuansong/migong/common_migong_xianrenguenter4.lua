




x550315_var_FileId = 550315
x550315_var_TransPos="xianrenguenterfour"



function x550315_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550315_var_TransPos)
end


function x550315_ProcMapTimerTick( varMap, monsterobjid )

end


function x550315_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550315_ProcEventEntry( varMap, monsterobjid )

end

