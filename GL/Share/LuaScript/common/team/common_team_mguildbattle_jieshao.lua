
x303120_var_FileId = 303120

x303120_var_QuestName="【帮会】跨服帮会战介绍"
x303120_var_QuestName0="【跨服帮会战场】"

--Gameopen
x303120_var_GameOpen = 1096


--DECLARE_QUEST_INFO_STOP--





x303120_var_Aword = {
	-- 胜利奖励
	{
		nExp = 1000*0.5*20,	--经验：等级x1000x0.5x20
		nBanggong = 150,		--帮贡：150
		nBattleHonor = 160,	-- 战场功绩
		nBanghuijingyan = { 5, 7, 10 }, --帮会经验
		nBanghuishiming = 2, --帮会使命
		nBanghuijinqian = 40000 --帮会金钱
	},
	
	-- 负方奖励
	{
		nExp = 1000*0.1*20,	--经验：等级x1000x0.5x20
		nBanggong = 50,			--帮贡：150
		nBattleHonor = 40,	-- 战场功绩
		nBanghuijingyan = { 5, 7, 10 }, --帮会经验
		nBanghuishiming = 2, --帮会使命
		nBanghuijinqian = 20000 --帮会金钱
	}

}



function x303120_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	

  if GetMergeDBToggle() == 1 then
      return
  end
    
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end

  if GetBattleSceneToggle( BATTLESCENE_TYPE_GUILDBATTLE ) == 0 then
    return
  end

	if extid == 596 then
		x303120_Award( varMap, varPlayer )
		return
	end

	
	local Readme_1   = "#Y【介绍】跨服帮会战场#W"
	local Readme_2   = "#G一，报名说明：#W#r"
	local Readme_3   = "  1，每周二、五#G17：00-18：30#W为跨服帮会战场报名时间。请使用#G随身战场报名按钮#W报名。跨服帮会战场将在20：00正式开启。#r"
	local Readme_4   = "  2，只有帮主才可以报名参加。#r"
	local Readme_5   = "  3，参加比赛的帮会，帮会人数不能少于#G15人#W。"
	local Readme_6   = "#G二，赛季说明：#W#r"
	local Readme_7   = "  1，跨服帮会战将以#G赛季#W为单位进行比赛。一个赛季包括#G12个比赛周#W。#r"
	local Readme_8   = "  2，所有第一次报名参加的帮会，一开始都会获得一个#G初始分#W，初始分是按照#G帮会实力折算#W的。#r"
	local Readme_9   = "  3，在跨服帮会战中获胜的帮会，会加200分。#r"
	local Readme_10  = "  4，在跨服帮会战中战败的帮会，会扣200分。#r"
	local Readme_11	 = "  5，没有进入跨服帮会战的帮会，会扣300分。（#R如果不是赛季第一场就报名的帮会#W，#R之前缺席的场次也会扣分#W。）#r"
	local Readme_12  = "  6，赛季结束时，排行榜前列的帮会将进入#G跨服帮会战世界杯#W的比赛。"
	local Readme_13  = "#G三，胜负判定：#W#r"
	local Readme_14  = "  1，战场开启#G2分钟#W后才会#G判定胜负#W。#r"
	local Readme_15  = "  2，20分钟内将对方全部清出战场的一方获胜。#r"
	local Readme_16  = "  3，20分钟内若未分出胜负，则判定有帮主的一方获胜。#r"
	local Readme_17  = "  4，若双方帮主均在战场或均死亡，则判定剩余人数多的一方获胜。#r"
	local Readme_18  = "  5，若双方剩余人数相等，则判定帮主死亡次数少的一方获胜。#r"
	local Readme_19  = "  6，若双方帮主死亡次数相等，则判定先报名的一方获胜。"
	local Readme_20  = "#G四，战场规则：#W#r"
	local Readme_21  = "  1，进入战场时间只开放#G2分钟#W，请在开战后抓紧时间进入战场。#r"
	local Readme_22  = "  2，#R如果战斗开始时由于各种原因没能进入战场#W，#R则在2分钟以内依然可以通过本国的帮战发布人进入#W。#r"
	local Readme_23  = "  3，每人只有#G一次#W进入战场的机会，在战场#G最后10分钟离线#W或者通过#G战场传送人#W主动离开战场，则不能再次进入。#r"
	local Readme_24  = "  4，在战场中每人有#G5次#W复活机会，#G第6次#W死亡后会被系统强制离开战场。"
	local Readme_25  = "#G五，战场奖励：#W#r"
	local Readme_26  = "  1，跨服帮会战每一场无论输赢都会有相应的奖励。#r"
	local Readme_27  = "  2，当赛季结束时，排行榜前列的帮会，将按照排名额外获得一批丰厚的奖励，奖励包括经验称号，全服双倍时间，以及获得参加#G跨服帮会战世界杯赛#W的资格#r"
	local Readme_28  = "  3，#R相关奖励请在比赛结束当天前往本国的帮战发布人处领取#W。#r"
	

	x303120_var_QuestContent_1 = Readme_1
	x303120_var_QuestContent_2 = Readme_2..Readme_3..Readme_4..Readme_5
	x303120_var_QuestContent_3 = Readme_6..Readme_7..Readme_8..Readme_9..Readme_10..Readme_11..Readme_12
	x303120_var_QuestContent_4 = Readme_13..Readme_14..Readme_15..Readme_16..Readme_17..Readme_18..Readme_19
	x303120_var_QuestContent_5 = Readme_20..Readme_21..Readme_22..Readme_23..Readme_24
	x303120_var_QuestContent_6 = Readme_25..Readme_26..Readme_27..Readme_28
		
	
	StartTalkTask(varMap);
	TalkAppendString(varMap,x303120_var_QuestContent_1)
	TalkAppendString(varMap,x303120_var_QuestContent_2)
	TalkAppendString(varMap,x303120_var_QuestContent_3)
	TalkAppendString(varMap,x303120_var_QuestContent_4)
	TalkAppendString(varMap,x303120_var_QuestContent_5)
	TalkAppendString(varMap,x303120_var_QuestContent_6)
	
	StopTalkTask(varMap);DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	
end




function x303120_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if GetGameOpenById(x303120_var_GameOpen)<=0 then
		return
	end

	if x303120_IsNewServer( varMap, varPlayer) == 1 then
		TalkAppendButton(varMap,x303120_var_FileId,"【帮会】新区跨服帮会战奖励",3,596) 
	end

  if GetMergeDBToggle() == 1 then
    return
  end

	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
    
  if GetBattleSceneToggle( BATTLESCENE_TYPE_GUILDBATTLE ) == 0 then
    return
  end
    
	TalkAppendButton(varMap,x303120_var_FileId,x303120_var_QuestName,1);

	
end





function x303120_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x303120_ProcAccept( varMap, varPlayer )

end




function x303120_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x303120_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x303120_CheckSubmit( varMap, varPlayer )

end




function x303120_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x303120_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x303120_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x303120_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end


function x303120_IsNewServer( varMap, varPlayer )
	local oldServerList =	{
15	,21	,23	,31	,44	,53	,62	,73	,84	,106	,121	,138	,150	,151	,156	,161	,167	,196	,201	,211	,216	,220	,241	,284	,300	,316	,321	,323	,344	,353	,364	,390	,424	,1002	,1122	,1172	,1222	,1242	,1272	,1302	,1332	,1342	,1352	,1372	,1402	,1432	,1442	,1452	,1462	,1472	,
1502	,1512	,1522	,1532	,1542	,1602	,1612	,1622	,1632	,1642	,1652	,1662	,3002	,3052	,3142	,3152	,3202	,3222	,3232	,3242	,3252	,3262	,3272	,3302	,3312	,3322	,3332	,2702,2712,2722,2732,2742,2752,2762,2772,2782,2792,2802,2812,2822,2832,2842,2852,2862,2872,2882,2892,2902,2912,2922,
2932,2942,2952,2962,2972,2982,2992,																	
2002,2012,2022,2032,2062,2072,2082,2102,2112,2132,  --双线一区
2152,2192,2162,2182,2172,2202,2212,2222,2232,2242,  --双线二区
										}
	local IsNewServer = 1
	local ServeriId = GetWorldIdEx()
	for varI , item in oldServerList do
		if ServeriId == item then
			IsNewServer = 0
			break
		end
	end
	
	return IsNewServer
end



function x303120_Award( varMap, varPlayer )

	if x303120_IsNewServer( varMap, varPlayer) == 0 then
		return
	end

  if GetMergeDBToggle() == 1 then
    return
  end
      
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
  local guild = GetGuildID(varMap, varPlayer)
	if guild == -1 then
		Msg2Player(varMap, varPlayer, "没有帮会不能领取此奖励", 0, 3)
		return
	end
--20120330 临时给予胜利奖励 by 596 begin	
--	--输赢
		local varWin =1
--	local varWin = GetGuildParamEx(varMap, varPlayer, guild, GD_GUILD_MBATTLE_RESULT)
--	if varWin <= 0 then
--		Msg2Player(varMap, varPlayer, "很抱歉，您没有参加这次比赛", 0, 2)
--		Msg2Player(varMap, varPlayer, "很抱歉，您没有参加这次比赛", 0, 3)
--		return
--	end
	if GetLevel(varMap, varPlayer) < 40 then
		Msg2Player(varMap, varPlayer, "你的等级不足40级，不能领取此奖励", 0, 3)
		return
	end
	

	
	
	local day, week = GetWeek()
	if day == 2 or day == 5 then
			if GetPlayerGameData(varMap, varPlayer, MD_MGUILD_BATTLE_JOIN_DATE[1], MD_MGUILD_BATTLE_JOIN_DATE[2], MD_MGUILD_BATTLE_JOIN_DATE[3]) ~= GetDayOfYear() then
				SetPlayerGameData(varMap, varPlayer, MD_MGUILD_BATTLE_JOIN_DATE[1], MD_MGUILD_BATTLE_JOIN_DATE[2], MD_MGUILD_BATTLE_JOIN_DATE[3],GetDayOfYear())
				SetPlayerGameData(varMap, varPlayer, MD_MGUILD_BATTLE_JOIN_FLAG[1], MD_MGUILD_BATTLE_JOIN_FLAG[2], MD_MGUILD_BATTLE_JOIN_FLAG[3],1)
			end		
	else
		Msg2Player(varMap, varPlayer, "请下次跨服帮会战时再来", 0, 3)
		return
	end
	
--20120330 临时给予胜利奖励 by596 end	




	local iHour, iMin, iSec = GetHourMinSec()
	if iHour ~=20 then
		Msg2Player(varMap, varPlayer, "请在20：00～21：00期间领取奖励", 0, 3)
		return		
	end	



	--是否参加
	local bIsJoin = GetPlayerGameData(varMap, varPlayer, MD_MGUILD_BATTLE_JOIN_FLAG[1], MD_MGUILD_BATTLE_JOIN_FLAG[2], MD_MGUILD_BATTLE_JOIN_FLAG[3])
	if bIsJoin == 0 then
		Msg2Player(varMap, varPlayer, "请下次跨服帮会战时再来", 0, 2)
		Msg2Player(varMap, varPlayer, "请下次跨服帮会战时再来", 0, 3)
		return
	end
	
	-- 是否过期
	local nJoinDate = GetPlayerGameData(varMap, varPlayer, MD_MGUILD_BATTLE_JOIN_DATE[1], MD_MGUILD_BATTLE_JOIN_DATE[2], MD_MGUILD_BATTLE_JOIN_DATE[3])
	if nJoinDate ~= GetDayOfYear() then
		Msg2Player(varMap, varPlayer, "很抱歉，您只能在比赛当天领取奖励", 0, 2)
		Msg2Player(varMap, varPlayer, "很抱歉，您只能在比赛当天领取奖励", 0, 3)
		return
	end
	
	--背包空间
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，不能领取奖励", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，不能领取奖励", 0, 3)
		return
	end
	
	local varGuildLevel = GetGuildLevel( varMap, varPlayer )
	-- 帮会经验
	if ( varGuildLevel <= 4 ) then
		varGuildLevel = 1
		AddGuildExp( varMap, varPlayer, x303120_var_Aword[varWin].nBanghuijingyan[varGuildLevel] )
	elseif ( varGuildLevel <= 5 ) then
		varGuildLevel = 2
		AddGuildExp( varMap, varPlayer, x303120_var_Aword[varWin].nBanghuijingyan[varGuildLevel] )
	elseif ( varGuildLevel <= 7 ) then
		varGuildLevel = 3
		AddGuildExp( varMap, varPlayer, x303120_var_Aword[varWin].nBanghuijingyan[varGuildLevel] )
	end
	
	-- 帮会使命
	AddGuildShiMing ( varMap, varPlayer, x303120_var_Aword[varWin].nBanghuishiming )
	-- 帮会金钱
	AddGuildMoney( varMap, varPlayer, x303120_var_Aword[varWin].nBanghuijinqian )
	
	local nLevel = GetLevel(varMap, varPlayer)
	-- 经验
	AddExp(varMap, varPlayer, x303120_var_Aword[varWin].nExp * nLevel)
	
	-- 帮贡
	AddGuildUserPoint(varMap, varPlayer, x303120_var_Aword[varWin].nBanggong)
	
	-- 战场功绩
	LuaCallNoclosure(SCENE_SCRIPT_ID, "AddBattleHonour", varMap, varPlayer, x303120_var_Aword[varWin].nBattleHonor)
	
	-- 排名
	local varTopIndex = GetGuildParamEx(varMap, varPlayer, guild, GD_GUILD_MBATTLE_TOPLIST)
	-- 牌子
	local nCnt = 1
	if varWin == 1 then -- 赢
	
		nCnt = 3
		if varTopIndex >= 0 and varTopIndex < 40 then
			nCnt = 5
		elseif varTopIndex >= 40 and varTopIndex < 100 then
			nCnt = 4
		end
	
	WriteLog(1, format("x303120_ProcEventEntry --- nCnt = %d, varTopIndex = %d, guild = %d", nCnt, varTopIndex, guild))
	
	elseif varWin == 2 then -- 输
	
		nCnt = 1
		if varTopIndex >= 0 and varTopIndex < 40 then
			nCnt = 2
		end
	end
	
	StartItemTask(varMap)
	if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
		ItemAppend( varMap, 12266664, nCnt)
	else
		ItemAppendBind( varMap, 12266664, nCnt)
	end

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
	end

	local varMsg = format( "#G您获得了#R%d#G点经验，#R%d#G点帮会贡献和#R%d#G点战场功绩", x303120_var_Aword[varWin].nExp * nLevel, x303120_var_Aword[varWin].nBanggong, x303120_var_Aword[varWin].nBattleHonor )
	Msg2Player(varMap, varPlayer, varMsg, 0, 2)
	Msg2Player(varMap, varPlayer, varMsg, 0, 3)
	
	varMsg = format( "#G您所在帮会获得了#R%d#G点帮会经验，#R%d#G点帮会使命点和#R#{_MONEY%d}#G帮会金钱", x303120_var_Aword[varWin].nBanghuijingyan[varGuildLevel], x303120_var_Aword[varWin].nBanghuishiming, x303120_var_Aword[varWin].nBanghuijinqian )
	Msg2Player(varMap, varPlayer, varMsg, 0, 2)
	Msg2Player(varMap, varPlayer, varMsg, 0, 3)
	
	varMsg = format( "#G您获得了#R%d#G个王者勋章", nCnt )
	Msg2Player(varMap, varPlayer, varMsg, 0, 2)
	Msg2Player(varMap, varPlayer, varMsg, 0, 3)
	
	SetPlayerGameData(varMap, varPlayer, MD_MGUILD_BATTLE_JOIN_FLAG[1], MD_MGUILD_BATTLE_JOIN_FLAG[2], MD_MGUILD_BATTLE_JOIN_FLAG[3], 0)
	
	return 1
	
end



