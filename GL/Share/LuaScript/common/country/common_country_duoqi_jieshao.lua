function x300741_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	
	
end
function x300741_ProcEventEntry( varMap, varPlayer, varTalknpc )	

	local Readme_1 = "#Y【夺旗】介绍#W#r"
	
	local Readme_2 = "\t当您达到40级时，您将可以接取夺旗系列任务。#r"
	
	local Readme_3 = "\t您可以接取#G国家守边#W，#G异国杀怪#W，#G敌国刺探#W和#G敌国情报#W四个任务。完成这些任务，可以获得#G高额奖励#W。"
	
	local varReadme = Readme_1..Readme_2..Readme_3
	
	StartTalkTask(varMap);TalkAppendString(varMap,varReadme)
	
	TalkAppendButton(varMap,300743,"国家守边",0,1)
	
	TalkAppendButton(varMap,300742,"异国杀怪",0,1)
	
	TalkAppendButton(varMap,300744,"敌国刺探",0,1)
	
	TalkAppendButton(varMap,300745,"敌国情报",0,1)
	
	StopTalkTask(varMap);DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	
end










function x300741_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300741_ProcAccept( varMap, varPlayer )

end




function x300741_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300741_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300741_CheckSubmit( varMap, varPlayer )

end




function x300741_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300741_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300741_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300741_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
