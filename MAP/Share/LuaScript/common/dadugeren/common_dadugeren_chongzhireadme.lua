--DECLARE_QUEST_INFO_START--
x270303_var_FileId = 270303



x270303_var_QuestName1="充100返25！激情七天抢特惠！"
x270303_var_QuestName2="限时打折 超低折扣买就送！"
x270303_var_QuestName3="无敌钢铁侠时装上线"
x270303_var_QuestName4="心动折扣价！团购促销第一期！"
x270303_var_QuestInfo1="\n#Y活动内容：#W\n\t#G5月8日~5月14日#W期间，只要你累积充值满#R100元#W，即可领取#R25两#W金卡红利！超额返利限时一周，为你送来夏季的首个清凉体验！"
x270303_var_QuestInfo2="\n#Y活动内容：#W\n\t自#G5月8日至5月15日#W，【金币商城】【限时打折】页面为您推出#R五大折扣礼包#W，星辰、还龙、还童全部低价抢购！还送钻石原石！神兵之魂！金鬃狂狮！更有永久版钢铁侠时装等你入手！"
x270303_var_QuestInfo3="\n#Y活动内容：#W\n\t一秒变身钢铁侠，全新体验热播大片的刺激快感，拥有无敌的神秘力量！全新版永久时装值得你拥有！" 
x270303_var_QuestInfo4="\n#Y活动内容：#W\n\t麒麟团购火爆开启！本期上架#R1000个完美星辰+1000个还龙书#W，最实惠的折扣，最心动的价格！数量有限，速来抢购！详情请见官网！"
--DECLARE_QUEST_INFO_STOP--
function x270303_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x270303_var_FileId, x270303_var_QuestName1,13,1)
		TalkAppendButton(varMap, x270303_var_FileId, x270303_var_QuestName2,13,2)
		TalkAppendButton(varMap, x270303_var_FileId, x270303_var_QuestName3,13,3)
		--TalkAppendButton(varMap, x270303_var_FileId, x270303_var_QuestName4,13,4)
end


function x270303_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	

	if extid == 1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x270303_var_QuestName1)
			TalkAppendString(varMap,x270303_var_QuestInfo1)
		  StopTalkTask()
		  DeliverTalkMenu(varMap, varPlayer,varTalknpc,x270303_var_FileId, x270303_var_QuestName1)
	elseif extid == 2 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x270303_var_QuestName2)
			TalkAppendString(varMap,x270303_var_QuestInfo2)
		  StopTalkTask()
		  DeliverTalkMenu(varMap, varPlayer,varTalknpc,x270303_var_FileId, x270303_var_QuestName2)
	elseif extid == 3 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x270303_var_QuestName3)
			TalkAppendString(varMap,x270303_var_QuestInfo3)
		  StopTalkTask()
		  DeliverTalkMenu(varMap, varPlayer,varTalknpc,x270303_var_FileId, x270303_var_QuestName3)
	elseif extid == 4 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x270303_var_QuestName4)
			TalkAppendString(varMap,x270303_var_QuestInfo4)
		  StopTalkTask()
		  DeliverTalkMenu(varMap, varPlayer,varTalknpc,x270303_var_FileId, x270303_var_QuestName4)
	elseif extid == 5 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x270303_var_QuestName5)
			TalkAppendString(varMap,x270303_var_QuestInfo5)
		  StopTalkTask()
		  DeliverTalkMenu(varMap, varPlayer,varTalknpc,x270303_var_FileId, x270303_var_QuestName5)
		end
end
