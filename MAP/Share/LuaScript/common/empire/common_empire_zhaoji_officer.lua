--皇帝召集令

x310271_var_FileId = 310271
x310271_var_TuchengzhanQuestID = 7559

x310271_var_AvaliableScene = { 50,		
							51,		
							58,    
							150,	
							151,	
							158,    
							250,	
							251,	
							258,    
							350,	
							351,	
							358,    
							76,		
							176,	
							276,	
							376,	
							86,		
							186,	
							286,	
							386,	
							2,		
							3,		
							4,		
							5,		
							6,		
							7,		
							8,		
							9,		
							10,     
							11,     
							13,		
							16,		
							17,		
							18,		
							19,		
							20,		
							21,		
							22,		
							23,		
							24,		
							25,		
							26,		
							27,		
							29,		
							30,		
							31,		
							33,		
							32,		
							34,		
							35,	
							44,
							45,
							46,
							47,
							48,
							49,
							465,
							466,
							467,
							468,
							469,
							470,
							472,
							477,
							520,
							521,
							522,
							}

x310271_var_DayLimited = 10

x310271_var_UseTime					=	{                       
											{min=0*60+0,  max=23*60+57},
										}

x310271_var_nValidMinute = 2   

x310271_var_CD_Date_Country = 0 --日期放在哪个国家的国家变量存储，以下类似
x310271_var_CD_Time_Country = 1
x310271_var_CD_Count_Country = 2
x310271_var_CD_Map_Country = 0
x310271_var_CD_PosX_Country = 1
x310271_var_CD_PosZ_Country = 2


function x310271_ProcEventEntry( varMap, varPlayer, varBagIdx )

end


function x310271_ProcIsSpellLikeScript( varMap, varPlayer)
		return 1; 
end


function x310271_ProcCancelImpacts( varMap, varPlayer )
		return 0; 
end

function x310271_ProcConditionCheck( varMap, varPlayer )
	
		if GetEmpirePosition(varMap, varPlayer) ~= EMPIRE_POSITION_EMPEROR  then
 				x310271_ShowTips(varMap, varPlayer, "只有皇帝才能使用皇帝召集令!");
				return 0
    end

		local minOfDay = GetMinOfDay()
		local weekIdx = GetWeek()

		if weekIdx == 6 and minOfDay >= 890 and minOfDay <= 900 and varMap == 44 then
				Msg2Player(varMap,varPlayer,"决战后花园期间，无法使用皇帝召集令",8 ,2)
				return 0
		end		
	
		if x310271_IsAvaliableScene(varMap) <= 0  then
    		x310271_ShowTips(varMap, varPlayer, "很抱歉，本地图无法使用");
				return 0
    end

		if x310271_CheckTime(varMap, varPlayer)<=0 then
				x310271_ShowTips(varMap, varPlayer, "很抱歉，现在时间不能用召集令");
				return 0
		end

		if x310271_GetDayCount(varMap, varPlayer)>= x310271_var_DayLimited then
				x310271_ShowTips(varMap, varPlayer, format("很抱歉，每天只能使用%d次皇帝召集令",x310271_var_DayLimited));
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


function x310271_IsAvaliableScene(varMap)
		
		for varI, item in x310271_var_AvaliableScene do
			if item == varMap then
				return 1
			end
		end
		return 0
		
end

function x310271_CheckTime(varMap, varPlayer)
	
		local hour,minute,sec =GetHourMinSec();
		local nowtime = hour*60+minute
		for varI, item in x310271_var_UseTime do
			if nowtime >= item.min and nowtime <= item.max then
				return 1;
			end
		end
		return 0;
	
end


function x310271_CheckIsInZhaoJi(varMap, varPlayer)
	
	local varToday = GetDayOfYear()
	local varLastday = GetCountryParam(varMap, x310271_var_CD_Date_Country, CD_EMPIRE_ZHAOJI_OFFICER_TIME)

	if varLastday == varToday then
		
			local lastMinute = GetCountryParam(varMap, x310271_var_CD_Time_Country, CD_EMPIRE_ZHAOJI_OFFICER_TIME)
	
			local hour,minute,sec =GetHourMinSec();
			local nowtime = hour*60+minute
	
			if (nowtime-lastMinute)>= x310271_var_nValidMinute then
						return 0
			else
						return 1
			end
	else
			return 0
	end
end

function x310271_CheckIsOffical(varMap, varPlayer)

	local pos = GetEmpirePosition( varMap, varPlayer )
	if pos == EMPIRE_POSITION_INVALID or pos == EMPIRE_POSITION_CIVILIAN then
			return 0
	end
	return 1
	
end

function x310271_CheckIsBangZhu(varMap, varPlayer)
	local pos = GetGuildOfficial(varMap, varPlayer)
	
	if pos ~= 5 then 
				return -1
	end
	return 1
end

function x310271_CheckCommonCondition(varMap, varPlayer)
	if IsPlayerStateNormal(varMap,varPlayer )<=0 then
		return 0
	end

	if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_MENTALGAME )>0 then
		x310271_ShowTips(varMap, varPlayer, "处于答题状态，不能回应召集");
		return 0
	end

	if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_STALL )>0 then
		x310271_ShowTips(varMap, varPlayer, "处于设摊状态，不能回应召集");
		return 0
	end

	if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_DIE )>0 then
		x310271_ShowTips(varMap, varPlayer, "处于死亡状态，不能回应召集");
		return 0
	end

	if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_CRASHBOX )>0 then
		x310271_ShowTips(varMap, varPlayer, "处于运镖状态，不能回应召集");
		return 0
	end

	if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_BUS )>0 then
		x310271_ShowTips(varMap, varPlayer, "处于BUS状态，不能回应召集");
		return 0
	end

	if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_ENJAIL )>0 then
		x310271_ShowTips(varMap, varPlayer, "处于监禁状态，不能回应召集");
		return 0
	end

	if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_WEDDING )>0 then
		x310271_ShowTips(varMap, varPlayer, "处于婚礼状态，不能回应召集");
		return 0
	end

	if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_TONGQUBUFF )>0 then
		x310271_ShowTips(varMap, varPlayer, "处于童趣状态，不能回应召集");
		return 0
	end

	if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_TIESAN )>0 then
		x310271_ShowTips(varMap, varPlayer, "处于铁人三项状态，不能回应召集");
		return 0
	end

    if IsHaveSpecificImpact( varMap, varPlayer, 7629) == 1 then
        Msg2Player( varMap, varPlayer, "您有战车加护效果，不能进行此操作", 8, 3)
        Msg2Player( varMap, varPlayer, "您有战车加护效果，不能进行此操作", 8, 2)
        return 0
    end

	return 1
end

function x310271_GetTargetScene(varMap, varPlayer)
	
	local targetScene = GetCountryParam( varMap, x310271_var_CD_Map_Country, CD_EMPIRE_ZHAOJI_OFFICER_POS)
	local posX = GetCountryParam(varMap, x310271_var_CD_PosX_Country, CD_EMPIRE_ZHAOJI_OFFICER_POS)
	local posZ = GetCountryParam(varMap, x310271_var_CD_PosZ_Country, CD_EMPIRE_ZHAOJI_OFFICER_POS)

	return targetScene,posX,posZ
	
end


function x310271_CheckSceneLevel( varMap, varPlayer,targetScene )
	
	local nLevel = GetLevel(varMap, varPlayer)
	if nLevel<40 then
		x310271_ShowTips(varMap, varPlayer, "等级不足，不能传送到皇帝所在场景");
		return 0
	end

	return 1
	
end

function x310271_CheckAgreeZhaoJi(varMap, varPlayer)
	
		if x310271_CheckCommonCondition(varMap, varPlayer)<=0 then
			return 0
		end
	
		if x310271_CheckIsOffical(varMap, varPlayer)<=0 then
				x310271_ShowTips(varMap, varPlayer, "只有帝国的官员才能响应召集");
				return 0
		end
		
		if x310271_CheckIsInZhaoJi(varMap, varPlayer)<=0 then
				x310271_ShowTips(varMap, varPlayer, "有效时间已过，不能回应召集");
				return 0
		end
	
		if x310271_IsAvaliableScene(varMap) <= 0  then
	  	x310271_ShowTips(varMap, varPlayer, "你所在的场景不能回应召集");
			return 0
	  end
	
		return 1
		
end



function x310271_ProcDeplete( varMap, varPlayer )
		return 1;
end








function x310271_ProcActivateOnce( varMap, varPlayer, varImpact )

		local camp = GetSceneCamp(varMap)
		local minute = GetMinOfDay()	
		local weekIdx = GetWeek()       
		  
		if minute >= 900 and minute < 1020 then
			if x310271_IsRuoGuo(varMap, varPlayer,camp) == 1 then
				if x310271_IsBenGuo(varMap, varPlayer,camp) == 0 then
					--if x310271_IsGuoYun(varMap, varPlayer,camp) == 1 then
						if x310271_IsLianMeng(varMap, varPlayer,camp) == 0 then
							if weekIdx == 6 then
								if IsHaveQuestNM(varMap, varPlayer, x310271_var_TuchengzhanQuestID ) <= 0 then
									Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，没有屠城战任务且不为联盟的异国玩家无法在弱国使用召集令！",8,2)
									Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，没有屠城战任务且不为联盟的异国玩家无法在弱国使用召集令！",8,3)		
									return				
								end
							else				
									Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，不为联盟的异国玩家无法在弱国使用召集令！",8 ,2)
									Msg2Player(varMap,varPlayer,"15：00到17：00为弱国保护时间，不为联盟的异国玩家无法在弱国使用召集令！",8 ,3)
									return
								end
							--end
							end
					end
			end	
		end
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			
				local hour,minute,sec =GetHourMinSec();
				local nowtime = hour*60+minute
				SetCountryParam( varMap, x310271_var_CD_Time_Country, CD_EMPIRE_ZHAOJI_OFFICER_TIME, nowtime )
				
				local posX,posZ = GetWorldPos( varMap,varPlayer )
				SetCountryParam( varMap, x310271_var_CD_Map_Country, CD_EMPIRE_ZHAOJI_OFFICER_POS, varMap)
				SetCountryParam( varMap, x310271_var_CD_PosX_Country, CD_EMPIRE_ZHAOJI_OFFICER_POS, posX )
				SetCountryParam( varMap, x310271_var_CD_PosZ_Country, CD_EMPIRE_ZHAOJI_OFFICER_POS, posZ )
		
				EmpireZhaoji( varMap, varPlayer, 0 );
				
				x310271_SetDayCount( varMap, varPlayer );
		
				x310271_ShowTips(varMap, varPlayer, "皇帝召集令已发送");
				local varMsg = format("x310271_ProcActivateOnce 开始皇帝召集, guid=%X, varName=%s, varMap=%d, posX=%d, posZ=%d",GetPlayerGUID( varMap,varPlayer ), GetName(varMap,varPlayer ),varMap,posX,posZ )
				WriteLog(1,varMsg)
				
		end
		
end	







function x310271_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x310271_ShowTips(varMap, varPlayer, varStr)
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
end




function x310271_GetDayCount(varMap, varPlayer)
	
		local varToday = GetDayOfYear()
		local varLastday = GetCountryParam(varMap, x310271_var_CD_Date_Country, CD_EMPIRE_ZHAOJI_OFFICER_TIME)
		
		if varLastday ~= varToday then
				return 0
		end
	
		local varDaycount = GetCountryParam(varMap, x310271_var_CD_Count_Country, CD_EMPIRE_ZHAOJI_OFFICER_TIME)
		return varDaycount;
		
end




function x310271_SetDayCount(varMap, varPlayer)

		local varToday = GetDayOfYear()
		local varLastday = GetCountryParam( varMap, x310271_var_CD_Date_Country, CD_EMPIRE_ZHAOJI_OFFICER_TIME )
	
		if varLastday ~= varToday then
				SetCountryParam(varMap, x310271_var_CD_Date_Country, CD_EMPIRE_ZHAOJI_OFFICER_TIME, varToday )
				SetCountryParam(varMap, x310271_var_CD_Count_Country, CD_EMPIRE_ZHAOJI_OFFICER_TIME, 1 )
		else
				local varDaycount = GetCountryParam(varMap, x310271_var_CD_Count_Country, CD_EMPIRE_ZHAOJI_OFFICER_TIME)
				SetCountryParam( varMap, x310271_var_CD_Count_Country, CD_EMPIRE_ZHAOJI_OFFICER_TIME, varDaycount+1)
		end
		
end


function x310271_ProcAgreeZhaoJi(varMap, varPlayer, varType )
		
		if x310271_CheckAgreeZhaoJi(varMap, varPlayer)<=0 then
			return
		end
		
		local targetScene,posX,posZ = x310271_GetTargetScene(varMap, varPlayer)
	
		if x310271_CheckSceneLevel(varMap, varPlayer,targetScene)<=0 then
			return
		end
	
		posX = posX + random(-5,5)
		posZ = posZ + random(-5,5)
		
		if varMap == targetScene then
				SetPos( varMap, varPlayer,posX, posZ )
		else
				if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,Map_ID) == 0 then
					return
				end
				NewWorld(varMap, varPlayer, targetScene, posX, posZ, x310271_var_FileId);
		end
		
		x310271_ShowTips(varMap, varPlayer, "您回应了皇帝召集令");
		local varMsg = format("x310271_ProcAgreeZhaoJi ok, guid=%X, varName=%s, varMap=%d, targetScene=%d, posX=%d, posZ=%d.",GetPlayerGUID( varMap,varPlayer ), GetName(varMap,varPlayer ),varMap,targetScene,posX,posZ )
		WriteLog(1,varMsg)

end



function x310271_IsRuoGuo(varMap, varPlayer,camp)
	  
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
					if x310271_IsMinGuo(varMap, varPlayer,camp) == 1 then
		 	 			return 1
		 	 		end
				end
		end
		return 0
		
end




function x310271_IsBenGuo(varMap, varPlayer,camp)
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
function x310271_IsGuoYun(varMap, varPlayer,camp)
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
function x310271_IsLianMeng(varMap, varPlayer,camp)
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
function x310271_IsMinGuo(varMap, varPlayer,camp)
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
