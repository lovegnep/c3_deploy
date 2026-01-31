


x300818_var_FileId 		= 300818 

x300818_var_ItemID		= 12030015

x300818_var_LevelMin		= 20
x300818_var_TuchengzhanQuestID = 7559


x300818_var_SceneList 	= { 50,		
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
							567,
							568,
							569,
							570,
							571
							}

x300818_var_lingdicheck 	= {							
							  { varMap= 6,	time1 = 960,time2 = 1020,x1 = 28,x2 = 107,z1 =41,z2 =123},	
							  { varMap= 9,	time1 = 960,time2 = 1020,x1 = 132,x2 = 187,z1 =15,z2 =97},	
							  { varMap= 13,time1 = 960,time2 = 1020,x1 = 31,x2 = 126,z1 =165,z2 =236},   
							  { varMap= 18,time1 = 960,time2 = 1020,x1 = 180,x2 = 210,z1 =28,z2 =60},  	
							  { varMap= 21,time1 = 960,time2 = 1020,x1 = 130,x2 = 288,z1 =70,z2 =191},	
							  { varMap= 24,time1 = 960,time2 = 1020,x1 = 84,x2 = 174,z1 =55,z2 =136},	
							}



function x300818_ProcEventEntry( varMap, varPlayer, varBagIdx )
end

function x300818_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end


function x300818_ProcReturn1(varMap, varPlayer,QuestData,varQuest,varTalknpc)
	
	if QuestData >=34 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，每小时只能使用35次帮会召集令。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，每小时只能使用35次帮会召集令。",8,2)			
		return
	end
	if HaveItem(varMap, varPlayer,x300818_var_ItemID)>0 then
			if DelItem(varMap, varPlayer,x300818_var_ItemID,1) ~= 1 then return 0 end
		else
			return	
		end
	local posX,posZ = GetWorldPos(varMap, varPlayer)
	SendGuildConvokeMsg(varMap, varPlayer,posX,posZ)
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您已顺利使用帮会召集令")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"您已顺利使用帮会召集令",8,2)	
	local guildid = GetGuildID(varMap, varPlayer)
	SetGuildQuestData(varMap,guildid,GD_GUILD_INDEX_CONVOKE_COUNT,1,1)
end
	
	
	
function x300818_ProcActivateOnce( varMap, varPlayer )
local camp = GetSceneCamp(varMap)
local minute = GetMinOfDay()	   
local weekIdx = GetWeek()
      
if minute >= 900 and minute < 1020 then
	if x300818_IsRuoGuo(varMap, varPlayer,camp) == 1 then
		if x300818_IsBenGuo(varMap, varPlayer,camp) == 0 then
	--	if x300818_IsGuoYun(varMap, varPlayer,camp) == 1 then
				if x300818_IsLianMeng(varMap, varPlayer,camp) == 0 then
					if weekIdx == 6 then
						if IsHaveQuestNM(varMap, varPlayer, x300818_var_TuchengzhanQuestID ) <= 0 then
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
	--		end
		end
	end
end	
  
	
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	if weekIdx == 6 and minOfDay >= 890 and minOfDay <= 900 and varMap == 44 then
			Msg2Player(varMap,varPlayer,"决战后花园期间，无法使用帮会召集令",8 ,2)
			Msg2Player(varMap,varPlayer,"决战后花园期间，无法使用帮会召集令",8 ,3)
			return
	end	
	

	
	
	
	
	local offcial = GetGuildOfficial(varMap, varPlayer)
	if offcial~=5 and offcial~=4 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您当前不是帮主或副帮主无法使用帮会召集令。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，您当前不是帮主或副帮主无法使用帮会召集令。",8,2)		
		return		
	end
	
	

		if x300818_checkscene(varMap, varPlayer) == 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，您当前所在地图无法使用帮会召集令。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，您当前所在地图无法使用帮会召集令。",8,2)		
			return		
		end

	
	if  GetWeek() == 6 then
		if x300818_lingdicheck(varMap, varPlayer) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，在领地争夺战期间，您无法在领地图腾附近使用帮会召集令。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，在领地争夺战期间，您无法在领地图腾附近使用帮会召集令。",8,2)		
			return		
		end	
	end
	
	if  GetWeek() == 6 then
		if x300818_kaiserbattlecheck(varMap, varPlayer) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，在皇帝战期间，您无法在沙城相关地图使用帮会召集令。")
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，在皇帝战期间，您无法在沙城相关地图使用帮会召集令。",8,2)		
			return		
		end	
	end	
	
	if x300818_checkposition(varMap, varPlayer) == 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您所在位置的可用传送点太少，请重新选择位置发布召集令。")
		DeliverTalkTips(varMap, varPlayer)
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，您所在位置的可用传送点太少，请重新选择位置发布召集令。",8,2)		
		return
	end
	
	if IsHaveSpecificImpact( varMap, varPlayer, 7629) == 1 then
		CancelSpecificImpact( varMap, varPlayer, 7629)	
	end
	
	GetGuildQuestData(varMap, varPlayer, GD_GUILD_INDEX_CONVOKE_COUNT, x300818_var_FileId, -1, "ProcReturn1", -1 )
end






function x300818_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300818_ProcConditionCheck( varMap, varPlayer )
	return 1; 
end







function x300818_ProcDeplete( varMap, varPlayer )
	return 1;
end







function x300818_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end


function x300818_checkposition( varMap, varPlayer)
	
	local posX,posZ = GetWorldPos(varMap, varPlayer)
	local selfposX = floor(posX)
	local selfposZ = floor(posZ)
	
	if IsPosCanGo(varMap,selfposX,selfposZ)==0 then
		return 0
	end
	
	return 1
end


function x300818_checkscene( varMap, varPlayer )
	
	local varRet = 0
	for varI,item in x300818_var_SceneList do
		if varMap == item then
			varRet = 1
			break
		end
	end
	
	return varRet
	
end


function x300818_lingdicheck( varMap, varPlayer )
	local varRet = 0
    local minute = GetMinOfDay()
	local posX,posZ = GetWorldPos(varMap, varPlayer)
	for varI,itm in x300818_var_lingdicheck do
		if varMap == itm.varMap and minute >=itm.time1 and minute <= itm.time2 and posX >=itm.x1 and posX <=itm.x2 and posZ >=itm.z1 and posZ <=itm.z2 then
			varRet = 1
			break
		end
	end
	return varRet
end	


function x300818_kaiserbattlecheck( varMap, varPlayer )
	local varRet = 0
	local minute = GetMinOfDay()
	local maplist ={472,550, 551, 552, 553, 554, 555, 556, 557, 558, 559, 560, 561, 562, 563, 565, 566} 
	if minute >=1200 and minute < 1260 then
		for itm, item in maplist do
			if item ==varMap then
				local isBattleStarted = LuaCallNoclosure(310122, "IsBattleStarted", varMap)
				if isBattleStarted == 1 then
					varRet =1
				end
			end	
		end	
	end
	return varRet
end



function x300818_CheckEnable( varMap, varPlayer)
    if IsHaveSpecificImpact( varMap, varPlayer, 7629) == 1 then
        Msg2Player( varMap, varPlayer, "您有战车加护效果，不能进行此操作", 8, 3)
        Msg2Player( varMap, varPlayer, "您有战车加护效果，不能进行此操作", 8, 2)
        return 0
    end

    return 1
end
function x300818_IsRuoGuo(varMap, varPlayer,camp)
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
				if x300818_IsMinGuo(varMap, varPlayer,camp) == 1 then
	 	 			return 1
	 	 		end
			end
	end
	return 0
end
function x300818_IsBenGuo(varMap, varPlayer,camp)
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
function x300818_IsGuoYun(varMap, varPlayer,camp)
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
function x300818_IsLianMeng(varMap, varPlayer,camp)
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
function x300818_IsMinGuo(varMap, varPlayer,camp)
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


