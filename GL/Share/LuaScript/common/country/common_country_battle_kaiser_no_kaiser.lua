--皇帝战的相关脚本-----没有皇帝的争夺战

x310121_var_FileId		 											= 310121
x310121_var_PrintDebugLog										=	0	--输出调试日志
x310121_var_PrintInfoLog										=	1	--输出基本调用信息日志

x310121_var_MapID														= SCENE_BATTLE_KAISER	--皇帝战场景Id
x310121_var_JadeId													=	13080012--玉玺的Id
x310121_var_JadePosition										=	{259, 307} --刷玉玺的位置
x310121_var_JadeGrowPoint										=	144
x310121_var_BattleOverPoint									= 3 --战争结束的分值,当到达这个分值,则战争结束
x310121_var_RefreshInterval									= 300 --刷新间隔 秒为单位
x310121_var_DeathPlayerReliveInterval				= 0 --死亡玩家复活间隔 秒为单位
x310121_var_LoopInterval										=	1000 --循环的间隔 毫秒
x310121_var_ReliveItemId										=	11990401 --原地复活使用的道具

x310121_var_ReliveNotice										=	"皇帝战期间，只有使用皇帝战回魂丹才能进行原地复活" --复活提示
x310121_var_ObtainJadeNotice								=	"皇帝战还没开始，不能夺取王旗！" --摘取玉玺的提示
x310121_var_GameBattleOverBroadcast					=	"%s获得了本次皇帝战的胜利!!!"
x310121_var_GameBattleOverBroadcastNoKaiser	=	"很遗憾,本次没有皇帝产生"

--楼兰的配置信息
x310121_var_CountryTable										=
{
	--楼兰
	{
		campId 			= {16},
		birthPlace	=	{439, 298},
		name				=	"楼兰"
	},
	
	--天山的配置信息
	{
		campId 			= {17},
		birthPlace	=	{244, 464},
		name				=	"天山"
	},
	
	--昆仑的配置信息
	{
		campId 			= {18},
		birthPlace	=	{121, 424},
		name				=	"昆仑"
	},
	
	--敦煌的配置信息
	{
		campId 			= {19},
		birthPlace	=	{412, 425},
		name				=	"敦煌"
	}
}

--运行时变量
x310121_var_HasJade													=	0 --标识是否刷出玉玺
x310121_var_PointTable											=	{0, 0, 0, 0} --4个国家的积分情况
x310121_var_CurrentJadeId										=	0	--当前玉玺的Id
x310121_var_IsStarted												=	0	--标识是否开始
x310121_var_CallOver												=	0 --标识是否已经调用结束
x310121_var_RefreshJadeCounter							=	x310121_var_RefreshInterval --记录刷玉玺的计数器

--处理没有皇帝的战争
function x310121_ProcBattleKaiserProcess( varMap, varIndex )
	WriteLog(1, format("x310121_ProcBattleKaiserProcess --- varMap = %d", varMap))
	x310121_var_IsStarted = 1
	x310121_var_HasJade = 0
	x310121_var_PointTable = {0, 0, 0, 0}
	x310121_var_RefreshJadeCounter = x310121_var_RefreshInterval
	x310121_ProcBatlleLoop(varMap, varIndex)
end

--处理战争的基本逻辑循环
function x310121_ProcBatlleLoop(varMap, varIndex)
	x310121_ProcJadeRefresh( varMap )
	if (x310121_var_CallOver == 0) then
	
		if (x310121_var_PrintDebugLog == 1) then
			--WriteLog(1, format("x310121_ProcBatlleLoop Debug --- SetSystemTimer"))
		end
		
		SetSystemTimerTick( varMap, x310121_var_FileId, 
				"ProcBatlleLoop", varIndex, x310121_var_LoopInterval) 
	end
end

--战争结束
function x310121_ProcBattleKaiserOver( varMap )
	--如果场景还有多余玉玺,处理回收
	if x310121_var_HasJade == 1 then 
		if (x310121_var_CurrentJadeId ~= 0) then
			
			if (x310121_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310121_ProcBattleKaiserOver Debug --- x310121_var_HasJade = 1, x310121_var_CurrentJadeId = %d",
							x310121_var_CurrentJadeId))
			end
			
			RecycleGrowPointByObjId(varMap, x310121_var_CurrentJadeId)
			x310121_ProcRecycleJade(varMap)
		end
	end
	x310121_GameOver(varMap)
end

--处理玉玺刷新的流程
function x310121_ProcJadeRefresh( varMap )
	if (x310121_var_HasJade == 0 and x310121_var_IsStarted == 1) then
		if (mod(x310121_var_RefreshJadeCounter, x310121_var_RefreshInterval) == 0) then
			x310121_ProduceJade( varMap )
		end
	end
	
	x310121_var_RefreshJadeCounter = x310121_var_RefreshJadeCounter + (x310121_var_LoopInterval / 1000)
	
	if (x310121_var_PrintDebugLog == 1) then
		--WriteLog(1, format("x310121_ProcJadeRefresh Debug --- x310121_ProcJadeRefresh = %d", 
		--				x310121_var_RefreshJadeCounter))
	end
end

--生产玉玺的流程
function x310121_ProduceJade( varMap )
	if (x310121_var_PrintInfoLog == 1) then
		WriteLog(1, format("x310121_ProduceJade Info --- varMap = %d",
								 varMap))
	end
	
	x310121_ProcGpCreate(varMap, x310121_var_JadeGrowPoint, 
				x310121_var_JadePosition[1], x310121_var_JadePosition[2])
	x310121_var_HasJade = 1
	x310121_var_RefreshJadeCounter = 0
end

--处理玩家复活的流程
function x310121_ProcPlayerRelive( varMap, varPlayer, varReliveOp)
	if (varReliveOp == 0) then --原地复活
	
		local itemCount = GetItemCount(varMap, varPlayer, x310121_var_ReliveItemId)
		if (x310121_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310121_ProcPlayerRelive Debug --- itemCount = %d, varPlayer = %d",
							 itemCount, varPlayer))
		end
		if 	varMap == 472 or varMap == 550 or varMap == 551 or varMap == 552 or varMap == 553 or varMap == 554 or varMap == 555 or varMap == 556 or varMap == 557 or varMap == 558 or varMap == 559 or varMap == 560 or varMap == 561 or varMap == 562 or varMap == 563 or varMap == 564  or varMap == 565  or varMap == 566    then  		
			if (itemCount > 0) then
				if (DelItem(varMap, varPlayer, x310121_var_ReliveItemId, 1) == 1) then
					ClearRageRecoverTick(varMap, varPlayer)
					RestoreHp(varMap, varPlayer, 100)
					RestoreRage(varMap, varPlayer, 100)
					ClearMutexState(varMap, varPlayer, 6)
					SendReliveResult(varMap, varPlayer,1)	
						LastMount(varMap, varPlayer )
						RestoreHp(varMap, varPlayer,0)
					ClearPlayerNextSceneInfo(varMap, varPlayer)					
				else
					Msg2Player(varMap, varPlayer, "扣除失败,无法复活", 8, 3)
				end
			else
				Msg2Player(varMap, varPlayer, x310121_var_ReliveNotice, 8, 3)
			end
		else
				Msg2Player(varMap, varPlayer, "很抱歉,当前场景无法原地复活", 8, 3)
		end			
		
	elseif (varReliveOp == 1 or varReliveOp == 2) then --场景复活
	
		local curCountry = GetCurCountry(varMap, varPlayer)
		if (curCountry < 0 or curCountry > 3) then
			WriteLog(1, 
				format("x310121_ProcPlayerRelive ERRROR!!! --- varMap = %d, varPlayer = %d, curCountry = %d",
							 varMap, varPlayer, curCountry))
			return 
		end
		
		local birX = x310121_var_CountryTable[curCountry + 1].birthPlace[1] + random( 1, 3)
		local birZ = x310121_var_CountryTable[curCountry + 1].birthPlace[2] + random( 1, 3)
		
		if (x310121_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310121_ProcPlayerRelive Debug --- birX = %d, birZ = %d",
							 birX, birZ))
		end
		
		SetPos( varMap, varPlayer, birX, birZ)
		ClearRageRecoverTick( varMap, varPlayer)
    RestoreHp( varMap, varPlayer, 100)
    RestoreRage( varMap, varPlayer, 100)
    ClearMutexState( varMap, varPlayer, 6)
    SendReliveResult( varMap, varPlayer, 1)
    ClearPlayerNextSceneInfo(varMap, varPlayer)			
	end
end

--处理玩家进入的流程
function x310121_ProcPlayerEnterMap( varMap, varPlayer)
end

--处理玩家退出的流程
function x310121_ProcPlayerLeaveMap( varMap, varPlayer)
end

function x310121_ProcGpCreate(varMap, growPointType, varX, varZ)
	x310121_var_CurrentJadeId = ItemBoxEnterScene(varX, varZ, growPointType, varMap, 1, x310121_var_JadeId)
end

function x310121_ProcGpOpen(varMap, varPlayer, varTalknpc)
	if (x310121_var_IsStarted == 0) then
		Msg2Player(varMap, varPlayer, x310121_var_ObtainJadeNotice, 8, 3)
		return 1
	end
	
	return 0
end

function x310121_ProcGpRecycle(varMap, varPlayer, varTalknpc)
	x310121_ProcRecycleJade(varMap)
	return 1
end

--处理玉玺的回收
function x310121_ProcRecycleJade(varMap)
	x310121_var_HasJade = 0
	x310121_var_CurrentJadeId = 0
end

function x310121_ProcGpProcOver(varMap, varPlayer, varTalknpc)
	local countryId = GetCurCountry(varMap, varPlayer)
	WriteLog(1, format("x310121_ProcGpProcOver --- countryId = %d", countryId))
	if (countryId < 0 or countryId > 3) then
		return 
	end
	
	local countryIndex = countryId + 1
	x310121_var_PointTable[countryIndex] = x310121_var_PointTable[countryIndex] + 1
	Msg2Player(varMap, varPlayer, format("夺旗完成, 本国现在拥有: %d面皇旗", x310121_var_PointTable[countryIndex]), 8, 3)
	if countryId == 0 then
		LuaThisScenceM2Wrold (varMap, format("楼兰王国夺旗！楼兰王国现在拥有: %d面皇旗", x310121_var_PointTable[countryIndex]), 1, 5)
	elseif countryId == 1 then
		LuaThisScenceM2Wrold (varMap, format("天山王国夺旗！ 天山王国现在拥有: %d面皇旗", x310121_var_PointTable[countryIndex]), 1, 5)
	elseif countryId == 2 then
		LuaThisScenceM2Wrold (varMap, format("昆仑王国夺旗！ 昆仑王国现在拥有: %d面皇旗", x310121_var_PointTable[countryIndex]), 1, 5)
	elseif countryId == 3 then
		LuaThisScenceM2Wrold (varMap, format("敦煌王国夺旗！ 敦煌王国现在拥有: %d面皇旗", x310121_var_PointTable[countryIndex]), 1, 5)
	end	
	if (x310121_var_PointTable[countryIndex] == x310121_var_BattleOverPoint) then
		x310121_GameOver(varMap)
	end
end

function x310121_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
end

--游戏结束的处理
function x310121_GameOver(varMap)
	if (x310121_var_IsStarted == 1) then
		local topOneCountryId = x310121_GetTopOneCountryId()
		if (x310121_var_PrintInfoLog == 1) then
			WriteLog(1, format("x310121_GameOver --- varMap = %d, topOneCountryId = %d", varMap, topOneCountryId))
		end
		
		local broadcast, countryName
		if (topOneCountryId == -1) then --没有皇帝产生
			BattleKaiserOverNotice(topOneCountryId)
			broadcast = x310121_var_GameBattleOverBroadcastNoKaiser
			
			countryName = ""
		else
			BattleKaiserOverNotice(topOneCountryId - 1)
			
			--向国家变量设置相关信息
			LuaCallNoclosure( BATTLE_KAISER_MAIN_SCRIPT, "SetCountryFreeParam", varMap, topOneCountryId - 1)
			broadcast = x310121_var_GameBattleOverBroadcast
			
			countryName = x310121_var_CountryTable[topOneCountryId].name
		end
		
		LuaAllScenceM2Wrold(varMap, format(broadcast, countryName), 5, 1)
		
		x310121_var_HasJade													=	0 --标识是否刷出玉玺
		x310121_var_PointTable											=	{0, 0, 0, 0} --4个国家的积分情况
		x310121_var_CurrentJadeId										=	0	--当前玉玺的Id
		x310121_var_IsStarted												=	0	--标识是否开始
		x310121_var_RefreshJadeCounter 							= x310121_var_RefreshInterval
	end
	
	if x310121_var_CallOver == 0 then
		x310121_var_CallOver = 1
	end
	
end

--获取分数第一的国家Id
function x310121_GetTopOneCountryId(varMap)	

	-- 后背列表,首要条件是必须有国王,然后再从后背列表中选择皇帝
	local backTable = {} 
	for i = 1, 4 do
		WriteLog(1, format("国王Id = %d ", CountryGetKingGUID(i - 1)))
		if (CountryGetKingGUID(i - 1) ~= -1) then
			for t = 1, 4 do
				if (backTable[t] == nil) then
					backTable[t] = i
					break
				end
			end
		end
	end
	
	if (getn(backTable) == 0) then
		WriteLog(1, format("x310121_GetTopOneCountryId --- backTable = nil"))
		return -1 --没有国王
	end
	
	local tempPointSortTable = {}
	local maxPoint = 0
	local flag = 0;
	for i = 1, getn(backTable) do
		if (x310121_var_PointTable[backTable[i]] > maxPoint) then		
			maxPoint = x310121_var_PointTable[backTable[i]]
			tempPointSortTable = {}
			flag = 1;
		elseif x310121_var_PointTable[backTable[i]] == maxPoint then
			flag = 1;
		end
		
		if flag == 1 then
			flag = 0;
			for t = 1, 4 do
				if (tempPointSortTable[t] == nil) then
					tempPointSortTable[t] = backTable[i]
					break
				end
			end
		end
	end

	local compCountNum = getn(tempPointSortTable)
	
	if (compCountNum > 1) then
		
		local tempStongWeakSortTable = {}
	--多个最高分,判断实力
		local maxStrongWeak = -1
		local tempStrongWeak = 0
		
		for i = 1, compCountNum do
			tempStrongWeak = GetStrongWeakScore(tempPointSortTable[i] - 1)
			if (tempStrongWeak >= maxStrongWeak) then
				if (tempStrongWeak > maxStrongWeak) then
					maxStrongWeak = tempStrongWeak
					tempStongWeakSortTable = {}
				end
				
				for t = 1, compCountNum do
					if (tempStongWeakSortTable[t] == nil) then
						tempStongWeakSortTable[t] = tempPointSortTable[i]
						break
					end
				end
			end
			
		end
		
		local strongWeakTableCount = getn(tempStongWeakSortTable)
		if (strongWeakTableCount > 1) then
			local index = random(1, strongWeakTableCount)
			return tempStongWeakSortTable[index]
		else
			return tempStongWeakSortTable[1]
		end
	else
		return tempPointSortTable[1]
	end
end

--处理玩家死亡
function x310121_ProcPlayerDie(varMap, varPlayer, varKiller)
	if (x310121_var_IsStarted == 1) then
		if (GetObjType(varMap, varKiller) == 1
					and GetObjType(varMap, varPlayer) == 1) then
					
			local killerCamp = GetCurCamp(varMap, varKiller)
			local dierCamp = GetCurCamp(varMap, varPlayer)
			
			if (x310121_var_PrintDebugLog == 1) then
				WriteLog(1, 
					format("x310121_ProcPlayerDie Info --- varMap = %d, varPlayer = %d, varKiller= %d, killerCamp = %d, dierCamp = %d",
								 varMap, varPlayer, varKiller, killerCamp, dierCamp))
			end
			
		 local teamid = GetTeamId(varMap, varKiller)        			
		 local teamnum = GetNearTeamCount(varMap, varKiller)
		 			
			if (killerCamp ~= dierCamp) then--对立方,处理任务及荣誉
				if teamid == -1 then
					LuaCallNoclosure(BATTLE_KAISER_MAIN_SCRIPT, "ProcPlayerKillMission",varMap, varKiller, 1) 
				else
					for varI = 0, teamnum - 1 do
					local memberId = GetNearTeamMember(varMap, varKiller, varI)		
						if IsPlayerStateNormal(varMap, memberId) > 0 and GetHp(varMap, memberId) > 0  then
							LuaCallNoclosure(BATTLE_KAISER_MAIN_SCRIPT, "ProcPlayerKillMission",varMap, memberId, 1)	
						end
					end	
				end	
			end
		end
	end
end
--处理玩家离开区域
function x310121_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )
end

function x310121_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end
