


function x300742_ProcEventEntry( varMap, varPlayer, varTalknpc )	
		StartTalkTask(varMap);
		local localexp = (GetLevel( varMap, varPlayer )) *1000*0.8*3

		local Readme_1 = "#Y异国杀怪#r#W"
		
		local Readme_2 = "\t出国去杀死任务目标怪物，获得任务物品，顺利回复任务获得#G"..localexp.."#W点个人经验。#r"
		
		local Readme_3 = "\t由于是到敌国完成任务，您需要处处小心，建议您组队完成本任务。"
		
		local varReadme = Readme_1..Readme_2..Readme_3
		
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkMenu(varMap,varPlayer,varTalknpc);DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, -1, -1,2 );
	
end




function x300742_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

end





function x300742_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300742_ProcAccept( varMap, varPlayer )

	
end




function x300742_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300742_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300742_CheckSubmit( varMap, varPlayer )

end




function x300742_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300742_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300742_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300742_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
