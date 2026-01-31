



x350003_var_FileId 					= 350003


x350003_var_QuestName				= "七夕活动介绍"

x350003_var_Readme1						=	"一、迎接七夕开放“#G情人服#W”。\n\t8月21日，独具情人节气氛的“情人服”，届时欢迎广大玩家入驻！\n二、“#G玫瑰物语#W”向心爱的#RTA#W表白\n\t从2009年8月25日0:00开始，玩家可以在金币商店内购买到娇艳欲滴的玫瑰花送给心上人， #Y送人玫瑰，手留余香#W，届时全世界玩家都将看到您爱的宣言，用这一份大胆的表白赢得您的爱情吧！\n三、“#G浓情金婚#W”有情人终成眷属\n\t“#Y千里姻缘一线牵，月老免费送金婚#W”，七夕当日所有玩家结婚都将免费，赶快与您倾心已久的玩家携手跨入婚姻的殿堂吧！！\n四、“#G爱的馈赠#W”\n\t珍贵的情人首饰盒，内含#R限量发售#W的三大系列六款极品首饰，期待送给爱人尊贵大礼的玩家千万不要错过！\n五、“#G鹊桥相伴#W”\n\t30级全能型坐骑-喜鹊降世符，玩家购买后将获得成年喜鹊一只，售价仅有9两900文，逾期不售，渴望收藏全新坐骑的玩家欲购从速哦！\n六、“#G情侣喜鹊坐骑卡#W”大礼包隆重推出\n\t价值400元的情侣喜鹊坐骑卡大礼包，内含情人节时装以及喜鹊坐骑！\n七、“#GQQ情侣徽章大放送#W”\n\t七夕期间注册或登录成吉思汗帐号，回答简单的五道问题即可获得QQ情侣徽章中的一枚，全套为情侣版，共两枚。 赠送给梦中情人的表白大礼！"




function x350003_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x350003_var_FileId,x350003_var_QuestName,0,1)
	
end



function x350003_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x350003_var_QuestName)
			TalkAppendString(varMap,x350003_var_Readme1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x350003_var_FileId, x350003_var_QuestName)
		
end



function x350003_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end




function x350003_ProcAccept( varMap, varPlayer )
end




function x350003_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x350003_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x350003_CheckSubmit( varMap, varPlayer )

end




function x350003_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x350003_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x350003_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x350003_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end



