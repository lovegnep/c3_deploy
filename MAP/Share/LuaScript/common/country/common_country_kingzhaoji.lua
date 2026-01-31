





x300808_var_FileId = 300808
x300808_var_TuchengzhanQuestID = 7559



x300808_var_AvaliableScene = {50,150,250,350,
51,151,251,351,
58,158,258,358,
86,186,286,386,
0,3,44,45,46,47,48,49,465,466,467,468,469,472,567,568,569,570,571
}

x300808_var_DayLimited = 5

x300808_var_UseTime					=	{                       
											{min=0*60+0,  max=23*60+57},
										}

x300808_var_nValidMinute = 2   






function x300808_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x300808_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300808_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300808_ProcConditionCheck( varMap, varPlayer )
	
	
	
    if IsKing(varMap, varPlayer) <= 0  then
    	
		x300808_ShowTips(varMap, varPlayer, "只有国王才能使用国王召集令!");
		
		return 0
    end

	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()

	if weekIdx == 6 and minOfDay >= 890 and minOfDay <= 900 and varMap == 44 then
			Msg2Player(varMap,varPlayer,"决战后花园期间，无法使用国王召集令",8 ,2)
			return 0
	end		
	

	
	
	
	if x300808_IsAvaliableScene(varMap) <= 0  then
    	
		x300808_ShowTips(varMap, varPlayer, "很抱歉，本地图无法使用");
		
		return 0
    end

	if x300808_CheckTime(varMap, varPlayer)<=0 then
		x300808_ShowTips(varMap, varPlayer, "很抱歉，现在时间不能用召集令");
		
		return 0
	end

	if x300808_GetDayCount(varMap, varPlayer)>= x300808_var_DayLimited then
		x300808_ShowTips(varMap, varPlayer, format("很抱歉，每天只能使用%d次国王召集令",x300808_var_DayLimited));
		
		return 0
	end
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	if IsHaveSpecificImpact( varMap, varPlayer, 7629) == 1 then
		CancelSpecificImpact( varMap, varPlayer, 7629)	
	end
	return 1; 
end


function x300808_IsAvaliableScene(varMap)
	for varI, item in x300808_var_AvaliableScene do
		if item == varMap then
			return 1
		end
	end

	return 0
end

function x300808_CheckTime(varMap, varPlayer)
	

	local hour,minute,sec =GetHourMinSec();

	local nowtime = hour*60+minute
	

	
	for varI, item in x300808_var_UseTime do
		if nowtime >= item.min and nowtime <= item.max then
			
			
			return 1;
			
		end
	end

	return 0;
end


function x300808_CheckIsInZhaoJi(varMap, varPlayer)
	local varCountry = GetCurCountry(varMap, varPlayer)
	local varToday = GetDayOfYear()

	local varLastday = GetCountryParam(varMap, varCountry, CD_INDEX_ZHAOJILIN_DATE)

	if varLastday == varToday then
		
		local lastMinute = GetCountryParam(varMap, varCountry, CD_INDEX_ZHAOJILIN_TIME)

		local hour,minute,sec =GetHourMinSec();
		local nowtime = hour*60+minute

		if (nowtime-lastMinute)>= x300808_var_nValidMinute then
			return 0
		else
			return 1
		end

	else
		return 0
	end
end

function x300808_CheckIsOffical(varMap, varPlayer)
	local officalIdList = {2,3,4,5,6,7}

	for varI,officalId in officalIdList do
		if IsSpecialCountryOffical(varMap, varPlayer,officalId)>0 then
			return 1
		end
	end

	return 0
end

function x300808_CheckIsBangZhu(varMap, varPlayer)
	local pos = GetGuildOfficial(varMap, varPlayer)
	
	if pos ~= 5 then 
				return -1
	end
	return 1
end

function x300808_CheckCommonCondition(varMap, varPlayer)
	if IsPlayerStateNormal(varMap,varPlayer )<=0 then
		return 0
	end

	if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_MENTALGAME )>0 then
		x300808_ShowTips(varMap, varPlayer, "处于答题状态，不能回应召集");
		return 0
	end

	if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_STALL )>0 then
		x300808_ShowTips(varMap, varPlayer, "处于设摊状态，不能回应召集");
		return 0
	end

	if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_DIE )>0 then
		x300808_ShowTips(varMap, varPlayer, "处于死亡状态，不能回应召集");
		return 0
	end

	if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_CRASHBOX )>0 then
		x300808_ShowTips(varMap, varPlayer, "处于运镖状态，不能回应召集");
		return 0
	end

	if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_BUS )>0 then
		x300808_ShowTips(varMap, varPlayer, "处于BUS状态，不能回应召集");
		return 0
	end

	if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_ENJAIL )>0 then
		x300808_ShowTips(varMap, varPlayer, "处于监禁状态，不能回应召集");
		return 0
	end

	if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_WEDDING )>0 then
		x300808_ShowTips(varMap, varPlayer, "处于婚礼状态，不能回应召集");
		return 0
	end

	if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_TONGQUBUFF )>0 then
		x300808_ShowTips(varMap, varPlayer, "处于童趣状态，不能回应召集");
		return 0
	end

	if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_TIESAN )>0 then
		x300808_ShowTips(varMap, varPlayer, "处于铁人三项状态，不能回应召集");
		return 0
	end
	
	if IsHaveSpecificImpact( varMap, varPlayer, 32584) == 1 then
		Msg2Player(varMap,varPlayer,"很抱歉，那达慕赛马大赛中无法回应召集",8,2)
		Msg2Player(varMap,varPlayer,"很抱歉，那达慕赛马大赛中无法回应召集",8,3)
		return 0
	end


    if IsHaveSpecificImpact( varMap, varPlayer, 7629) == 1 then
        Msg2Player( varMap, varPlayer, "您有战车加护效果，不能进行此操作", 8, 3)
        Msg2Player( varMap, varPlayer, "您有战车加护效果，不能进行此操作", 8, 2)
        return 0
    end

	return 1
end

function x300808_GetTargetScene(varMap, varPlayer)
	local varCountry = GetCurCountry(varMap, varPlayer)
	local targetScene = GetCountryParam(varMap, varCountry, CD_ZHAOJILIN_SCENE)

	local varX = GetCountryParam(varMap, varCountry, CD_ZHAOJILIN_POS_X)
	local z = GetCountryParam(varMap, varCountry, CD_ZHAOJILIN_POS_Z)

	return targetScene,varX,z
end


function x300808_CheckSceneLevel(varMap, varPlayer,targetScene)
	local nLevel = GetLevel(varMap, varPlayer)
	if nLevel<40 then
		x300808_ShowTips(varMap, varPlayer, "等级不足，不能传送到国王所在场景");
		return 0
	end

	return 1
end

function x300808_CheckAgreeZhaoJi(varMap, varPlayer)
	
	if x300808_CheckCommonCondition(varMap, varPlayer)<=0 then
		return 0
	end

	if x300808_CheckIsOffical(varMap, varPlayer)<=0 and x300808_CheckIsBangZhu(varMap, varPlayer) <= 0 then
		x300808_ShowTips(varMap, varPlayer, "只有国家官员或者本国的帮主才能回应召集");
		
		return 0
	end
	
	if x300808_CheckIsInZhaoJi(varMap, varPlayer)<=0 then
		x300808_ShowTips(varMap, varPlayer, "有效时间已过，不能回应召集");
		
		return 0
	end

	

	if x300808_IsAvaliableScene(varMap) <= 0  then
    	
		x300808_ShowTips(varMap, varPlayer, "你所在的场景不能回应召集");
		
		return 0
    end

	return 1
end










function x300808_ProcDeplete( varMap, varPlayer )
	return 1;
end








function x300808_ProcActivateOnce( varMap, varPlayer, varImpact )
local camp = GetSceneCamp(varMap)
local minute = GetMinOfDay()
local weekIdx = GetWeek()
	         
if minute >= 900 and minute < 1020 then
	if x300808_IsRuoGuo(varMap, varPlayer,camp) == 1 then
		if x300808_IsBenGuo(varMap, varPlayer,camp) == 0 then
			--if x300808_IsGuoYun(varMap, varPlayer,camp) == 1 then
				if x300808_IsLianMeng(varMap, varPlayer,camp) == 0 then
					if weekIdx == 6 then
						if IsHaveQuestNM(varMap, varPlayer, x300808_var_TuchengzhanQuestID ) <= 0 then
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

	if x300808_kaiserbattlecheck( varMap, varPlayer ) == 1 then
		Msg2Player(varMap,varPlayer,"很抱歉，在皇帝战期间，您无法在沙城附近使用国王召集令。",8,2)
		Msg2Player(varMap,varPlayer,"很抱歉，在皇帝战期间，您无法在沙城附近使用国王召集令。",8,3)		
		return		
	end
	
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		
		
		local varCountry = GetCurCountry(varMap, varPlayer)
		
		local hour,minute,sec =GetHourMinSec();
		local nowtime = hour*60+minute
		SetCountryParam(varMap, varCountry, CD_INDEX_ZHAOJILIN_TIME, nowtime)
		
		
		local varX,z =GetWorldPos(varMap,varPlayer)
		SetCountryParam(varMap, varCountry, CD_ZHAOJILIN_SCENE, varMap)
		SetCountryParam(varMap, varCountry, CD_ZHAOJILIN_POS_X, varX)
		SetCountryParam(varMap, varCountry, CD_ZHAOJILIN_POS_Z, z)

		CountryZhaoJi(varMap, varPlayer)
		x300808_SetDayCount(varMap, varPlayer);

		x300808_ShowTips(varMap, varPlayer, "国王召集令已发送");
		local varMsg = format("x300808_ProcActivateOnce 开始国王召集, guid=%X, varName=%s, varMap=%d, varX=%d, z=%d, varCountry=%d",GetPlayerGUID( varMap,varPlayer ), GetName(varMap,varPlayer ),varMap,varX,z,varCountry)

		WriteLog(1,varMsg)
	end
end	







function x300808_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x300808_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end




function x300808_GetDayCount(varMap, varPlayer)
	local varCountry = GetCurCountry(varMap, varPlayer)

	local varToday = GetDayOfYear()
	local varLastday = GetCountryParam(varMap, varCountry, CD_INDEX_ZHAOJILIN_DATE)
	
	
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount = GetCountryParam(varMap, varCountry, CD_INDEX_ZHAOJILIN_DAYCOUNT)
	return varDaycount;
end




function x300808_SetDayCount(varMap, varPlayer)
	local varCountry = GetCurCountry(varMap, varPlayer)

	local varToday = GetDayOfYear()

	local varLastday = GetCountryParam(varMap, varCountry, CD_INDEX_ZHAOJILIN_DATE)

	if varLastday ~= varToday then
		SetCountryParam(varMap, varCountry, CD_INDEX_ZHAOJILIN_DATE, varToday)
		SetCountryParam(varMap, varCountry, CD_INDEX_ZHAOJILIN_DAYCOUNT, 1)
	else
		local varDaycount = GetCountryParam(varMap, varCountry, CD_INDEX_ZHAOJILIN_DAYCOUNT)
		SetCountryParam(varMap, varCountry, CD_INDEX_ZHAOJILIN_DAYCOUNT, varDaycount+1)
	end
end


function x300808_ProcAgreeZhaoJi(varMap, varPlayer)
	if x300808_CheckAgreeZhaoJi(varMap, varPlayer)<=0 then
		return
	end
	
	local targetScene,varX,z = x300808_GetTargetScene(varMap, varPlayer)

	if x300808_CheckSceneLevel(varMap, varPlayer,targetScene)<=0 then
		return
	end

	varX = varX+random(-5,5)

	z = z+random(-5,5)
	
	if varMap == targetScene then
		SetPos( varMap, varPlayer,varX,z)
	else
		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,Map_ID) == 0 then
			return
		end
		NewWorld(varMap, varPlayer, targetScene, varX, z, x300808_var_FileId);
	end
	
	x300808_ShowTips(varMap, varPlayer, "您回应了国王召集令");

	local varCountry = GetCurCountry(varMap, varPlayer)
	local varMsg = format("x300808_ProcAgreeZhaoJi ok, guid=%X, varName=%s, varMap=%d, targetScene=%d, varX=%d, z=%d, varCountry=%d",GetPlayerGUID( varMap,varPlayer ), GetName(varMap,varPlayer ),varMap,targetScene,varX,z,varCountry)

	WriteLog(1,varMsg)

end
function x300808_IsRuoGuo(varMap, varPlayer,camp)
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
				if x300808_IsMinGuo(varMap, varPlayer,camp) == 1 then
	 	 			return 1
	 	 		end
			end
	end
	return 0
end
function x300808_IsBenGuo(varMap, varPlayer,camp)
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
function x300808_IsGuoYun(varMap, varPlayer,camp)
local countryid 
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
function x300808_IsLianMeng(varMap, varPlayer,camp)
local countryid
	if camp == 16 then countryid = 0
		elseif camp == 17 then countryid = 1 
		elseif camp == 18 then countryid = 2
		elseif camp == 19 then countryid = 3
	else
 		return 1
	end
	local varCountryID = GetCurCountry(varMap, varPlayer )
	    if  IsLeague( varCountryID,countryid ) == 1 then
			return 1
		else
			return 0
		end
	return 1			
end
function x300808_IsMinGuo(varMap, varPlayer,camp)
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

function x300808_kaiserbattlecheck( varMap, varPlayer )
	local varRet = 0
	local minute = GetMinOfDay()
	local maplist ={472,550, 551, 552, 553, 554, 555, 556, 557, 558, 559, 560, 561, 562, 563,564, 565, 566} 
	if minute >=1200 and minute < 1260 then
		for itm, item in maplist do
			if item ==varMap then
					varRet =1
			end	
		end	
	end
	return varRet
end
