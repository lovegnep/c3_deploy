



x550309_var_FileId = 550309
x550309_var_TransPos="liangcangexitfive"



function x550309_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550309_var_TransPos)
end


function x550309_ProcMapTimerTick( varMap, monsterobjid )

end


function x550309_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550309_ProcEventEntry( varMap, monsterobjid )

end

