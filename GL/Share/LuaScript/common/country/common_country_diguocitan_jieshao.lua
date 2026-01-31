


function x300744_ProcEventEntry( varMap, varPlayer, varTalknpc )	
		StartTalkTask(varMap);
		local localexp = (GetLevel( varMap, varPlayer )) *1000*1*3

		local Readme_1 = "#Y敌国刺探#r#W"
		
		local Readme_2 = "\t出国去杀死敌国指定NPC，完成任务顺利回复获得#G"..localexp.."#W点个人经验。#r"
		
		local Readme_3 = "\t由于是到敌国完成任务，您需要处处小心，建议您组队或集体完成本任务。"
		
		local varReadme = Readme_1..Readme_2..Readme_3
		
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkMenu(varMap,varPlayer,varTalknpc);DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, -1, -1,2 );
	
end




function x300744_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

end





function x300744_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300744_ProcAccept( varMap, varPlayer )

	
end




function x300744_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300744_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300744_CheckSubmit( varMap, varPlayer )

end




function x300744_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300744_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300744_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300744_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
