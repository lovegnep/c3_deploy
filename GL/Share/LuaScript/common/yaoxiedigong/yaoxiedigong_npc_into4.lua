

x310037_var_FileId = 310037


x310037_var_QuestName="圣山地宫传入1"



x310037_var_MaxHuman = 100
x310037_var_MaxHumanOther = 200 

x310037_var_ItemId = 12030027

function x310037_IsOpenedTime()
	local minute = GetMinOfDay();
	if (minute >=2*60 and minute<=2*60+4) or ( minute>=6*60 and minute<=6*60+4 ) or (minute>=10*60 and minute<=10*60+4) or 
		(minute >=14*60 and minute<=14*60+4) or (minute >=18*60 and minute<=18*60+4) or (minute >=22*60 and minute<=22*60+4) then
		return 1
	end

	return -1
end

function x310037_HaveAccepted(varMap, varPlayer)
	
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_DAY[1], MD_YAOXIE_DIGONG_DAY[2], MD_YAOXIE_DIGONG_DAY[3])

	if varLastday == GetDayOfYear() then
		return 1
	end
	return -1
end

function x310037_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if GetLevel(varMap, varPlayer) < 75 then
		return
	end
    TalkAppendButton(varMap,x310037_var_FileId,"圣山地宫(75级)",14,-1)
     
end


function x310037_ProcEventEntry( varMap, varPlayer, varTalknpc,idScript,idExt )
	
		StartTalkTask(varMap)
		  local Readme_1 = "#y【圣山地宫】#r"
		  local Readme_2 = "#w\t每天的#g02:00#w，#g06:00#w，#g10:00#w，#g14:00#w，#g18:00#w和#g22:00#w，圣山地宫的入口会打开#r5分钟#w，如果你拥有#g混沌之星#w，那么在圣山地宫开放的任意时间里都可以进入。"
		  local Readme_3 = "#W\n\t在那时，我可以给持有#G五耀之证#W或者#G混沌之星#W的勇士们加持#G五耀之力#W，这样他们就有了足够的能力铲除妖魔。然而，五耀之力是一种非常霸道的力量，普通人的身体#R一周#W只能加持#R七次#W，而且#R每天#W不能超过#R三次#W。"
		  local Readme_4 = "#W\n\t同时，聚集过多的五耀之力可能会造成不可预知的问题，因此圣山地宫中最多只能有#R一百人#W同时进行战斗。但是如果你拥有#G混沌之星#W，就可以大大减少五耀之力的散发，这样圣山地宫将可以有#R两百人#W同时进行战斗。"
		  local varReadme = Readme_1..Readme_2..Readme_3
			TalkAppendString(varMap,varReadme)
			StopTalkTask(varMap)	
		DeliverTalkInfo(varMap,varPlayer,varTalknpc,x310037_var_FileId,-1)
	return 

end




function x310037_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end


function x310037_IsGameTime()
	local minute = GetMinOfDay();
	if (minute >=2*60 and minute<=2*60+19) or ( minute>=6*60 and minute<=6*60+19 ) or (minute>=10*60 and minute<=10*60+19) or 
		(minute >=14*60 and minute<=14*60+19) or (minute >=18*60 and minute<=18*60+19) or (minute >=22*60 and minute<=22*60+19) then
		return 1
	end
	return -1
end




function x310037_ProcAccept( varMap, varPlayer )


	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_DAY[1], MD_YAOXIE_DIGONG_DAY[2], MD_YAOXIE_DIGONG_DAY[3])
	local varLastweek = GetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_WEEKDAY[1], MD_YAOXIE_DIGONG_WEEKDAY[2], MD_YAOXIE_DIGONG_WEEKDAY[3])



	--换天清零	
	if varLastday ~= GetDayOfYear() then
		x310037_SetMD( varMap, varPlayer, MD_YAOXIE_DIGONG_DAYCOUNT, 0)	
	end

	--换周清零
	if varLastweek ~= GetWeekIndex() then
		x310037_SetMD( varMap, varPlayer, MD_YAOXIE_DIGONG_WEEKCOUNT, 0)	
	end

	--获取每日和每周完成次数
	local daycount = x310037_GetMD( varMap, varPlayer, MD_YAOXIE_DIGONG_DAYCOUNT)
	local weekcount = x310037_GetMD( varMap, varPlayer, MD_YAOXIE_DIGONG_WEEKCOUNT)	

	
	if GetLevel( varMap, varPlayer ) < 75 then
	
		Msg2Player(varMap,varPlayer,"等级不够，无法进入",8,3)		
		Msg2Player(varMap,varPlayer,"等级不够，无法进入",8,2)
		return
	end

	if x310037_IsGameTime() < 0 then
			Msg2Player(varMap,varPlayer,"不是在活动时间内",8,3)		
			Msg2Player(varMap,varPlayer,"不是在活动时间内",8,2)
			return
	end

	local bHave = 0
	if GetItemCount(varMap, varPlayer, 11990100)  > 0 then
		bHave = 1
	end

	if bHave == 0 then
		if x310037_IsOpenedTime() < 0 then
			Msg2Player(varMap,varPlayer,"不是在活动时间内，但拥有混沌之星，也可进入",8,3)		
			Msg2Player(varMap,varPlayer,"不是在活动时间内，但拥有混沌之星，也可进入",8,2)
			return
		end
	else
		if x310037_IsGameTime() < 0 then
			Msg2Player(varMap,varPlayer,"不是在活动时间内",8,3)		
			Msg2Player(varMap,varPlayer,"不是在活动时间内",8,2)
			return
		end
	end

--	if x310037_HaveAccepted(varMap, varPlayer) > 0 then
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
		if GetItemCount(varMap, varPlayer, x310037_var_ItemId)  == 0 then
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
		curNum = YX_LOULAN_HUMAN_NUM4 
	elseif countryId == 1 then
		curNum = YX_LAIYIN_HUMAN_NUM4 
	elseif countryId == 2 then
		curNum = YX_KUNLUN_HUMAN_NUM4 
	elseif countryId == 3 then
		curNum = YX_DUNHUANG_HUMAN_NUM4 
	end
	local sign = 0;

	
		if x310037_IsOpenedTime() > 0 then
			if GetItemCount(varMap, varPlayer, x310037_var_ItemId)  > 0 then
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


















	SetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_DAY[1], MD_YAOXIE_DIGONG_DAY[2], MD_YAOXIE_DIGONG_DAY[3], GetDayOfYear())
	SetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_MINUTE[1], MD_YAOXIE_DIGONG_MINUTE[2], MD_YAOXIE_DIGONG_MINUTE[3], GetMinOfDay())
	SetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_COUNT[1], MD_YAOXIE_DIGONG_COUNT[2], MD_YAOXIE_DIGONG_COUNT[3], 1)
	
	--检查周索引
	SetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_WEEKDAY[1], MD_YAOXIE_DIGONG_WEEKDAY[2], MD_YAOXIE_DIGONG_WEEKDAY[3], GetWeekIndex())

	--记录每天和每周完成次数
	if daycount < 3 and weekcount < 7 then
		x310037_SetMD( varMap, varPlayer, MD_YAOXIE_DIGONG_DAYCOUNT, daycount + 1)	
		x310037_SetMD( varMap, varPlayer, MD_YAOXIE_DIGONG_WEEKCOUNT, weekcount + 1)
	end
	
	if sign == 0 then
		return
	elseif sign == 1 then
		if DelItem(varMap, varPlayer, x310037_var_ItemId, 1) ~= 1 then return 0 end
	elseif sign == 2 then
		if DelItem(varMap, varPlayer, 11990100, 1) ~= 1 then return 0 end
	end
	

	local NewSceneId;

	if countryId == 0 then
		NewSceneId = YX_LOULAN_SCENE_ID4
		YX_LOULAN_HUMAN_NUM4 = YX_LOULAN_HUMAN_NUM4 + 1
	elseif countryId == 1 then
		NewSceneId = YX_LAIYIN_SCENE_ID4
		YX_LAIYIN_HUMAN_NUM4 = YX_LAIYIN_HUMAN_NUM4 + 1
	elseif countryId == 2 then
		NewSceneId = YX_KUNLUN_SCENE_ID4
		YX_KUNLUN_HUMAN_NUM4 = YX_KUNLUN_HUMAN_NUM4 + 1
	elseif countryId == 3 then
		NewSceneId = YX_DUNHUANG_SCENE_ID4
		YX_DUNHUANG_HUMAN_NUM4 = YX_DUNHUANG_HUMAN_NUM4 + 1
	end
	local PosX = 67
	local PosZ = 63
	
	NewWorld(varMap, varPlayer, NewSceneId,PosX ,PosZ, 310037 )
end



	




function x310037_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x310037_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
