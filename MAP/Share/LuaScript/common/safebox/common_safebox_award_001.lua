--DECLARE_QUEST_INFO_START--

x586000_var_FileId = 586000 






x586000_var_QuestName="领取360保险箱奖励"

--DECLARE_QUEST_INFO_STOP--



function x586000_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	--LuaCallNoclosure(SCENE_SCRIPT_ID,"Request360State",varMap,varPlayer,0, 1)
	
	StartTalkTask(varMap)
	local Readme_1 = "#Y【360保险箱奖励领取】#r#W"
	local info = "\t在游戏过程中运行360保险箱后，可以在我这领取经验加成奖励！\n \n\t（如果您已拥有360保险箱的经验加成效果，不需要再次领取）"
	TalkAppendString(varMap, Readme_1);
	TalkAppendString(varMap, info);
	StopTalkTask(varMap);
	DeliverTalkInfo( varMap, varPlayer, varTalknpc, x586000_var_FileId, -1 );
end




function x586000_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x586000_var_FileId,x586000_var_QuestName,3);
end





function x586000_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x586000_ProcAccept( varMap, varPlayer )
	LuaCallNoclosure(SCENE_SCRIPT_ID,"Request360State",varMap,varPlayer,0, 1)
end




function x586000_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x586000_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x586000_CheckSubmit( varMap, varPlayer )

end




function x586000_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x586000_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x586000_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x586000_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
