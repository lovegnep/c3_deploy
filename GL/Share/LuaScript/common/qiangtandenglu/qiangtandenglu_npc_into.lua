

x310400_var_FileId = 310400


x310400_var_QuestName="抢滩东瀛岛传入"



x310400_var_MaxHuman = 100
x310400_var_MaxHumanOther = 200

x310400_var_BuffId = 7061
x310400_var_ItemId = 12030030
x310400_var_QuestId = 9400

function x310400_IsOpenedTime()
	local minute = GetMinOfDay();
	if (minute >=7*60 and minute<=7*60+4) or ( minute>=11*60 and minute<=11*60+4 ) or (minute>=15*60 and minute<=15*60+4) or 
		(minute >=19*60 and minute<=19*60+4) or (minute >=22*60+30 and minute<=22*60+4+30) then
		return 1
	end

	return -1

end

function x310400_HaveAccepted(varMap, varPlayer)
	
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_DAY[1], MD_YAOXIE_DIGONG_DAY[2], MD_YAOXIE_DIGONG_DAY[3])
	if varLastday == GetDayOfYear() then
		return 1
	end
	return -1
end

function x310400_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if GetLevel(varMap, varPlayer) < 75 then
		return
	end
    TalkAppendButton(varMap,x310400_var_FileId,"抢滩东瀛岛(75级)",14,-1)
     
end


function x310400_ProcEventEntry( varMap, varPlayer, varTalknpc,idScript,idExt )
	
		StartTalkTask(varMap)
		  local Readme_1 = "#Y【抢滩东瀛岛】#r"
		  local Readme_2 = "#W\t每天的#G7:00#W，#G11:00#W，#G15:00#W，#G19:00#W和#G22:30#W，大元水师会对东瀛周边小岛开始抢滩作战。"
		  local Readme_3 = "#W\n\t在那时，我可以给持有#G勇武之证#W的勇士们加持#G勇武之力#W，极大地提升勇士们的力量和勇气。然而，长时间的加持勇武之力会给人带来永久的伤害，所以，每人#R每天只有#W一次#R加持的机会#W。"
		  local Readme_4 = "#w\n\t\n\t由于过多勇士的聚集可能并不利于战斗，通常只会选拔#r一百位#w勇士前往东瀛岛。但是如果你拥有#g混沌之星#w，我可以将你破例送到超过100人的岛上，这样东瀛岛上将最多可以有#r两百人#w同时作战。\n\t#g（请注意：抢滩登录和妖邪地宫共享任务次数）"
		  local varReadme = Readme_1..Readme_2..Readme_3..Readme_4
			TalkAppendString(varMap,varReadme)
			StopTalkTask(varMap)	
		DeliverTalkInfo(varMap,varPlayer,varTalknpc,x310400_var_FileId,-1)

	return 

end




function x310400_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end

function x310400_IsGameTime()
	local minute = GetMinOfDay();
	if (minute >=7*60 and minute<=7*60+20) or ( minute>=11*60 and minute<=11*60+20 ) or (minute>=15*60 and minute<=15*60+20) or 
		(minute >=19*60 and minute<=19*60+20) or (minute >=22*60+30 and minute<=22*60+20+30) then
		return 1
	end
	return -1
end




function x310400_ProcAccept( varMap, varPlayer )
	
	if GetLevel( varMap, varPlayer ) < 75 then
	
		Msg2Player(varMap,varPlayer,"等级不够，无法进入",8,3)		
		Msg2Player(varMap,varPlayer,"等级不够，无法进入",8,2)
		return
	end

	if x310400_IsGameTime() < 0 then
			Msg2Player(varMap,varPlayer,"不是在活动时间内",8,3)		
			Msg2Player(varMap,varPlayer,"不是在活动时间内",8,2)
			return
	end
	
	local bHave = 0
	if GetItemCount(varMap, varPlayer, 11990100)  > 0 then
		bHave = 1
	end

	if x310400_HaveAccepted(varMap, varPlayer) > 0 then
		
		Msg2Player(varMap,varPlayer,"一天只能进入一次东瀛岛，或者妖邪地宫",8,3)		
		Msg2Player(varMap,varPlayer,"一天只能进入一次东瀛岛，或者妖邪地宫",8,2)
		return 
	end

	if bHave == 0 then
		if GetItemCount(varMap, varPlayer, x310400_var_ItemId)  == 0 then
			Msg2Player(varMap,varPlayer,"你没有勇武之证，但拥有混沌之星，也可以进入",8,3)		
			Msg2Player(varMap,varPlayer,"你没有勇武之证，但拥有混沌之星，也可以进入",8,2)
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
		curNum = QT_LOULAN_HUMAN_NUM 
	elseif countryId == 1 then
		curNum = QT_LAIYIN_HUMAN_NUM
	elseif countryId == 2 then
		curNum = QT_KUNLUN_HUMAN_NUM 
	elseif countryId == 3 then
		curNum = QT_DUNHUANG_HUMAN_NUM 
	end
	local sign = 0;
	
	if curNum < x310400_var_MaxHuman then
		
			if GetItemCount(varMap, varPlayer, x310400_var_ItemId)  > 0 then
				sign = 1
			else
				if bHave > 0 then
					sign =2;
				end
			end
		
	elseif curNum >= x310400_var_MaxHuman and curNum < x310400_var_MaxHumanOther then
		
		if bHave  > 0 then
			sign =2;	
		else	
			Msg2Player(varMap,varPlayer,"东瀛岛已超过百人，无法进入",8,3)	
			Msg2Player(varMap,varPlayer,"东瀛岛已超过百人，无法进入",8,2)
			return
		end

	 
	else	
		Msg2Player(varMap,varPlayer,"东瀛岛已达二百人，无法进入",8,3)	
		Msg2Player(varMap,varPlayer,"东瀛岛已达二百人，无法进入",8,2)
		return

	end

	SetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_DAY[1], MD_YAOXIE_DIGONG_DAY[2], MD_YAOXIE_DIGONG_DAY[3], GetDayOfYear())
	SetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_MINUTE[1], MD_YAOXIE_DIGONG_MINUTE[2], MD_YAOXIE_DIGONG_MINUTE[3], GetMinOfDay())
	SetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_COUNT[1], MD_YAOXIE_DIGONG_COUNT[2], MD_YAOXIE_DIGONG_COUNT[3], 1)


	if sign == 0 then
		return
	elseif sign == 1 then
		if DelItem(varMap, varPlayer, x310400_var_ItemId, 1) ~= 1 then return 0 end
	elseif sign == 2 then
		if DelItem(varMap, varPlayer, 11990100, 1) ~= 1 then return 0 end
	end
	

	local NewSceneId;
	if countryId == 0 then
		NewSceneId = QT_LOULAN_SCENE_ID
		QT_LOULAN_HUMAN_NUM = QT_LOULAN_HUMAN_NUM + 1
	elseif countryId == 1 then
		NewSceneId = QT_LAIYIN_SCENE_ID
		QT_LAIYIN_HUMAN_NUM = QT_LAIYIN_HUMAN_NUM + 1
	elseif countryId == 2 then
		NewSceneId = QT_KUNLUN_SCENE_ID
		QT_KUNLUN_HUMAN_NUM = QT_KUNLUN_HUMAN_NUM + 1
	elseif countryId == 3 then
		NewSceneId = QT_DUNHUANG_SCENE_ID
		QT_DUNHUANG_HUMAN_NUM = QT_DUNHUANG_HUMAN_NUM + 1
	end

	local PosX = 70
	local PosZ = 128
	
	NewWorld(varMap, varPlayer, NewSceneId,PosX ,PosZ, 310400 )
end
function x310400_CanEnter(varMap, varPlayer)

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_DAY[1], MD_YAOXIE_DIGONG_DAY[2], MD_YAOXIE_DIGONG_DAY[3])
	local minute = GetPlayerGameData(varMap, varPlayer, MD_YAOXIE_DIGONG_MINUTE[1], MD_YAOXIE_DIGONG_MINUTE[2], MD_YAOXIE_DIGONG_MINUTE[3])

	if varLastday ~= GetDayOfYear() then
		return -1
	end
	
	local curMin = GetMinOfDay()
	if (minute >=7*60 and minute<=7*60+20) then
		if curMin > 7*60+20 then
			return -1
		end
	elseif( minute>=11*60 and minute<=11*60+20 ) then
		if curMin > 11*60+20 then
			return -1
		end
	elseif (minute>=15*60 and minute<=15*60+20) then
		if curMin > 15*60+20 then
			return -1
		end
	elseif (minute>=19*60 and minute<=19*60+20) then
		if curMin > 19*60+20 then
			return -1
		end
	elseif (minute>=22*60+30 and minute<=22*60+20+30) then
		if curMin > 22*60+20+30 then
			return -1
		end
		
	end

	return 1
end


function x310400_EnterScene(varMap, varPlayer)
	
	if varMap == QT_LOULAN_SCENE_ID or 
		varMap == QT_LAIYIN_SCENE_ID or
		varMap == QT_KUNLUN_SCENE_ID or
		varMap == QT_DUNHUANG_SCENE_ID then
		local countryId = GetCurCountry(varMap, varPlayer)
		local PosX = 150
		local PosZ = 181
		
		if x310400_CanEnter(varMap, varPlayer) < 0 then
			NewWorld(varMap, varPlayer, 15,PosX ,PosZ, 310400 )
		end
		if IsHaveQuestNM( varMap, varPlayer, x310400_var_QuestId ) == 0 then
			local varRet = AddQuestNM( varMap, varPlayer, x310400_var_QuestId ) 
		end

		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x310400_var_BuffId, 0)
		GamePlayScriptLog(varMap, varPlayer, 531)

	end

end



