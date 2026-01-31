




x550308_var_FileId = 550308
x550308_var_TransPos="liangcangexitfour"



function x550308_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550308_var_TransPos)
end


function x550308_ProcMapTimerTick( varMap, monsterobjid )

end


function x550308_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550308_ProcEventEntry( varMap, monsterobjid )

end

