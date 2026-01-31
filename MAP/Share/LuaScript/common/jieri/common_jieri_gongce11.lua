
x350010_var_FileId = 350010
x350010_var_QuestName = "祈福种子介绍"
x350010_var_AwardInfo = "\n\t#Y\n\t#Y祈福种子：\n\t#W每天可以用来祈福1次，祈福后会获得随机金币商城道具的奖励。\n\t#Y黄金祈福种子：\n\t#W黄金祈福种子可以一直进行祈福，每次祈福后都会获得随机金币商城道具的奖励。"


function x350010_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x350010_var_FileId,x350010_var_QuestName,0,-1)
	return 0
	
end




function x350010_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	StartTalkTask(varMap)
	TalkAppendString(varMap,x350010_var_AwardInfo)
	StopTalkTask(varMap)
	DeliverTalkMenu( varMap,varPlayer,varTalknpc )

	

end

function x350010_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)


end






function x350010_ProcAccept( varMap, varPlayer )
end

function x350010_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x350010_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end




function x350010_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x350010_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x350010_CheckSubmit( varMap, varPlayer )
end



function x350010_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x350010_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


