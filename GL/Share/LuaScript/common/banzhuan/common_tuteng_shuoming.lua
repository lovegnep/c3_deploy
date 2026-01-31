--DECLARE_QUEST_INFO_START--

x311106_var_FileId = 311106
x311106_var_Name = "【国家】争夺龙魂介绍"


--DECLARE_QUEST_INFO_STOP--

function x311106_ProcEnumEvent(varMap, varPlayer, varTalknpc, varIndex)

	TalkAppendButton(varMap, x311106_var_FileId, x311106_var_Name, 13, 0)
end

function x311106_ProcEventEntry(varMap , varPlayer , varTalknpc , varScripId , varIndex)
		local str ="\n #G一、任务开启条件：#W\n  帮会世界杯A组排行有资料时此玩法开启\n \n#G二、接取限制：#W\n  所有等级大于70的玩家每天均可以接取3次此任务。"
		local str1 ="\n#G三、玩法概述：#W\n1、当帮会世界杯A组排行榜有资料时，将根据世界杯前四排名在对应帮会所属国家的外城和古道创建图腾。如果世界杯A组排行榜前四名没有本国家的帮会，则不会在本国创建图腾。\n2、世界杯A组冠军、亚军、季军和殿军所属国家的外城和古道将分别创建紫色、红色、黄色、绿色的龙之图腾。\n3、玩家在本国外城接取任务后需要去别国抢夺龙魂，并将其交给我方潜伏在敌国古道的密探，将获得丰厚的经验和天赋奖励。去强国抢夺能更大几率获得更好的奖励。\n4、每天24：00图腾资源排名第一的国家将迎来更多的挑战，其他国家成员可以在次日01：00-24：00中的任意时间内夺取该国图腾资源。\n5、每天24：00图腾资源最少的国家第二天将受到保护，不能被其他国家夺取。\n6、每天24：00图腾资源不为最少也不为最多的国家,其他国家成员可以在次日12：00-24：00中的任意时间内夺取该国图腾资源。\n7、当日图腾数量少于100的国家将不能被夺取。\n8、至少完成一次任务的玩家可以在次日1：00之后到本国外城图腾龙魂发布人处领取龙魂封赏，前一日图腾资源数更多的国家的成员将获得更好的奖励。  "
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y【国家】争夺龙魂")
		TalkAppendString(varMap,"  每个国家的外城、古道都有一座代表国家昌盛的图腾，图腾的建设需要全体国民的努力！")
		TalkAppendString(varMap,str)
		TalkAppendString(varMap,str1)
		--TalkAppendString(varMap,"8、至少完成一次任务的玩家可以在次日1：00之后到本国外城图腾龙魂发布人处领取龙魂封赏，前一日图腾资源数更多的国家的成员将获得更好的奖励。  ")
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x311106_var_FileId, -1, 1)	
end

function x311106_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)

end




function x311106_ProcQuestAttach(varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)

end

