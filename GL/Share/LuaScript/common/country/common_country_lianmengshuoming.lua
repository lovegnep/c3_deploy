
x310209_var_FileId = 310209


x310209_var_QuestName="【介绍】弱国联盟"

--DECLARE_QUEST_INFO_STOP--



function x310209_ProcEventEntry( varMap, varPlayer, varTalknpc )	

		StartTalkTask(varMap);
		local Readme_1 = "#Y【介绍】弱国联盟：#W#r #r"
		local Readme_2 = "#G如何联盟：#W#r\t根据上周国家强弱榜的每周排名，最后两名国家的国王可以发起与对方的联盟，双方同意后，两国即可结为同盟。"
		local Readme_3 = "在周日24点后，如果上周国家强弱榜的最后两名没有成为联盟，系统也会自动将其结为联盟。顺利结盟后，两国的玩家将会变为友善阵营，不可进行PK，同时也无法击杀对方国家的NPC。#r"
		local Readme_4 = "#G如何解盟：#W#r\t在结盟后，两个国家的国王可以随时发起解盟，无须对方同意。解盟后双方将回归原有的敌对状态。#r"
		local Readme_5 = "#G注意事项：#W#r\t在解盟的当天24点之前，无法再次结盟。不处于上周国家强弱榜最后两名的国家，无法结盟。"
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
		
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap);
		DeliverTalkMenu(varMap,varPlayer,varTalknpc);
		DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, -1, -1,2 );
	
end




function x310209_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,x310209_var_FileId,x310209_var_QuestName);
end





function x310209_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x310209_ProcAccept( varMap, varPlayer )

	
end




function x310209_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x310209_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x310209_CheckSubmit( varMap, varPlayer )

end




function x310209_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x310209_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x310209_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310209_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
