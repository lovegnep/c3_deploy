--------------------------------------------
--2011-2-12 by rj 跨服战场随身报名脚本接口--
--------------------------------------------

x303100_var_FileId          		= 303100
x303100_var_MMapServerIdAry      	= {7, 8, 9, 10}		-- 跨服战场服务器 ID 数组
x303100_var_MPVPSignupIntervalTbl	= {}				-- 跨服战场报名冷却时间用户表
x303100_var_MaxEnterLimit       	= 2000				-- 单跨服 MapServer 人数许可进入人数

x303100_var_MPVP2v2GameId 			= 1061				-- 跨服 2v2 活动 ID
x303100_var_MPVP6v6GameId 			= 1084				-- 跨服 6v6 活动 ID
x303100_var_MGuildBattleGameId		= 1096			-- 跨服帮会战活动ID

-- 跨服帮会战条件
x303100_var_GuildMemberCount = 15 -- 帮会成员数量要求
x303100_var_GuildLevel = 1 -- 帮会等级要求

--远程返回状态码
x303100_var_SIGNUPOK 				= 1					-- 报名成功
x303100_var_SIGNUPTIMEERR 			= 100				-- 报名时间错误
x303100_var_MATCHOODERR 			= 101				-- 匹配空错误
x303100_var_SIGNUPFULLERR 			= 102				-- 报名满错误
x303100_var_SELFSIGNUPEDERR 		= 103				-- 自己已经报过名错误
x303100_var_OTHERSIGNUPEDERR 		= 104				-- 队友已经报过名错误
x303100_var_LEVELERR				= 105				-- 级别错误
x303100_var_TEAMNOEXISTERR			= 106				-- 队伍不存在错误
x303100_var_TEAMMEMBERNUMERR		= 107				-- 队伍成员数量错误
x303100_var_TEAMMEMBEROFFLINEERR	= 108				-- 队伍成员离线错误
x303100_var_TEAMMEMBERLEVELERR		= 109				-- 队伍成员等级错误
x303100_var_MPVP_BATTLE_STATECODE_NOGUILD = 110			-- 没有加入帮会
x303100_var_MPVP_BATTLE_STATECODE_NOTGUILDLEADER = 111	-- 不是帮主
x303100_var_MPVP_BATTLE_STATECODE_GUILDLEVELERR = 112	-- 帮会等级不满足最低要求
x303100_var_MPVP_BATTLE_STATECODE_GUILDMEMBERCOUNTERR = 113		-- 帮会成员数量不满足最低要求
x303100_var_MPVP_BATTLE_STATECODE_GUILDNOTSIGNUP = 114	-- 帮会没有报名
x303100_var_MPVP_BATTLE_STATECODE_PLAYERHASENTERED = 115	-- 用户已经进入过
x303100_var_MPVP_BATTLE_STATECODE_REACHREADYTIME = 116		-- 超过准备时间
x303100_var_MPVP_BATTLE_STATECODE_BATTLENOTBEGIN = 117		-- 战场未开始
	
-- 战场类型定义
x303100_var_MPVP_BATTLE_TYPE_2V2 = 0
x303100_var_MPVP_BATTLE_TYPE_6V6 = 1
x303100_var_MGUILD_BATTLE_TYPE = 2

x303100_var_Leader_Index          = 5


---------------------------------------------------------------------------------------------------------------
-- 2V2检查
---------------------------------------------------------------------------------------------------------------
function x303100_2v2SignupCheck(varMap, varPlayer, varSignupType)
	-- GameOpen 检查
	if GetGameOpenById(x303100_var_MPVP2v2GameId) ~= 1 then
		Msg2Player(varMap, varPlayer, "活动没有开启，敬请期待！",8, 3)	
		return -1
	end

	-- 报名时间检查
	local bCanOpen = 0
	local weekIdx = GetWeek()
	local minOfDay = GetMinOfDay()

	if weekIdx == 1 or weekIdx == 4 then
		if minOfDay >= 1195 and minOfDay < 1260 then	
			bCanOpen = 1
		end	
	elseif weekIdx == 0 then
		if minOfDay >= 775 and minOfDay < 900 then	
			bCanOpen = 1
		end
	end

	if weekIdx == 1 or weekIdx == 2 or weekIdx == 3 or weekIdx == 4 or weekIdx == 5 then
		if minOfDay >= 535 and minOfDay < 960 then
			bCanOpen = 1
		end
	end

	if bCanOpen == 0 then
		Msg2Player(varMap, varPlayer, "跨服双人战场报名还没有开始！", 8, 3)
		return -1
	end
	
	-- 进行目标跨服战场 ServerID 查找，因为已经取消报名场景，所以不能使用老算法
	local curCanSignupSvrTlb = {}
	local idxSignup = 0
	for i, item in x303100_var_MMapServerIdAry do
		local varNum = GetMapServerCurUserNum(item)
		if varNum ~= -1 then
			idxSignup = idxSignup + 1
			curCanSignupSvrTlb[idxSignup] = item
		end
	end

	local eleNum = getn(curCanSignupSvrTlb)
	if eleNum == 0 then
    	Msg2Player(varMap, varPlayer, "很抱歉，无可用跨服战场服务器", 8, 3)
	 	WriteLog(1, format("MPVPBATTLE:x303100_ProcSignupCheck 2 varMap=%d PlayerSNID=%X", varMap, GetGUID(varMap, varPlayer)))
		return -1
	end

	local idxArray = random(1, eleNum)
	if idxArray < 1 then idxArray = 1 end
	if idxArray > eleNum then idxArray = eleNum end

   	return curCanSignupSvrTlb[idxArray]
end

---------------------------------------------------------------------------------------------------------------
-- 6v6检查
---------------------------------------------------------------------------------------------------------------
function x303100_6v6SignupCheck(varMap, varPlayer, varSignupType)
	-- GameOpen 检查
	if GetGameOpenById(x303100_var_MPVP6v6GameId) ~= 1 then
		Msg2Player(varMap, varPlayer, "活动没有开启，敬请期待！",8, 3)	
		return -1
	end
	-- 报名时间检查
	local bCanOpen = 0
	local weekIdx = GetWeek()
	local minOfDay = GetMinOfDay()

	if weekIdx == 6 then
		if minOfDay >= 780 and minOfDay < 790 then	
			bCanOpen = 1	
		end	
		if minOfDay >= 810 and minOfDay < 820 then	
			bCanOpen = 1	
		end	
	end	


	if bCanOpen == 0 then
		Msg2Player(varMap, varPlayer, "跨服六人战场报名还没有开始！", 8, 3)
		return -1
	end
			
	-- 进行目标跨服战场 ServerID 查找，因为已经取消报名场景，所以不能使用老算法
	local curCanSignupSvrTlb = {}
	local idxSignup = 0
	for i, item in x303100_var_MMapServerIdAry do
		local varNum = GetMapServerCurUserNum(item)
		if varNum ~= -1 then
			idxSignup = idxSignup + 1
			curCanSignupSvrTlb[idxSignup] = item
		end
	end

	local eleNum = getn(curCanSignupSvrTlb)
	if eleNum == 0 then
    	Msg2Player(varMap, varPlayer, "很抱歉，无可用跨服战场服务器", 8, 3)
		WriteLog(1, format("MPVPBATTLE:x303100_ProcSignupCheck 2 varMap=%d PlayerSNID=%X", varMap, GetGUID(varMap, varPlayer)))
		return -1
	end

	local idxArray = random(1, eleNum)
	if idxArray < 1 then idxArray = 1 end
	if idxArray > eleNum then idxArray = eleNum end

	return curCanSignupSvrTlb[idxArray]
end

---------------------------------------------------------------------------------------------------------------
-- 跨服帮会战检查
---------------------------------------------------------------------------------------------------------------
function x303100_GuildSignupCheck(varMap, varPlayer, varSignupType)
	-- GameOpen 检查
	if GetGameOpenById(x303100_var_MGuildBattleGameId) ~= 1 then
		Msg2Player(varMap, varPlayer, "活动没有开启，敬请期待！",8, 3)	
		return -1
	end

	local guildid = GetGuildID(varMap, varPlayer)
	if guildid == -1 then
		Msg2Player(varMap, varPlayer, "你还没有参加帮会!", 8, 3)
		return -1
	end
	local pos = GetGuildOfficial(varMap, varPlayer)
	if pos ~= x303100_var_Leader_Index then
		Msg2Player(varMap, varPlayer, "你不是帮主，不能报名！",8, 3)
        return -1
    end
	local glevel, gcnt, gexp = GetGuildSimpleData(guildid)
	if glevel < x303100_var_GuildLevel then
		Msg2Player(varMap, varPlayer, format("你的帮会等级不足%d级", x303100_var_GuildLevel), 8, 3)
		return -1
	end
	if gcnt < x303100_var_GuildMemberCount then
		Msg2Player(varMap, varPlayer, format("你的帮会成员数量不足%d人", x303100_var_GuildMemberCount), 8, 3)
		return -1
	end
			
	-- 进行目标跨服战场 ServerID 查找
	local curCanSignupSvrTlb = {}
	local idxSignup = 0
	for i, item in x303100_var_MMapServerIdAry do
		local varNum = GetMapServerCurUserNum(item)
		if varNum ~= -1 then
			idxSignup = idxSignup + 1
			curCanSignupSvrTlb[idxSignup] = item
		end
	end

	local eleNum = getn(curCanSignupSvrTlb)
	if eleNum <= 0 then
    	Msg2Player(varMap, varPlayer, "很抱歉，无可用跨服战场服务器", 8, 3)
		WriteLog(1, format("MPVPBATTLE:x303100_ProcSignupCheck 2 varMap=%d PlayerSNID=%X", varMap, GetGUID(varMap, varPlayer)))
		return -1
	end

	local idxArray = random(1, eleNum)

	return curCanSignupSvrTlb[idxArray]
end

-- 报名检测函数列表，针对不同的战场类型
-- 列表内容顺序请与定义的战场类型相匹配
x303100_var_SignupProcList = 
{
	x303100_2v2SignupCheck,	-- 2v2
	x303100_6v6SignupCheck,		-- 6v6
	x303100_GuildSignupCheck,	-- guild battle
}

---------------------------------------------------------------------------------------------------------------
--【功能】报名检查事件，所有的报名点都要进行这个判定
--【参数】varBattleType - 战场类型(1 mpvp2v2 2 mpvp6v6)，varSignupType - 报名类型(1 单人 2 组队 3 团队 4 帮会)
--【返回】经过策略选择出的目标跨服战场 ServerID，返回 -1 为报名检查失败
---------------------------------------------------------------------------------------------------------------
function x303100_ProcSignupCheck(varMap, varPlayer, varBattleType, varSignupType)
	
	-- 合服检查
    if GetMergeDBToggle() == 1 then
        return -1
    end

	-- 3 秒报名冷却时间检测，GL 的已报名记录需要时间从跨服 Map 上同步状态
	if x303100_var_MPVPSignupIntervalTbl[GetGUID(varMap, varPlayer)] ~= nil then
		
		local signupInterval = GetCurrentTime() - x303100_var_MPVPSignupIntervalTbl[GetGUID(varMap, varPlayer)]
		if signupInterval >= 0 and signupInterval < 3 then
			Msg2Player(varMap, varPlayer, format("报名操作频率太高，请%d秒后重试！",  3 - signupInterval), 8, 3)	
			return -1
		elseif signupInterval < 0 then -- 向前调整系统时间，忽略这次冷却检测
		 	WriteLog(1, format("MPVPBATTLE:x303100_ProcSignupCheck 1 varMap=%d PlayerSNID=%X", varMap, GetGUID(varMap, varPlayer)))
		end
	end

	x303100_var_MPVPSignupIntervalTbl[GetGUID(varMap, varPlayer)] = GetCurrentTime()
	
	local funProc = x303100_var_SignupProcList[varBattleType+1]
	if funProc == nil then
		WriteLog(1, format("MPVPBATTLE:x303100_ProcSignupCheck invalid battle type=%d PlayerSNID=%X", varBattleType, GetGUID(varMap, varPlayer)))
		return -1
	end
	
	return funProc(varMap, varPlayer, varSignupType)

end

-----------------------------------------------------------------------------------------------
--【功能】状态返回，包括报名请求返回、进入战场请求返回、跨服战场主动状态返回
--【参数】varBattleType - 战场类型(1 mpvp2v2 2 mpvp6v6)，varResult - 状态码(值参考脚本开头常量)
--【返回】无
-----------------------------------------------------------------------------------------------
function x303100_ProcMPVPBattleResult(varMap, varPlayer, varBattleType, varResult, varParam)

	local strMsg = ""

	if varResult == x303100_var_SIGNUPOK then
		
		-- 传送前玩家自身所在场景类型警告
		local varMapType = GetSceneType(varMap)
		if varMapType == 1 then
            Msg2Player(varMap, varPlayer, "注意不可以在副本进行跨服战场传送！", 8, 3)
            Msg2Player(varMap, varPlayer, "注意不可以在副本进行跨服战场传送！", 8, 2)
        elseif varMapType == 2 or varMapType == 7 then
            Msg2Player(varMap, varPlayer, "注意不可以在战场里进行跨服战场传送！", 8, 3)
            Msg2Player(varMap, varPlayer, "注意不可以在战场里进行跨服战场传送！", 8, 2)
        elseif varMap == 91 or varMap == 191 or varMap == 291 or varMap == 391 then
            Msg2Player(varMap, varPlayer, "注意不可以在轮回之地进行跨服战场传送！", 8, 3)
            Msg2Player(varMap, varPlayer, "注意不可以在轮回之地进行跨服战场传送！", 8, 2)
		end
		
		-- 传送前玩家自身状态警告
        local varState, varMsg = LuaCallNoclosure(800021, "BattleTransCheckPlayerState", varMap, varPlayer)
        if varState == 1 then
            Msg2Player(varMap, varPlayer, "你现在的自身状态无法被传送进跨服战场！", 8, 3)
            Msg2Player(varMap, varPlayer, "你现在的自身状态无法被传送进跨服战场！", 8, 2)
        end

		strMsg = "跨服战场报名完成！"
	elseif varResult == x303100_var_SIGNUPTIMEERR then
		strMsg = "不在报名时间段内，无法报名！"
	elseif varResult == x303100_var_MATCHOODERR then
		if varBattleType == x303100_var_MPVP_BATTLE_TYPE_2V2 then
			strMsg = "很抱歉，您本次跨服2V2战场轮空！"
		elseif varBattleType == x303100_var_MPVP_BATTLE_TYPE_6V6 then
			strMsg = "很抱歉，您本次跨服6V6战场轮空！"
		elseif varBattleType == x303100_var_MGUILD_BATTLE_TYPE then
			strMsg = "很抱歉，您本次跨服帮会战轮空！"
		end
	elseif varResult == x303100_var_LEVELERR then	
    	strMsg = "您的等级不够，无法报名！"
	elseif varResult == x303100_var_SIGNUPFULLERR then
    	strMsg = "本轮战场报名已满，无法报名！"
	elseif varResult == x303100_var_SELFSIGNUPEDERR then
    	strMsg = "您已经报过名了！"
	elseif varResult == x303100_var_OTHERSIGNUPEDERR then	
    	strMsg = "您的队友已经报过名了！"
	elseif varResult == x303100_var_TEAMNOEXISTERR then		
    	strMsg = "队伍不存在，无法报名！"
	elseif varResult == x303100_var_TEAMMEMBERNUMERR then		
    	strMsg = "队伍人数错误，无法报名！"
	elseif varResult == x303100_var_TEAMMEMBEROFFLINEERR then		
    	strMsg = "队伍成员离线，无法报名！"
	elseif varResult == x303100_var_TEAMMEMBERLEVELERR then		
    	strMsg = "队伍成员等级不够，无法报名！"
	elseif varResult == x303100_var_MPVP_BATTLE_STATECODE_NOGUILD then
		strMsg = "没有加入帮会"
	elseif varResult == x303100_var_MPVP_BATTLE_STATECODE_NOTGUILDLEADER then
		strMsg = "不是帮主"
	elseif varResult == x303100_var_MPVP_BATTLE_STATECODE_GUILDLEVELERR then
		strMsg = "帮会等级不满足最低要求"
	elseif varResult == x303100_var_MPVP_BATTLE_STATECODE_GUILDMEMBERCOUNTERR then
		strMsg = "帮会成员数量不满足最低要求"
	elseif varResult == x303100_var_MPVP_BATTLE_STATECODE_GUILDNOTSIGNUP then
		strMsg = "您所在的帮会还没有报名！"
	elseif varResult == x303100_var_MPVP_BATTLE_STATECODE_PLAYERHASENTERED then   	
		strMsg = "你已经进入过战场，不能再次进入"
	elseif varResult == x303100_var_MPVP_BATTLE_STATECODE_REACHREADYTIME then
		strMsg = "超过战场准备时间，不能进入！"
	elseif varResult == x303100_var_MPVP_BATTLE_STATECODE_BATTLENOTBEGIN then
		strMsg = "战场还未开始，不能进入!"
	end

    Msg2Player(varMap, varPlayer, strMsg, 8, 3)
    Msg2Player(varMap, varPlayer, strMsg, 8, 2)
    
	-- 报名时间、队伍都在 ProcSignupCheck 进行了初步检测这里的日志不会太多
	WriteLog(1, format("MPVPBATTLE:x303100_ProcMPVPBattleResult varMap=%d PlayerSNID=%X Param1=%d Param2=%d Param3=%d", 
		varMap, GetGUID(varMap, varPlayer), varBattleType, varResult, varParam))
end

------------------------------------------------------------------------------------
--【功能】调用场景切换
--【参数】varBattleType - 战场类型(1 mpvp2v2 2 mpvp6v6)，targetSceneId - 目标场景 ID
--【返回】无
------------------------------------------------------------------------------------
function x303100_ProcMPVPBattleChangeScene(varMap, varPlayer, varBattleType, targetSceneId)

	if varMap ~= targetSceneId then
		
		-- 传送前玩家自身状态检查
        local varState, varMsg = LuaCallNoclosure(800021, "BattleTransCheckPlayerState", varMap, varPlayer)
        if varState == 1 then
            Msg2Player(varMap, varPlayer, varMsg, 8, 3)
            return
        end

        -- 传送前玩家所在场景检查，策划同学可进行补充
		local varMapType = GetSceneType(varMap)
		if varMapType == 1 then
            Msg2Player(varMap, varPlayer, "传送失败，不可以在副本进行传送！", 8, 3)
            Msg2Player(varMap, varPlayer, "传送失败，不可以在副本进行传送！", 8, 2)
            return
        elseif varMapType == 2 or varMapType == 7 then
            Msg2Player(varMap, varPlayer, "传送失败，不可以在战场里进行传送！", 8, 3)
            Msg2Player(varMap, varPlayer, "传送失败，不可以在战场里进行传送！", 8, 2)
            return
        elseif varMap == 91 or varMap == 191 or varMap == 291 or varMap == 391 then
            Msg2Player(varMap, varPlayer, "传送失败，不可以在轮回之地进行传送！", 8, 3)
            Msg2Player(varMap, varPlayer, "传送失败，不可以在轮回之地进行传送！", 8, 2)
            return
		end

        local nCurX, nCurZ = GetWorldPos(varMap, varPlayer)
        SetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_SCENE_PRE, varMap + 1)
        SetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSX_PRE, nCurX)
        SetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSZ_PRE, nCurZ)
		SetPlayerRuntimeData(varMap, varPlayer, RD_BATTLE_SCENE_KICK_DOWN, 0)

		--2011-08-25 by rj 跨服帮会战对于通知进入但跨服服务器人数满无法进入的用户记录参加信息
		if x303100_var_MGUILD_BATTLE_TYPE == varBattleType then			
	    	LuaCallNoclosure(303117, "RecordGuildMemberEnterCount", varMap, varPlayer)
		end

		NewWorld(varMap, varPlayer, targetSceneId, 100, 100, 303100)			
	    WriteLog(1, format("MPVPBATTLE:x303100_ProcMPVPBattleChangeScene varMap=%d PlayerSNID=%X Param1=%d", 
	    	varMap, GetGUID(varMap, varPlayer), targetSceneId)) 
	end
end
