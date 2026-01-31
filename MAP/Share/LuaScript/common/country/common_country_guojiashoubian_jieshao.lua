


function x300743_ProcEventEntry( varMap, varPlayer, varTalknpc )	
		StartTalkTask(varMap);
		local localexp = (GetLevel( varMap, varPlayer )) * 1000*0.5*5		
		
		local Readme_1 = "#Y国家守边#W#r"
		
		local Readme_2 = "\t到本国边境守边，防止外族入侵，在规定时间内完成，顺利回复任务会获得守边奖励#G"..localexp.."#W点个人经验。#r"
		
		local Readme_3 = "\t在守边期间，您可以杀死侵犯我方的敌人。"
		
		local varReadme = Readme_1 .. Readme_2 .. Readme_3
				
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkMenu(varMap,varPlayer,varTalknpc);DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, -1, -1,2 );
	
	
end




function x300743_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

end





function x300743_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300743_ProcAccept( varMap, varPlayer )

	
end




function x300743_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300743_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300743_CheckSubmit( varMap, varPlayer )

end




function x300743_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300743_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300743_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300743_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
