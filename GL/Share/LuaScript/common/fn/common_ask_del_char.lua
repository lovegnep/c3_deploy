
x561102_var_FileId = 561102
x561102_var_QuestName = "删除角色"


function x561102_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,561102,x561102_var_QuestName,0,-1)
	
end




function x561102_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	

	StartTalkTask(varMap)
	TalkAppendString(varMap,"\t你确定要删除吗？")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, 561102, -1);

end



function x561102_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	
	return 1

end





function x561102_ProcAccept( varMap, varPlayer )

	if x561102_IsCanDeleteChar( varMap, varPlayer ) == 1 then
		AskDeleteChar( varMap, varPlayer )
	end

end


function x561102_ProcDeleteChar( varMap, varPlayer )

	if x561102_IsCanDeleteChar( varMap, varPlayer ) == 1 then
		DeleteChar( varMap, varPlayer )
	end

end

function x561102_IsCanDeleteChar( varMap, varPlayer )

	if CountryGetOfficial( varMap, varPlayer ) > 0 then 
		StartTalkTask(varMap)
		TalkAppendString(varMap,"删除角色前请先解除国家内的一切职务。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0		
	end
	
	if GetEmpirePosition( varMap, varPlayer ) ~= 0 then
	    
	    StartTalkTask(varMap)
		TalkAppendString(varMap,"删除角色前请先解除帝国内的一切职务。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0		
	
	end

	
	if GetGuildID( varMap, varPlayer ) ~= -1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"删除角色前请先退出帮会。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end

	
	if IsMarried( varMap, varPlayer ) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"删除角色前请先离婚。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end

	
	if IsHaveMaster( varMap, varPlayer ) > 0 or IsHavePrentice( varMap, varPlayer ) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"删除角色前请先解除师徒关系。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end

	
	if IsHaveFriend( varMap, varPlayer ) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"删除角色前请先删除所有好友。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end	
	
	return 1

end





function x561102_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x561102_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x561102_CheckSubmit( varMap, varPlayer )
end



function x561102_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x561102_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x561102_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x561102_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
