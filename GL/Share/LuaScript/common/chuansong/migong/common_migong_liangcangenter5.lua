


x550304_var_FileId = 550304
x550304_var_QuestName="µØÏÂÁ¸²Ö"
x550304_var_TransPos="liangcangenterfive"



function x550304_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550304_var_TransPos)
end


function x550304_ProcMapTimerTick( varMap, monsterobjid )

end


function x550304_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550304_ProcEventEntry( varMap, monsterobjid )

end

