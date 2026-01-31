

x588049_var_FileId 		= 588049
x588049_var_ScriptName	= "学习元素技能"


x588049_var_TitleInfo		= "\t"
x588049_var_needid = 11000380
x588049_var_neednum = 1500
						
function x588049_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	
	StartTalkTask(varMap)		
		TalkAppendString(varMap,"#Y"..x588049_var_ScriptName.."#W")
		TalkAppendString(varMap,x588049_var_TitleInfo)
	TalkAppendString(varMap,format("需要消耗#R%d#W个#R@item_%d#W", x588049_var_neednum, x588049_var_needid))

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
	if 1~= DelItem(varMap, varPlayer, x588049_var_needid, x588049_var_neednum) then
		Msg2Player(varMap,varPlayer,"扣除道具失败", 8, 3)
		Msg2Player(varMap,varPlayer,"扣除道具失败", 8, 2)
		return
	end
		AddSkillToPlayer(varMap,varPlayer,4714,1,4)
		AddSkillToPlayer(varMap,varPlayer,4814,1,5)
		AddSkillToPlayer(varMap,varPlayer,4914,1,3)
		
end
