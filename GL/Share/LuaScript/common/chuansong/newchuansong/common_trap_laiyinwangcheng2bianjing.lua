

x550102_var_FileId = 550102
x550102_var_TransPos="laiyinwangcheng2bianjing"



function x550102_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550102_var_TransPos)
end


function x550102_ProcMapTimerTick( varMap, monsterobjid )

end


function x550102_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550102_ProcEventEntry( varMap, monsterobjid )

end

