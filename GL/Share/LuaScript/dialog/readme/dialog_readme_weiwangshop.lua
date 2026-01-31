
function x103000_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,103000,"【威望说明】",0,0)	
end




function x103000_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)	
		local Readme_1 = "#Y【威望说明】#r"
		local Readme_2 = "#W\t当#G徒弟升级，或完成师徒任务时#W，师傅会获得威望点。#r"
		local Readme_3 = "#W#r\t获得的威望点可以通过威望点商店来换取各种物品。获得威望点的条件如下：#r"
		local Readme_4 = "#W#r1、师傅的徒弟或师傅徒弟的徒弟升级时，师傅会获得一定的威望点。#r"
		local Readme_5 = "#W#r2、师傅和徒弟一起完成师徒任务，师傅会获得大量的威望点。#W#r"
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
		
		StartTalkTask(varMap);TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkMenu(varMap,varPlayer,varTalknpc);DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, -1, -1,2 )
end




function x103000_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	
			StartTalkTask(varMap);TalkAppendString(varMap,"按钮A对应的任务描述");StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer)
			
			Msg2Player(varMap,varPlayer,"按钮A对应的任务描述",8,2)

end






function x103000_ProcAccept( varMap, varPlayer )
end



function x103000_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x103000_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x103000_CheckSubmit( varMap, varPlayer )
end



function x103000_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x103000_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x103000_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x103000_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
