


x550306_var_FileId = 550306
x550306_var_TransPos="liangcangexittwo"



function x550306_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550306_var_TransPos)
end


function x550306_ProcMapTimerTick( varMap, monsterobjid )

end


function x550306_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550306_ProcEventEntry( varMap, monsterobjid )

end

