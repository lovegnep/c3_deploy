
-- ----------------------------------------------------------------------------
-- 赛季结束领取奖励
-- ----------------------------------------------------------------------------

MARK_BIT_FORWARD											= {13, 1}						--领取奖励的标记位
MARK_BIT_FORWARD_DATE									= {12, 12}						--领取日期
MARK_BIT_OPEN_DOUBLE_EXP							= {14, 1}						--开双的标志位

x303127_var_PrintDebugLog										=	0 --debug输出
x303127_var_PrintInfoLog										=	1	--输出基本调用信息日志

x303127_var_GD_Index												=	105			--奖励开双占得GD索引

x303127_var_FileId = 303127
x303127_var_QuestName1 = "【帮会】跨服帮会战赛季奖励领取"
x303127_var_QuestName2 = "【帮会】跨服帮会战开启全服双倍"

x303127_var_Date_Value											= 4095					--日期的位
x303127_var_Forward_Value										= 4096					--是否领取过奖励的位
x303127_var_OpenDouble_Value								=	8192					--是否开过双倍经验的位

x303127_var_Clear_Date_Value								= 4294963200		--清零日期的值
x303127_var_Clear_Forward_Value							= 4294963199		--清零是否领取过奖励的位的值
x303127_var_Clear_OpenDouble_Value					=	4294959103		--清零是否开过双倍经验的位的值

x303127_var_Guild_Leader_Offcail						=	5				--帮主的临时官阶
x303127_var_Guild_Other_Member_Offcail			=	0				--除帮主外其他成员的临时官阶

--Gameopen
x303127_var_GameOpen = 1096

x303127_var_Toplist1 = 83

-- 奖励
x303127_var_Aword = {

	-- 帮主称号
	[5] = {
		162, 163, 164, 165, 166,
	},
	
	-- 帮会成员称号
	[0] = {
		167, 168, 169, 170, 171,
	},
}

---------------------Begin 位运算的操作函数--------------------------------
x303127_bit_num_map = {}
for i = 1, 32 do
		x303127_bit_num_map[i] = 2 ^ ( 32 - i )
end

function x303127_bit_move_left(_x, _offset) --左移
			return _x * ( 2 ^ _offset) 
end 

function x303127_bit_move_rigth(_x, _offset) --右移
			return _x / ( 2 ^ _offset) 
end

function x303127_num_to_bit( _num ) --数字转换为bit数组
		local bit = {}
		for i = 1, 32 do
				if _num >= x303127_bit_num_map[i] then
					 bit[i] = 1
					 _num = _num - x303127_bit_num_map[i]
				else
					 bit[i] = 0
				end
		end
		return bit
end
											 
function x303127_bit_to_num( _bit ) --bit数组转换为数字
		 local num = 0
		 for i = 1, 32 do
		 		 if _bit[i] == 1 then
		 		 		num = num + x303127_bit_num_map[i]
		 		 end
		 end
		 return num
end
		
function x303127_bit_or_operate( _x, _y ) --或运算
			local _x_bit = x303127_num_to_bit( _x )
			local _y_bit = x303127_num_to_bit( _y )
			local _ret_bit = {}
			for i = 1, 32 do
				if _x_bit[i] == 1 or _y_bit[i] == 1 then
						_ret_bit[i] = 1
				else
						_ret_bit[i] = 0
				end
			end
			return x303127_bit_to_num( _ret_bit )
end

function x303127_bit_and_operate( _x, _y ) --与运算
			local _x_bit = x303127_num_to_bit( _x )
			local _y_bit = x303127_num_to_bit( _y )
			local _ret_bit = {}
			for i = 1, 32 do
				if _x_bit[i] == 1 and _y_bit[i] == 1 then
						_ret_bit[i] = 1
				else
						_ret_bit[i] = 0
				end
			end
			return x303127_bit_to_num( _ret_bit )
end

---------------------End 位运算的操作函数--------------------------------

--获取领奖标识
function x303127_GetForwardMark( varValue )
	local tForwardMark = x303127_bit_and_operate(varValue, x303127_var_Forward_Value)
	local forwardMark = x303127_bit_move_rigth(tForwardMark, MARK_BIT_FORWARD[1] - MARK_BIT_FORWARD[2])
	return forwardMark
end

--设置领奖标记, varValue为0或者1
function x303127_SetForwardMark(varMap, varPlayer, varValue)
	local guildId = GetGuildID(varMap, varPlayer)
	local param = GetGuildParamEx(varMap, varPlayer, guildId, x303127_var_GD_Index)
	param = x303127_bit_and_operate(param, x303127_var_Clear_Forward_Value)	--原始值清零
	param = x303127_bit_or_operate(param, x303127_bit_move_left(varValue, MARK_BIT_FORWARD[1] - 1))
	SetGuildParamEx(varMap, varPlayer, guildId, x303127_var_GD_Index, param)
end

--获取领取的周索引
function x303127_GetForwardWeekIndex(varValue)
	local tWeekIndex = x303127_bit_and_operate(varValue, x303127_var_Date_Value)
	local weekIndex = x303127_bit_move_rigth(tWeekIndex, MARK_BIT_FORWARD_DATE[1] - MARK_BIT_FORWARD_DATE[2])
	return weekIndex
end

--设置领奖日期
function x303127_SetWeekIndex(varMap, varPlayer)
	local guildId = GetGuildID(varMap, varPlayer)
	local curWeekIndex = GetWeekIndex()			--获取当前周索引数
	local param = GetGuildParamEx(varMap, varPlayer, guildId, x303127_var_GD_Index)
	param = x303127_bit_and_operate(param, x303127_var_Clear_Date_Value)	--原始值清零
	param = x303127_bit_or_operate(curWeekIndex, param)
	SetGuildParamEx(varMap, varPlayer, guildId, x303127_var_GD_Index, param)
end

--获取开双标志
function x303127_GetOpenDoubleExpMark(varValue)
	local tOpenDoubleMark = x303127_bit_and_operate(varValue, x303127_var_OpenDouble_Value)
	local openDoubleMark = x303127_bit_move_rigth(tOpenDoubleMark, MARK_BIT_OPEN_DOUBLE_EXP[1] - MARK_BIT_OPEN_DOUBLE_EXP[2])
	return openDoubleMark
end

--设置开双标记 varValue为0或者1
function x303127_SetOpenDoubleExpMark(varMap, varPlayer, varValue)
	local guildId = GetGuildID(varMap, varPlayer)
	local param = GetGuildParamEx(varMap, varPlayer, guildId, x303127_var_GD_Index)
	param = x303127_bit_and_operate(param, x303127_var_Clear_OpenDouble_Value)	--原始值清零
	param = x303127_bit_or_operate(param, x303127_bit_move_left(varValue, MARK_BIT_OPEN_DOUBLE_EXP[1] - 1))
	SetGuildParamEx(varMap, varPlayer, guildId, x303127_var_GD_Index, param)
end

function x303127_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

  if GetGameOpenById( x303127_var_GameOpen ) <= 0 then
    return
  end
	
  if GetMergeDBToggle() == 1 then
    return
  end
      
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end

	local guild = GetGuildID(varMap, varPlayer)
	if guild == -1 then
		return 1
	end
	
	local varValue = GetGuildParamEx(varMap, varPlayer, guild, x303127_var_GD_Index)
	local guildForwardWeekIndex = x303127_GetForwardWeekIndex(varValue)
	local hasForward = x303127_GetForwardMark( varValue )
	local hasOpenDouble = x303127_GetOpenDoubleExpMark(varValue)
	local offcial = GetGuildOfficial(varMap, varPlayer)
	
	
	if (x303127_var_PrintDebugLog == 1) then
		WriteLog(1, 
		format("x303127_ProcEnumEvent Debug --- varValue = %d, guildForwardWeekIndex = %d, hasForward = %d, hasOpenDouble = %d", 
				varValue, guildForwardWeekIndex, hasForward, hasOpenDouble))
	end
	
	local currWeekIndex = GetWeekIndex()
	if (guildForwardWeekIndex <= currWeekIndex
			and (guildForwardWeekIndex + 12) > currWeekIndex
			and hasForward == 1 
			and hasOpenDouble == 0
			and offcial == x303127_var_Guild_Leader_Offcail) then
		TalkAppendButton(varMap, x303127_var_FileId, x303127_var_QuestName2, 3, 2);
	end
	
	local curWeek = MGuildBattleSeasonWeek()
	local curCount = GetMGuildNumOfBattleCurSeason()
	if ( curWeek ~= 12 or curCount ~= 24 ) then
		return 1
	end

	TalkAppendButton(varMap, x303127_var_FileId,x303127_var_QuestName1, 3, 1);
	
end

function x303127_ProcEventEntry( varMap, varPlayer, varTalknpc, idScript, idExt )
	
  if GetMergeDBToggle() == 1 then
    return
  end
      
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
  local guild = GetGuildID(varMap, varPlayer)
	if guild == -1 then
		return
	end
	
	local curWeek = MGuildBattleSeasonWeek()
	local curCount = GetMGuildNumOfBattleCurSeason()
	
	local offcial = GetGuildOfficial(varMap, varPlayer)
	
	if ( idExt == 1 ) then			--领取奖励
		if ( curWeek ~= 12 or curCount ~= 24 ) then
			return 1
		end
		
		x303127_ProcObtainForward(varMap, varPlayer)		
	elseif ( idExt == 2 and offcial == x303127_var_Guild_Leader_Offcail ) then
		--x303127_ProcOpenDoubleExp(varMap, varPlayer)
	local Readme_1   = "#Y【奖励】开启跨服帮会战场全服双倍#W"
    local Readme_2   = " 跨服帮会战场全服双倍奖励，请务必在#G下个赛季第12周之前#W使用。"
    local Readme_3   = " 确定要开启跨服帮会战场全服双倍吗？"
    
    x303127_var_QuestContent_1 = Readme_1
		x303127_var_QuestContent_2 = Readme_2
		x303127_var_QuestContent_3 = Readme_3

    StartTalkTask( varMap )
    TalkAppendString( varMap, x303127_var_QuestContent_1 )
    TalkAppendString( varMap, x303127_var_QuestContent_2 )
    TalkAppendString( varMap, x303127_var_QuestContent_3 )
    StopTalkTask( varMap )
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x303127_var_FileId, -1 )
		
	end
	
	return 1
	
end

function x303127_ProcAccept( varMap, varPlayer )
	local offcial = GetGuildOfficial(varMap, varPlayer)

	if ( offcial == x303127_var_Guild_Leader_Offcail ) then
		x303127_ProcOpenDoubleExp(varMap, varPlayer)
	end
end

--开双的实现
function x303127_ProcOpenDoubleExp(varMap, varPlayer)

	local guid = GetGUID(varMap, varPlayer)
	local currWeekIndex = GetWeekIndex()
	
	local guildId = GetGuildID(varMap, varPlayer)
	local varValue = GetGuildParamEx(varMap, varPlayer, guildId, x303127_var_GD_Index)
	local guildForwardWeekIndex = x303127_GetForwardWeekIndex(varValue)
	local hasForward = x303127_GetForwardMark( varValue )
	local hasOpenDouble = x303127_GetOpenDoubleExpMark(varValue)
	if(x303127_var_PrintInfoLog == 1) then
		WriteLog(1, format("x303127_ProcOpenDoubleExp ---varMap = %d, playerGuid = %d, guildId = %d, hasForward = %d, hasOpenDouble = %d", 
						varMap, guid, guildId, hasForward, hasOpenDouble))
	end
	
	if (guildForwardWeekIndex <= currWeekIndex
			and (guildForwardWeekIndex + 12) > currWeekIndex 
			and hasForward == 1 
			and hasOpenDouble == 0) then	--满足开双条件
		
		ModifyConfig(varMap, varPlayer, 2, 2.0, 3600, x303127_var_FileId, "ProcOpenDoubleExpRecall", -1)
	else
		Msg2Player(varMap, varPlayer, "您所在的帮会已经开过双倍经验", 0, 2)
		Msg2Player(varMap, varPlayer, "您所在的帮会已经开过双倍经验", 0, 3)
	end

end

--领取奖励的实现
function x303127_ProcObtainForward(varMap, varPlayer)

	local curWeek = MGuildBattleSeasonWeek()
	local curCount = GetMGuildNumOfBattleCurSeason()
	local guid = GetGUID(varMap, varPlayer)
	
	if(x303127_var_PrintInfoLog == 1) then
		WriteLog(1, format("x303127_ProcObtainForward ---varMap = %d, curWeek = %d, curCount = %d, playerGuid = %d", 
						varMap, curWeek, curCount, guid))
	end
	
	if ( curWeek ~= 12 or curCount ~= 24 ) then
		Msg2Player(varMap, varPlayer, "请在规定时间内领取奖励", 0, 2)
		Msg2Player(varMap, varPlayer, "请在规定时间内领取奖励", 0, 3)
		return
	end
		
	local curWeekIndex = GetWeekIndex()			--获取当前周索引数
	local forwardWeekIndex = GetPlayerGameData(varMap, varPlayer, MD_MGUILDBATTLE_FORWARD_SEASONWEEK[1]
																		, MD_MGUILDBATTLE_FORWARD_SEASONWEEK[2], MD_MGUILDBATTLE_FORWARD_SEASONWEEK[3]);

	if (forwardWeekIndex == curWeekIndex) then
		Msg2Player(varMap, varPlayer, "您已经领取过奖励了", 0, 2)
		Msg2Player(varMap, varPlayer, "您已经领取过奖励了", 0, 3)
		return
	end

	local varGuildID = GetGuildID( varMap, varPlayer )
	local varGuildName = GetGuildName( varGuildID )
	
	local nWorldId = GetWorldIdEx()
	local nCount = GetToplistCount( nWorldId, x303127_var_Toplist1 )
	
	if(x303127_var_PrintDebugLog == 1) then
		WriteLog(1, format("x303127_ProcObtainForward ---varGuildID = %d, varGuildName = %s, toplistCount = %d", 
						varGuildID, varGuildName, nCount))
	end
	
	local snid, key, country, name, guidname, snguid, matchcount, serverID, week
	
	local hasGetForward = 0			--是否获取到奖励的标识
	
	for varI = 0, (nCount - 1) do
	 
		snid, key, country, name, guidname, snguid, matchcount, serverID, week = GetToplistInfo( nWorldId, x303127_var_Toplist1, varI )
		
		if(x303127_var_PrintDebugLog == 1) then
			WriteLog(1, format("x303127_ProcObtainForward ---snid = %d, key = %d, country = %d, guidname = %s", 
							snid, key, country, guidname))
		end
		
		if ( varGuildName == guidname and nWorldId == serverID ) then
			if (varI < 20) then --前20名,给予称号奖励
				x303127_ProcGivenTitleForward(varMap, varPlayer, varI)
			else
				Msg2Player(varMap, varPlayer, "很遗憾，您所在的帮会没能进入排行榜前20，不能领取称号奖励", 0, 2)
				Msg2Player(varMap, varPlayer, "很遗憾，您所在的帮会没能进入排行榜前20，不能领取称号奖励", 0, 3)
			end
			
			x303127_ProcGivenOpenDoublePower(varMap, varPlayer, varI)
			hasGetForward = 1
			break
		end
	end
	
	if (hasGetForward == 0) then
		Msg2Player(varMap, varPlayer, "很遗憾，您所在的帮会没能进入排行榜，下个赛季请继续加油", 0, 2)
		Msg2Player(varMap, varPlayer, "很遗憾，您所在的帮会没能进入排行榜，下个赛季请继续加油", 0, 3)
	end
end

--给予开双权限
function x303127_ProcGivenOpenDoublePower(varMap, varPlayer, varI)
	--如果是帮主,判断是否已经在GD中记录,如果没有记录,则记录奖励标志,为开双使用,以免换帮主可以重复开双
	
	local guid = GetGUID(varMap, varPlayer)
	local offcial = GetGuildOfficial(varMap, varPlayer)
	if(x303127_var_PrintInfoLog == 1) then
		WriteLog(1, format("x303127_ProcGivenOpenDoublePower --- varMap = %d, guid = %d, offcial = %d",	
					varMap, guid, offcial))
	end
	
	if (offcial == x303127_var_Guild_Leader_Offcail) then 
		local guildId = GetGuildID(varMap, varPlayer)
		local varValue = GetGuildParamEx(varMap, varPlayer, guildId, x303127_var_GD_Index)
		local forwardWeekIndex = x303127_GetForwardWeekIndex(varValue)
		local curWeekIndex = GetWeekIndex()		
		
		if(x303127_var_PrintInfoLog == 1) then
			WriteLog(1, format("x303127_ProcGivenOpenDoublePower --- Leader Obtain Forward... varValue = %d, forwardWeekIndex = %d, curWeekIndex = %d",	
						varValue, forwardWeekIndex, curWeekIndex))
		end
		
		if (forwardWeekIndex ~= curWeekIndex) then
			x303127_SetWeekIndex(varMap, varPlayer)							--设置当前索引
			
			if (x303127_GetForwardMark( varValue ) == 0) then
				x303127_SetForwardMark(varMap, varPlayer, 1)			--已经领取过
			end
			
			if (x303127_GetOpenDoubleExpMark(varValue) == 1) then
				x303127_SetOpenDoubleExpMark(varMap, varPlayer, 0)	--标识可以开双
			end
			
			Msg2Player(varMap, varPlayer, "您领取了跨服帮会战全服开双奖励", 0, 2)
			Msg2Player(varMap, varPlayer, "您领取了跨服帮会战全服开双奖励", 0, 3)
			
		end

		return
	end
	
end


--给与奖励的处理
function x303127_ProcGivenTitleForward(varMap, varPlayer, varRank)
	
	local guid = GetGUID(varMap, varPlayer)
	local offcial = GetGuildOfficial(varMap, varPlayer)
	if(x303127_var_PrintInfoLog == 1) then
		WriteLog(1, format("x303127_ProcGivenForward --- varMap = %d, guid = %d, offcial = %d",	
					varMap, guid, offcial))
	end
	
	if ( offcial ~= x303127_var_Guild_Leader_Offcail ) then --判断是否为帮主,如果不是帮主,则统一帮众奖励
		offcial = x303127_var_Guild_Other_Member_Offcail
	end
	
	local guildId = GetGuildID(varMap, varPlayer)
	local varValue = GetGuildParamEx(varMap, varPlayer, guildId, x303127_var_GD_Index)
	local forwardWeekIndex = x303127_GetForwardWeekIndex(varValue)
	local curWeekIndex = GetWeekIndex()
	
	if ( offcial == x303127_var_Guild_Leader_Offcail and forwardWeekIndex == curWeekIndex ) then
		offcial = x303127_var_Guild_Other_Member_Offcail
		Msg2Player(varMap, varPlayer, "很遗憾，前任帮主已经领取过帮主称号奖励了", 0, 2)
		Msg2Player(varMap, varPlayer, "很遗憾，前任帮主已经领取过帮主称号奖励了", 0, 3)
	end
	
	local offcicalTabel = x303127_var_Aword[offcial]
	if (offcicalTabel == nil) then
		WriteLog(1, format("x303127_ProcGivenForward ERROR!!! offcicalTabel is nil!!! offcial = %d", offcial))
	end
	
	local tempRank = -1
	if (varRank < 1) then
		tempRank = 1
	elseif (varRank < 2) then
		tempRank = 2
	elseif (varRank < 3) then
		tempRank = 3
	elseif (varRank < 10) then
		tempRank = 4
	elseif (varRank < 20) then
		tempRank = 5
	end
	
	if (tempRank == -1 or tempRank > getn(offcicalTabel)) then
		WriteLog(1, format("x303127_ProcGivenForward ERROR!!! tempRank is invalid!!! tempRank = %d", tempRank))
	end
	
	AwardTitle( varMap, varPlayer, offcicalTabel[tempRank])
	
	local curWeekIndex = GetWeekIndex()			--获取当前周索引数
	SetPlayerGameData(varMap, varPlayer, MD_MGUILDBATTLE_FORWARD_SEASONWEEK[1]
								, MD_MGUILDBATTLE_FORWARD_SEASONWEEK[2], MD_MGUILDBATTLE_FORWARD_SEASONWEEK[3], curWeekIndex);
	
end

function x303127_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


--开双回调
function x303127_ProcOpenDoubleExpRecall(varMap, varPlayer, varResult)
	--WriteLog(1, format("x303127_ProcOpenDoubleExpRecall --- varMap = %d, varPlayer = %d, varResult = %d",
	--varMap, varPlayer, varResult))
				 
	local varGuildID = GetGuildID( varMap, varPlayer )
	local varGuildName = GetGuildName( varGuildID )
	local varName = GetName( varMap, varPlayer )
				 
	if ( varResult == 1 ) then
		local varMsg1 = format(varGuildName.."的帮主"..varName.."开起了双倍令。")
		LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
		x303127_SetOpenDoubleExpMark(varMap, varPlayer, 1)	--标识可以开双
	elseif ( varResult == 0 ) then
		local varMsg1 = format("很抱歉，您现在不能开起双倍令。")
		LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
		LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
	end
	
end
