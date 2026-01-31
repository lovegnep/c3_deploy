
x561100_var_FileId = 561100
x561100_var_QuestName = "【领取奖励说明】"
x561100_var_AwardInfo = "\t在我这里可以领取活动的奖励以及系统补偿。但是您必须在《成吉思汗3 恶狼传说》官网进行相关的启动。\n\t当您顺利在官网进行启动后，可以点击#G领取奖励补偿#W按钮进行领取！"


function x561100_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x561100_var_FileId,x561100_var_QuestName,0,-1)
	return 0
	
end




function x561100_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	StartTalkTask(varMap)
	TalkAppendString(varMap,"#Y"..x561100_var_QuestName)
	TalkAppendString(varMap,x561100_var_AwardInfo)
	StopTalkTask(varMap)
	DeliverTalkMenu( varMap,varPlayer,varTalknpc )

	

end

function x561100_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)


end






function x561100_ProcAccept( varMap, varPlayer )
end

function x561100_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x561100_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end




function x561100_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x561100_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x561100_CheckSubmit( varMap, varPlayer )
end



function x561100_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x561100_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


