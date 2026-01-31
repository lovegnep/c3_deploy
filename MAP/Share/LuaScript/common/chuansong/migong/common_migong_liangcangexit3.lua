




x550307_var_FileId = 550307
x550307_var_TransPos="liangcangexitthree"



function x550307_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550307_var_TransPos)
end


function x550307_ProcMapTimerTick( varMap, monsterobjid )

end


function x550307_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550307_ProcEventEntry( varMap, monsterobjid )

end

