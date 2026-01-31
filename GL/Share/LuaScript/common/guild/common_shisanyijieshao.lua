
x300748_var_FileId = 300748


x300748_var_QuestName="十三翼之战"

--DECLARE_QUEST_INFO_STOP--



function x300748_ProcEventEntry( varMap, varPlayer, varTalknpc )	
		StartTalkTask(varMap);
		local localexp = (GetLevel( varMap, varPlayer )) *1000*0.8*10	

		local Readme_1 = "#Y十三翼之战#r#W"
		
		local Readme_2 = "\t制作中，敬请期待#r"
		
		local varReadme = Readme_1..Readme_2		
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkMenu(varMap,varPlayer,varTalknpc);DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, -1, -1,2 );
	
end




function x300748_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
end





function x300748_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300748_ProcAccept( varMap, varPlayer )

	
end




function x300748_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300748_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300748_CheckSubmit( varMap, varPlayer )

end




function x300748_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300748_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300748_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300748_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
