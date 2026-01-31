

x490445_var_FileId = 490445
x490445_var_TransPosloulan  ="shabaketodunhuangsichouzhilu"
x490445_var_TransPoslaiyin  ="shabaketodunhuangsichouzhilu"
x490445_var_TransPoskunlun  ="shabaketodunhuangsichouzhilu"
x490445_var_TransPosdunhuang="shabaketodunhuangsichouzhilu"
x490445_var_TuchengzhanQuestID = 7559


function x490445_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
local minute = GetMinOfDay()
local weekIdx = GetWeek()
	
if minute >= 900 and minute < 1020 then
	if 	x490445_IsDunHuangRuoGuo(varMap, varPlayer) > 0 then
		if x490445_IsLianMeng(varMap, varPlayer) ~= 1 then
			if x490445_IsBenGuo(varMap, varPlayer) == 0 then    
				if weekIdx == 6 then
					if IsHaveQuestNM(varMap, varPlayer, x490445_var_TuchengzhanQuestID ) <= 0 then
						Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，没有屠城战任务且不为联盟的异国玩家无法前往弱国！",8,2)
						Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，没有屠城战任务且不为联盟的异国玩家无法前往弱国！",8,3)		
						return				
					end
				else	
				--if CountryIsFortuneTimeEx(3,0) > 0 or CountryIsFortuneTimeEx(3,1) > 0 then
					Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，不为联盟的异国玩家无法前往弱国！",8,2)
					Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，不为联盟的异国玩家无法前往弱国！",8,3)
					return
			--	end 
				end
			end
		end
	end
end
	
	local selfType = GetObjType(varMap, varPlayer)
	
	if selfType == 1 then 
		
		if IsHaveSpecificImpact( varMap, varPlayer, 7606) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7612) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7618) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7624) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7609) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7615) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7621) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7627) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7607) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7613) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7619) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7625) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7610) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7616) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7622) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7628) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7605) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7611) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7617) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7623) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7608) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7614) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7620) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7626) == 1  then
			Msg2Player(varMap,varPlayer,"很抱歉，未完成铁人三项任务时无法通往其他场景！",8,2)
			return
		end
	end
	
	if selfType == 9 then	
		
		local busType = GetBusType(varMap, varPlayer)
		if busType == 1 then 
			local memberCount = GetBusMemberCount(varMap, varPlayer)
			ReadyBusChangeScene(varMap, 367, varPlayer)
			for	varI = 0, memberCount - 1 do
				local varObj = GetBusMemberObjId(varMap, varPlayer, varI)
				x490445_TransToPosition(varMap, varObj)
			end
			
			DeleteBus(varMap, varPlayer,0)
			return
		end
	elseif selfType == 1 then	
		if IsPlayerMutexState(varMap, varPlayer,PLAYER_STATE_PROTECTTIME) == 1 then
			return 
		end

		local busId = GetBusId(varMap, varPlayer)
		if busId ~= -1 then
			local busType = GetObjType(varMap, busId)
			if busType == 3 then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "很抱歉，护送目标感到危险，拒绝进入该场景！");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return	
			end

			local IsInDist = 0
			local busType = GetBusType(varMap, busId)
			if busType == 0 then		
				
				IsInDist = IsValidMyselfBus(varMap,varPlayer)
			elseif busType == 2 then	
				IsInDist = IsValidGuildBus(varMap,varPlayer)		
			elseif busType == 3 then	
				StartTalkTask(varMap)
				TalkAppendString(varMap, "你正在护送，不能这么做！");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return			
			end
			
			if IsInDist == 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "你的护送目标离你太远了，不能这么做！");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return
			end
				
			local memberCount = GetBusMemberCount(varMap, busId)
			ReadyBusChangeScene(varMap, 367, busId)
			for	varI = 0, memberCount - 1 do
				local varObj = GetBusMemberObjId(varMap, busId, varI)
				x490445_TransToPosition(varMap, varObj)
			end
			
			DeleteBus(varMap, busId,0)
			return
		end
		
		local isBusMember = IsBusMember(varMap, varPlayer)



	end
	local guo = GetCurCountry(varMap,varPlayer)	
	x490445_TransToPosition(varMap, varPlayer)
end

function x490445_TransToPosition(varMap, varPlayer)

	local guo = GetCurCountry(varMap,varPlayer)
	
	if guo == 0 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x490445_var_TransPosloulan)
		
		elseif guo == 1 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x490445_var_TransPoslaiyin)
		
		elseif guo == 2 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x490445_var_TransPoskunlun)
		
		elseif guo == 3 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x490445_var_TransPosdunhuang)
	
	end
end


function x490445_ProcMapTimerTick( varMap, monsterobjid )

end


function x490445_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x490445_ProcEventEntry( varMap, monsterobjid )

end

function x490445_IsDunHuangRuoGuo(varMap, varPlayer)
  local maxlevel = GetTopListInfo_MaxLevel(GetWorldID(varMap, varPlayer))
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
	if maxlevel >= 70 then
			if dunhuangscore <= allscore*0.2 then
				if x490445_IsMinGuo(varMap, varPlayer) == 1 then
	 	 			return 1
	 	 		end
			end
	end
	return 0
end

function x490445_IsLianMeng(varMap, varPlayer)

	local varCountryID = GetCurCountry(varMap, varPlayer )
	if IsLeague( varCountryID, 3 ) == 1 then
	    return 1
	end
	return 0
		
end

function x490445_IsBenGuo(varMap, varPlayer)
local country = GetCurCountry(varMap, varPlayer )
		if country == 3 then
	 		return 1
		end
	return 0
end

function x490445_IsMinGuo(varMap, varPlayer)
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
	local MinGuo = dunhuangscore
	local Onlyvalue = 0
		for varI = 0, 3 do
			if GetCountryParam(varMap, varI, CD_LASTWEEK_STRONG_WEAK_JIFEN) <= MinGuo then
				Onlyvalue = Onlyvalue + 1
			end
		end
		if Onlyvalue == 1 then
			return 1
		end
	return 0
end

