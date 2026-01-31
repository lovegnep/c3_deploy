

--DECLARE_QUEST_INFO_START--

x800026_var_FileId = 800026
--DECLARE_QUEST_INFO_STOP--




function x800026_SubTrainMoneyRate( varMap, varLevel, attack, mode, constant )	
	local mode = mode/10
	local Money
	if varLevel < 10 then
		Money = ceil(varLevel*attack*mode)
	else
		Money = ceil(varLevel*varLevel*attack*mode/10)
	end
	
	if Money > 0 then
		return Money
	else
		return 0
	end
end







function x800026_ProcEventEntry( varMap, varPlayer, varTalknpc )	

end




function x800026_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x800026_var_FileId,"´úÁ·");
end





function x800026_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x800026_ProcAccept( varMap, varPlayer )

end




function x800026_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800026_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800026_CheckSubmit( varMap, varPlayer )

end




function x800026_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800026_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800026_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800026_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
