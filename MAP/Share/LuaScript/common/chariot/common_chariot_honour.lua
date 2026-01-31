--战车荣誉计算相关的逻辑实现
x571000_var_FileId 									= 571000
x571000_var_ExtHonourLimit  				= 1000
x571000_var_HouhuayuanMapId 				= 44

x571000_var_MaxChariotHonourLimit		=	999999 -- 最大战车荣誉上限

x571000_var_HonourLimit							= 4000 --荣誉上限
x571000_var_HonourLimitWithBuff			= 8000 --荣誉之星的荣誉上限

x571000_var_PrintDebugLog						=	1 --调试日志输出
x571000_var_PrintInfoLog						=	1 --Info日志输出


--计算战车荣誉的入口
function x571000_CalculateChariotHonor(varMap, varDeader, varKiller)
	local dierGuid = GetGUID(varMap, varDeader)
	if (varKiller == -1) then
		return
	end
	
	local	killer = GetPlayerObjIdByChariot(varMap, varKiller)
	if (killer == -1) then
		return
	end
	
	--不计算宠物
	local killerType = GetObjType(varMap, killer)
	--if killerType == 3 then
	--	killerType = 1
	--	killer = GetOwnerID(varMap, killer)
	--	killerType = GetObjType(varMap, killer)
	--end	

	if killerType ~= 1 then
		return	
	end
	
	if (x571000_var_PrintDebugLog == 1) then
		local killerGuid = GetGUID(varMap, killer)
		WriteLog(1, format("x571000_CalculateChariotHonor Debug --- varMap = %d, killerGuid = %d, dierGuid = %d"
				,	varMap, killerGuid, dierGuid))
	end
	
	if varMap == PK_PUNISH_PRISON_SCENE_ID then 
		return
	end
	
	if varDeader == killer then  
		return
	end
	
	if (x571000_var_PrintDebugLog == 1) then
		WriteLog(1, format("x571000_CalculateChariotHonor Debug --- Start Count Honour.... "))
	end
	
	local killerLevel = GetLevel(varMap, killer)
	local diedLevel = GetLevel(varMap, varDeader)
	local killerName = GetName(varMap, killer)
	local nMemberNum = 1
	local bHasTeam = HasTeam(varMap, killer)
	local nShareMemberNum = 0
	
	if (x571000_var_PrintDebugLog == 1) then
		WriteLog(1, format("x571000_CalculateChariotHonor Debug --- killerLevel = %d, diedLevel = %d"
			,	killerLevel, diedLevel))
	end
	
	if bHasTeam > 0 then
    	nMemberNum = GetNearTeamCount(varMap, killer)
  	end
  
  	if nMemberNum >= 2 then
	  for varI=0, nMemberNum-1 do
				local memberId = GetNearTeamMember(varMap, killer, varI)
				if IsPlayerStateNormal(varMap, memberId) > 0 and GetHp(varMap, memberId) > 0 and memberId ~= killer then
					nShareMemberNum = nShareMemberNum + 1
				end
		end
	end
	
	local updateResult = x571000_UpdateHonorRecord( varMap, varDeader, killer )
	LuaScenceM2Player(varMap, killer, updateResult, killerName, CHAT_RIGHTDOWN, 1 )
	
	local getHonor = x571000_HonorNumCalculate( varMap, varDeader, killer )
	local addHonorNum = getHonor / (nShareMemberNum + 1) 
	local tempHonor = floor(addHonorNum);
	if addHonorNum >= tempHonor + 0.5 then
		addHonorNum = tempHonor + 1
	else
		addHonorNum = tempHonor
	end
	
	if addHonorNum > 0 then
		x571000_TeamShareHonor( varMap, varDeader, killer, addHonorNum )              
	
		local addResult = x571000_IsCanAddHonor( varMap, varDeader, killer );
		if addResult == nil then
			if GetSceneType(varMap) == 0  then
				LuaCallNoclosure(404909, "ComputeZhuanJingTianfuCnt", varMap, varDeader, killer ) 
			end
			
			local canAddHonor = x571000_CanAddHonorNum( varMap, varDeader, killer )

			--当可增加的荣誉为0时的处理
			if (canAddHonor <= 0) then 
				--判断是否在后花园场景,如果在后花园,则计算后花园上限
				if (varMap == x571000_var_HouhuayuanMapId) then
					canAddHonor = x571000_CalculateExtHonour(varMap, killer, canAddHonor)
				end
			end
			
			--处理皇帝战的额外荣誉
			if (varMap == SCENE_BATTLE_KAISER or varMap == SCENE_BATTLE_KAISER_BACKROOM) then
				LuaCallNoclosure(BATTLE_KAISER_MAIN_SCRIPT, "ProcPlayerChariotExtHonour", varMap, killer, addHonorNum) 
			end
			
			local IsOverFlow = 0
			if addHonorNum > canAddHonor then
				addHonorNum = canAddHonor
				IsOverFlow = 1
			end
			
			if addHonorNum > 0 then
				
				AddPlayerChariotHonour(varMap, killer, addHonorNum)
				local szMsg = "获得战车荣誉" .. addHonorNum .. "点"
				LuaScenceM2Player(varMap, killer, szMsg, killerName, CHAT_RIGHTDOWN, 1 )
				
				
				if varMap == 50 or varMap == 150 or varMap == 250 or varMap == 350 or
				   varMap == 51 or varMap == 151 or varMap == 251 or varMap == 351 or
				   varMap == 58 or varMap == 158 or varMap ~= 258 or varMap ~= 358 or
				   varMap == 86 or varMap == 186 or varMap == 286 or varMap == 386 then
					LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"ProcCountryBattleLitePlayerKilled", varMap,varDeader,killer,addHonorNum*2 )   
				end
				
				local extHonour = 0
				if (varMap == x571000_var_HouhuayuanMapId and addHonorNum > 1 and IsOverFlow == 0) then -- 后花园场景,获取额外的荣誉奖励
					extHonour = addHonorNum * 2
					if (extHonour + addHonorNum > canAddHonor) then
						extHonour = canAddHonor - addHonorNum
					end
					
					AddPlayerChariotHonour(varMap, killer, extHonour)
					LuaScenceM2Player(varMap, killer, "后花园获得额外战车荣誉" .. extHonour .. "点", killerName, CHAT_RIGHTDOWN, 1 )
				end
				SetChariotHonorInfo(varMap, killer, "HONORNUM", GetChariotHonorInfo(varMap, killer, "HONORNUM") + addHonorNum + extHonour)
			end
			
			if 1 == x571000_IsHonorOverflow(varMap, killer) then
				if (varMap ~= x571000_var_HouhuayuanMapId or addHonorNum <= 0) then
					LuaScenceM2Player(varMap, killer, "已经达到每天可以获得的最大战车荣誉上限", killerName, CHAT_RIGHTDOWN, 1 )
				end
			end
		else
			
			if addHonorNum > 0 then
								
				if varMap == 50 or varMap == 150 or varMap == 250 or varMap == 350 or
				   varMap == 51 or varMap == 151 or varMap == 251 or varMap == 351 or
				   varMap == 58 or varMap == 158 or varMap ~= 258 or varMap ~= 358 or
				   varMap == 86 or varMap == 186 or varMap == 286 or varMap == 386 then
					LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"ProcCountryBattleLitePlayerKilled", varMap,varDeader,killer,addHonorNum*2 )   
				end
			end
			
			LuaScenceM2Player(varMap, killer, addResult, killerName, CHAT_RIGHTDOWN, 1 )
		end
	end
end

function x571000_TeamShareHonor( varMap, varDeader, varKiller, honor )
	local nMemberNum = 1
	local bHasTeam = HasTeam(varMap, varKiller)
	
	if bHasTeam > 0 then
    nMemberNum = GetNearTeamCount(varMap, varKiller)
  end
  
  if nMemberNum >= 2 then
  
	  for varI=0, nMemberNum-1 do
	  
			local memberId = GetNearTeamMember(varMap, varKiller, varI)
			
			if IsPlayerStateNormal(varMap, memberId) > 0 and GetHp(varMap, memberId) > 0 and memberId ~= varKiller then
			
				LuaScenceM2Player(varMap, memberId, "#cff0000本次荣誉变化来源于队伍的荣誉共享", GetName(varMap, memberId), CHAT_RIGHTDOWN, 1 )
				
				local updateResult = x571000_UpdateHonorRecord( varMap, varDeader, memberId )
				
				LuaScenceM2Player(varMap, memberId, updateResult, GetName(varMap, memberId), CHAT_RIGHTDOWN, 1 )
				
				local addResult = x571000_IsCanAddHonor( varMap, varDeader, memberId );
				
				if addResult ~= nil then
					LuaScenceM2Player(varMap, memberId, addResult, GetName(varMap, memberId), CHAT_RIGHTDOWN, 1 )
				else
					
					if GetSceneType(varMap) == 0  then
						LuaCallNoclosure(404909,"ComputeZhuanJingTianfuCnt", varMap, varDeader, memberId ) 
					end
					
					local canAddHonor = x571000_CanAddHonorNum( varMap, varDeader, memberId )
					
					--当可增加的荣誉为0时的处理
					if (canAddHonor <= 0) then 
						--判断是否在后花园场景,如果在后花园,则计算后花园上限
						if (varMap == x571000_var_HouhuayuanMapId) then
							canAddHonor = x571000_CalculateExtHonour(varMap, memberId, canAddHonor)
						end
					end
					
					--处理皇帝战的额外荣誉
					if (varMap == SCENE_BATTLE_KAISER or varMap == SCENE_BATTLE_KAISER_BACKROOM) then
						LuaCallNoclosure(BATTLE_KAISER_MAIN_SCRIPT, "ProcPlayerChariotExtHonour", varMap, memberId, honor) 
					end
					
					local IsOverFlow = 0
					local addHonour = honor
					if addHonour > canAddHonor then
						addHonour = canAddHonor
						IsOverFlow = 1
					end
					
					if addHonour > 0 then
					
						AddPlayerChariotHonour(varMap, memberId, addHonour)
						local szMsg = "获得战车荣誉" .. addHonour .. "点"
						LuaScenceM2Player(varMap, memberId, szMsg, GetName(varMap, memberId), CHAT_RIGHTDOWN, 1 )					
						
						local extHonour = 0
						if (varMap == x571000_var_HouhuayuanMapId and addHonour > 1 and IsOverFlow == 0) then -- 后花园场景,获取额外的战车荣誉奖励
							extHonour = addHonour * 2
							if (extHonour + addHonour > canAddHonor) then
								extHonour = canAddHonor - addHonour
							end
							AddPlayerChariotHonour(varMap, memberId, extHonour)
							LuaScenceM2Player(varMap, memberId, "后花园获得额外战车荣誉" .. extHonour .. "点", GetName(varMap, memberId), CHAT_RIGHTDOWN, 1 )
						end
						
						SetChariotHonorInfo(varMap, memberId, "HONORNUM", GetChariotHonorInfo(varMap, memberId, "HONORNUM") + addHonour + extHonour)
					end
					
					if 1 == x571000_IsHonorOverflow(varMap, memberId) then
						if (varMap ~= x571000_var_HouhuayuanMapId or addHonour <= 0) then
						LuaScenceM2Player(varMap, memberId, "已经达到每天可以获得的最大战车荣誉上限", GetName(varMap, memberId), CHAT_RIGHTDOWN, 1 )
					end
					end
					
				end
			end
		end
	end
end

function x571000_IsHonorOverflow(varMap,varPlayer)
	local selfLevel = GetLevel(varMap, varPlayer)
	local peerVipValue = GetPeerVipBenefit(varMap, varPlayer, 3)
	
	local honorNum = GetChariotHonorInfo(varMap, varPlayer, "HONORNUM")
	if honorNum >= x571000_var_HonourLimit + peerVipValue then
		return 1
	end
	return -1
end

--处理后花园的额外荣誉
function x571000_CalculateExtHonour(varMap, varPlayer, canAddHonor)
	WriteLog(1, format("x571000_CalculateExtHonour --- varMap = %d, varKiller = %d, canAddHonor = %d",
		varMap, varPlayer, canAddHonor))
	if (canAddHonor < 0) then
		canAddHonor = 0
	end
	
	local currDay = GetDayOfYear()
	local lastDay = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_DATE[1], MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_DATE[2], MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_DATE[3])
	if (currDay ~= lastDay) then
		SetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_DATE[1], MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_DATE[2], MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_DATE[3], currDay)
		SetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_COUNT[1], MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_COUNT[2], MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_COUNT[3], 0)
	end
	
	local curExtHonour = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_COUNT[1], MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_COUNT[2], MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_COUNT[3])
	if (curExtHonour < x571000_var_ExtHonourLimit) then
		canAddHonor = canAddHonor + 1
		SetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_COUNT[1], MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_COUNT[2], MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_COUNT[3], curExtHonour + 1)
	end
	return canAddHonor
end

function x571000_CanAddHonorNum( varMap, varDeader, varKiller )
	local honorNum = GetChariotHonorInfo(varMap, varKiller, "HONORNUM")
	
	local honorMax = 0
	local peerVipValue = GetPeerVipBenefit(varMap, varKiller, 3)
	
	if IsHaveSpecificImpact( varMap, varPlayer, 9016) > 0 then
		honorMax = x571000_var_HonourLimitWithBuff + peerVipValue * 2
	else
		honorMax = x571000_var_HonourLimit + peerVipValue 
	end
	
	return floor(honorMax - honorNum)
end

function x571000_HonorNumCalculate( varMap, varDeader, varKiller )
	local killerLevel = GetLevel(varMap, varKiller)
	local diedLevel = GetLevel(varMap, varDeader)

	local honor = 25 + (diedLevel * diedLevel / (killerLevel + diedLevel)) / 2
	
	if (x571000_var_PrintDebugLog == 1) then
		WriteLog(1, format("x571000_HonorNumCalculate Debug --- killerLevel = %d, diedLevel = %d, honor = %d"
			, killerLevel, diedLevel, honor))
	end
	
	local killerCountry = GetCurCountry(varMap, varKiller)
	if (varMap == killerCountry*100 + 50) or (varMap == killerCountry*100 + 51) then
		honor = 3 * honor
	end
	
	local tempHonor = floor(honor);
	if honor >= tempHonor + 0.5 then
		honor = tempHonor + 1
	else
		honor = tempHonor
	end
	
	return honor
end

function x571000_IsCanAddHonor( varMap, varDeader, varPlayer )

	local totalNum = 10
	local timeLimit = 3600*2 
	local timesLimit = 10 
	local curTime = GetCurrentTime();
	
	local diedCountry = GetCurCountry(varMap, varDeader)
	local selfCountry = GetCurCountry(varMap, varPlayer)
	local diedLevel = GetLevel(varMap, varDeader)
	local selfLevel = GetLevel(varMap, varPlayer)
	local diedGuid = GetGUID(varMap, varDeader)
	local diedName = GetName(varMap, varDeader)
	diedName = "#cFF0000" .. diedName
	
	local IsDiedInRecord = -1;
	local diedIndex = -1;
	local diedFirstBeKillTime = -1;
	local diedTimes = 1;
	
	if(diedCountry == selfCountry) then
		return "杀死本国战车，无战车荣誉获得"
	end
	
	if(diedLevel < 30) then
		return "被杀者等级小于30，无战车荣誉获得"
	end
	
	if(selfLevel - diedLevel > 20) then
		return "你的等级大于被杀者20级以上，无战车荣誉获得"
	end
	
	if (GetPlayerChariotHonour(varMap, varPlayer) >= x571000_var_MaxChariotHonourLimit) then
		return "已经达到最大战车荣誉上限,无法再获得战车荣誉"
	end
	
	for varIndex=0, tonumber(totalNum - 1) do
		local guid, killTime, times = GetChariotHonorRecord(varMap, varPlayer, varIndex)
		if tonumber(guid) == tonumber(diedGuid) then
			IsDiedInRecord = 1
			diedIndex = varIndex
			diedFirstBeKillTime = killTime
			diedTimes = times
		end
	end
	
	if 1 == IsDiedInRecord and (curTime - diedFirstBeKillTime < timeLimit and diedTimes > timesLimit) then
		return "在" .. timeLimit/3600 .. "小时之内，杀死" .. diedName .. "的战车次数超过" .. timesLimit .. "次，不再给战车荣誉"
	end
	
	local honorNum = GetChariotHonorInfo(varMap, varPlayer, "HONORNUM")
	
	local honorMax = 0
	local peerVipValue = GetPeerVipBenefit(varMap, varPlayer, 3)
	
	if IsHaveSpecificImpact( varMap, varPlayer, 9016) > 0 then
		honorMax = x571000_var_HonourLimitWithBuff + peerVipValue * 2
	else
		honorMax = x571000_var_HonourLimit + peerVipValue 
	end
	
	
	
	if honorNum >= honorMax then
		
		if (varMap == x571000_var_HouhuayuanMapId) then -- 后花园场景
			if (x571000_ReachHouhuayuanExtHonourLimit(varMap, varPlayer) == 0) then
				return nil
			end
		end

		return "你今天已经击败了足够的敌国玩家战车，不能再通过击败敌国玩家战车来获战车得荣誉。"
	end

	return nil
end

--判断是否到达额外荣誉上限
function x571000_ReachHouhuayuanExtHonourLimit(varMap, varPlayer)
	local currDay = GetDayOfYear()
	local lastDay = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_DATE[1], MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_DATE[2], MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_DATE[3])
	if (lastDay == currDay) then --如果是当天
		local curExtHonour = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_COUNT[1], MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_COUNT[2], MD_HOUHUAYUAN_CHARIOT_EXTHONOUR_COUNT[3])
		if (curExtHonour >= x571000_var_ExtHonourLimit) then
			return 1
		end
	end

	return 0
end

function x571000_UpdateHonorRecord( varMap, varDeader, varPlayer )

	local diedName = GetName(varMap, varDeader)
	diedName = "#cFF0000" .. diedName
	local diedGuid = GetGUID(varMap, varDeader)
	
	local totalNum = 10
	local timeLimit = 3600*2 
	local curTime = GetCurrentTime();
	
	local IsDiedInRecord = -1;
	local diedIndex = -1;
	local diedFirstBeKillTime = -1;
	local diedTimes = 1;
	
	for varIndex=0, tonumber(totalNum - 1) do
		local guid,killTime, times = GetChariotHonorRecord(varMap, varPlayer, varIndex)
		if guid ~= -1 then
			if curTime - killTime > timeLimit then
				SetChariotHonorRecord(varMap, varPlayer, varIndex, "TIMES", -1)
				SetChariotHonorRecord(varMap, varPlayer, varIndex, "KILL_TIME", -1)
				SetChariotHonorRecord(varMap, varPlayer, varIndex, "GUID", -1)
			end
		end
	end
	
	local varToday = GetDayOfYear()
	local honorDay = GetChariotHonorInfo(varMap, varPlayer, "HONORDAY") 
	if varToday ~= honorDay then
		SetChariotHonorInfo(varMap, varPlayer, "HONORDAY", varToday)
		SetChariotHonorInfo(varMap, varPlayer, "HONORNUM", 0)
	end
	
	for varIndex=0, tonumber(totalNum - 1) do
		local guid, killTime, times = GetChariotHonorRecord(varMap, varPlayer, varIndex)
		if tonumber(guid) == tonumber(diedGuid) then
			IsDiedInRecord = 1;
			diedIndex = varIndex;
			diedFirstBeKillTime = killTime
			diedTimes = times
		end
	end
	
	if( IsDiedInRecord == -1 ) then
		local bFull = IsChariotHonorRecordFull(varMap, varPlayer)
		if( bFull == 1 ) then
			
			for varIndex=1, tonumber(totalNum - 1) do
					local guid, killTime, times = GetChariotHonorRecord(varMap, varPlayer, varIndex)
					SetChariotHonorRecord(varMap, varPlayer, varIndex - 1, "TIMES", times)
					SetChariotHonorRecord(varMap, varPlayer, varIndex - 1, "KILL_TIME", killTime)
					SetChariotHonorRecord(varMap, varPlayer, varIndex - 1, "GUID", guid)
			end
			
			SetChariotHonorRecord(varMap, varPlayer, totalNum - 1, "TIMES", 0)
			SetChariotHonorRecord(varMap, varPlayer, totalNum - 1, "KILL_TIME", 0)
			SetChariotHonorRecord(varMap, varPlayer, totalNum - 1, "GUID", -1)
			return "最多记录10个被杀的战车, 杀战车记录已满, 第一个战车被顶掉, " .. diedName .. "的战车被加到记录中。"
		end
		AddChariotHonorRecord(varMap, varPlayer, varDeader)
		return "杀死战车："..diedName.. "的战车" .. "  1次"
	
	else
		diedTimes = diedTimes + 1
		SetChariotHonorRecord(varMap, varPlayer, diedIndex, "TIMES", diedTimes)
		return "杀死战车："..diedName.. "的战车" .. "  "..diedTimes.. "次"
	end
	return "荣誉记录无法更新"
end
