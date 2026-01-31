



x350002_var_FileId 					= 350002


x350002_var_QuestName				= "七夕的来历"

x350002_var_Readme1						=	"\t民间俗语说：“#Y今日人间七月七，天上牛郎会织女。#W”农历七月初七，俗称“#G七夕#W”，相传是天上牛郎织女一年一度相会的时刻，又叫“#G乞巧节#W”。 \n\t这一天，我们古人总会望着银河两岸的牵牛星与织女星，想像着他们一年仅一夕的相会，该是如何的让人断肠。关于七夕的诗，最为经久传唱的，应该是那首《#Y鹊桥仙#W》: \n\t#G纤云弄巧，飞星传恨，银汉迢迢暗度。金风玉露一相逢，便胜却人间无数。 \n\t柔情似水，佳期如梦，忍顾鹊桥归路。两情若是久长时，又岂在朝朝暮暮！#W"




function x350002_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x350002_var_FileId,x350002_var_QuestName,0,1)
	
end



function x350002_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x350002_var_QuestName)
			TalkAppendString(varMap,x350002_var_Readme1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x350002_var_FileId, x350002_var_QuestName)
		
end



function x350002_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end




function x350002_ProcAccept( varMap, varPlayer )
end




function x350002_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x350002_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x350002_CheckSubmit( varMap, varPlayer )

end




function x350002_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x350002_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x350002_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x350002_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end



