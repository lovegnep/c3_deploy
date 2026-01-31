
x350009_var_FileId = 350009
x350009_var_QuestName = "关于圣诞许愿和圣诞祈福"
x350009_var_AwardInfo = "\n#Y许愿种子：#W\n\t许愿种子，代表着真诚的许诺和美好的愿望，使用许愿种子后，可以让好运一直伴随在你的身边。\n\t在活动期间每天可以许愿十六次，每次许愿需要3个许愿种子。"
x350009_var_AwardInfo1 ="\n#Y祈福种子，#W\n\t祈福种子，代表着衷心的祈祷和善意的祝福，使用祈福种子后，有可能会获得神秘的礼物哦。\n\t在活动期间每天都可以祈福，祈福后会获得神秘礼品。"

function x350009_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x350009_var_FileId,x350009_var_QuestName,0,-1)
	return 0
	
end




function x350009_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	StartTalkTask(varMap)
	TalkAppendString(varMap,x350009_var_AwardInfo)
	TalkAppendString(varMap,x350009_var_AwardInfo1)
	StopTalkTask(varMap)
	DeliverTalkMenu( varMap,varPlayer,varTalknpc )

	

end

function x350009_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)


end






function x350009_ProcAccept( varMap, varPlayer )
end

function x350009_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x350009_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end




function x350009_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x350009_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x350009_CheckSubmit( varMap, varPlayer )
end



function x350009_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x350009_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


