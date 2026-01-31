--DECLARE_QUEST_INFO_START--
x330006_var_FileId          			= 330006
x330006_var_QuestName       			= "【体力】完成大都灯谜会"
x330006_var_QuestInfo					= "\t太多的思考容易让你变得文弱，不如用体力值直接完成#R大都灯谜会#W，用更多的时间来锻炼你的体魄。"
x330006_var_QuestSuggest				= "\t如果你今天已经领取了#R大都灯谜会#W任务，就不能用消耗体力值的方式完成任务，当然，如果你选择了用体力值直接完成任务，也不可再领取#R大都灯谜会#W任务。"
x330006_var_QuestId 					= 9315
x330006_var_QuestCommentCountOver  		= "你今天不能再领取任务了，明天再来吧。"
x330006_var_ExpParam					= 7000
x330006_var_Prestige					= 25
x330006_var_MoneyParam					= 300
x330006_var_Level								= 40
x330006_var_LevelLess 					= 65
x330006_var_PlayerPhyForce				= 90
x330006_var_QuestName1          		= "#cb4b4b4【体力】完成大都灯谜会"
--DECLARE_QUEST_INFO_STOP--


function x330006_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetMonsterGUID(varMap, varTalknpc) == 139093 then		--体力值减负大师处不显示此按钮，改为分页
		return
	end
	if GetLevel(varMap, varPlayer) < x330006_var_Level then
		return
	end
	if x330006_GetMD( varMap, varPlayer, MD_DENGMI_DATE) ~= GetDayOfYear()  and IsHaveQuest( varMap, varPlayer, x330006_var_QuestId) <= 0 then	
		TalkAppendButton(varMap, x330006_var_FileId, x330006_var_QuestName, 3, 1)
	else 
	  	TalkAppendButton(varMap, x330006_var_FileId, x330006_var_QuestName1, 3, 1)
	end
end


function x330006_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)
	local varExp = GetLevel(varMap, varPlayer) * x330006_var_ExpParam
	local varMoney = GetLevel(varMap, varPlayer) * x330006_var_MoneyParam	
	StartTalkTask(varMap)

		--任务信息
		TalkAppendString(varMap,"#Y"..x330006_var_QuestName)
		TalkAppendString(varMap,format("%s\n \n\t扣除#R90#W点体力值，直接完成#R大都灯谜会#W任务。你将获得#R经验值#W#G%s#W点、#R银卡#W#G#{_MONEY%d}#W奖励。", x330006_var_QuestInfo, varExp, varMoney))
		TalkAppendString(varMap," ")

		--提示信息
		TalkAppendString( varMap,"#G小提示：")
		TalkAppendString( varMap,format("%s", x330006_var_QuestSuggest))
		TalkAppendString( varMap," ")
		varMoney =format("#{_MONEY%d}",varMoney)		
		--奖励信息
		TalkAppendString( varMap,"#Y奖励内容：")
		TalkAppendString( varMap,format("经验值：%s点\n银卡：%s", varExp, varMoney))		
		TalkAppendString( varMap," ")		

		
	StopTalkTask(varMap)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x330006_var_FileId, -1)
	
end



function x330006_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
--	if IsQuestHaveDone(varMap, varPlayer, 1402) <= 0 then
--		Msg2Player( varMap, varPlayer, "请先在#G帝国嘉奖使#cffcf00处完成任务【个人】大都灯谜会的冠军", 8, 2)
--		Msg2Player( varMap, varPlayer, "请先在#G帝国嘉奖使#cffcf00处完成任务【个人】大都灯谜会的冠军", 8, 3)		
--		return 
--	end
	if GetLevel(varMap, varPlayer) < x330006_var_LevelLess then
		local str =format("您的等级不足#R%d级#cffcf00，还不能使用此功能", x330006_var_LevelLess)
		Msg2Player( varMap, varPlayer, str, 8, 3)
		return
	end
		
	if IsHaveQuest( varMap, varPlayer, x330006_var_QuestId) > 0 then
		Msg2Player( varMap, varPlayer, x330006_var_QuestCommentCountOver, 8, 2)
		Msg2Player( varMap, varPlayer, x330006_var_QuestCommentCountOver, 8, 3)
		return
	end

	if x330006_GetMD( varMap, varPlayer, MD_DENGMI_DATE) == GetDayOfYear() then
		Msg2Player( varMap, varPlayer, x330006_var_QuestCommentCountOver, 8, 2)
		Msg2Player( varMap, varPlayer, x330006_var_QuestCommentCountOver, 8, 3)
		return
	end
	
	if GetPlayerPhysicalForce( varMap, varPlayer) < x330006_var_PlayerPhyForce then
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 2)
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 3)
		return	
	end	
	x330006_GetPlayerAward(varMap, varPlayer)	
	x330006_SetMD( varMap, varPlayer, MD_DENGMI_DATE, GetDayOfYear())	
end


function x330006_GetPlayerAward(varMap, varPlayer)
	local varExp = GetLevel(varMap, varPlayer) * x330006_var_ExpParam
	local curForce = GetPlayerPhysicalForce( varMap, varPlayer)
	SetPlayerPhysicalForce(varMap, varPlayer, curForce - x330006_var_PlayerPhyForce)	
 	AddExp(varMap, varPlayer, varExp)
	local varMoney = GetLevel(varMap, varPlayer) * x330006_var_MoneyParam
	AddMoney( varMap, varPlayer, 1, varMoney)	
	GamePlayScriptLog( varMap, varPlayer, 3081)
 	local varMessage = format("获得经验奖励：#R%s#cffcf00点\n获得银卡奖励：#R#{_MONEY%d}.", varExp, varMoney)
 	Msg2Player( varMap, varPlayer, format("已经完成任务：%s",x330006_var_QuestName), 8, 2) 
	Msg2Player( varMap, varPlayer, varMessage, 8, 2)
  StartTalkTask(varMap)
  TalkAppendString(varMap,format("你完成了任务：%s",x330006_var_QuestName));
  StopTalkTask(varMap) 
  DeliverTalkTips(varMap,varPlayer)
  StartTalkTask(varMap)
  TalkAppendString(varMap,"获得#R经验"..varExp.."#cffcf00点的奖励")
  StopTalkTask(varMap)
  DeliverTalkTips(varMap,varPlayer)
  StartTalkTask(varMap)    
  TalkAppendString(varMap,format("获得#R银卡奖励#R#{_MONEY%d}#cffcf00的奖励",varMoney))
  StopTalkTask(varMap)        
  DeliverTalkTips(varMap,varPlayer)  	
  local multi = x330006_IsMulti( varMap, varPlayer)
	if multi > 0 then
		AddExp( varMap, varPlayer, floor(varExp*multi))
		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(varExp*multi)), 8, 2)
		Msg2Player( varMap, varPlayer, format( "低于排行榜最后一名10级，额外获得#R%s#cffcc00点经验奖励。", floor(varExp*multi)), 8, 3)
	end 
end



function x330006_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x330006_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end

function x330006_ProcEnumEventForMenu(varMap, varPlayer, varTalknpc, varQuest)
	if GetLevel(varMap, varPlayer) < x330006_var_Level then
		return 0
	end
	if x330006_GetMD( varMap, varPlayer, MD_DENGMI_DATE) ~= GetDayOfYear()  and IsHaveQuest( varMap, varPlayer, x330006_var_QuestId) <= 0 then	
		TalkAppendButton(varMap, x330006_var_FileId, x330006_var_QuestName, 3, 1)
	else 
	  	TalkAppendButton(varMap, x330006_var_FileId, x330006_var_QuestName1, 3, 1)
	end
	return 1
end

function x330006_IsMulti( varMap, varPlayer)
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
