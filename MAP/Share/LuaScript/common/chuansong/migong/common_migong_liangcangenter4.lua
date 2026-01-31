




x550303_var_FileId = 550303
x550303_var_TransPos="liangcangenterfour"



function x550303_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550303_var_TransPos)
end


function x550303_ProcMapTimerTick( varMap, monsterobjid )

end


function x550303_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550303_ProcEventEntry( varMap, monsterobjid )

end

