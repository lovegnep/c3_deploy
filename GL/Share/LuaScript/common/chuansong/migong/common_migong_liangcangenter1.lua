


x550300_var_FileId = 550300
x550300_var_TransPos="liangcangenterone"



function x550300_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550300_var_TransPos)
end


function x550300_ProcMapTimerTick( varMap, monsterobjid )

end


function x550300_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550300_ProcEventEntry( varMap, monsterobjid )

end

