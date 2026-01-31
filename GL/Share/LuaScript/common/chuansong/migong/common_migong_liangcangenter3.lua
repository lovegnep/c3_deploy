




x550302_var_FileId = 550302
x550302_var_TransPos="liangcangenterthree"



function x550302_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550302_var_TransPos)
end


function x550302_ProcMapTimerTick( varMap, monsterobjid )

end


function x550302_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550302_ProcEventEntry( varMap, monsterobjid )

end

