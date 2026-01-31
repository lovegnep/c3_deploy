

x588049_var_FileId 		= 588049
x588049_var_ScriptName	= "学习元素技能"


x588049_var_TitleInfo		= "\t"

						
function x588049_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	
	StartTalkTask(varMap)		
		TalkAppendString(varMap,"#Y"..x588049_var_ScriptName.."#W")
		TalkAppendString(varMap,x588049_var_TitleInfo)
		
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588049_var_FileId, x588049_var_FileId)
end


function x588049_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap,x588049_var_FileId,x588049_var_ScriptName,3,0)

end

function x300479_ProcMapTimerTick( varMap, monsterobjid )

end
function x588049_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x588049_ProcAccept( varMap, varPlayer )
		AddSkillToPlayer(varMap,varPlayer,8502,1,4)
		AddSkillToPlayer(varMap,varPlayer,4814,1,5)
		AddSkillToPlayer(varMap,varPlayer,4914,1,3)
		
end
