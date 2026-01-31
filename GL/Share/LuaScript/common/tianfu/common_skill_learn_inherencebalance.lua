

--DECLARE_QUEST_INFO_START--

x570060_var_FileId = 570060







x570060_var_QuestName="平衡天赋学习"
--DECLARE_QUEST_INFO_STOP--



function x570060_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	if GetGameOpenById(1054 ) == 0 then
		return
	end
	local inherenceLevel = GetInherenceLevel( varMap, varPlayer )
	if  inherenceLevel < 30 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您的天赋等级不足30级，还不能学习平衡天赋。");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	else
		OpenInherenceBalanceStudyUI(varMap, varPlayer)
	end
	return 0
end




function x570060_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	if GetGameOpenById(1054 ) == 0 then
		return
	end
	
	TalkAppendButton(varMap,x570060_var_FileId,x570060_var_QuestName,3);
end





function x570060_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x570060_ProcAccept( varMap, varPlayer )

end




function x570060_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570060_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570060_CheckSubmit( varMap, varPlayer )

end




function x570060_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570060_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570060_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570060_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
