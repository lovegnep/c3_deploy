x320021_var_FileId 						= 320021
x320021_var_QuestName					= "突袭寒玉"
x320021_var_QuestName1					= "提交寒玉"
x320021_var_QuestInfo					= "\t天池寒玉决定着这场战争的最后胜利。"
x320021_var_BanZhuanBuff				= 30560
x320021_var_GameOpenId				= 1087
x320021_var_PlayerBuff				= {}
x320021_var_MenuSlect					= {}
x320021_var_GetPlayerExp				=
{
{level = 40, value = 1600},
{level = 65, value = 2400},
{level = 85, value = 4320},
}

function x320021_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if x320021_var_GameOpenId > 0 and GetGameOpenById( x320021_var_GameOpenId ) <= 0 then
      return
  end
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local GetWeekcount = mod (GetWeekIndex() , 2)
	local nlevel = GetLevel( varMap, varPlayer)
	
	if GetWeekcount == 1 then
		return
	end
	
	if varMap ~= 44 then
		return
	end	
	
	if minOfDay < 869 or minOfDay > 900 then
		return
	end

	if weekIdx ~= 6 then
		return
	end	
	
	if nlevel < 40 then
		return
	end
	
--	if GetCurCamp(varMap, varPlayer) == 5 then
--		TalkAppendButton(varMap, x320021_var_FileId, x320021_var_QuestName, 3, 1)
--	end
	if GetCurCamp(varMap, varPlayer) == 6 and IsHaveSpecificImpact(varMap, varPlayer, x320021_var_BanZhuanBuff) == 1 then
		TalkAppendButton(varMap, x320021_var_FileId, x320021_var_QuestName1, 3, 2)	
	end
end

function x320021_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varidx)
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local GetWeekcount = mod (GetWeekIndex() , 2)
	local nlevel = GetLevel( varMap, varPlayer)
	
	if GetWeekcount == 1 then
		return
	end
	
	if varMap ~= 44 then
		return
	end	
	
	if minOfDay < 869 or minOfDay > 900 then
		return
	end

	if weekIdx ~= 6 then
		return
	end	
	
	if nlevel < 40 then
		return
	end


--	if IsHaveSpecificImpact(varMap, varPlayer, x320021_var_BanZhuanBuff) == 1 and GetCurCamp(varMap, varPlayer) == 5 then
--		Msg2Player(varMap, varPlayer, "你只能携带一块天池寒玉。", 8, 3)
--		return
--	end
		x320021_var_MenuSlect[GetGUID(varMap, varPlayer)] = varidx
--	if x320021_var_MenuSlect[GetGUID(varMap, varPlayer)] == 1 then
--		x320021_var_PlayerBuff[GetGUID(varMap, varPlayer)] = x320021_var_BanZhuanBuff
--		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x320021_var_PlayerBuff[GetGUID(varMap, varPlayer)], 0)
--		Msg2Player(varMap, varPlayer, "突袭成功，将天池寒玉交给本方的前锋统领你将获得不菲的奖励。", 8, 2)	
--		Msg2Player(varMap, varPlayer, "突袭成功，将天池寒玉交给本方的前锋统领你将获得不菲的奖励。", 8, 3)	
--	end
	
	if x320021_var_MenuSlect[GetGUID(varMap, varPlayer)] == 2 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, x320021_var_QuestName1)
			TalkAppendString(varMap,x320021_var_QuestInfo)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x320021_var_FileId, -1)
	end

end

function x320021_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if x320021_var_GameOpenId > 0 and GetGameOpenById( x320021_var_GameOpenId ) <= 0 then
      return
  end
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local GetWeekcount = mod (GetWeekIndex() , 2)
	local nlevel = GetLevel( varMap, varPlayer)
	
	if GetWeekcount == 1 then
		return
	end
	
	if varMap ~= 44 then
		return
	end	
	
	if minOfDay < 869 or minOfDay > 900 then
		return
	end

	if weekIdx ~= 6 then
		return
	end	
	
	if nlevel < 40 then
		return
	end

	if x320021_var_MenuSlect[GetGUID(varMap, varPlayer)] == 2 then
		if LuaCallNoclosure(320029, "GetPlayerBuff", varMap, varPlayer) ~= nil then		
			DispelSpecificImpact(varMap, varPlayer, LuaCallNoclosure(320029, "GetPlayerBuff", varMap, varPlayer), 1)
			AddExp(varMap, varPlayer, x320021_BanZhuanExp(varMap, varPlayer))
			LuaCallNoclosure(320016, "AddBlueCampResource", varMap, varPlayer)
			Msg2Player(varMap,varPlayer,"顺利突袭对方寒玉，为您的所属阵营增加#R5点#o资源积分奖励",8,2)
			Msg2Player(varMap,varPlayer,"顺利突袭对方寒玉，为您的所属阵营增加#R5点#o资源积分奖励",8,3)			
			Msg2Player(varMap, varPlayer, format("个人获得#R%d点#o经验奖励",x320021_BanZhuanExp(varMap, varPlayer)), 8, 2)
			Msg2Player(varMap, varPlayer, format("个人获得#R%d点#o经验奖励",x320021_BanZhuanExp(varMap, varPlayer)), 8, 3)
		    local PlayerValue = x320021_GetMD( varMap, varPlayer, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL)
		    if PlayerValue <= 32767 then
		    	x320021_SetMD( varMap, varPlayer, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL, PlayerValue + 1)
		    	Msg2Player(varMap, varPlayer, format("个人获得#R1点#o的积分，你目前积分#R%d点#o",PlayerValue+1), 8, 2)
		    	Msg2Player(varMap, varPlayer, format("个人获得#R1点#o的积分，你目前积分#R%d点#o",PlayerValue+1), 8, 3)
		    end	
		    local redcamp1, bluecamp1 = LuaCallNoclosure(320016, "GetTwoCampResource", varMap, varPlayer)    
			WriteLog(1, format("x320021_ProcAcceptCheck: Playerid=%s, GetExp=%d, GetRedCampResource=%d, GetBlueCampResource=%d",varPlayer, x320021_BanZhuanExp(varMap, varPlayer), redcamp1, bluecamp1))
		    	
		end
	end	
end


function x320021_BanZhuanExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = 0
	if nLevel < 40 then
		return
	end
	for i, j in x320021_var_GetPlayerExp do
		if nLevel >= j.level then
			nExp = nLevel * j.value
		else
			return nExp
		end
	end
	return nExp
end


function x320021_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x320021_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end

function x320021_GetPlayerBuff(varMap, varPlayer)
	return x320021_var_PlayerBuff[GetGUID(varMap, varPlayer)]
end
