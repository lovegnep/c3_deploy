

x310033_var_FileId = 310033


x310033_var_QuestName="圣山地宫传入1"



x310033_var_MaxHuman = 100
x310033_var_MaxHumanOther = 200

x310033_var_BuffId = 7040
x310033_var_ItemId = 12030027
x310033_var_SceneId = { 50, 150, 250, 350 }

function x310033_IsOpenedTime()
	local minute = GetMinOfDay();
	if (minute >=2*60 and minute<=2*60+4) or ( minute>=6*60 and minute<=6*60+4 ) or (minute>=10*60 and minute<=10*60+4) or 
		(minute >=14*60 and minute<=14*60+4) or (minute >=18*60 and minute<=18*60+4) or (minute >=22*60 and minute<=22*60+4) then
		return 1
	end

	return -1

end

function x310033_HaveAccepted(varMap, varPlayer)
	
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_DAY[1], MD_YAOXIE_DIGONG_DAY[2], MD_YAOXIE_DIGONG_DAY[3])
	if varLastday == GetDayOfYear() then
		return 1
	end
	return -1
end

function x310033_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if GetLevel(varMap, varPlayer) < 50 then
		return
	end
    TalkAppendButton(varMap,x310033_var_FileId,"圣山地宫(50级)",14,-1)
     
end


function x310033_ProcEventEntry( varMap, varPlayer, varTalknpc,idScript,idExt )
	
		StartTalkTask(varMap)
		  local Readme_1 = "#y【圣山地宫】#r"
		  local Readme_2 = "#w\t每天的#g02:00#w，#g06:00#w，#g10:00#w，#g14:00#w，#g18:00#w和#g22:00#w，圣山地宫的入口会打开#r5分钟#w，如果你拥有#g混沌之星#w，那么在圣山地宫开放的任意时间里都可以进入。"
		  local Readme_3 = "#W\n\t在那时，我可以给持有#G五耀之证#W或者#G混沌之星#W的勇士们加持#G五耀之力#W，这样他们就有了足够的能力铲除妖魔。然而，五耀之力是一种非常霸道的力量，普通人的身体#R一周#W只能加持#R七次#W，而且#R每天#W不能超过#R三次#W。"
		  local Readme_4 = "#W\n\t同时，聚集过多的五耀之力可能会造成不可预知的问题，因此圣山地宫中最多只能有#R一百人#W同时进行战斗。但是如果你拥有#G混沌之星#W，就可以大大减少五耀之力的散发，这样圣山地宫将可以有#R两百人#W同时进行战斗。"
		  local varReadme = Readme_1..Readme_2..Readme_3
			TalkAppendString(varMap,varReadme)
			StopTalkTask(varMap)	
		DeliverTalkInfo(varMap,varPlayer,varTalknpc,x310033_var_FileId,-1)

	return 

end




function x310033_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end

function x310033_IsGameTime()
	local minute = GetMinOfDay();
	if (minute >=2*60 and minute<=2*60+19) or ( minute>=6*60 and minute<=6*60+19 ) or (minute>=10*60 and minute<=10*60+19) or 
		(minute >=14*60 and minute<=14*60+19) or (minute >=18*60 and minute<=18*60+19) or (minute >=22*60 and minute<=22*60+19) then
		return 1
	end
	return -1
end




function x310033_ProcAccept( varMap, varPlayer )


	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_DAY[1], MD_YAOXIE_DIGONG_DAY[2], MD_YAOXIE_DIGONG_DAY[3])
	local varLastweek = GetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_WEEKDAY[1], MD_YAOXIE_DIGONG_WEEKDAY[2], MD_YAOXIE_DIGONG_WEEKDAY[3])



	--换天清零	
	if varLastday ~= GetDayOfYear() then
		x310033_SetMD( varMap, varPlayer, MD_YAOXIE_DIGONG_DAYCOUNT, 0)	
	end

	--换周清零
	if varLastweek ~= GetWeekIndex() then
		x310033_SetMD( varMap, varPlayer, MD_YAOXIE_DIGONG_WEEKCOUNT, 0)	
	end

	--获取每日和每周完成次数
	local daycount = x310033_GetMD( varMap, varPlayer, MD_YAOXIE_DIGONG_DAYCOUNT)
	local weekcount = x310033_GetMD( varMap, varPlayer, MD_YAOXIE_DIGONG_WEEKCOUNT)	

	
--	Msg2Player(varMap,varPlayer,"daycount="..daycount,8,2)
--	Msg2Player(varMap,varPlayer,"weekcount="..weekcount,8,2)
--	Msg2Player(varMap,varPlayer,"varLastday="..varLastday,8,2)	
--	Msg2Player(varMap,varPlayer,"GetDayOfYear="..GetDayOfYear(),8,2)
		
	if GetLevel( varMap, varPlayer ) < 50 then
	
		Msg2Player(varMap,varPlayer,"等级不够，无法进入",8,3)		
		Msg2Player(varMap,varPlayer,"等级不够，无法进入",8,2)
		return
	end

	if x310033_IsGameTime() < 0 then
			Msg2Player(varMap,varPlayer,"不是在活动时间内",8,3)		
			Msg2Player(varMap,varPlayer,"不是在活动时间内",8,2)
			return
	end
	
	local bHave = 0
	if GetItemCount(varMap, varPlayer, 11990100)  > 0 then
		bHave = 1
	end

	if bHave == 0 then
		if x310033_IsOpenedTime() < 0 then
			Msg2Player(varMap,varPlayer,"不是在活动时间内，但拥有混沌之星，也可进入",8,3)		
			Msg2Player(varMap,varPlayer,"不是在活动时间内，但拥有混沌之星，也可进入",8,2)
			return
		end
	else
		if x310033_IsGameTime() < 0 then
			Msg2Player(varMap,varPlayer,"不是在活动时间内",8,3)		
			Msg2Player(varMap,varPlayer,"不是在活动时间内",8,2)
			return
		end
	end

--	if x310033_HaveAccepted(varMap, varPlayer) > 0 then
--		
--		Msg2Player(varMap,varPlayer,"一天只能进入一次圣山地宫",8,3)		
--		Msg2Player(varMap,varPlayer,"一天只能进入一次圣山地宫",8,2)
--		return 
--	end


	if weekcount >= 7 then
		Msg2Player(varMap,varPlayer,"很抱歉，您本周已经进过7次圣山地宫了",8,3)		
		Msg2Player(varMap,varPlayer,"很抱歉，您本周已经进过7次圣山地宫了",8,2)
		return		
	end
	
	if daycount >= 3 then
		Msg2Player(varMap,varPlayer,"很抱歉，您今天已经进过3次圣山地宫了",8,3)		
		Msg2Player(varMap,varPlayer,"很抱歉，您今天已经进过3次圣山地宫了",8,2)
		return		
	end	

	if bHave == 0 then
		if GetItemCount(varMap, varPlayer, x310033_var_ItemId)  == 0 then
			Msg2Player(varMap,varPlayer,"你没有五耀之证，但拥有混沌之星，也可以进入",8,3)		
			Msg2Player(varMap,varPlayer,"你没有五耀之证，但拥有混沌之星，也可以进入",8,2)
			return
		end
	end
	

	if IsBusMember(varMap, varPlayer) > 0 then
		Msg2Player(varMap,varPlayer,"护送状态，无法进入",8,3)		
		Msg2Player(varMap,varPlayer,"护送状态，无法进入",8,2)
		return
	end

	local countryId = GetCurCountry(varMap, varPlayer)
	
	local curNum = 0
	if countryId == 0 then
		curNum = YX_LOULAN_HUMAN_NUM1 
	elseif countryId == 1 then
		curNum = YX_LAIYIN_HUMAN_NUM1 
	elseif countryId == 2 then
		curNum = YX_KUNLUN_HUMAN_NUM1 
	elseif countryId == 3 then
		curNum = YX_DUNHUANG_HUMAN_NUM1 
	end
	local sign = 0;
	
	
		if x310033_IsOpenedTime() > 0 then
			if GetItemCount(varMap, varPlayer, x310033_var_ItemId)  > 0 then
				sign = 1
			else
				if bHave > 0 then
					sign =2;
				end
			end
		else
			if bHave > 0 then
				sign =2;
			end
		end
	
		
		
		
		
			
			
			
		
	--春节补偿（圣山地宫）数值计算
--	local isAccept = x310033_HaveAccepted(varMap, varPlayer)
--	local num = x310033_GetMD( varMap, varPlayer, MD_2011CJBC_FUBEN_SHENGSHAN)
--	local time = GetDayOfYear()
--	if time >= 24 and time < 45 then
--		if num < 22 and isAccept == 1 then			
--			x310033_SetMD( varMap, varPlayer, MD_2011CJBC_FUBEN_SHENGSHAN, num + 1)		
--		end
--	end	
	 
	
		
		
		

	

	SetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_DAY[1], MD_YAOXIE_DIGONG_DAY[2], MD_YAOXIE_DIGONG_DAY[3], GetDayOfYear())
	SetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_MINUTE[1], MD_YAOXIE_DIGONG_MINUTE[2], MD_YAOXIE_DIGONG_MINUTE[3], GetMinOfDay())
	SetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_COUNT[1], MD_YAOXIE_DIGONG_COUNT[2], MD_YAOXIE_DIGONG_COUNT[3], 1)
	
	--检查周索引
	SetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_WEEKDAY[1], MD_YAOXIE_DIGONG_WEEKDAY[2], MD_YAOXIE_DIGONG_WEEKDAY[3], GetWeekIndex())

	--记录每天和每周完成次数
	if daycount < 3 and weekcount < 7 then
		x310033_SetMD( varMap, varPlayer, MD_YAOXIE_DIGONG_DAYCOUNT, daycount + 1)	
		x310033_SetMD( varMap, varPlayer, MD_YAOXIE_DIGONG_WEEKCOUNT, weekcount + 1)
	end
	
	if sign == 0 then
		return
	elseif sign == 1 then
		if DelItem(varMap, varPlayer, x310033_var_ItemId, 1) ~= 1 then return 0 end
		
		if countryId == 0 then
			GamePlayScriptLog(varMap,varPlayer,531)
		elseif countryId == 1 then
			GamePlayScriptLog(varMap,varPlayer,533)
		elseif countryId == 2 then
			GamePlayScriptLog(varMap,varPlayer,535)
		elseif countryId == 3 then
			GamePlayScriptLog(varMap,varPlayer,537)
		end
		GamePlayScriptLog(varMap,varPlayer,539)
	elseif sign == 2 then
		if DelItem(varMap, varPlayer, 11990100, 1) ~= 1 then return 0 end
		
		if countryId == 0 then
			GamePlayScriptLog(varMap,varPlayer,532)
		elseif countryId == 1 then
			GamePlayScriptLog(varMap,varPlayer,534)
		elseif countryId == 2 then
			GamePlayScriptLog(varMap,varPlayer,536)
		elseif countryId == 3 then
			GamePlayScriptLog(varMap,varPlayer,538)
		end
		GamePlayScriptLog(varMap,varPlayer,539)
	end
	

	local NewSceneId;
	if countryId == 0 then
	
		NewSceneId = YX_LOULAN_SCENE_ID1
		YX_LOULAN_HUMAN_NUM1 = YX_LOULAN_HUMAN_NUM1 + 1
		
		WriteLog(1,format("YXD:EnterInfo varMap=%d targetSceneId=%d GUID=%X varCount=%d",varMap,NewSceneId,GetGUID(varMap,varPlayer),YX_LOULAN_HUMAN_NUM1))

	elseif countryId == 1 then
	
		NewSceneId = YX_LAIYIN_SCENE_ID1
		YX_LAIYIN_HUMAN_NUM1 = YX_LAIYIN_HUMAN_NUM1 + 1
		
		WriteLog(1,format("YXD:EnterInfo varMap=%d targetSceneId=%d GUID=%X varCount=%d",varMap,NewSceneId,GetGUID(varMap,varPlayer),YX_LAIYIN_HUMAN_NUM1))
		
	elseif countryId == 2 then
	
		NewSceneId = YX_KUNLUN_SCENE_ID1
		YX_KUNLUN_HUMAN_NUM1 = YX_KUNLUN_HUMAN_NUM1 + 1
		
		WriteLog(1,format("YXD:EnterInfo varMap=%d targetSceneId=%d GUID=%X varCount=%d",varMap,NewSceneId,GetGUID(varMap,varPlayer),YX_KUNLUN_HUMAN_NUM1))
		
	elseif countryId == 3 then
	
		NewSceneId = YX_DUNHUANG_SCENE_ID1
		YX_DUNHUANG_HUMAN_NUM1 = YX_DUNHUANG_HUMAN_NUM1 + 1
		
		WriteLog(1,format("YXD:EnterInfo varMap=%d targetSceneId=%d GUID=%X varCount=%d",varMap,NewSceneId,GetGUID(varMap,varPlayer),YX_DUNHUANG_HUMAN_NUM1))
	end

	local PosX = 67
	local PosZ = 63
	
	NewWorld(varMap, varPlayer, NewSceneId,PosX ,PosZ, 310033 )
	
end

function x310033_CanEnter(varMap, varPlayer)

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_DAY[1], MD_YAOXIE_DIGONG_DAY[2], MD_YAOXIE_DIGONG_DAY[3])
	local minute = GetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_MINUTE[1], MD_YAOXIE_DIGONG_MINUTE[2], MD_YAOXIE_DIGONG_MINUTE[3])

	if varLastday ~= GetDayOfYear() then
		return -1
	end
	
	local curMin = GetMinOfDay()
	if (minute >=2*60 and minute<=2*60+20) then
		if curMin >= 2*60+20 then
			return -1
		end
	elseif( minute>=6*60 and minute<=6*60+20 ) then
		if curMin >= 6*60+20 then
			return -1
		end
	elseif (minute>=10*60 and minute<=10*60+20) then
		if curMin >= 10*60+20 then
			return -1
		end
	elseif (minute>=14*60 and minute<=14*60+20) then
		if curMin >= 14*60+20 then
			return -1
		end
	elseif (minute>=18*60 and minute<=18*60+20) then
		if curMin >= 18*60+20 then
			return -1
		end
	elseif (minute>=22*60 and minute<=22*60+20) then
		if curMin >= 22*60+20 then
			return -1
		end
		
	end

	return 1
end


function x310033_EnterScene(varMap, varPlayer)
	
	if varMap == YX_LOULAN_SCENE_ID1 or varMap == YX_LOULAN_SCENE_ID2 or varMap == YX_LOULAN_SCENE_ID3 or varMap == YX_LOULAN_SCENE_ID4 or varMap == YX_LOULAN_SCENE_ID5 or varMap == YX_LOULAN_SCENE_ID6 or varMap == YX_LOULAN_SCENE_ID7 or varMap == YX_LOULAN_SCENE_ID8 or varMap == YX_LOULAN_SCENE_ID9 or varMap == YX_LOULAN_SCENE_ID10 or varMap == YX_LOULAN_SCENE_ID11 or varMap == YX_LOULAN_SCENE_ID12 or
		varMap == YX_LAIYIN_SCENE_ID1 or varMap == YX_LAIYIN_SCENE_ID2 or varMap == YX_LAIYIN_SCENE_ID3 or varMap == YX_LAIYIN_SCENE_ID4 or varMap == YX_LAIYIN_SCENE_ID5 or varMap == YX_LAIYIN_SCENE_ID6 or varMap == YX_LAIYIN_SCENE_ID7 or varMap == YX_LAIYIN_SCENE_ID8 or varMap == YX_LAIYIN_SCENE_ID9 or varMap == YX_LAIYIN_SCENE_ID10 or varMap == YX_LAIYIN_SCENE_ID11 or varMap == YX_LAIYIN_SCENE_ID12 or
		varMap == YX_KUNLUN_SCENE_ID1 or varMap == YX_KUNLUN_SCENE_ID2 or varMap == YX_KUNLUN_SCENE_ID3 or varMap == YX_KUNLUN_SCENE_ID4 or varMap == YX_KUNLUN_SCENE_ID5 or varMap == YX_KUNLUN_SCENE_ID6 or varMap == YX_KUNLUN_SCENE_ID7 or varMap == YX_KUNLUN_SCENE_ID8 or varMap == YX_KUNLUN_SCENE_ID9 or varMap == YX_KUNLUN_SCENE_ID10 or varMap == YX_KUNLUN_SCENE_ID11 or varMap == YX_KUNLUN_SCENE_ID12 or
		varMap == YX_DUNHUANG_SCENE_ID1 or varMap == YX_DUNHUANG_SCENE_ID2 or varMap == YX_DUNHUANG_SCENE_ID3 or varMap == YX_DUNHUANG_SCENE_ID4 or varMap == YX_DUNHUANG_SCENE_ID5 or varMap == YX_DUNHUANG_SCENE_ID6 or varMap == YX_DUNHUANG_SCENE_ID7 or varMap == YX_DUNHUANG_SCENE_ID8 or varMap == YX_DUNHUANG_SCENE_ID9 or varMap == YX_DUNHUANG_SCENE_ID10 or varMap == YX_DUNHUANG_SCENE_ID11 or varMap == YX_DUNHUANG_SCENE_ID12 then
		local PosX 
		local PosZ 
		if x310033_CanEnter(varMap, varPlayer) < 0 then
				local countryId = GetCurCountry(varMap, varPlayer)
				local NewSceneId = x310033_var_SceneId[countryId+1]
				local PosX, PosZ;
				if  varMap == YX_LOULAN_SCENE_ID1 or varMap == YX_LAIYIN_SCENE_ID1 then
					PosX =128
					PosZ = 83
				elseif varMap == YX_KUNLUN_SCENE_ID1 or varMap == YX_DUNHUANG_SCENE_ID1 then
					PosX =128
					PosZ =173			
				elseif varMap == YX_LOULAN_SCENE_ID2 or varMap ==YX_LAIYIN_SCENE_ID2  then
					PosX =128
					PosZ = 83
				elseif varMap ==YX_KUNLUN_SCENE_ID2 or varMap ==YX_DUNHUANG_SCENE_ID2 then
					PosX =128
					PosZ =173					
				elseif varMap ==YX_LOULAN_SCENE_ID3 or varMap ==YX_LAIYIN_SCENE_ID3 then
					PosX =128
					PosZ = 83
				elseif varMap ==YX_KUNLUN_SCENE_ID3 or varMap ==YX_DUNHUANG_SCENE_ID3 then
					PosX =128
					PosZ =173
				elseif varMap ==YX_LOULAN_SCENE_ID4 or varMap ==YX_LAIYIN_SCENE_ID4 then
					PosX =128
					PosZ = 83
				elseif varMap ==YX_KUNLUN_SCENE_ID4 or varMap ==YX_DUNHUANG_SCENE_ID4 then
					PosX =128
					PosZ =173								
				elseif varMap ==YX_LOULAN_SCENE_ID5 or varMap ==YX_LAIYIN_SCENE_ID5 then
					PosX =128
					PosZ = 83
				elseif varMap ==YX_KUNLUN_SCENE_ID5 or varMap ==YX_DUNHUANG_SCENE_ID5 then
					PosX =128
					PosZ =173
				elseif varMap ==YX_LOULAN_SCENE_ID6 or varMap ==YX_LAIYIN_SCENE_ID6 then
					PosX =128
					PosZ = 83		
				elseif varMap ==YX_KUNLUN_SCENE_ID6 or varMap ==YX_DUNHUANG_SCENE_ID6 then
					PosX =128
					PosZ =173	
				elseif varMap ==YX_LOULAN_SCENE_ID7 or varMap ==YX_LAIYIN_SCENE_ID7 then
					PosX =128
					PosZ = 83			
				elseif varMap ==YX_KUNLUN_SCENE_ID7 or varMap ==YX_DUNHUANG_SCENE_ID7 then
					PosX =128
					PosZ =173
				elseif varMap ==YX_LOULAN_SCENE_ID8 or varMap ==YX_LAIYIN_SCENE_ID8 then
					PosX =128
					PosZ = 83			
				elseif varMap ==YX_KUNLUN_SCENE_ID8 or varMap ==YX_DUNHUANG_SCENE_ID8 then
					PosX =128
					PosZ =173	
				elseif varMap ==YX_LOULAN_SCENE_ID9 or varMap ==YX_LAIYIN_SCENE_ID9 then
					PosX =128
					PosZ = 83	
				elseif varMap ==YX_KUNLUN_SCENE_ID9 or varMap ==YX_DUNHUANG_SCENE_ID9 then
					PosX =128
					PosZ =173				
				elseif varMap ==YX_LOULAN_SCENE_ID10 or varMap ==YX_LAIYIN_SCENE_ID10 then
					PosX =128
					PosZ = 83	
				elseif varMap ==YX_KUNLUN_SCENE_ID10 or varMap ==YX_DUNHUANG_SCENE_ID10 then
					PosX =128
					PosZ =173	
				elseif varMap ==YX_LOULAN_SCENE_ID11 or varMap ==YX_LAIYIN_SCENE_ID11 then
					PosX =128
					PosZ = 83	
				elseif varMap ==YX_KUNLUN_SCENE_ID11 or varMap ==YX_DUNHUANG_SCENE_ID11 then
					PosX =128
					PosZ =173				
				elseif varMap ==YX_LOULAN_SCENE_ID12 or varMap ==YX_LAIYIN_SCENE_ID12 then
					PosX =128
					PosZ = 83	
				elseif varMap ==YX_KUNLUN_SCENE_ID12 or varMap ==YX_DUNHUANG_SCENE_ID12 then
					PosX =128
					PosZ =173																	
				end
			NewWorld(varMap, varPlayer, NewSceneId,PosX ,PosZ, 310033 )
		end
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x310033_var_BuffId, 0)
		GamePlayScriptLog(varMap, varPlayer, 531)
		LuaCallNoclosure(802005,"AddActivityQuest",varMap, varPlayer, 1,3)
		LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,9)
	end

	

end


function x310033_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x310033_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
