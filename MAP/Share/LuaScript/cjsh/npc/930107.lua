

x930107_var_FileId 		= 930107
x930107_var_ScriptName	= "学习召唤技能"
x930107_var_skill1					= {139,218,319,424,520,618,1115,1216,1316,1417,1514,1615}	
x930107_var_skill2					= {140,219,320,425,521,619,1116,1217,1317,1418,1515,1616}	

x930107_var_TitleInfo		= "\t"
x930107_var_needid = 11000380
x930107_var_neednum = 1500

						
function x930107_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	
	StartTalkTask(varMap)		
	TalkAppendString(varMap,"#Y"..x930107_var_ScriptName.."#W")
	TalkAppendString(varMap,x930107_var_TitleInfo)
	TalkAppendString(varMap,format("需要消耗#R%d#W个#R@item_%d#W", x930107_var_neednum, x930107_var_needid))
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930107_var_FileId, x930107_var_FileId)
end


function x930107_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap,x930107_var_FileId,x930107_var_ScriptName,3,0)

end

function x300479_ProcMapTimerTick( varMap, monsterobjid )

end
function x930107_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x930107_ProcAccept( varMap, varPlayer )
		local ZhiYe= GetZhiye( varMap, varPlayer)

	if 1~= DelItem(varMap, varPlayer, x930107_var_needid, x930107_var_neednum) then
		Msg2Player(varMap,varPlayer,"扣除道具失败", 8, 3)
		Msg2Player(varMap,varPlayer,"扣除道具失败", 8, 2)
		return
	end

	AddSkillToPlayer(varMap,varPlayer,x930107_var_skill1[ZhiYe+1],1,6)
		AddSkillToPlayer(varMap,varPlayer,x930107_var_skill2[ZhiYe+1],1,7)
		
end
