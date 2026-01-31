











x310501_var_FileId = 310501 
x310501_var_TuchengzhanQuestID = 7559
x310501_var_lingdicheck 	= {							
							  { varMap= 6,	time1 = 960,time2 = 1020,x1 = 28,x2 = 107,z1 =41,z2 =123},	
							  { varMap= 9,	time1 = 960,time2 = 1020,x1 = 132,x2 = 187,z1 =15,z2 =97},	
							  { varMap= 13,time1 = 960,time2 = 1020,x1 = 31,x2 = 126,z1 =165,z2 =236},   
							  { varMap= 18,time1 = 960,time2 = 1020,x1 = 180,x2 = 210,z1 =28,z2 =60},  	
							  { varMap= 21,time1 = 960,time2 = 1020,x1 = 130,x2 = 288,z1 =70,z2 =191},	
							  { varMap= 24,time1 = 960,time2 = 1020,x1 = 84,x2 = 174,z1 =55,z2 =136},	
							  { varMap= 27,time1 = 960,time2 = 1020,x1 = 100,x2 = 100,z1 =100,z2 =100},   
							  { varMap= 31,time1 = 960,time2 = 1020,x1 = 100,x2 = 100,z1 =100,z2 =100},	
							  { varMap= 34,time1 = 960,time2 = 1020,x1 = 100,x2 = 100,z1 =100,z2 =100},	
							}







function x310501_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x310501_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x310501_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x310501_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end

	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()

	if weekIdx == 6 and minOfDay >= 890 and minOfDay <= 900 and varMap == 44 then
			Msg2Player(varMap,varPlayer,"决战后花园期间，无法使用队伍召集令",8 ,2)
			Msg2Player(varMap,varPlayer,"决战后花园期间，无法使用队伍召集令",8 ,3)
			return 0
	end		
	
	

	
	
	local varMsg = nil
	local varLevel = GetLevel(varMap,varPlayer)
	local nNeedLevel = x310501_GetNeedLevel(varMap, varPlayer)
	if varLevel < 10 then
	   varMsg = "很抱歉，10级才能使用队伍召集令。"
	elseif HasTeam(varMap, varPlayer) ~= 1 then
		varMsg = "很抱歉，您还未进行组队无法使用。"
	elseif (GetTeamSize(varMap, varPlayer) < 2) then
		varMsg = "很抱歉，您所在的队伍中成员小于2人，无法使用。";
	elseif 0 == nNeedLevel then
		varMsg = "很抱歉，您所在地图无法使用该道具。";
	end
	
	if  GetWeek() == 6 then
		if x310501_lingdicheck(varMap, varPlayer) == 1 then
			varMsg = "很抱歉，在领地争夺战期间，您无法在领地图腾附近使用队伍召集令。";
		end	
		if x310501_kaiserbattlecheck(varMap, varPlayer) == 1 then
			varMsg = "很抱歉，在皇帝战期间，您无法在沙城附近使用队伍召集令。";
		end	
	end


	if varMsg ~= nil then
		StartTalkTask(varMap)
		TalkAppendString(varMap,varMsg)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	if IsHaveSpecificImpact( varMap, varPlayer, 7629) == 1 then
		CancelSpecificImpact( varMap, varPlayer, 7629)	
	end
	return 1; 
end







function x310501_ProcDeplete( varMap, varPlayer )
	return 1;
end








function x310501_ProcActivateOnce( varMap, varPlayer )
local camp = GetSceneCamp(varMap)
local minute = GetMinOfDay()	
local weekIdx = GetWeek()
         
if minute >= 900 and minute < 1020 then
	if x310501_IsRuoGuo(varMap, varPlayer,camp) == 1 then
		if x310501_IsBenGuo(varMap, varPlayer,camp) == 0 then
		--if x310501_IsGuoYun(varMap, varPlayer,camp) == 1 then
				if x310501_IsLianMeng(varMap, varPlayer,camp) == 0 then
					if weekIdx == 6 then
						if IsHaveQuestNM(varMap, varPlayer, x310501_var_TuchengzhanQuestID ) <= 0 then
							Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，没有屠城战任务且不为联盟的异国玩家无法在弱国使用召集令！",8,2)
							Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，没有屠城战任务且不为联盟的异国玩家无法在弱国使用召集令！",8,3)		
							return				
						end
					else					
						Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，不为联盟的异国玩家无法在弱国使用召集令！",8 ,2)
						Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，不为联盟的异国玩家无法在弱国使用召集令！",8 ,3)
						return
					end
				end
		--end
		end
	end
end	
	local nNeedLevel = x310501_GetNeedLevel(varMap, varPlayer)
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
	
		varMsg = "您使用了队伍召集令,您的队友会尽快赶来！"
		StartTalkTask(varMap)
		TalkAppendString(varMap,varMsg)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		
		CallUpTeamMember( varMap, varPlayer, nNeedLevel )
	end
	return 1;
end



function x310501_CheckEnable( varMap, varPlayer)
    if IsHaveSpecificImpact( varMap, varPlayer, 7629) == 1 then
        Msg2Player( varMap, varPlayer, "您有战车加护效果，不能进行此操作", 8, 3)
        Msg2Player( varMap, varPlayer, "您有战车加护效果，不能进行此操作", 8, 2)
        return 0
    end

    return 1
end



function x310501_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x310501_GetNeedLevel(varMap, varPlayer)
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()	
	
	if varMap == 52 or varMap == 152 or varMap == 252 or varMap == 352 or 
	   varMap == 87 or varMap == 187 or varMap == 287 or varMap == 387 or 
	   varMap == 98 or varMap == 198 or varMap == 298 or varMap == 398 or
	   varMap == 99 or varMap == 199 or varMap == 299 or varMap == 399 or
	   varMap == 100 or varMap == 200 or varMap == 300 or varMap == 400 or
	   varMap == 101 or varMap == 201 or varMap == 301 or varMap == 401 or
	   varMap == 102 or varMap == 202 or varMap == 302 or varMap == 402 or
	   varMap == 89 or varMap == 189  or varMap == 289  or varMap == 389  then
		return 10
	elseif varMap == 53 or varMap == 153 or varMap == 253 or varMap == 353 then
		return 15
	elseif	varMap == 55 or varMap == 155 or varMap == 255 or varMap == 355 then
	    return 20
	elseif	varMap == 54 or varMap == 154 or varMap == 254 or varMap == 354  or
			varMap == 104 or varMap == 204 or varMap == 304 or varMap == 404 or
			varMap == 105 or varMap == 205 or varMap == 305 or varMap == 405 or
			varMap == 106 or varMap == 206 or varMap == 306 or varMap == 406 or
			varMap == 107 or varMap == 207 or varMap == 307 or varMap == 407 or
			varMap == 108 or varMap == 208 or varMap == 308 or varMap == 408 or
			varMap == 109 or varMap == 209 or varMap == 309 or varMap == 409 or
			varMap == 110 or varMap == 210 or varMap == 310 or varMap == 410 or
			varMap == 111 or varMap == 211 or varMap == 311 or varMap == 411 then
	    return 25
	elseif varMap == 56 or varMap == 156 or varMap == 256 or varMap == 356  then
		return 30
	elseif	varMap == 57 or varMap == 157 or varMap == 257 or varMap == 357 or
			varMap == 103 or varMap == 203  or varMap == 303  or varMap == 403 then
	    return 35
	elseif varMap == 0  or varMap == 51 or varMap == 151 or varMap == 251 or 
		   varMap == 351 or varMap == 50 or varMap == 150 or varMap == 250 or
		   varMap == 58 or varMap == 158 or varMap == 258 or varMap == 358 or
		   varMap == 86 or varMap == 186 or varMap == 286 or varMap == 386 or
		   varMap == 36 or varMap == 37 or varMap == 38 or  varMap == 15 or
		   varMap == 350 or varMap == 2 or varMap == 3 or varMap == 4 or varMap == 5 or 
		   varMap == 6 or varMap == 7 or varMap == 8 or varMap == 9 or varMap == 10 or
		   varMap == 11 or varMap == 13 or varMap == 16 or varMap == 17 or varMap == 18 or
		   varMap == 19 or varMap == 20 or varMap == 21 or varMap == 22 or varMap == 23 or
		   varMap == 24 or varMap == 25 or varMap == 26 or varMap == 27 or varMap == 29 or
		   varMap == 30 or varMap == 31 or varMap == 32 or varMap == 33 or varMap == 34 or varMap == 35 or varMap == 76 or varMap == 176 or varMap == 276 or varMap == 376 or varMap == 472 or
			 varMap == 550 or varMap == 551 or varMap == 552 or varMap == 553 or varMap == 554 or varMap == 555 or varMap == 556 or varMap == 557 or varMap == 558 or varMap == 559 or varMap == 560 or
			 varMap == 561 or varMap == 562 or varMap == 563 or varMap == 564 or varMap == 565 or varMap == 566 or varMap == 67 or varMap == 167 or varMap == 267 or varMap == 367 then
		return 40
	elseif	varMap == 501 then
	    return 45
	elseif  varMap == 503 then
		return 50
	elseif  varMap == 504 then
		return 55
	elseif  varMap == 506 then
		return 60
	elseif  varMap == 507 then
		return 65
	elseif   varMap == 509 then
		return 70
	elseif  varMap == 508  then
		return 75
	elseif  varMap == 510 or varMap == 567 or varMap == 568 or varMap == 569 or varMap == 570 or varMap == 571 then
		return 80
	elseif varMap == 511 then
		return 84
	elseif varMap == 512 then
		return 88
	elseif varMap == 513 then
		return 90
	elseif varMap == 514 then
		return 92
	elseif varMap == 515 then
		return 94
	elseif varMap == 516 then
		return 96
	elseif varMap == 517 then
		return 98
	elseif varMap == 518 then
		return 100
	elseif varMap == 45 or varMap == 46 or varMap == 47 or varMap == 48 or varMap == 49 or varMap == 465 or varMap == 466 or varMap == 467 or varMap == 468 or varMap == 469 or varMap ==470 or varMap ==477 or varMap ==520 or varMap ==521 or varMap ==522 then
		return 70
	elseif varMap == 44 then
		if weekIdx == 6 and minOfDay >= 870 and minOfDay <= 890 then
			return 40
		else
			return 70
		end
	end
	return 0
end


function x310501_kaiserbattlecheck( varMap, varPlayer )
	local varRet = 0
	local minute = GetMinOfDay()
	local maplist ={472,550, 551, 552, 553, 554, 555, 556, 557, 558, 559, 560, 561, 562, 563,564, 565, 566} 
	if minute >=1200 and minute < 1260 then
		for itm, item in maplist do
			if item ==varMap then
--				local isBattleStarted = LuaCallNoclosure(310122, "IsBattleStarted", varMap)
--				if isBattleStarted == 1 then
					varRet =1
--				end
			end	
		end	
	end
	return varRet
end

function x310501_lingdicheck( varMap, varPlayer )
	local varRet = 0
    local minute = GetMinOfDay()
	local posX,posZ = GetWorldPos(varMap, varPlayer)
	if  GetWeek() == 6 then
		for varI,itm in x310501_var_lingdicheck do
			if varMap == itm.varMap and minute >=itm.time1 and minute <= itm.time2 and posX >=itm.x1 and posX <=itm.x2 and posZ >=itm.z1 and posZ <=itm.z2 then
				varRet = 1
				break
			end
		end
	end
	return varRet
end	



function x310501_IsRuoGuo(varMap, varPlayer,camp)
  local maxlevel = GetTopListInfo_MaxLevel(GetWorldID(varMap, varPlayer))
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
	local myscore = 0
	if camp == 16 then
			 myscore = loulanscore
  elseif camp == 17 then
			 myscore = tianshanscore
	elseif camp == 18 then
			 myscore = kunlunscore
	elseif camp == 19 then
			 myscore = dunhuangscore
	else 
		   return 0
  end
	if maxlevel >= 70 then
			if myscore <= allscore*0.2 then
				if x310501_IsMinGuo(varMap, varPlayer,camp) == 1 then
	 	 			return 1
	 	 		end
			end
	end
	return 0
end
function x310501_IsBenGuo(varMap, varPlayer,camp)
local country = GetCurCountry(varMap, varPlayer )
	if camp == 16 then
 		if country == 0 then
 			return 1
 		else 
 			return 0
 		end
	elseif camp == 17 then
		if country == 1 then
	 	 return 1
		else
			return 0
		end
	elseif camp == 18 then
		if country == 2 then
		 return 1
		else
		 return 0
		end
	elseif camp ==19 then
		if country == 3 then
		 return 1
		else
		 return 0
		end
	else
  	return 1
	end
end
function x310501_IsGuoYun(varMap, varPlayer,camp)
	if camp == 16 then countryid = 0
		elseif camp == 17 then countryid = 1 
		elseif camp == 18 then countryid = 2
		elseif camp == 19 then countryid = 3
	else
 		return 0
	end
	if CountryIsFortuneTimeEx(countryid,0) > 0 or CountryIsFortuneTimeEx(countryid,1) > 0 then
		return 1
	end
  return 0
end
function x310501_IsLianMeng(varMap, varPlayer,camp)
local countryid
	if camp == 16 then countryid = 0
		elseif camp == 17 then countryid = 1 
		elseif camp == 18 then countryid = 2
		elseif camp == 19 then countryid = 3
	else
 		return 1
	end
	local varCountryID = GetCurCountry(varMap, varPlayer )
		if  IsLeague( varCountryID, countryid ) == 1 then
			return 1
		else
			return 0
		end
	return 1			
end
function x310501_IsMinGuo(varMap, varPlayer,camp)
local countryid
	if camp == 16 then countryid = 0
		elseif camp == 17 then countryid = 1 
		elseif camp == 18 then countryid = 2
		elseif camp == 19 then countryid = 3
	else
 		return 0
	end
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
	local MinGuo = GetCountryParam(varMap, countryid, CD_LASTWEEK_STRONG_WEAK_JIFEN)
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
