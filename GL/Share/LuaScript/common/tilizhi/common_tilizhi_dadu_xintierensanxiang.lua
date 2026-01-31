--DECLARE_QUEST_INFO_START--
x330004_var_FileId          			= 330004
x330004_var_QuestName       			= "【体力】完成新铁人三项"
x330004_var_QuestInfo					= "\t我也知道生命的活力在于锻炼，但用体力值直接完成#R铁人三项#W也是个不错的选择啊！我保证，奖励方面我不会亏待你的。"
x330004_var_QuestSuggest				= "\t如果你今天已经领取了#R新铁人三项#W任务，就不能用消耗体力值的方式完成任务，当然，如果你选择了用体力值直接完成任务，也不可再领取#R新铁人三项#W任务。"
x330004_var_QuestId 					= {7537,7538,7539,7551,7552}
x330004_var_QuestCommentCountOver  		= "你今天不能再领取任务了，明天再来吧。"
x330004_var_ExpParam					= 7000
x330005_var_ShengWang					= 200
x330004_var_Prestige					= 200
x330004_var_Level								= 40
x330004_var_LevelLess 					= 65
x330004_var_PlayerPhyForce				= 60
x330004_var_QuestName1          ="#cb4b4b4【体力】完成新铁人三项"
--DECLARE_QUEST_INFO_STOP--

function x330004_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetMonsterGUID(varMap, varTalknpc) == 139093 then		--体力值减负大师处不显示此按钮，改为分页
		return
	end
	if GetLevel(varMap, varPlayer) < x330004_var_Level then
		return
	end
	if x330004_GetMD( varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY) ~= GetDayOfYear()  and x330004_IsHaveMission( varMap, varPlayer)  == -1 then
		TalkAppendButton(varMap, x330004_var_FileId, x330004_var_QuestName, 3, 1)
		else
		TalkAppendButton(varMap, x330004_var_FileId, x330004_var_QuestName1, 3, 1)
	end
end


function x330004_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)
	local varExp = GetLevel(varMap, varPlayer) * x330004_var_ExpParam

	StartTalkTask(varMap)

		--任务信息
		TalkAppendString(varMap,"#Y"..x330004_var_QuestName)
		TalkAppendString(varMap,format("%s\n \n\t扣除#R60#W点体力值，直接完成#R新铁人三项#W任务。你将获得#R经验值#W#G%s#W点、#R声望#W#G%s#W点奖励。", x330004_var_QuestInfo, varExp, x330005_var_ShengWang))
		TalkAppendString(varMap," ")

		--提示信息
		TalkAppendString( varMap,"#G小提示：")
		TalkAppendString( varMap,format("%s", x330004_var_QuestSuggest))
		TalkAppendString( varMap," ")

		--奖励信息
		TalkAppendString( varMap,"#Y奖励内容：")
		TalkAppendString( varMap,format("经验值：%s点\n声望：%s点", varExp, x330005_var_ShengWang))		
		TalkAppendString( varMap," ")		

		
	StopTalkTask(varMap)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x330004_var_FileId, -1)

end



function x330004_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	if GetLevel(varMap, varPlayer) < x330004_var_LevelLess then
		local str =format("您的等级不足#R%d级#cffcf00，还不能使用此功能", x330004_var_LevelLess)
		Msg2Player( varMap, varPlayer, str, 8, 3)
		return
	end
		
--	if IsQuestHaveDone(varMap, varPlayer, 1401) <= 0 then
--		Msg2Player( varMap, varPlayer, "请在#G帝国嘉奖使#cffcf00处先完成任务【个人】铁人三项的挑战", 8, 2)
--		Msg2Player( varMap, varPlayer, "请在#G帝国嘉奖使#cffcf00处先完成任务【个人】铁人三项的挑战", 8, 3)		
--		return 
--	end
	if x330004_IsHaveMission( varMap, varPlayer)  == 1 then
		Msg2Player( varMap, varPlayer, x330004_var_QuestCommentCountOver, 8, 2)
		Msg2Player( varMap, varPlayer, x330004_var_QuestCommentCountOver, 8, 3)
		return
	end

	if x330004_GetMD( varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY) == GetDayOfYear() then
		Msg2Player( varMap, varPlayer, x330004_var_QuestCommentCountOver, 8, 2)
		Msg2Player( varMap, varPlayer, x330004_var_QuestCommentCountOver, 8, 3)
		return
	end
	
	if GetPlayerPhysicalForce( varMap, varPlayer) < x330004_var_PlayerPhyForce then
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 2)
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 3)
		return	
	end	
	x330004_GetPlayerAward(varMap, varPlayer)	
	x330004_SetMD( varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY, GetDayOfYear())

end

function x330004_GetPlayerAward(varMap, varPlayer)
	local varExp = GetLevel(varMap, varPlayer) * x330004_var_ExpParam
	local curForce = GetPlayerPhysicalForce( varMap, varPlayer)
	SetPlayerPhysicalForce(varMap, varPlayer, curForce - x330004_var_PlayerPhyForce)	
 	AddExp(varMap, varPlayer, varExp)
 	SetShengWang(varMap, varPlayer, GetShengWang( varMap, varPlayer) + x330005_var_ShengWang)
 	GamePlayScriptLog( varMap, varPlayer, 3082)
 	local varMessage = format("获得经验奖励：#R%s#cffcf00点\n获得声望奖励：#R%s#cffcf00点", varExp,x330005_var_ShengWang)
 	Msg2Player( varMap, varPlayer, format("已经完成任务：%s",x330004_var_QuestName), 8, 2) 
	Msg2Player( varMap, varPlayer, varMessage, 8, 2)
  StartTalkTask(varMap)
  TalkAppendString(varMap,format("你完成了任务：%s",x330004_var_QuestName));
  StopTalkTask(varMap) 
  DeliverTalkTips(varMap,varPlayer)
  StartTalkTask(varMap)
  TalkAppendString(varMap,"获得#R经验"..varExp.."#cffcf00点的奖励")
  StopTalkTask(varMap)
  DeliverTalkTips(varMap,varPlayer)
  StartTalkTask(varMap)    
  TalkAppendString(varMap,"获得#R声望奖励"..x330005_var_ShengWang.."#cffcf00点的奖励")
  StopTalkTask(varMap)        
  DeliverTalkTips(varMap,varPlayer) 	
		--增加消耗的额外经验加成
	local multi = x330004_IsMulti( varMap, varPlayer)
	if multi > 0 then
		AddExp( varMap, varPlayer, floor(varExp*multi))
		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(varExp*multi)), 8, 2)
		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(varExp*multi)), 8, 3)
	end   
   	
end


function x330004_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x330004_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end

function x330004_IsHaveMission( varMap, varPlayer)
	for i, item in x330004_var_QuestId do
		if IsHaveQuest( varMap, varPlayer, item) == 1 then
			return 1
		end
	end
	return -1
end

function x330004_ProcEnumEventForMenu(varMap, varPlayer, varTalknpc, varQuest)
	if GetLevel(varMap, varPlayer) < x330004_var_Level then
		return 0
	end
	if x330004_GetMD( varMap, varPlayer, MD_TIEREN_ACCEPTTIME_DAY) ~= GetDayOfYear()  and x330004_IsHaveMission( varMap, varPlayer)  == -1 then
		TalkAppendButton(varMap, x330004_var_FileId, x330004_var_QuestName, 3, 1)
		else
		TalkAppendButton(varMap, x330004_var_FileId, x330004_var_QuestName1, 3, 1)
	end
	return 1
end

function x330004_IsMulti( varMap, varPlayer)
local MaxLevel = GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) )
local MinLevel = GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) )
local Level = GetLevel( varMap, varPlayer)
local Dislevel = MinLevel - Level - 10
	if MaxLevel >= 75 then
		if Dislevel > 0 then
			if Level < 50 then
				local multi50 = Dislevel/10
				return multi50
			elseif Level >= 50 and Level < 60 then
				local multi60 = Dislevel*2/10
				return multi60
			elseif Level >= 60 and Level < 75 then
				local multi70 = Dislevel*4/10
				return multi70
			elseif Level >= 75 and Level < 90 then
				local multi80 = Dislevel*8/10
				return multi80
			else 
				return 0
			end
		end
		return 0
	end
	return 0
end
