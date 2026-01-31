




x550301_var_FileId = 550301
x550301_var_TransPos="liangcangenterone"



function x550301_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550301_var_TransPos)
end


function x550301_ProcMapTimerTick( varMap, monsterobjid )

end


function x550301_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550301_ProcEventEntry( varMap, monsterobjid )

end

