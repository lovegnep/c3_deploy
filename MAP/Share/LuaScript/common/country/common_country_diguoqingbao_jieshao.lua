


function x300745_ProcEventEntry( varMap, varPlayer, varTalknpc )	
		StartTalkTask(varMap);
		local localexp = (GetLevel( varMap, varPlayer )) *1000*0.6*3	

		local Readme_1 = "#Y敌国情报#r#W"
		
		local Readme_2 = "\t出国获取敌国的机密情报，完成任务后顺利回复任务获得#g"..localexp.."#W点个人经验。#r"
		
		local Readme_3 = "\t由于是到敌国完成任务，您需要处处小心，建议您组队或集体完成本任务。"
		
		local varReadme = Readme_1..Readme_2..Readme_3
		
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkMenu(varMap,varPlayer,varTalknpc);DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, -1, -1,2 );
	
end




function x300745_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

end





function x300745_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300745_ProcAccept( varMap, varPlayer )

	
end




function x300745_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300745_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300745_CheckSubmit( varMap, varPlayer )

end




function x300745_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300745_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300745_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300745_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
