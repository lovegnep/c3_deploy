--DECLARE_QUEST_INFO_START-- 
x310402_var_FileId 					= 	310402
x310402_var_QuestName				= 	"【离线代练说明】" 
x310402_var_QuestInfo				= 	"离线代练说明" 
--DECLARE_QUEST_INFO_STOP--

function x310402_ProcEnumEvent( varMap, varPlayer, varTalknpc )
	TalkAppendButton(varMap, x310402_var_FileId,x310402_var_QuestName,13,1)
end

function x310402_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【离线代练说明】#r#W"
		local Readme_2 = "\t只有不低于#G40#W级的玩家才可以使用离线代练。\n\t开始离线代练后您的离线代练时间将累积计算到您下次上线为止，之后您可花费一定的金钱领取对应的离线经验，离线代练时间最多可累积7天。"
		local Readme_3 = "\n\t可选择您要领取的离线经验档次，不同的档次需要花费不同数量的金钱。"
		local Readme_4 = "\n\t#G低档#W：普通经验效率，需要花费#G银币#W，#G40#W级可使用\n"..
										 "\t#G中档#W：双倍经验效率，需要花费#G金币#W，#G60#W级可使用\n"..
										 "\t#G高档#W：三倍经验效率，需要花费#G金币#W，#G70#W级可使用"
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310402_var_FileId, -1 );
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310402_var_FileId,x310402_var_QuestName)
end 

function x310402_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x310402_ProcAccept( varMap, varPlayer )
end



function x310402_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x310402_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x310402_CheckSubmit( varMap, varPlayer )
end



function x310402_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x310402_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x310402_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x310402_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
