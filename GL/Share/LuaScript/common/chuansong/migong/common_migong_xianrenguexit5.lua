


x550318_var_FileId = 550318
x550318_var_TransPos="xianrenguexitfive"



function x550318_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550318_var_TransPos)
end


function x550318_ProcMapTimerTick( varMap, monsterobjid )

end


function x550318_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550318_ProcEventEntry( varMap, monsterobjid )

end

