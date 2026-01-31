
x300749_var_FileId = 300749


x300749_var_QuestName="八鲁湾之战"

--DECLARE_QUEST_INFO_STOP--



function x300749_ProcEventEntry( varMap, varPlayer, varTalknpc )	
		StartTalkTask(varMap);
		local localexp = (GetLevel( varMap, varPlayer )) *1000*0.8*5	

		local Readme_1 = "#Y八鲁湾之战#r#W"
		
		local Readme_2 = "\t制作中，敬请期待#r"
		
		local varReadme = Readme_1..Readme_2
		
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkMenu(varMap,varPlayer,varTalknpc);DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, -1, -1,2 );
	
end




function x300749_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
end





function x300749_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300749_ProcAccept( varMap, varPlayer )

	
end




function x300749_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300749_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300749_CheckSubmit( varMap, varPlayer )

end




function x300749_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300749_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300749_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300749_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
