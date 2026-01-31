
x300973_var_FileId = 300973


x300973_var_QuestName="【帮会】世界杯战场规则"

--DECLARE_QUEST_INFO_STOP--



function x300973_ProcEventEntry( varMap, varPlayer, varTalknpc )	

		StartTalkTask(varMap);
		local Readme_1 = "#Y【帮会】世界杯战场规则如下：#W#r #r"
		local Readme_2 = "1、每个参赛帮会最多可以进入#G50人#W。#r #r"
		local Readme_3 = "2、战场采用积分制，采集龙谷水晶交给本方联军统帅每次得#G1分#W，占领苏鲁锭战旗每10秒得#G2分#W，夺取龙珠交给本方联军统帅得#G50分#W，摧毁敌方箭塔得#G200分#W。#r #r"
		local Readme_4 = "3、战场时间为#G30分钟#W，先得到#G2000分#W的一方获得#G胜利#W，若其中一方在战场中人数为0时，则直接判负。大赛结束后，均未达到2000分，则#G分高者取胜#W，分数一样时，A组赛前排名低者胜，B组帮会积分排名低者胜。#r #r"
		local Readme_5 = "4、战场内不能进行原地复活。"
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
		
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap);
		DeliverTalkMenu(varMap,varPlayer,varTalknpc);
		DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, -1, -1,2 );
	
end




function x300973_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x300973_var_FileId,x300973_var_QuestName);
end





function x300973_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300973_ProcAccept( varMap, varPlayer )

	
end




function x300973_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300973_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300973_CheckSubmit( varMap, varPlayer )

end




function x300973_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300973_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300973_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300973_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
