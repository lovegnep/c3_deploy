--DECLARE_QUEST_INFO_START--

x310171_var_FileId 					= 	310171                   

x310171_var_QuestKind 				= 	1                       
x310171_var_LevelLess					= 	20                      

x310171_var_QuestHelp				=	"\t请到《成吉思汗3 恶狼传说》官网进行网站资料补充,可以填写一个身份证为18岁以上的ID,如果已经注册过18岁以下身份证的玩家可能会受到游戏中防沉迷系统的影响,请在登记后重新登录游戏。\n你将获得奖励:\n#Y50000点经验#W\n#Y1两银卡#W"          
x310171_var_QuestName				=   "不能说的秘密"


x310171_var_ExtTarget					=	{ {type=20,n=1,target="@npc_72005"} }


x310171_var_BonusExp					=	50000	
x310171_var_BonusMoney				=	1000	

--DECLARE_QUEST_INFO_STOP--


x310171_MP_ISCOMPLETE				= 7	

						



function x310171_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap, x310171_var_FileId, x310171_var_QuestName,3,1);
	return 0;
end




function x310171_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,varExtIdx)	
	
	if GetNonageFlag(varMap, varPlayer) ~= 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,x310171_var_QuestHelp)
		StopTalkTask(varMap)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"感谢你的支持，你会得:\n")
		TalkAppendString(varMap,"经验奖励:"..x310171_var_BonusExp)
		TalkAppendString(varMap,"银卡奖励:"..x310171_var_BonusMoney)
		StopTalkTask(varMap)
	end

	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310171_var_FileId, -1);
end




function x310171_ProcAcceptCheck( varMap, varPlayer,varQuest )

	if GetLevel( varMap, varPlayer ) < x310171_var_LevelLess then
		local varReadme = "等级不足，请升级到"..x310171_var_LevelLess.."级以后再来接受此任务！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)		
		return
	end

	if GetNonageFlag(varMap, varPlayer) ~= 0 then
		return
	end

	if GetPlayerGameData(varMap,varPlayer,MD_ZHUCE_DATE[1],MD_ZHUCE_DATE[2],MD_ZHUCE_DATE[3]) == 1 then
		local varReadme = "你已经领取过这个任务了！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)		
		return		
	end

	
	AddExp(varMap, varPlayer, x310171_var_BonusExp);
	local varReadme = "你获得了"..x310171_var_BonusExp.."经验的奖励！"
	StartTalkTask(varMap)
	TalkAppendString(varMap, varReadme);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,varReadme,8,2)

	AddMoney( varMap, varPlayer, 1, x310171_var_BonusMoney )
	SetPlayerGameData(varMap, varPlayer, MD_ZHUCE_DATE[1], MD_ZHUCE_DATE[2], MD_ZHUCE_DATE[3], 1)

end




function x310171_CheckSubmit(varMap, varPlayer, varTalknpc, varIndex)
end




function x310171_ProcQuestAbandon(varMap, varPlayer, varQuest)
end




function x310171_GetBonus( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
end




function x310171_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected,varQuest)
end




function x310171_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x310171_var_QuestName)
		TalkAppendString(varMap,format("%s", x310171_var_QuestInfo))
		TalkAppendString(varMap," ")

		




		







		

		
		if x310171_var_BonusExp > 0 then
			AddQuestExpBonus(varMap, x310171_var_BonusExp )
		end

		
		if x310171_var_BonusMoney > 0 then
			AddQuestMoneyBonus2(varMap, x310171_var_BonusMoney )
		end

	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x310171_var_FileId, -1);	
end




function x310171_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
end




function x310171_QuestLogRefresh( varMap, varPlayer, varQuest)
end

function x310171_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
end


