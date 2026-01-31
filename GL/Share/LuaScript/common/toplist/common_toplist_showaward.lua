------------- 皇城展示奖励

x310604_var_MDTbale											=	{
	{MD_ZHANSHIJIANGLI_ZHANCHANGJIFEN_MARK}, --战场
	
	{MD_ZHANSHIJIANGLI_LUNHUI_MARK}, --轮回台
	{MD_ZHANSHIJIANGLI_QIULONGDAO_MARK}, --囚龙岛
	{MD_ZHANSHIJIANGLI_DAJIAOTANG_MARK}, --大教堂
	{MD_ZHANSHIJIANGLI_YINDUHE_MARK},	--印度河
	{MD_ZHANSHIJIANGLI_ZHUJIAZHUANG_MARK}, --祝家庄
	{MD_ZHANSHIJIANGLI_XIAWANGMU_MARK}, --战神墓(夏王墓)                             
	{MD_ZHANSHIJIANGLI_CHIXUEHAO_MARK}, --赤血号
	{MD_ZHANSHIJIANGLI_HESHIBI_MARK}, --和氏璧
	
	{MD_ZHANSHIJIANGLI_TULONG_MARK, MD_ZHANSHIJIANGLI_TULONG_HAOYOU_MARK}, --屠龙
	{MD_ZHANSHIJIANGLI_ZHILI_MARK, MD_ZHANSHIJIANGLI_ZHILI_HAOYOU_MARK}, --智力竞赛
	{MD_ZHANSHIJIANGLI_SHADI_MARK, MD_ZHANSHIJIANGLI_SHADI_HAOYOU_MARK}, --杀敌
	{MD_ZHANSHIJIANGLI_ZHANCHANGDENGJI_MARK, MD_ZHANSHIJIANGLI_ZHANCHANGDENGJI_HAOYOU_MARK}, --战场等级
	{MD_ZHANSHIJIANGLI_MEIGUI_MARK},  --玫瑰
	{MD_ZHANSHIJIANGLI_XIAOLABA_MARK}, --小喇叭
	{MD_ZHANSHIJIANGLI_YANHUA_MARK}   --烟花
}

x310604_var_PrintDebugLog								=	0 --调试日志的输出

x310604_var_FileId 											= 310604                  
x310604_var_MapId												= {0, 41}
x310604_var_ItemList										= {10300158,10300159,10300160}

x310604_var_TimeLimit										=	1	--一周的次数上限

x310604_var_NpcList											=	{
	{varObjSnid = 138911, varTopListId = 19, key = 1},		-- 战场积分
	
	{varObjSnid = 138912, varTopListId = 59, key = 2},	-- 轮回台
	{varObjSnid = 138913, varTopListId = 51, key = 3},	-- 囚龙岛
	{varObjSnid = 138915, varTopListId = 61, key = 4},	-- 大教堂
	{varObjSnid = 138916, varTopListId = 65, key = 5},	-- 印度河
	{varObjSnid = 138917, varTopListId = 57, key = 6},	-- 祝家庄
	{varObjSnid = 138914, varTopListId = 63, key = 7},	-- 夏王墓
	{varObjSnid = 138918, varTopListId = 55, key = 8},	-- 赤血号
	{varObjSnid = 138919, varTopListId = 53, key = 9}		-- 和氏璧
}

x310604_var_StatuaryNpcList							=	{	--雕像NPC列表
	{varObjSnid = 138900, varTopListId = 45, key = 10},	-- 屠龙
	{varObjSnid = 138901, varTopListId = 37, key = 11},	-- 智力竞赛
	{varObjSnid = 138902, varTopListId = 15, key = 12},	-- 杀敌
	{varObjSnid = 138903, varTopListId = 17, key = 13},		-- 战场等级
	{varObjSnid = 138920, varTopListId = 31, key = 14}, --玫瑰
	{varObjSnid = 138921, varTopListId = 47, key = 15},	--小喇叭
	{varObjSnid = 138922, varTopListId = 49, key = 16}	--烟花
}

x310604_var_AwardItemList								=	{
	{			-- 战场积分
		{itemId = 12030147, count = 1}, -- 个人
		{itemId = 0, count = 0}, -- 国家
		{itemId = 12030148, count = 1}, -- 帮会
		{itemId = 0, count = 0} -- 好友
	},
	{			-- 轮回台,囚龙岛,夏王墓,大教堂,印度河,祝家庄,战神墓(夏王墓),和氏璧 这几个排行榜的奖励一样
		{itemId = 12030147, count = 1}, -- 个人
		{itemId = 12030149, count = 1}, -- 国家
		{itemId = 0, count = 0}, -- 帮会
		{itemId = 0, count = 0} -- 好友
	},
	{			-- 轮回台,囚龙岛,夏王墓,大教堂,印度河,祝家庄,战神墓(夏王墓),和氏璧 这几个排行榜的奖励一样
		{itemId = 12030147, count = 1}, -- 个人
		{itemId = 12030149, count = 1}, -- 国家
		{itemId = 0, count = 0}, -- 帮会
		{itemId = 0, count = 0} -- 好友
	},
	{			-- 轮回台,囚龙岛,夏王墓,大教堂,印度河,祝家庄,战神墓(夏王墓),和氏璧 这几个排行榜的奖励一样
		{itemId = 12030147, count = 1}, -- 个人
		{itemId = 12030149, count = 1}, -- 国家
		{itemId = 0, count = 0}, -- 帮会
		{itemId = 0, count = 0} -- 好友
	},
	{			-- 轮回台,囚龙岛,夏王墓,大教堂,印度河,祝家庄,战神墓(夏王墓),和氏璧 这几个排行榜的奖励一样
		{itemId = 12030147, count = 1}, -- 个人
		{itemId = 12030149, count = 1}, -- 国家
		{itemId = 0, count = 0}, -- 帮会
		{itemId = 0, count = 0} -- 好友
	},
	{			-- 轮回台,囚龙岛,夏王墓,大教堂,印度河,祝家庄,战神墓(夏王墓),和氏璧 这几个排行榜的奖励一样
		{itemId = 12030147, count = 1}, -- 个人
		{itemId = 12030149, count = 1}, -- 国家
		{itemId = 0, count = 0}, -- 帮会
		{itemId = 0, count = 0} -- 好友
	},
	{			-- 轮回台,囚龙岛,夏王墓,大教堂,印度河,祝家庄,战神墓(夏王墓),和氏璧 这几个排行榜的奖励一样
		{itemId = 12030147, count = 1}, -- 个人
		{itemId = 12030149, count = 1}, -- 国家
		{itemId = 0, count = 0}, -- 帮会
		{itemId = 0, count = 0} -- 好友
	},
	{			-- 轮回台,囚龙岛,夏王墓,大教堂,印度河,祝家庄,战神墓(夏王墓),和氏璧 这几个排行榜的奖励一样
		{itemId = 12030147, count = 1}, -- 个人
		{itemId = 12030149, count = 1}, -- 国家
		{itemId = 0, count = 0}, -- 帮会
		{itemId = 0, count = 0} -- 好友
	},
	{			-- 轮回台,囚龙岛,夏王墓,大教堂,印度河,祝家庄,战神墓(夏王墓),和氏璧 这几个排行榜的奖励一样
		{itemId = 12030147, count = 1}, -- 个人
		{itemId = 12030149, count = 1}, -- 国家
		{itemId = 0, count = 0}, -- 帮会
		{itemId = 0, count = 0} -- 好友
	},
	{			-- 屠龙
		{itemId = 12030147, count = 1}, -- 个人
		{itemId = 0, count = 0}, -- 国家
		{itemId = 12030148, count = 1}, -- 帮会
		{itemId = 12030150, count = 1} -- 好友
	},
	{			-- 智力
		{itemId = 12030147, count = 1}, -- 个人
		{itemId = 0, count = 0}, -- 国家 
		{itemId = 12030148, count = 1}, -- 帮会
		{itemId = 12030150, count = 1} -- 好友
	},
	{			-- 杀敌
		{itemId = 12030147, count = 1}, -- 个人
		{itemId = 0, count = 0}, -- 国家
		{itemId = 12030148, count = 1}, -- 帮会
		{itemId = 12030150, count = 1} -- 好友
	},
	{			-- 战场
		{itemId = 12030147, count = 1}, -- 个人
		{itemId = 0, count = 0}, -- 国家
		{itemId = 12030148, count = 1}, -- 帮会
		{itemId = 12030150, count = 1} -- 好友
	},
		{			-- 玫瑰
		{itemId = 12030147, count = 1}, -- 个人
		{itemId = 12030149, count = 1}, -- 国家 
		{itemId = 0, count = 0}, -- 帮会
		{itemId = 0, count = 0} -- 好友
	},
	{			-- 小喇叭
		{itemId = 12030147, count = 1}, -- 个人
		{itemId = 12030149, count = 1}, -- 国家
		{itemId = 0, count = 0}, -- 帮会
		{itemId = 0, count = 0} -- 好友
	},
	{			-- 烟花
		{itemId = 12030147, count = 1}, -- 个人
		{itemId = 12030149, count = 1}, -- 国家
		{itemId = 0, count = 0}, -- 帮会
		{itemId = 0, count = 0} -- 好友
	}
}



--x310604_var_TempVarRelation							=	-1 -- 奖励类型
--x310604_var_TempVarTalkNpc							=	-1 -- 访问的NpcObjId

x310604_var_TempPlayerRelationTable			=	{}	--玩家临时关系表

x310604_var_PersonAwardConfirm					=	"#Y领取冠军大礼包#W\n\t恭喜你获得上周的#R%s#W冠军，你本周内可以在我这里领取一个冠军礼包。\n\t你是否现在就领取此礼包？" --个人奖励提示
x310604_var_PersonAwardConfirm1         =	"#Y领取极品时装#W\n\t恭喜你获得上周的#R%s#W冠军，你本周内可以在我这里领取一件极品时装。\n\t你是否现在就领取此时装？" --RMB三个榜个人奖励提示
x310604_var_CountryAwardConfirm					=	"#Y领取国家同享礼包#W\n\t我是上周的#R%s#W冠军，所有#R%s#W国家的玩家本周内可以在我这里领取一个国家同享礼包。\n\t你是否现在就领取此礼包？" --个人奖励提示
x310604_var_GuildAwardConfirm						=	"#Y领取帮会同享礼包#W\n\t我是上周的#R%s#W冠军，所有#R%s#W帮会的玩家本周内可以在我这里领取一个帮会同享礼包。\n\t你是否现在就领取此礼包？" --个人奖励提示
x310604_var_FriendsAwardConfirm					=	"#Y领取好友同享礼包#W\n\t我是上周的#R%s#W冠军，只要我是你的好友并且友好度大于100点就可以在我这里领取一个好友同享礼包。\n\t你是否现在就领取此礼包？" --个人奖励提示

x310604_var_ObtianConfirm								=	"领取排行榜奖励"	--获取奖励提示

x310604_var_TimeFullConfirm							=	"很抱歉，您本周已经领取过此礼包了"	--到达次数上限的提示
x310604_var_AwardItemFail								=	"背包已满，请整理后再试" -- 添加道具失败
x310604_var_NotEnoughFriendPoint				=	"好友度不足100,无法领取此奖励" -- 好友度不足的提示
x310604_var_TimeoutConfirm							=	"请于淩晨1：00后再来领取奖励" -- 好友度不足的提示

--处理变量初始化

function x310604_ProcEnumEvent(varMap, varPlayer, varTalknpc)

	if (x310604_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310604_ProcEnumEvent --- varMap=%d varPlayer=%d varTalknpc=%d",
					varMap, varPlayer, varTalknpc))
	end
	
	local varNpcSnid = GetMonsterGUID(varMap, varTalknpc)
	if (x310604_HasThisAwardNpc(varMap, varNpcSnid) == 1) then
		TalkAppendButton(varMap, x310604_var_FileId, x310604_var_ObtianConfirm, 3, -1)
	end
end

function x310604_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)
	if (x310604_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310604_ProcEventEntry --- varMap=%d varPlayer=%d varTalknpc=%d idExt = %d",
				varMap, varPlayer, varTalknpc, idExt))
	end
				
	local varNpcSnid = GetMonsterGUID(varMap, varTalknpc)
	local snid, country = x310604_GetTopOneInfo(varMap, varNpcSnid)
	local countryname ="未知"
	if country ==0 then
		countryname ="楼兰"
	elseif country ==1 then
		countryname ="天山"	
	elseif country ==2 then
		countryname ="昆仑"	
	elseif country ==3 then
		countryname ="敦煌"	
	end	
	local toplistname ="排行榜"
	if varNpcSnid ==138912 then
		toplistname ="轮回台排行榜"
	elseif varNpcSnid ==138913 then
		toplistname ="囚龙岛排行榜"
	elseif varNpcSnid ==138914 then
		toplistname ="夏王墓排行榜"		
	elseif varNpcSnid ==138915 then
		toplistname ="大教堂排行榜"
	elseif varNpcSnid ==138916 then
		toplistname ="印度河排行榜"
	elseif varNpcSnid ==138917 then
		toplistname ="祝家庄排行榜"
	elseif varNpcSnid ==138918 then
		toplistname ="赤血号排行榜"
	elseif varNpcSnid ==138919 then
		toplistname ="和氏璧排行榜"
	elseif varNpcSnid ==138911 then
		toplistname ="战场积分排行榜"	
	elseif varNpcSnid ==138900 then
		toplistname ="屠龙排行榜"	
	elseif varNpcSnid ==138901 then
		toplistname ="智力竞赛排行榜"	
	elseif varNpcSnid ==138902 then
		toplistname ="杀敌排行榜"	
	elseif varNpcSnid ==138903 then
		toplistname ="战场等级排行榜"	
	elseif varNpcSnid ==138920 then
		toplistname ="玫瑰排行榜"	
	elseif varNpcSnid ==138921 then
		toplistname ="小喇叭排行榜"	
	elseif varNpcSnid ==138922 then
		toplistname ="烟花排行榜"	
	end
	if countryname =="未知" then
		Msg2Player(varMap, varPlayer,format"上周没有"..toplistname.."冠军，请下周再来", 8, 3)
		return
	end
		
	if (x310604_IsSamePlayer(varMap, varPlayer, varNpcSnid) == 1) then -- 本人领取
		if varNpcSnid == 138920 or varNpcSnid	== 138921 or varNpcSnid	== 138922 then
			x310604_ObtianAwardConfirm(varMap, varPlayer, varTalknpc, 1, format(x310604_var_PersonAwardConfirm1,toplistname,guildName))
		else	
			x310604_ObtianAwardConfirm(varMap, varPlayer, varTalknpc, 1, format(x310604_var_PersonAwardConfirm,toplistname,guildName))
		end
		return
	else
		if (idExt == 2) then --按同国家方式领取
			x310604_ObtianAwardConfirm(varMap, varPlayer, varTalknpc, idExt, format(x310604_var_CountryAwardConfirm,toplistname,countryname))
		return 
		end
		
		if (idExt == 3) then --按同帮会方式领取
			local snid, country, newName, guildName = x310604_GetTopOneInfo(varMap, varNpcSnid)
			x310604_ObtianAwardConfirm(varMap, varPlayer, varTalknpc, idExt, format(x310604_var_GuildAwardConfirm,toplistname,guildName))
		return 
		end
		
		if (idExt == 4) then --按好友方式领取
			x310604_ObtianAwardConfirm(varMap, varPlayer, varTalknpc, idExt, format(x310604_var_FriendsAwardConfirm,toplistname,guildName))
		return 
		end
		
		if varMap ==41 then
			if varNpcSnid ==138911 then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "按以下方式领取奖励")
				TalkAppendButton(varMap, x310604_var_FileId, "领取帮会同享礼包", 3, 3)
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap, "按以下方式领取奖励")
				TalkAppendButton(varMap, x310604_var_FileId, "领取国家同享礼包", 3, 2)
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			end
		else
				StartTalkTask(varMap)
				TalkAppendString(varMap, "按以下方式领取奖励")
				TalkAppendButton(varMap, x310604_var_FileId, "领取帮会同享礼包", 3, 3)
				TalkAppendButton(varMap, x310604_var_FileId, "领取好友同享礼包", 3, 4)
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		end		
	end
end
		
--获取奖励的提示
function x310604_ObtianAwardConfirm(varMap, varPlayer, varTalknpc, relation, awardConfirm)
	
	--做一个临时的记录
	--x310604_var_TempVarRelation = relation
	--x310604_var_TempVarTalkNpc = varTalknpc
	
	x310604_var_TempPlayerRelationTable[varPlayer] = relation
	
	StartTalkTask(varMap)
	TalkAppendString(varMap, awardConfirm)
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310604_var_FileId, -1)
end

--添加MD次数
function x310604_AddTime(varMap, varPlayer, varNpcSnid)
	local key = x310604_GetKey(varNpcSnid)
	if (key == -1) then
		return
	end
	
	local varMDCount
	if (x310604_var_TempPlayerRelationTable[varPlayer] == 4) then --好友的方式,暂时使用独立MD
		varMDCount	= x310604_var_MDTbale[key][2]
	else
		varMDCount	= x310604_var_MDTbale[key][1]
	end

	local varToday = GetWeekIndex()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_ZHANSHIJIANGLI_WEEKDAY[1], MD_ZHANSHIJIANGLI_WEEKDAY[2], MD_ZHANSHIJIANGLI_WEEKDAY[3])
	WriteLog(1, format("x310604_AddTime --- varMap = %d, varToday = %d, varLastday = %d", 
						varMap, varToday, varLastday))
	if (varToday ~= varLastday) then --不是本周
		--设置为本周
		SetPlayerGameData(varMap, varPlayer, MD_ZHANSHIJIANGLI_WEEKDAY[1], MD_ZHANSHIJIANGLI_WEEKDAY[2], MD_ZHANSHIJIANGLI_WEEKDAY[3], varToday)	
	
		-- 清掉所有记录
		for i, value in x310604_var_MDTbale do
			SetPlayerGameData(varMap, varPlayer, value[1][1], value[1][2], value[1][3], 0)
			if (i > 9 and i < 14) then
				SetPlayerGameData(varMap, varPlayer, value[2][1], value[2][2], value[2][3], 0)
			end
		end
	end
	SetPlayerGameData(varMap, varPlayer, varMDCount[1], varMDCount[2], varMDCount[3], 1)
	
end

--判断领取奖励的次数是否已满
function x310604_IsFullTime(varMap, varPlayer, varTalknpc)
	local varMDCount
	local varNpcSnid = GetMonsterGUID(varMap, varTalknpc)
	local key = x310604_GetKey(varNpcSnid)
	if (key == -1) then
		return 1
	end
	
	if (x310604_var_TempPlayerRelationTable[varPlayer] == 4) then --好友的方式,NPC只能为固定NPC
		local correctNpc = 0
		for i, value in x310604_var_StatuaryNpcList do
			if (value.varObjSnid == varNpcSnid) then
				correctNpc = 1
				break
			end
		end
		if (correctNpc == 0) then
			return 1
		end
		varMDCount	= x310604_var_MDTbale[key][2]
	else
		varMDCount	= x310604_var_MDTbale[key][1]
	end

	local varToday = GetWeekIndex()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_ZHANSHIJIANGLI_WEEKDAY[1], MD_ZHANSHIJIANGLI_WEEKDAY[2], MD_ZHANSHIJIANGLI_WEEKDAY[3])
	WriteLog(1, format("x310604_IsFullTime --- varMap = %d, varToday = %d, varLastday = %d, key = %d", 
						varMap, varToday, varLastday, key))
	if (varToday == varLastday) then --本周
		local varMark	= GetPlayerGameData(varMap, varPlayer, varMDCount[1], varMDCount[2], varMDCount[3])
		if (varMark == 1) then
			return 1
		end
	end
	
	return 0
end

--通过Npc获取Toplist的索引
function x310604_GetTopListId(varMap, varNpcSnid)
	
	if (x310604_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310604_GetTopListId --- varMap = %d, varNpcSnid = %d", varMap, varNpcSnid))
	end
	
	for i, value in x310604_var_NpcList do
		if (value.varObjSnid == varNpcSnid) then
			return value.varTopListId
		end
	end
	
	for i, value in x310604_var_StatuaryNpcList do
		if (value.varObjSnid == varNpcSnid) then
			return value.varTopListId
		end
	end
	return -1
end

--获取NPC奖励类型
function x310604_HasThisAwardNpc(varMap, varNpcSnid)

	if (x310604_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310604_HasThisAwardNpc --- varMap = %d, varNpcSnid = %d", varMap, varNpcSnid))
	end
	
	for i, value in x310604_var_NpcList do
		if (varNpcSnid == value.varObjSnid) then
			return 1
		end
	end
	
	for i, value in x310604_var_StatuaryNpcList do
		if (varNpcSnid == value.varObjSnid) then
			return 1
		end
	end
	
	return 0
end

--判断是否是正确的场景
function x310604_IsCorrectMap(varMap)
	for i, mapId in x310604_var_MapId do
		if (mapId == varMap) then
			return 1
		end
	end
	return 0
end

--获取冠军信息
function x310604_GetTopOneInfo(varMap, varNpcSnid)
	local nWorldId = GetWorldIdEx()
	local topListId = x310604_GetTopListId(varMap, varNpcSnid) -- 排行榜Id
	local snid, rank, country, newName, guildName = GetToplistInfo(nWorldId, topListId, 0)
	
	if (x310604_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310604_GetTopOneInfo --- varMap=%d varNpcSnid=%d topListId=%d, snid = %d, rank = %d",
				varMap, varNpcSnid, topListId, snid, rank))
	end
	
	return snid, country, newName, guildName
end

--判断是否同一国家
function x310604_IsSameCountry(varMap, varPlayer, varNpcSnid)
	local snid, country = x310604_GetTopOneInfo(varMap, varNpcSnid)
	local countryId = GetCurCountry(varMap, varPlayer)
	
	if (x310604_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310604_IsSameCountry --- varMap=%d varPlayer=%d varNpcSnid=%d country = %d countryId = %d",
				varMap, varPlayer, varNpcSnid, country, countryId))
	end
	
	if (countryId == country) then-- 本国家
		return 1
	end
	return 0
end

--判断是否同一帮会
function x310604_IsSameGuild(varMap, varPlayer, varNpcSnid)
	local snid, country, newName, guildName = x310604_GetTopOneInfo(varMap, varNpcSnid)
	local guildId = GetGuildID(varMap, varPlayer)
	
	if (x310604_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310604_IsSameGuild --- varMap=%d varPlayer=%d varNpcSnid=%d guildId=%d",
				varMap, varPlayer, varNpcSnid, guildId))
	end
	
	if (guildId == -1) then
		return 0
	end
	local varGuildName = GetGuildName(guildId)
	if (varGuildName == guildName) then-- 本帮会
		return 1
	end
	return 0
end

--判断是否为好友
function x310604_IsFriends(varMap, varPlayer, varNpcSnid)
	if (x310604_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310604_IsFriends --- varMap=%d varPlayer=%d varNpcSnid=%d",
				varMap, varPlayer, varNpcSnid))
	end
	
	local snid, country, newName, guildName = x310604_GetTopOneInfo(varMap, varNpcSnid)
	return IsFriendBySnid(varMap, varPlayer, snid)
end

--判断是否本人
function x310604_IsSamePlayer(varMap, varPlayer, varNpcSnid)
	local snid = x310604_GetTopOneInfo(varMap, varNpcSnid) -- 冠军Id
	local varPlayerSnid = GetGUID(varMap, varPlayer)
	
	if (x310604_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310604_IsSamePlayer --- varMap=%d varPlayer=%d snid=%d",
				varMap, varPlayerSnid, snid))
	end
	
	if (snid == varPlayerSnid) then-- 本人
		return 1
	end
	return 0
end

--获取NPC对应的Key
function x310604_GetKey(varNpcSnid)
	local key = -1
	for i, value in x310604_var_NpcList do
		if (value.varObjSnid == varNpcSnid) then
		key = value.key
		break
		end
	end
	
	if (key == -1) then
		for i, value in x310604_var_StatuaryNpcList do
			if (value.varObjSnid == varNpcSnid) then
			key = value.key
			break
			end
		end
	end
	
	return key
end

--获取礼物
function x310604_ObtainAward(varMap, varPlayer, varNpcSnid)
	WriteLog(1, format("x310604_ObtainAward --- varMap=%d varPlayerGuid=%d, varNpcSnid=%d relation = %d",
				varMap, GetGUID(varMap, varPlayer), varNpcSnid, x310604_var_TempPlayerRelationTable[varPlayer]))
				
	local key = x310604_GetKey(varNpcSnid)
	if (key == -1) then
		return
	end
	
	if (x310604_var_TempPlayerRelationTable[varPlayer] == 4) then --如果好是好友则判断好友度
		local snid = x310604_GetTopOneInfo(varMap, varNpcSnid)
		local friendPoint = GetFriendPointByGuid(varMap, varPlayer, snid)
		if (friendPoint < 100) then
			Msg2Player(varMap, varPlayer, x310604_var_NotEnoughFriendPoint, 8, 2)
			Msg2Player(varMap, varPlayer, x310604_var_NotEnoughFriendPoint, 8, 3)
		else
			local itemId = 0			
			if (friendPoint < 1000) then
				itemId = 12030150
			elseif (friendPoint < 5000) then
				itemId = 12030151
			elseif (friendPoint < 10000) then
				itemId = 12030152
			elseif (friendPoint < 50000) then
				itemId = 12030153
			elseif (friendPoint < 100000) then
				itemId = 12030154
			else
				itemId = 12030155
			end
			
			StartItemTask(varMap)
			ItemAppend(varMap, itemId, 1)
			if StopItemTask(varMap, varPlayer) <= 0 then
				Msg2Player(varMap, varPlayer, x310604_var_AwardItemFail, 8, 2)
				Msg2Player(varMap, varPlayer, x310604_var_AwardItemFail, 8, 3)
			else
			  DeliverItemListSendToPlayer(varMap, varPlayer)
			  local str =format("您获得了%d个@item_%d", 1, itemId)
			  Msg2Player(varMap, varPlayer, str, 8, 2)
				Msg2Player(varMap, varPlayer, str, 8, 3)
			  x310604_AddTime(varMap, varPlayer, varNpcSnid)
			end
		end
	else
		local item = x310604_var_AwardItemList[key][x310604_var_TempPlayerRelationTable[varPlayer]]
		if (item.itemId == 0 or item.count == 0) then
			return
		end
		if key == 14 or key == 15 or key == 16 then
			if x310604_var_TempPlayerRelationTable[varPlayer] == 1 then
				local varindex = random(1,3)
				item.itemId = x310604_var_ItemList[varindex]
				item.count = 1    
			end
		end
		StartItemTask(varMap)
		ItemAppend(varMap, item.itemId, item.count)
		if StopItemTask(varMap, varPlayer) <= 0 then
			Msg2Player(varMap, varPlayer, x310604_var_AwardItemFail, 8, 2)
			Msg2Player(varMap, varPlayer, x310604_var_AwardItemFail, 8, 3)
		else
		  DeliverItemListSendToPlayer(varMap, varPlayer)
		  local str =format("您获得了%d个@item_%d",item.count,item.itemId)
		  Msg2Player(varMap, varPlayer, str, 8, 2)
			Msg2Player(varMap, varPlayer, str, 8, 3)
		  x310604_AddTime(varMap, varPlayer, varNpcSnid)
		end
	end
end

function x310604_ProcAccept( varMap, varPlayer )
	return 1
end

function x310604_ProcAcceptCheck( varMap, varPlayer, varTalknpc)

	if (x310604_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310604_ProcAcceptCheck --- varMap=%d varPlayer=%d varTalknpc=%d, awardType=%d",
				varMap, varPlayer, varTalknpc, x310604_var_TempPlayerRelationTable[varPlayer]))
	end
	
	if (x310604_IsUpdateTime(varMap, varPlayer, varTalknpc) == 0) then
		return 0
	end
				
	if (x310604_IsCorrectMap(varMap) ~= 1) then -- 在有效场景
		return 0
	end
	
	if (x310604_var_TempPlayerRelationTable[varPlayer] == nil) then
		return
	end
	
	if (x310604_IsFullTime(varMap, varPlayer, varTalknpc) == 1) then	-- 到达次数上限
		x310604_SendClientMsg(varMap, varPlayer, varTalknpc, x310604_var_TimeFullConfirm)
		return 0
	end
	
	if (x310604_ValidateRelation(varMap, varPlayer, varTalknpc) == 0) then --验证与第一名之间的关系
		return 0
	end
	
	local varNpcSnid = GetMonsterGUID(varMap, varTalknpc)
	x310604_ObtainAward(varMap, varPlayer, varNpcSnid)
	x310604_var_TempPlayerRelationTable[varPlayer] = nil
  return 1
end

--判断是否是TopList更新的时间
function x310604_IsUpdateTime(varMap, varPlayer, varTalknpc)
	local varMonday = GetWeekFirstDay()
	local varToday = GetDayOfYear()
	local varTime = GetMinOfDay();
	
	if (x310604_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310604_IsUpdateTime ---- varMonday = %d, varToday = %d, varTime = %d",
			varMonday, varToday, varTime))
	end
	
	if (varMonday == varToday) then --如果是周一,则判断是否凌晨
		if (varTime < 60) then -- 0点到1点不准领取奖励
			x310604_SendClientMsg(varMap, varPlayer, varTalknpc, x310604_var_TimeoutConfirm)
			return 0
		end
	end
	
	return 1
end

--验证关系
function x310604_ValidateRelation(varMap, varPlayer, varTalknpc)

	if (x310604_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310604_ValidateRelation --- varMap=%d varPlayer=%d varTalknpc=%d, awardType=%d",
				varMap, varPlayer, varTalknpc, x310604_var_TempPlayerRelationTable[varPlayer]))
	end
	
	local varNpcSnid = GetMonsterGUID(varMap, varTalknpc)
	if (x310604_var_TempPlayerRelationTable[varPlayer] == 1) then -- 本人
		if (x310604_IsSamePlayer(varMap, varPlayer, varNpcSnid) == 0) then
			x310604_SendClientMsg(varMap, varPlayer, varTalknpc, "您不是冠军!!!")
			return 0
		end
	end
	
	if (x310604_var_TempPlayerRelationTable[varPlayer] == 2) then -- 本国家
		if (x310604_IsSameCountry(varMap, varPlayer, varNpcSnid) == 0) then
			x310604_SendClientMsg(varMap, varPlayer, varTalknpc, "您跟冠军不是同一国家!!!")
			return 0
		end
	end
	
	if (x310604_var_TempPlayerRelationTable[varPlayer] == 3) then -- 本帮会
		if (x310604_IsSameGuild(varMap, varPlayer, varNpcSnid) == 0) then
			x310604_SendClientMsg(varMap, varPlayer, varTalknpc, "您跟冠军不是同一帮会!!!")
			return 0
		end
	end
	
	if (x310604_var_TempPlayerRelationTable[varPlayer] == 4) then -- 好友
		if (x310604_IsFriends(varMap, varPlayer, varNpcSnid) == 0) then
			x310604_SendClientMsg(varMap, varPlayer, varTalknpc, "您不是冠军的好友!!!")
			return 0
		end
	end
	
	return 1
end

--向客户端发送相应消息
function x310604_SendClientMsg(varMap, varPlayer, varTalknpc, msg)
		StartTalkTask(varMap)
		TalkAppendString(varMap, msg)
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end

--空实现
function x310604_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest, varIndex )
    return 1
end
