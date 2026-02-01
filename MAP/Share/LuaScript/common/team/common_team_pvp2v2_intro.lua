


x303002_var_FileId 					= 303002

x303002_var_QuestName				= "【双人战场说明】"

x303002_var_Readme1						=	"\n#Y一、报名条件\n\n3、您的队伍人数必须为两人。\n4、您的队伍中所有玩家的等级必须大于或等于60级。\n5、只有队长才能申请参加双人战场。"
x303002_var_Readme2						=	"\n#Y二、双人战场规则\n#W1、每场双人战比赛的战斗时间为4分钟。\n2、双人战比赛中玩家死亡后，无法进行任何复活操作。比赛结束后，系统会自动复活双方玩家。\n3、当完成报名后，系统会在战斗开启时在萤幕右中位置给予玩家提示，点击提示图示，即可进入比赛场地。\n4、玩家如果不线上将无法获得邀请。\n5、在双人战场内掉线的玩家，上线时会被传送出战场。\n6、双人战比赛决出胜负后，只有此时仍在双人战场内的玩家才能获得相应的战场积分。\n7、连续7天不参加任何一场双人战场，玩家的战场等级减3。"
x303002_var_Readme3						=	"\n#Y三、胜利判定\n#W1、当一方所有玩家死亡，另一方仍有存活玩家，判定有存活玩家的一方获胜。\n2、在双人战场战斗开启后超过1分钟，某一方依然没有玩家进入双人战场。则判定另一方获胜。\n3、当双人战场战斗时间结束，双方剩余队员数不同时，则判定队员多的一方获胜。\n4、当双人战场战斗时间结束，双方剩余队员数相同时，则判定双方平局。"




function x303002_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	--仅非跨服服务器可见
	--local fuwuqiid = {146,4202,186,386}
	--local worldID = GetWorldId(varMap,varPlayer)
	--for k,v in fuwuqiid do
	--if v == worldID then
	--TalkAppendButton(varMap,x303002_var_FileId,x303002_var_QuestName,0,1)
	--end
	--end
	TalkAppendButton(varMap,x303002_var_FileId,x303002_var_QuestName,0,1)

end



function x303002_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x303002_var_QuestName)
			TalkAppendString(varMap,x303002_var_Readme1)
			TalkAppendString(varMap,x303002_var_Readme2)
			TalkAppendString(varMap,x303002_var_Readme3)

	TalkAppendString(varMap, "\n\n每10分钟一场：每点的0~4分报名，4~9分对战。")
	TalkAppendString(varMap, "每小时6场，开赛时刻：:00、:10、:20、:30、:40、:50。\n\n#G【周末】周六、周日#W")
	TalkAppendString(varMap, "早上 06:00~09:00，4小时×6场=24场/天\n晚上 21:00~24:00，3小时×6场=18场/天\n合计42场/天。\n")
	TalkAppendString(varMap, "#G【工作日】周一至周五#W")
	TalkAppendString(varMap, "仅晚上 21:00~24:00，18场/天。")

		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x303002_var_FileId, x303002_var_QuestName)
		
end



function x303002_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end




function x303002_ProcAccept( varMap, varPlayer )
end




function x303002_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x303002_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x303002_CheckSubmit( varMap, varPlayer )

end




function x303002_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x303002_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x303002_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x303002_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end



