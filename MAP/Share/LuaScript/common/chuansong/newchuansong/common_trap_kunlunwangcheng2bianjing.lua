

x550103_var_FileId = 550103
x550103_var_TransPos="kunlunwangcheng2bianjing"



function x550103_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550103_var_TransPos)
end


function x550103_ProcMapTimerTick( varMap, monsterobjid )

end


function x550103_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550103_ProcEventEntry( varMap, monsterobjid )

end

