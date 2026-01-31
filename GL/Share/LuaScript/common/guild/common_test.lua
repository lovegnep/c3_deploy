
function x300635_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
	
end




function x300635_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)	

		if varIndex == 1 then
		
			StartTalkTask(varMap);TalkAppendString(varMap,"按钮A对应的任务描述");StopTalkTask(varMap);DeliverTalkInfo(varMap, varPlayer, varTalknpc, 300635, -1)
			
		end
	
end




function x300635_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	
			StartTalkTask(varMap);TalkAppendString(varMap,"按钮A对应的任务描述");StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer)
			
			Msg2Player(varMap,varPlayer,"按钮A对应的任务描述",8,2)

end






function x300635_ProcAccept( varMap, varPlayer )
end



function x300635_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300635_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300635_CheckSubmit( varMap, varPlayer )
end



function x300635_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300635_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300635_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300635_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
