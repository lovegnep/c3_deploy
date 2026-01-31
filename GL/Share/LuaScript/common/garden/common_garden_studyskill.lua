
x801001_var_FileId = 801001

x801001_var_QuestName = "学习守护兽技能"


function x801001_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x801001_var_FileId,x801001_var_QuestName,0,-1)
	return 0
end




function x801001_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	

end

function x801001_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

end


function x801001_AddAward( varMap, varPlayer,itemNum,varIndex, dbIndex )

end

function x801001_ProcAccept( varMap, varPlayer )

end

function x801001_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x801001_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end




function x801001_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x801001_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x801001_CheckSubmit( varMap, varPlayer )
end



function x801001_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x801001_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


