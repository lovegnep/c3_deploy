
x801000_var_FileId = 801000

x801000_var_QuestName = "挑战守护兽"

x801000_var_garden_angle_def_camp = 22	-- 防守方守护兽阵营
x801000_var_garden_angle_att_camp = 23	-- 挑战方守护兽阵营

function x801000_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x801000_var_FileId,x801000_var_QuestName,0,-1)
	return 0
end




function x801000_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	

end

function x801000_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

end


function x801000_AddAward( varMap, varPlayer,itemNum,varIndex, dbIndex )

end

function x801000_ProcAccept( varMap, varPlayer )

end

function x801000_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x801000_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end




function x801000_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x801000_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x801000_CheckSubmit( varMap, varPlayer )
end



function x801000_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x801000_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


