



x310017_var_FileId 					= 310017


x310017_var_QuestName				= "【收集神石】活动介绍"

x310017_var_Readme1						=	"\n#Y一、活动介绍\n#W1、在近来出现了五种写有#Y“成”“吉”“思”“汗”“China Joy”#W的神石，凡是收集齐五块神石的人，当你是第888给阿依娜石头的人，就有机会成为免费参加上海China Joy的活动的幸运儿。活动时间为每天#Y12：30~13：00#W和#G19：30~20：00#W，在接受过#Y【天降宝箱】#W任务后，可以在#Y天赐宝箱#W中随机获得五种神石中的一种，#R每天可以完成1次#W。"




function x310017_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x310017_var_FileId,x310017_var_QuestName,0,1)
	
end



function x310017_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x310017_var_QuestName)
			TalkAppendString(varMap,x310017_var_Readme1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310017_var_FileId, x310017_var_QuestName)
		
end



function x310017_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end




function x310017_ProcAccept( varMap, varPlayer )
end




function x310017_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x310017_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x310017_CheckSubmit( varMap, varPlayer )

end




function x310017_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x310017_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x310017_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310017_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end



