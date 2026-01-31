x320023_var_FileId 						= 320023
x320023_var_QuestName					= "兑换个人积分经验"
x320023_var_QuestName1					= "兑换活动积分经验"
x320023_var_QuestInfo					= "\t大对决活动中获得的个人积分可以在我处兑换经验奖励。"
x320023_var_QuestInfo1					= "\t大对决活动结束后，所有参加玩法的玩家都可以在我处领取一笔经验，获得胜利的玩家能获得更高的经验奖励。"
x320023_var_BanZhuanBuff				= 30560
x320023_var_GameOpenId				= 1083
x320023_var_PlayerBuff				= {}
x320023_var_MenuSlect					= {}
x320023_var_GetPlayerExp				=
{
{level = 40, value = 1600},
{level = 65, value = 2400},
{level = 85, value = 4320},
}

x320023_var_GetPlayerExp1				=
{
{level = 40, value = 14400, value1 = 7200, value2 = 9600},
{level = 65, value = 21600, value1 = 10800, value2 = 14800},
{level = 85, value = 38880, value1 = 19440, value2 = 25600},
} 

function x320023_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local GetWeekcount = mod (GetWeekIndex() , 2)
	local nlevel = GetLevel( varMap, varPlayer)
	local WeekDay = x320023_GetMD(varMap, varPlayer, MD_YUNBIAOBANZHUAN_WEEK)
	if WeekDay == GetWeekIndex() then
	
		if varMap ~= 44 then
			return
		end	
		
		if minOfDay < 900 then
			return
		end
	
		if weekIdx < 6 then
			return
		end	
		
		if nlevel < 40 then
			return
		end
	elseif WeekDay < GetWeekIndex() then
	
	else
		return
	end	
	if x320023_var_GameOpenId > 0 and GetGameOpenById( x320023_var_GameOpenId ) <= 0 then
      return
  end

	TalkAppendButton(varMap, x320023_var_FileId, x320023_var_QuestName, 3, 1)
	TalkAppendButton(varMap, x320023_var_FileId, x320023_var_QuestName1, 3, 2)	

end


function x320023_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varidx)
		local redresource, blueresource = LuaCallNoclosure(320016, "GetTwoCampResource", varMap, varPlayer)
		local PlayerCamp = x320023_GetMD(varMap, varPlayer, MD_YUNBIAOBANZHUAN_PLAYERCAMP)
		local ExpBonus = 0
		x320023_var_MenuSlect[GetGUID(varMap, varPlayer)] = varidx
		
		if x320023_var_MenuSlect[GetGUID(varMap, varPlayer)] == 1 then
			StartTalkTask(varMap)
				--任务完成信息
				TalkAppendString(varMap,"#Y"..x320023_var_QuestName)
				TalkAppendString(varMap,x320023_var_QuestInfo)
	
				local ExpBonus = x320023_DrawPlayerExp(varMap, varPlayer)
				if ExpBonus > 0 then
					AddQuestExpBonus(varMap, ExpBonus )
				end
			StopTalkTask(varMap)
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x320023_var_FileId, -1)
		elseif x320023_var_MenuSlect[GetGUID(varMap, varPlayer)] == 2 then
			StartTalkTask(varMap)
				--任务完成信息
				TalkAppendString(varMap,"#Y"..x320023_var_QuestName1)
				TalkAppendString(varMap,x320023_var_QuestInfo1)
			if redresource > blueresource then
				if PlayerCamp == 5 then				
					ExpBonus = x320023_SquareSuccessExp(varMap, varPlayer)
				elseif PlayerCamp == 6 then
					ExpBonus = x320023_SquareLossExp(varMap, varPlayer)
				end
			elseif redresource < blueresource then
				if PlayerCamp == 6 then				
					ExpBonus = x320023_SquareSuccessExp(varMap, varPlayer)
				elseif PlayerCamp == 5 then
					ExpBonus = x320023_SquareLossExp(varMap, varPlayer)
				end
			else
				ExpBonus = x320023_SquareDrawExp(varMap, varPlayer)
			end			
	
				if ExpBonus > 0 then
					AddQuestExpBonus(varMap, ExpBonus )
				end
			StopTalkTask(varMap)
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x320023_var_FileId, -1)		
		end

end

function x320023_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local GetWeekcount = mod (GetWeekIndex() , 2)
	local nlevel = GetLevel( varMap, varPlayer)
	local WeekIdx =	x320023_GetMD(varMap, varPlayer, MD_YUNBIAOBANZHUAN_WEEK)	
	local PlayerCamp = x320023_GetMD(varMap, varPlayer, MD_YUNBIAOBANZHUAN_PLAYERCAMP)	
	local PlayerValue = x320023_GetMD( varMap, varPlayer, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL)	
	if WeekIdx == GetWeekIndex() then
	
		if varMap ~= 44 then
			return
		end	
		
		if minOfDay < 900 then
			return
		end
	
		if weekIdx < 6 then
			return
		end	
		
		if nlevel < 40 then
			return
		end
		if x320023_var_GameOpenId > 0 and GetGameOpenById( x320023_var_GameOpenId ) <= 0 then
      return
  	end
	elseif WeekIdx < GetWeekIndex() then
	
	else
		return
	end			
	if x320023_var_MenuSlect[GetGUID(varMap, varPlayer)] == 1 then 
		if PlayerValue > 0 then
			AddExp(varMap, varPlayer, x320023_DrawPlayerExp(varMap, varPlayer))
			GamePlayScriptLog(varMap, varPlayer, 2517)
			Msg2Player(varMap, varPlayer, format("领取%d点经验奖励",x320023_DrawPlayerExp(varMap, varPlayer)), 8, 2)
			x320023_SetMD( varMap, varPlayer, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL, 0)
			DelQuest(varMap, varPlayer, 6655)	
			DelQuest(varMap, varPlayer, 6656)
		else
			Msg2Player(varMap, varPlayer, "您没有参加活动或已领取过奖励！", 8, 3)		
			return
		end
	elseif x320023_var_MenuSlect[GetGUID(varMap, varPlayer)] == 2 then
		if PlayerCamp == 0 then
			Msg2Player(varMap, varPlayer, "您没有参加活动或已领取过奖励！", 8, 3)		
		else
		x320023_SquarePlayerExp(varMap, varPlayer)
		GamePlayScriptLog(varMap, varPlayer, 2518)			
	end	
	end	

end

function x320023_SquarePlayerExp(varMap, varPlayer)
	local redresource, blueresource = LuaCallNoclosure(320016, "GetTwoCampResource", varMap, varPlayer)
	local PlayerCamp = x320023_GetMD(varMap, varPlayer, MD_YUNBIAOBANZHUAN_PLAYERCAMP)	

	if redresource < 0 or blueresource < 0 then
		return
	end

	if redresource == nil or blueresource == nil then
		return
	end
	DelQuest(varMap, varPlayer, 6655)	
	DelQuest(varMap, varPlayer, 6656)
	if redresource > blueresource then
		x320023_SetMD( varMap, varPlayer, MD_YUNBIAOBANZHUAN_PLAYERCAMP, 0)
		if PlayerCamp == 5 then
			AddExp(varMap, varPlayer, x320023_SquareSuccessExp(varMap, varPlayer))
			Msg2Player(varMap, varPlayer, format("领取%d点经验奖励",x320023_SquareSuccessExp(varMap, varPlayer)), 8, 2)
		elseif PlayerCamp == 6 then
			AddExp(varMap, varPlayer, x320023_SquareLossExp(varMap, varPlayer))
			Msg2Player(varMap, varPlayer, format("领取%d点经验奖励",x320023_SquareLossExp(varMap, varPlayer)), 8, 2)
		else 
			return	0		
		end
	elseif redresource < blueresource then
		x320023_SetMD( varMap, varPlayer, MD_YUNBIAOBANZHUAN_PLAYERCAMP, 0)
		if PlayerCamp == 5 then
			AddExp(varMap, varPlayer, x320023_SquareLossExp(varMap, varPlayer))

			Msg2Player(varMap, varPlayer, format("领取%d点经验奖励",x320023_SquareLossExp(varMap, varPlayer)), 8, 2)
		elseif PlayerCamp == 6 then
			AddExp(varMap, varPlayer, x320023_SquareSuccessExp(varMap, varPlayer))
			Msg2Player(varMap, varPlayer, format("领取%d点经验奖励",x320023_SquareSuccessExp(varMap, varPlayer)), 8, 2)
		else 
			return	0
		end	
	else
		x320023_SetMD( varMap, varPlayer, MD_YUNBIAOBANZHUAN_PLAYERCAMP, 0)
		if PlayerCamp == 5 or PlayerCamp == 6 then	
			AddExp(varMap, varPlayer, x320023_SquareDrawExp(varMap, varPlayer))
			Msg2Player(varMap, varPlayer, format("领取%d点经验奖励",x320023_SquareDrawExp(varMap, varPlayer)), 8, 2)		
		else
			return	0
		end
	end
end

function x320023_DrawPlayerExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local PlayerValue = x320023_GetMD( varMap, varPlayer, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL)
	local nExp = 0
	if nLevel < 40 then
		return 0
	end
	for i, j in x320023_var_GetPlayerExp do
		if nLevel >= j.level then
			nExp = nLevel * j.value * PlayerValue
		else
			return nExp
		end
	end
	return nExp
end


function x320023_SquareSuccessExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = 0
	if nLevel < 40 then
		return 0
	end
	for i, j in x320023_var_GetPlayerExp1 do
		if nLevel >= j.level then
			nExp = nLevel * j.value
		else
			return nExp
		end
	end
	return nExp
end

function x320023_SquareLossExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = 0
	if nLevel < 40 then
		return
	end
	for i, j in x320023_var_GetPlayerExp1 do
		if nLevel >= j.level then
			nExp = nLevel * j.value1
		else
			return nExp
		end
		end
	return nExp
end

function x320023_SquareDrawExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = 0
	if nLevel < 40 then
		return 0
	end
	for i, j in x320023_var_GetPlayerExp1 do
		if nLevel >= j.level then
			nExp = nLevel * j.value2
		else
			return nExp
		end
	end
	return nExp
end


function x320023_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x320023_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
