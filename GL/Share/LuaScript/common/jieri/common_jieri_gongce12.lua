
x350011_var_FileId = 350011
x350011_var_QuestName = "圣诞上线送礼"
x350011_var_AwardInfo = "\t从#G12月22日起至1月4日#W，每天的#G12：00—12：10、15：00—15：10、18：00—18：10和21：00—21：10，#W各位玩家可以在这里领取圣诞礼物。\n\t#G许愿种子#W和#G祈福种子#W就包含在这些圣诞礼物中，你可以使用许愿种子或祈福种子去圣诞树处许愿祈福。"


function x350011_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x350011_var_FileId,x350011_var_QuestName,0,-1)
	return 0
	
end




function x350011_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	StartTalkTask(varMap)
	TalkAppendString(varMap,x350011_var_AwardInfo)
	StopTalkTask(varMap)
	DeliverTalkMenu( varMap,varPlayer,varTalknpc )

	

end

function x350011_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)


end






function x350011_ProcAccept( varMap, varPlayer )
end

function x350011_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x350011_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end




function x350011_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x350011_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x350011_CheckSubmit( varMap, varPlayer )
end



function x350011_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x350011_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


