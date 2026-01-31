--DECLARE_QUEST_INFO_START--

x311101_var_FileId = 311101
x311101_var_QuestName = "【国家】争夺龙魂"
x311101_var_QuestId = {10304,10329,10330,10331}
x311101_var_LevelLess	= 	70
x311101_var_GameOpenId = 1088
x311101_var_GatherDate = {}
x311101_var_GatherSecond = {}

x311101_var_QuestTarget ="  前往敌国#G王城（高奖）#W或#G边塞#W的图腾柱处争夺#G龙之魂#W"
--{
--[0] = {varTarget ="前往敌国#G王城（高奖）#W或#G边塞#W的图腾柱处争夺#G龙之魂"},
--[1] = {varTarget ="去天山@npcsp_王城_60070（高奖）或@npcsp_边塞_60071"},
--[2] = {varTarget ="去昆仑@npcsp_王城_60072（高奖）或@npcsp_边塞_60073"},
--[3] = {varTarget ="去敦煌@npcsp_王城_60074（高奖）或@npcsp_边塞_60075"},
--[4] = {varTarget1 = "的图腾柱处争夺龙之魂"}
--}

x311101_var_QuestSubmit =  ""--"楼兰边塞@npc_124552或天山边塞@npc_127561或昆仑边塞@npc_130555或敦煌边塞@npc_133550"

--x311101_var_Prise = {
--varExp = 2200, varHonour =100,
--}
x311101_var_Prise = {
[1] = {varBrick = 7062, varExp = 5000, inh = 5},	--绿砖
[2] = {varBrick = 7064, varExp = 8000, inh = 6},	--黄砖
[3] = {varBrick	= 7063, varExp = 12000, inh = 8},	--红砖
[4] = {varBrick = 7065, varExp = 15000, inh = 10},	--紫砖
}


x311101_var_TuTengInMapId	= {
	[0]= {varWaiCheng = 50, varGuDao =51},   --楼兰	
	[1]= {varWaiCheng = 150, varGuDao =151}, --天山
	[2]= {varWaiCheng = 250, varGuDao =251}, --昆仑
	[3]= {varWaiCheng = 350, varGuDao =351}, --敦煌
}

--保存图腾国家排名
x311101_var_TopFourCountry = {
[0]= -1,-- -1,
[1]= -1,-- -1,
[2]= -1,-- -1,
[3]= -1,-- -1,
}

--保存图腾对象id
x311101_var_TuTengObjId = {
[50]=-1,
[51]=-1,
[150]=-1,
[151]=-1,
[250]=-1,
[251]=-1,
[350]=-1,
[351]=-1,
}

x311101_var_TuTengCoordinate = {
	[0]= {varX = 100, varZ =150}, --楼兰图腾所在坐标
	[1]= {varX = 100, varZ =100}, --天山图腾所在坐标
	[2]= {varX = 100, varZ =100}, --昆仑图腾所在坐标
	[3]= {varX = 100, varZ =100}, --敦煌图腾所在坐标
}

x311101_var_TuTengTypeId = {
[0] = 937, 				-- 第1名图腾类型(紫色)
[1] = 934,				-- 第2名图腾类型(红色)
[2] = 931,				-- 第3名图腾类型(黄色)
[3] = 935,				-- 第4名图腾类型(绿色)
}


--采集时间
x311101_var_GatherTime = {
[0] = {varMin=0*3600+0*60+0, varMax=1*3600+0*60+0},
[1] = {varMin=1*3600+0*60+1, varMax=12*3600+0*60+0},
[2] = {varMin=12*3600+0*60+1, varMax=24*3600+0*60+0},
}

--采集目标国家比自身国家强获得各种颜色砖的概率
x311101_var_GatherStrongRate = {
[1] = {--边塞
	[1] = {--目标国家比自身国家强1位
		[1]={varFrom=1,varEnd=10}, --采集绿砖概率 10%
		[2]={varFrom=11,varEnd=50}, --黄砖概率 20%
		[3]={varFrom=51,varEnd=90},--蓝砖概率 30%
		[4]={varFrom=91,varEnd=100},--紫砖概率 40%
	},

	[2] ={--目标国家比自身国家强2位
		[1]={varFrom=0,varEnd=0}, --0%
		[2]={varFrom=1,varEnd=40},--10%
		[3]={varFrom=41,varEnd=100},--30%
		[4]={varFrom=0,varEnd=0},--60%
	},
	
	[3] = {--目标国家比自身国家强3位
		[1]={varFrom=0,varEnd=0},
		[2]={varFrom=0,varEnd=0},
		[3]={varFrom=1,varEnd=100},--100%
		[4]={varFrom=0,varEnd=0},
	}
},

[2] ={ --王城
	[1] = {--目标国家比自身国家强1位
		[1]={varFrom=0,varEnd=0}, --采集绿砖概率 10%
		[2]={varFrom=1,varEnd=30}, --黄砖概率 20%
		[3]={varFrom=31,varEnd=80},--蓝砖概率 30%
		[4]={varFrom=81,varEnd=100},--紫砖概率 40%
	},

	[2] ={--目标国家比自身国家强2位
		[1]={varFrom=0,varEnd=0}, --0%
		[2]={varFrom=1,varEnd=5},--10%
		[3]={varFrom=6,varEnd=20},--30%
		[4]={varFrom=21,varEnd=100},--60%
	},

	[3] = {--目标国家比自身国家强3位
		[1]={varFrom=0,varEnd=0},
		[2]={varFrom=0,varEnd=0},
		[3]={varFrom=0,varEnd=0},
		[4]={varFrom=1,varEnd=100},--100%
	}
}
}

--采集目标国家比自身国家弱获得各种颜色砖的概率
x311101_var_GatherWeekRate = {
[1] = { --边塞
	[1] = {--目标国家比自身国家弱1位
		[1]={varFrom=1,varEnd=10}, --采集绿砖概率 10%
		[2]={varFrom=11,varEnd=50}, --黄砖概率 20%
		[3]={varFrom=51,varEnd=90},--蓝砖概率 30%
		[4]={varFrom=91,varEnd=100},--紫砖概率 40%
	},
	
	[2] ={--目标国家比自身国家弱2位
		[1]={varFrom=1,varEnd=50}, --0%
		[2]={varFrom=51,varEnd=80},--10%
		[3]={varFrom=81,varEnd=100},--30%
		[4]={varFrom=0,varEnd=0},--60%
	},
	
	[3] = {--目标国家比自身国家弱3位
		[1]={varFrom=1,varEnd=100},
		[2]={varFrom=0,varEnd=0},
		[3]={varFrom=0,varEnd=0},
		[4]={varFrom=0,varEnd=0},--100%
	}
},

[2] = { --王城
	[1] = {--目标国家比自身国家弱1位
		[1]={varFrom=0,varEnd=0}, --采集绿砖概率 10%
		[2]={varFrom=1,varEnd=30}, --黄砖概率 20%
		[3]={varFrom=31,varEnd=80},--蓝砖概率 30%
		[4]={varFrom=81,varEnd=100},--紫砖概率 40%
	},
	
	[2] ={--目标国家比自身国家弱2位
		[1]={varFrom=1,varEnd=50}, --0%
		[2]={varFrom=51,varEnd=70},--10%
		[3]={varFrom=71,varEnd=90},--30%
		[4]={varFrom=91,varEnd=100},--60%
	},
	
	[3] = {--目标国家比自身国家弱3位
		[1]={varFrom=1,varEnd=70},
		[2]={varFrom=71,varEnd=90},
		[3]={varFrom=91,varEnd=100},
		[4]={varFrom=0,varEnd=0},--100%
	}
}
}

x311101_var_BrickColor = {
[0] = {varBrick = 7062, varExp = 2200, varHonour = 100, varName = "绿色图腾" },	--绿砖
[1] = {varBrick = 7064, varExp = 2300, varHonour = 110, varName = "黄色图腾" },	--黄砖
[2] = {varBrick	= 7063, varExp = 2400, varHonour = 120, varName = "红色图腾" },	--红砖
[3] = {varBrick = 7065, varExp = 2500, varHonour = 130, varName = "紫色图腾" },	--紫砖
}

--DECLARE_QUEST_INFO_STOP--

function x311101_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if x311101_var_GameOpenId > 0 and GetGameOpenById( x311101_var_GameOpenId ) <= 0 then
      return
  end
--	test创建
--	SetGrowPointIntervalContainer( varMap, 931, 1000)
--	SetGrowPointIntervalContainer( varMap, 934, 1000)
--	SetGrowPointIntervalContainer( varMap, 935, 1000)
--	SetGrowPointIntervalContainer( varMap, 937, 1000)
--	test回收
--	RecycleGrowPointByType(varMap, 931, -1)
--	RecycleGrowPointByType(varMap, 934, -1)
--	RecycleGrowPointByType(varMap, 935, -1)
--	RecycleGrowPointByType(varMap, 937, -1)
	if x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1] == varQuest then
		if IsHaveQuestNM(varMap, varPlayer, varQuest) ~= 1 then
			local state = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1], x311101_var_QuestName, state, varQuest)
		end
	end
end

function x311101_ProcEventEntry(varMap , varPlayer , varTalknpc , varScripId , varQuest)
	local buffindex = x311101_GetBuff(varMap, varPlayer, varQuest)
	local localexp =(GetLevel( varMap, varPlayer )) * x311101_var_Prise[buffindex].varExp
	local localinh = GetLevel(varMap, varPlayer) *x311101_var_Prise[buffindex].inh
	local refixInh = RefixInherenceExp( varMap, varPlayer, localinh)

	StartTalkTask(varMap)
	TalkAppendString(varMap,"#Y【国家】争夺龙魂")

	TalkAppendString(varMap,"   最近我们的敌国在他们的王城和边塞分别树立起了图腾龙柱，试图用此引来龙之魂的力量，以增强他们的战斗力。\n\t但是，我国的龙魂密探，已经潜伏在各个敌国的边塞中，你现在就去敌国的边塞或王城夺取对方的龙之魂，将其交给密探！")
	TalkAppendString(varMap," ")

	TalkAppendString( varMap,"#Y任务目标：")
	TalkAppendString( varMap,"  前往敌国#G王城（高奖）#W或#G边塞#W的图腾柱处争夺#G龙之魂\n")

	TalkAppendString(varMap,"#Y任务奖励：")
	TalkAppendString(varMap,"  经验值："..localexp.."点")
	if GetLevel(varMap, varPlayer) >= 80 then
		TalkAppendString(varMap,"  天赋值："..refixInh.."点")
	end
	StopTalkTask()

	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x311101_var_FileId, varQuest, 0)
end

function x311101_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
	if x311101_var_GameOpenId > 0 and GetGameOpenById( x311101_var_GameOpenId ) <= 0 then
      return 
  end
	if varQuest ~= x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1] then
		return 0
	end
	local nWorldId = GetWorldIdEx()
	if GetToplistCount(nWorldId, WORLDCUP_TOPLIST_A) <= 0 then
		Msg2Player(varMap, varPlayer, "【国家】争夺龙魂任务尚未达到开放条件", 8, 2)
		Msg2Player(varMap, varPlayer, "【国家】争夺龙魂任务尚未达到开放条件", 8, 3)
		return 0
	end
	
		--如果排行榜上刷新数据前四都为帮会已不存在，则不开放任务
	local Emp =0
	for i=0, 3 do
		local snid, key, country = GetToplistInfo(nWorldId, WORLDCUP_TOPLIST_A, i)
		if nil == country or country < 0 or country > 3 then
			Emp = Emp + 1
		end
	end
	if Emp == 4 then
		Msg2Player(varMap, varPlayer, "【国家】争夺龙魂任务尚未达到开放条件", 8, 2)
		Msg2Player(varMap, varPlayer, "【国家】争夺龙魂任务尚未达到开放条件", 8, 3)	
		return
	end
	--------

	if IsHaveQuestNM(varMap, varPlayer, varQuest) > 0 then
		x311101_DiliverStrInfo(varMap, varPlayer, "您已经接受此任务")
		return 0
	end

	LuaCallNoclosure(311104, "ProcSwitchDay", varMap, varPlayer)

	if x311101_GetMD(varMap, varPlayer, MD_CURRENT_BANZHUAN_DAYCOUNT[1], MD_CURRENT_BANZHUAN_DAYCOUNT[2], MD_CURRENT_BANZHUAN_DAYCOUNT[3]) >= 3 then
		x311101_DiliverStrInfo(varMap, varPlayer, "今日已完成此任务三次，请明天再来!")
		return 0
	end
	
	local varRet = QuestCheckAcceptNM(varMap, varPlayer, varTalknpc, varQuest) 

	if varRet > 0 then 
		varRet = AddQuestNM(varMap, varPlayer, varQuest)
		if varRet > 0 then
			x311101_DiliverStrInfo(varMap, varPlayer, "您接受了任务:【国家】争夺龙魂")
			Msg2Player(varMap, varPlayer, "您接受了任务:【国家】争夺龙魂", 8, 2)
		elseif varRet == 0 then
			x311101_DiliverStrInfo(varMap, varPlayer, "任务获取失败，添加失败")
			return 0
		elseif varRet == -1 then
			x311101_DiliverStrInfo(varMap, varPlayer, "背包已满,请整理后再来接任务")
			return 0
		elseif varRet == -2 then
			x311101_DiliverStrInfo(varMap, varPlayer, "任务已满，添加任务失败")
			return 0
		end
	elseif varRet == -1 then
		x311101_DiliverStrInfo(varMap, varPlayer, "你等级低于70级，不能接受任务")
		return 0
	elseif varRet == -2 then
		x311101_DiliverStrInfo(varMap, varPlayer, "超过最大等级限制")
		return 0
	end
	GamePlayScriptLog(varMap, varPlayer, 2520) 
	SetQuestParam(varMap, varPlayer, varQuest, 0, -1)
	SetQuestParam(varMap, varPlayer, varQuest, 7, 0)
	SetQuestParam(varMap, varPlayer, varQuest, 2, -1)
	return 1
end


function x311101_ProcQuestLogRefresh(varMap, varPlayer, varQuest)
	if varQuest ~= x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1] then
		return -1
	end

	x311101_QuestLogRefresh(varMap, varPlayer, varQuest)
end

function x311101_ProcQuestAttach(varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
	if varQuest ~= x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1] then
		return 0
	end

	if IsHaveQuestNM(varMap, varPlayer, varQuest) == 0 then
		return
	end
end

function x311101_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
	return 0
end

function x311101_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest)
end

function x311101_ProcQuestAbandon( varMap, varPlayer,varQuest )
	if varQuest ~= x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1] then
		return -1
	end

	if IsHaveQuestNM(varMap, varPlayer, varQuest) <= 0 then
		return -1
	end
	
	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest)
	local buffIndex = GetQuestParam(varMap, varPlayer, varQuestIdx, 2)
	local varRet = DelQuestNM(varMap, varPlayer, varQuest)
	if varRet == 1 then
		if buffIndex >=0 and buffIndex<=3  then
			CancelSpecificImpact(varMap, varPlayer, x311101_var_BrickColor[buffIndex].varBrick)
		end
		x311101_DiliverStrInfo(varMap, varPlayer,"您放弃了任务:【国家】争夺龙魂")
		Msg2Player(varMap, varPlayer, "您放弃了任务:【国家】争夺龙魂", 8, 2)
	end
end

function x311101_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return 0
end

function x311101_ProcLogInOrDie(varMap, varPlayer)
	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1])
	local buffIndex = GetQuestParam(varMap, varPlayer, varQuestIdx, 2)

	if IsHaveQuestNM(varMap, varPlayer, x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1]) > 0 then
		if buffIndex >=0 and buffIndex<=3 then
			SetQuestParam(varMap, varPlayer, x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1], 7, 0)
			SetQuestParam(varMap, varPlayer, x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1], 0, -1)
			SetQuestParam(varMap, varPlayer, x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1], 2, -1)
			DispelSpecificImpact(varMap, varPlayer, x311101_var_BrickColor[buffIndex].varBrick, 1)
			x311101_QuestLogRefresh(varMap, varPlayer, x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1])
			x311101_DiliverStrInfo(varMap, varPlayer, "您的争夺龙魂任务已失败，请重新去争夺龙魂")
			Msg2Player(varMap, varPlayer, "您的争夺龙魂任务已失败，请重新去争夺龙魂", 8, 2)
		end
	end
end

function x311101_QuestLogRefresh(varMap, varPlayer, varQuest)

	if varQuest ~= x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1] then
		return -1
	end
	x311101_var_QuestSubmit = x311101_GetQuestSubmit(varMap, varPlayer)

	--local varStr = x311101_GetTargetStr(varMap, varPlayer, varQuest)

	StartTalkTask(varMap)
	local buffindex = x311101_GetBuff(varMap, varPlayer, varQuest)
	local varLevel = GetLevel(varMap, varPlayer)
	local varExpBonus = x311101_var_Prise[buffindex].varExp * varLevel
	local localinh = GetLevel(varMap, varPlayer) *x311101_var_Prise[buffindex].inh
	local refixInh = RefixInherenceExp( varMap, varPlayer, localinh)

  if varExpBonus > 0 then
		AddQuestExpBonus(varMap,  varExpBonus);
	end
	if GetLevel(varMap, varPlayer) >= 80 then
		AddQuestInherenceExpBonus(varMap,refixInh)
	end

	local QuestIdx = GetQuestIndexByID(varMap, varPlayer, x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1])
	local value = x311101_GetMD(varMap, varPlayer, MD_CURRENT_BANZHUAN_DAYCOUNT[1], MD_CURRENT_BANZHUAN_DAYCOUNT[2], MD_CURRENT_BANZHUAN_DAYCOUNT[3])
	local loulan1 = GetCountryParam(varMap, 0, CD_LASTDATE_BANZHUAN_NUM)
	local tianshan1 = GetCountryParam(varMap, 1, CD_LASTDATE_BANZHUAN_NUM)
	local kunlun1 = GetCountryParam(varMap, 2, CD_LASTDATE_BANZHUAN_NUM)
	local dunhuang1 = GetCountryParam(varMap, 3, CD_LASTDATE_BANZHUAN_NUM)
	local loulan = GetCountryParam(varMap, 0, CD_CURDATE_BANZHUAN_NUM)
	local tianshan = GetCountryParam(varMap, 1, CD_CURDATE_BANZHUAN_NUM)
	local kunlun = GetCountryParam(varMap, 2, CD_CURDATE_BANZHUAN_NUM)
	local dunhuang = GetCountryParam(varMap, 3, CD_CURDATE_BANZHUAN_NUM)
	AddQuestLogCustomText( varMap,
							"",						
							format("%s(%d/3)",x311101_var_QuestName,value+1),        
							format( "%s(%d/1)", x311101_var_QuestTarget, GetQuestParam(varMap, varPlayer, QuestIdx, 7)),
							x311101_var_QuestSubmit,
							format("  前往敌国#G王城（高奖）#W或#G边塞#W的图腾柱处争夺#G龙之魂#W\n#G昨日龙魂数量#W：\n楼兰龙魂数量：%d\n天山龙魂数量：%d\n昆仑龙魂数量：%d\n敦煌龙魂数量：%d\n#G今日龙魂数量#W：\n楼兰龙魂数量：%d\n天山龙魂数量：%d\n昆仑龙魂数量：%d\n敦煌龙魂数量：%d\n  昨日数量最少的国家今日无法被夺取龙魂，昨日数量最多的国家今日在01：00-24：00任意时间可以被夺取，其他国家在12：00到24：00可以被夺取，今日龙魂数量不高于100后将无法再被夺取。", loulan1,tianshan1,kunlun1,dunhuang1,loulan,tianshan,kunlun,dunhuang),              
							"\t最近我们的敌国在他们的王城和边塞分别树立起了图腾龙柱，试图用此引来龙之魂的力量，以增强他们的战斗力。\n\t但是，我国的龙魂密探，已经潜伏在各个敌国的边塞中，你现在就去敌国的边塞或王城夺取对方的龙之魂，将其交给密探！",	
							"\t龙之魂分为绿，黄，红，紫四种颜色，分别对应着二,三,四,五倍的奖励，在敌国王城有更大的几率夺取高倍奖励的龙之魂！弱国玩家也有更大的几率夺得高倍奖励的龙之魂。"					
							)
	StopTalkTask()

	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest)
end

function x311101_IsSuccessed(varMap, varPlayer, varQuest)
	if varQuest ~= x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1] then
		return 0
	end

	if IsHaveQuestNM(varMap, varPlayer, varQuest) > 0 then
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest)
		local buffIndex = GetQuestParam(varMap, varPlayer, varQuestIdx, 2)

		if buffIndex >=0 and buffIndex<=3  then
			if IsHaveSpecificImpact(varMap, varPlayer, x311101_var_BrickColor[buffIndex].varBrick) > 0 then
				return 1;
			end
		end
	end

	return 0
end

function x311101_GetTargetStr(varMap, varPlayer, varQuest)
	local nCompleteFlag = 0
	
	if IsHaveQuestNM(varMap, varPlayer, varQuest) > 0 then
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest)
		local buffIndex = GetQuestParam(varMap, varPlayer, varQuestIdx, 2)

		if buffIndex >=0 and buffIndex<=3  then
			if IsHaveSpecificImpact(varMap, varPlayer, x311101_var_BrickColor[buffIndex].varBrick) > 0 then
				nCompleteFlag =1
			end
		end
	end

	local nCountry = GetCurCountry(varMap, varPlayer)
	local Str = "  "

	if nil == nCountry or nCountry < 0 or nCountry > 3 then
		WriteLog(1, "x311101 GetCountry error")
		return nil
	end
	
	if 0 == nCompleteFlag then
		for i=0, 3 do
			if i ~= nCountry then
				Str = Str..x311101_var_QuestTarget.."\n"
			end
		end
	else
		for i=0, 3 do
			if i ~= nCountry then
				Str = Str..x311101_var_QuestTarget[i].varTarget.."\n"
			end
		end
	end
	
	return Str
end

function x311101_GetBrick(varMap, varPlayer)
	local nDesCountry = x311101_GetCountryByMapId(varMap)
	local nDesRegion = x311101_GetRegionByMapId(varMap)
	local nSelfCountry = GetCurCountry(varMap, varPlayer)
	local nWorldId = GetWorldIdEx()
	local arrayTopList ={}

	if -1 == nDesRegion then
		WriteLog(1, "x311101_GetBrick error nDesRegion = "..nDesRegion)
	end

	local snid, key, country, name, guidname, snguid  = GetToplistInfo(nWorldId, COUNTRY_STRONG_WEAK_TOPLIST, 0)
	if nil ~= country and nil ==  arrayTopList[country] then 
		arrayTopList[country] = {}
		arrayTopList[country] = 0
	end

	local snid, key, country, name, guidname, snguid = GetToplistInfo(nWorldId, COUNTRY_STRONG_WEAK_TOPLIST, 1)
	if nil ~= country and nil ==  arrayTopList[country] then 
		arrayTopList[country] = {}
		arrayTopList[country] = 1 
	end

	local snid, key, country = GetToplistInfo(nWorldId, COUNTRY_STRONG_WEAK_TOPLIST, 2)
	if nil ~= country and nil ==  arrayTopList[country] then 
		arrayTopList[country] = {} 
		arrayTopList[country] = 2
	end

	local snid, key, country = GetToplistInfo(nWorldId, COUNTRY_STRONG_WEAK_TOPLIST, 3)
	if nil ~= country and nil ==  arrayTopList[country] then 
		arrayTopList[country] = {} 
		arrayTopList[country] = 3
	end

	local nDesOrder = arrayTopList[nDesCountry]
	local nSelfOrder = arrayTopList[nSelfCountry]

	if nil == nDesOrder or  nil == nSelfOrder then
		WriteLog(1, "x311101_GetBrick GetToplistInfo error")
		return nil
	end

	local nDiffOrder = nDesOrder  - nSelfOrder

	nDiffOrder = -nDiffOrder
	
	local nNum = random(1,100)
	
	if nDiffOrder > 0 then
		for i = 1 ,4 do
			if nNum >= x311101_var_GatherStrongRate[nDesRegion][nDiffOrder][i].varFrom and nNum <=x311101_var_GatherStrongRate[nDesRegion][nDiffOrder][i].varEnd then
				return x311101_var_BrickColor[i-1].varBrick, i-1
			end
		end
	elseif nDiffOrder < 0 then
		nDiffOrder = - nDiffOrder
		for i = 1 ,4 do
			if nNum >= x311101_var_GatherWeekRate[nDesRegion][nDiffOrder][i].varFrom and nNum <=x311101_var_GatherWeekRate[nDesRegion][nDiffOrder][i].varEnd then
				return x311101_var_BrickColor[i-1].varBrick, i-1
			end
		end
	else
		WriteLog(1, "x311101_GetBrick  error nDesCountry ="..nDesCountry.."  nSelfCountry ="..nSelfCountry)
		return nil
	end
end

function x311101_GetOrderByCountryId(varMap, varCountry)
	if -1 == varCountry or varCountry < 0 or varCountry > 3 then
		WriteLog(1, "x311101 tuteng not in this Country  varMap="..varMap)
		return
	end

	local nWorldId = GetWorldIdEx()
	local nCountTopList = GetToplistCount(nWorldId, WORLDCUP_TOPLIST_A)
	local nCount = 0

	if nCountTopList <= 4 then
		nCount = nCountTopList
	else
		nCount = 4
	end

	if nCount <=0 then
		WriteLog(1, "x311101_ProcTuTengUpdate WorldCup TopList Count < 0 nCount="..nCount)
		return -1
	end

	for i=0, 3 do
		x311101_var_TopFourCountry[i] = -1
	end

	for i=0, nCount-1 do
		local snid, key, country = GetToplistInfo(nWorldId, WORLDCUP_TOPLIST_A, i)
		if nil == country or country < 0 or country > 3 then
			WriteLog(1, "x311101_ProcTuTengUpdate country not validate varMap ="..varMap)
		elseif -1 == x311101_var_TopFourCountry[country] then
			x311101_var_TopFourCountry[country] = i
		end
	end
	
	return x311101_var_TopFourCountry[varCountry]
end

function x311101_GetCountryByMapId(varMap)
	for i, item in x311101_var_TuTengInMapId do
		if item.varWaiCheng == varMap or item.varGuDao == varMap then
			return i
		end
	end
	return -1
end

function x311101_GetRegionByMapId(varMap)
	for i, item in x311101_var_TuTengInMapId do
		if item.varGuDao == varMap then
			return 1
		end

		if item.varWaiCheng == varMap  then
			return 2
		end
	end
	return -1
end

function x311101_IsPlayerHasBrick(varMap, varPlayer)
	for i, item in x311101_var_BrickColor do
		if 1 == IsHaveSpecificImpact(varMap, varPlayer, item.varBrick) then
			return 1
		end
	end
	
	return 0
end

function x311101_IsTheCountryHasLeastBrick(varMap, varPlayer, varCountry)
	local CountryBanZhanNum = GetCountryParam(varMap, varCountry, CD_LASTDATE_BANZHUAN_NUM)
	local nMin = CountryBanZhanNum
	local nCount = 0
	
	for i=0, 3 do
		local nNum = GetCountryParam(varMap, i, CD_LASTDATE_BANZHUAN_NUM)
		if nNum < nMin then
			nMin  = nNum
		end
		
		if nNum == CountryBanZhanNum then
			nCount = nCount + 1
		end
	end

	if nMin == CountryBanZhanNum and 1 == nCount then
		return 1
	end
	
	return 0
end

function x311101_IsTheCountryHasMostBrick(varMap, varPlayer, varCountry)
	local nCountryNum = GetCountryParam(varMap, varCountry, CD_LASTDATE_BANZHUAN_NUM)
	local nMax = nCountryNum
	for i=0, 3 do
		local Num = GetCountryParam(varMap, i, CD_LASTDATE_BANZHUAN_NUM)
		if Num > nMax then
			nMax = Num
		end
	end

	if  nMax == nCountryNum then
		return 1
	end
	
	return 0
end

function x311101_ProcGpCreate(varMap, varGpType, varX, varZ)
	local nCountry = x311101_GetCountryByMapId(varMap)

	if -1 == nCountry or nCountry < 0 or nCountry > 3 then
		WriteLog(1, "x311101 tuteng not in this Country  varMap="..varMap)
		return
	end

	local nOrder = x311101_GetOrderByCountryId(varMap, nCountry)
	if -1 == nOrder then
		WriteLog(1, "x311101 country ="..nCountry.."not in top four nOrder ="..nOrder.." varMap="..varMap)
		return
	end

	if x311101_var_TuTengTypeId[nOrder] ~= varGpType then
		WriteLog(1, "x311101 tuteng type is not validate varGpType ="..varGpType.."and x311101_var_TuTengTypeId[nOrder] ="..x311101_var_TuTengTypeId[nOrder].."varMap="..varMap)
		return
	end

	if -1 ~= x311101_var_TopFourCountry[nCountry] and -1 == x311101_var_TuTengObjId[varMap] then
		local varBoxId = ItemBoxEnterScene(varX, varZ, varGpType, varMap, 1, 0)

		if varBoxId < 0 then
			WriteLog(1, "x311101 itembosx id error varBoxId ="..varBoxId.."varMap="..varMap)
			return
		end

		SetGrowPointObjID(varMap, varGpType, varX, varZ, varBoxId)
		SetGrowPointIntervalContainer(varMap, varGpType, -1)
		x311101_var_TuTengObjId[varMap] = varBoxId
		LuaCallNoclosure(311100, "SaveTuTengObjId", varMap, nCountry, varBoxId)
	end
end


function x311101_ProcGpOpen(varMap,varPlayer,varTalknpc)
	local curday = GetDayOfYear()                                
	local hour,minute,sec =GetHourMinSec()
	local nowtime = hour*3600+minute*60+sec                              
	if x311101_var_GatherDate[GetGUID(varMap, varPlayer)] ~= nil and x311101_var_GatherDate[GetGUID(varMap, varPlayer)] == curday then
		if x311101_var_GatherSecond[GetGUID(varMap, varPlayer)] ~= nil and x311101_var_GatherSecond[GetGUID(varMap, varPlayer)] + 60 > nowtime then
			local second = 60 - (nowtime - x311101_var_GatherSecond[GetGUID(varMap, varPlayer)] )
			Msg2Player(varMap,varPlayer,format("您刚采集过龙之魂，请于"..second.."秒后再试!"),8,3)
			Msg2Player(varMap,varPlayer,format("您刚采集过龙之魂，请于"..second.."秒后再试!"),8,2)
			return 1 
		end
	end

	if 0 == IsHaveQuestNM(varMap, varPlayer, x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1]) then
		x311101_DiliverStrInfo(varMap, varPlayer, "很抱歉，您没有【国家】争夺龙魂任务，无法采集!")
		Msg2Player(varMap,varPlayer,"很抱歉，您没有【国家】争夺龙魂任务，无法采集!",8,2)
		return 1
	end

--	if 1 == x311101_IsPlayerHasBrick(varMap, varPlayer) then
--		x311101_DiliverStrInfo(varMap, varPlayer, "你已经夺取了龙之魂了。")
--		return 1
--	end

	local nCountry = GetCurCountry(varMap, varPlayer)

	if -1 == nCountry or nCountry < 0 or nCountry > 3 then
		WriteLog(1, "x311101 tuteng not in this Country  varMap="..varMap)
		return 1
	end

	if x311101_GetCountryByMapId(varMap) == nCountry then
		x311101_DiliverStrInfo(varMap, varPlayer, "不能夺取本国的龙魂!")
		return 1
	end

	local nTuTengCountry = x311101_GetCountryByMapId(varMap)
	
	if GetCountryParam(varMap, nTuTengCountry, CD_CURDATE_BANZHUAN_NUM) <= 100 then
		x311101_DiliverStrInfo(varMap, varPlayer, "这里的龙魂数量已经不高于100了，还是换个国家吧。")
		return 1
	end

	local hour,minute,sec =GetHourMinSec();
	local nowtime = hour*3600+minute*60+sec
	if x311101_IsTheCountryHasLeastBrick(varMap, varPlayer, nTuTengCountry) >= 1 then
			x311101_DiliverStrInfo(varMap, varPlayer, "由于该国昨日龙之魂数量最少，本日不能再夺取该国的龙之魂了。")
			return 1
	elseif nowtime >= x311101_var_GatherTime[0].varMin and nowtime <= x311101_var_GatherTime[0].varMax then
		if x311101_IsTheCountryHasMostBrick(varMap, varPlayer, nTuTengCountry) >= 1 then
			x311101_DiliverStrInfo(varMap, varPlayer, "请于1:00后再来争夺龙魂!")
		else
			x311101_DiliverStrInfo(varMap, varPlayer, "请于12:00后再来争夺龙魂!")
		end
		return 1
	elseif nowtime >= x311101_var_GatherTime[1].varMin and nowtime <= x311101_var_GatherTime[1].varMax then
		if x311101_IsTheCountryHasMostBrick(varMap, varPlayer, nTuTengCountry) >= 1 then
			return 0
		else
			x311101_DiliverStrInfo(varMap, varPlayer, "请于12:00后再来争夺龙魂!")
			return 1
		end
	elseif nowtime >= x311101_var_GatherTime[2].varMin and nowtime <= x311101_var_GatherTime[2].varMax then
		return 0
	else
		WriteLog(1,"x311101 time error")
		return 1
	end

	return 0
end

function x311101_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return 0
end

function x311101_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	local curday = GetDayOfYear()
	local hour,minute,sec =GetHourMinSec()
	local nowtime = hour*3600+minute*60+sec
	--if 0 == x311101_IsPlayerHasBrick(varMap, varPlayer) then
		local BrickBuff, BuffIndex = x311101_GetBrick(varMap, varPlayer)
		if nil == BrickBuff then
			WriteLog(1, "x311101_GetBrick error")
			return  
		end
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, BrickBuff, 0)
		Msg2Player(varMap,varPlayer,format("你顺利的夺取了龙之魂，获得#R"..x311101_var_BrickColor[BuffIndex].varName),8,3)
		Msg2Player(varMap,varPlayer,format("你顺利的夺取了龙之魂，获得#R"..x311101_var_BrickColor[BuffIndex].varName),8,2)
		local EnemyCountry = x311101_GetCountryByMapId(varMap)
		SetQuestParam(varMap, varPlayer, x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1], 0, EnemyCountry)
		SetQuestParam(varMap, varPlayer, x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1], 2, BuffIndex)
		SetQuestParam(varMap, varPlayer, x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1], 7, 1)
		x311101_var_GatherDate[GetGUID(varMap, varPlayer)] = curday
		x311101_var_GatherSecond[GetGUID(varMap, varPlayer)] = nowtime 
		GamePlayScriptLog(varMap, varPlayer, 2521)
		local countryId = GetSceneCamp(varMap) - 16
		local nPlayerX, nPlayerZ = GetWorldPos(varMap, varPlayer)
		nPlayerX = format("%d", nPlayerX)
		nPlayerZ = format("%d", nPlayerZ)
		if x311101_GetRegionByMapId(varMap) == 1 then
			mapname = "#G边塞#o"
		elseif  x311101_GetRegionByMapId(varMap) == 2 then
			mapname = "#G王城#o"
		end
		BroadcastFightInfo(varMap, countryId, nPlayerX, nPlayerZ, "本国"..mapname.."#aB{goto_".. varMap .. "," .. nPlayerX..","..nPlayerZ.."}"..nPlayerX..","..nPlayerZ.."#aE".."有入侵者抢夺我方龙之魂".."#aE")
--	end
end

function x311101_DiliverStrInfo(varMap, varPlayer, varStr)
	StartTalkTask(varMap)
	TalkAppendString(varMap, varStr)
	StopTalkTask()
	DeliverTalkTips(varMap, varPlayer)
end

function x311101_GetMD(varMap, varPlayer, nMDIndex, nOffset, nSize)
	local varDate= GetPlayerGameData(varMap, varPlayer, nMDIndex, nOffset, nSize)
	return varDate
end


function x311101_SaveTuTengObjId(varMap,varCountry, varObjId)
	x311101_var_TuTengObjId[varMap] = varObjId
end
function x311101_GetQuestSubmit(varMap, varPlayer)
local camp = GetSceneCamp(varMap)
local country = GetCurCountry(varMap, varPlayer )
	if camp == 16 then
		x311101_var_QuestSubmit = "@npc_124552"
  elseif camp == 17 then
		x311101_var_QuestSubmit = "@npc_127561"
	elseif camp == 18 then
		x311101_var_QuestSubmit = "@npc_130555"
	elseif camp == 19 then
		x311101_var_QuestSubmit = "@npc_133550"
	else 
		if 	country == 0 then
			 		x311101_var_QuestSubmit = "@npc_124552"
		elseif   country == 1 then
					x311101_var_QuestSubmit = "@npc_127561"
		elseif 	country ==  2 then
					x311101_var_QuestSubmit = "@npc_130555"
		elseif  country ==  3 then
					x311101_var_QuestSubmit = "@npc_133550"
		end
  end
	return x311101_var_QuestSubmit
end
function x311101_GetBuff(varMap, varPlayer, varQuest)
	if varQuest ~= x311101_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1] then
		return 1
	end

	if IsHaveQuestNM(varMap, varPlayer, varQuest) > 0 then
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest)
		local iRet = GetQuestParam(varMap, varPlayer, varQuestIdx, 0)

		if iRet>=0 then
			for i, item in x311101_var_Prise do
				if IsHaveSpecificImpact(varMap, varPlayer, item.varBrick) > 0 then
					return i
				end
			end
		end
	end

	return 1
end
