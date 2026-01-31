


function x300775_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	StartTalkTask(varMap);
	
	local Readme_1 = "#Y【国家守边之守卫边塞】介绍#W#r"
	
	local Readme_2 = "\t当您达到40级时，您将可以在王城苏儿台接取国家守边任务，我这里是领取和回复国家守边第二步守卫边塞任务的。#r"
	
	local Readme_3 = "\t#W任务期间死亡，离线或超时，任务自动置成失败状态，找我重新领取。" 
	
	local varReadme = Readme_1..Readme_2..Readme_3
	
	TalkAppendString(varMap,varReadme)
	
	StopTalkTask(varMap);DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	
end




function x300775_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	local Level = GetLevel(varMap, varPlayer)
	if Level >= 40 then
		TalkAppendButton(varMap,300775,"【国家守边之守卫边塞】介绍",5);
	end
end





function x300775_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300775_ProcAccept( varMap, varPlayer )

end




function x300775_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300775_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300775_CheckSubmit( varMap, varPlayer )

end




function x300775_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300775_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300775_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300775_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
