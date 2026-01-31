

x930202_var_FileId 		= 930202
x930202_var_ScriptName	= "传送至大都"


x930202_var_TitleInfo		= "\t"

						
function x930202_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	
	StartTalkTask(varMap)		
		TalkAppendString(varMap,"#Y"..x930202_var_ScriptName.."#W")
		TalkAppendString(varMap,x930202_var_TitleInfo)
		
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930202_var_FileId, x930202_var_FileId)
end


function x930202_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap,x930202_var_FileId,x930202_var_ScriptName,3,0)

end

function x300479_ProcMapTimerTick( varMap, monsterobjid )

end
function x930202_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x930202_ProcAccept( varMap, varPlayer )
	NewWorld(varMap,varPlayer,0,259,192,930202)
end
