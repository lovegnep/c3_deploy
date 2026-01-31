
-- ----------------------------------------------------------------------------
-- 每场领取奖励
-- ----------------------------------------------------------------------------

x303126_var_FileId = 303126
x303126_var_QuestName = "【帮会】跨服帮会战奖励领取"

--Gameopen
x303126_var_GameOpen = 1096

-- 奖励
x303126_var_Aword = {
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

function x303126_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	if GetGameOpenById( x303126_var_GameOpen ) <= 0 then
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
		return
	end

	TalkAppendButton(varMap, x303126_var_FileId,x303126_var_QuestName, 3);
	
end


function x303126_ProcEventEntry( varMap, varPlayer, varTalknpc )
	
  if GetMergeDBToggle() == 1 then
    return
  end
      
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
  local guild = GetGuildID(varMap, varPlayer)
	if guild == -1 then
		return
	end
	
	--输赢
	local varWin = GetGuildParamEx(varMap, varPlayer, guild, GD_GUILD_MBATTLE_RESULT)
	if varWin <= 0 then
		Msg2Player(varMap, varPlayer, "很抱歉，您没有参加这次比赛", 0, 2)
		Msg2Player(varMap, varPlayer, "很抱歉，您没有参加这次比赛", 0, 3)
		return
	end
	
	--是否参加
	local bIsJoin = GetPlayerGameData(varMap, varPlayer, MD_MGUILD_BATTLE_JOIN_FLAG[1], MD_MGUILD_BATTLE_JOIN_FLAG[2], MD_MGUILD_BATTLE_JOIN_FLAG[3])
	if bIsJoin == 0 then
		Msg2Player(varMap, varPlayer, "您已经领取过这次奖励了", 0, 2)
		Msg2Player(varMap, varPlayer, "您已经领取过这次奖励了", 0, 3)
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
		AddGuildExp( varMap, varPlayer, x303126_var_Aword[varWin].nBanghuijingyan[varGuildLevel] )
	elseif ( varGuildLevel <= 5 ) then
		varGuildLevel = 2
		AddGuildExp( varMap, varPlayer, x303126_var_Aword[varWin].nBanghuijingyan[varGuildLevel] )
	elseif ( varGuildLevel <= 7 ) then
		varGuildLevel = 3
		AddGuildExp( varMap, varPlayer, x303126_var_Aword[varWin].nBanghuijingyan[varGuildLevel] )
	end
	
	-- 帮会使命
	AddGuildShiMing ( varMap, varPlayer, x303126_var_Aword[varWin].nBanghuishiming )
	-- 帮会金钱
	AddGuildMoney( varMap, varPlayer, x303126_var_Aword[varWin].nBanghuijinqian )
	
	local nLevel = GetLevel(varMap, varPlayer)
	-- 经验
	AddExp(varMap, varPlayer, x303126_var_Aword[varWin].nExp * nLevel)
	
	-- 帮贡
	AddGuildUserPoint(varMap, varPlayer, x303126_var_Aword[varWin].nBanggong)
	
	-- 战场功绩
	LuaCallNoclosure(SCENE_SCRIPT_ID, "AddBattleHonour", varMap, varPlayer, x303126_var_Aword[varWin].nBattleHonor)
	
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
	
	WriteLog(1, format("x303126_ProcEventEntry --- nCnt = %d, varTopIndex = %d, guild = %d", nCnt, varTopIndex, guild))
	
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

	local varMsg = format( "#G您获得了#R%d#G点经验，#R%d#G点帮会贡献和#R%d#G点战场功绩", x303126_var_Aword[varWin].nExp * nLevel, x303126_var_Aword[varWin].nBanggong, x303126_var_Aword[varWin].nBattleHonor )
	Msg2Player(varMap, varPlayer, varMsg, 0, 2)
	Msg2Player(varMap, varPlayer, varMsg, 0, 3)
	
	varMsg = format( "#G您所在帮会获得了#R%d#G点帮会经验，#R%d#G点帮会使命点和#R#{_MONEY%d}#G帮会金钱", x303126_var_Aword[varWin].nBanghuijingyan[varGuildLevel], x303126_var_Aword[varWin].nBanghuishiming, x303126_var_Aword[varWin].nBanghuijinqian )
	Msg2Player(varMap, varPlayer, varMsg, 0, 2)
	Msg2Player(varMap, varPlayer, varMsg, 0, 3)
	
	varMsg = format( "#G您获得了#R%d#G个王者勋章", nCnt )
	Msg2Player(varMap, varPlayer, varMsg, 0, 2)
	Msg2Player(varMap, varPlayer, varMsg, 0, 3)
	
	SetPlayerGameData(varMap, varPlayer, MD_MGUILD_BATTLE_JOIN_FLAG[1], MD_MGUILD_BATTLE_JOIN_FLAG[2], MD_MGUILD_BATTLE_JOIN_FLAG[3], 0)
	
	return 1
	
end


function x303126_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x303126_ProcAccept( varMap, varPlayer )

end


function x303126_ProcQuestAbandon( varMap, varPlayer, varQuest )
end


function x303126_ProcContinue( varMap, varPlayer, varTalknpc )
end


function x303126_CheckSubmit( varMap, varPlayer )
end


function x303126_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end
