--DECLARE_QUEST_INFO_START--
x330028_var_FileId          			= 330028
x330028_var_QuestName       			= "【体力】完成校场练兵"
x330028_var_QuestInfo					= "\t年轻人，如果你觉得自己足够强大，而且又忙于别的事情，那我劝你用体力值直接完成校场练兵的任务吧。"
x330028_var_QuestSuggest				= "\t如果你今天已经领取了#R校场练兵#W任务，就不能用消耗体力值的方式完成任务，当然，如果你选择了用体力值直接完成任务，也不可再领取#R校场练兵#W任务。"
x330028_var_QuestId						= 9209
x330028_var_QuestCommentCountOver  		= "你今天不能再领取任务了，明天再来吧。"
x330028_var_ExpParam					= 22000
x330028_var_CountryRes					= 1
x330028_var_CangBaoTu					= 12035017
x330028_var_Level			 					= 60
x330028_var_LevelLess 					= 70
x330028_var_PlayerPhyForce				= 150
x330028_var_QuestName1          = "#cb4b4b4【体力】完成校场练兵"

--DECLARE_QUEST_INFO_STOP--


function x330028_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetMonsterGUID(varMap, varTalknpc) == 139093 then		--体力值减负大师处不显示此按钮，改为分页
		return
	end
	if GetLevel(varMap, varPlayer) < x330028_var_Level then
		return
	end
	if x330028_GetMD( varMap, varPlayer, MD_SHABAKE_XIAOJUNCHANG_DATE) ~= GetDayOfYear() and IsHaveQuest( varMap, varPlayer, x330028_var_QuestId) <= 0 then
		TalkAppendButton(varMap, x330028_var_FileId, x330028_var_QuestName, 3, 1)
	else 
	  TalkAppendButton(varMap, x330028_var_FileId, x330028_var_QuestName1, 3, 1)
	end
end


function x330028_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)
	local varExp = GetLevel(varMap, varPlayer) * x330028_var_ExpParam	
	StartTalkTask(varMap)

		--任务信息
		TalkAppendString(varMap,"#Y"..x330028_var_QuestName)
		TalkAppendString(varMap,format("%s\n\t需要扣除#R150#W点体力值，，直接完成#R校场练兵#W任务。你将获得#R经验值#W#G%s#W点、#R国家资源#W#G%s#W点奖励。", x330028_var_QuestInfo, varExp, x330028_var_CountryRes))
		TalkAppendString(varMap," ")

		--提示信息
		TalkAppendString( varMap,"#G小提示：")
		TalkAppendString( varMap,format("%s", x330028_var_QuestSuggest))
		TalkAppendString( varMap," ")

		--奖励信息
		TalkAppendString( varMap,"#Y奖励内容：")
		TalkAppendString( varMap,format("经验值：%s点\n国家资源：%s点", varExp, x330028_var_CountryRes))		
		TalkAppendString( varMap," ")		

		
	StopTalkTask(varMap)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x330028_var_FileId, -1)

end



function x330028_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	if GetLevel(varMap, varPlayer) < x330028_var_LevelLess then
		local str =format("您的等级不足#R%d级#cffcf00，还不能使用此功能", x330028_var_LevelLess)
		Msg2Player( varMap, varPlayer, str, 8, 3)
		return
	end
--	if IsQuestHaveDone(varMap, varPlayer, 1406) <= 0 then
--		Msg2Player( varMap, varPlayer, "请先在#G帝国嘉奖使#cffcf00处完成任务【个人】沙城日常的进阶", 8, 2)
--		Msg2Player( varMap, varPlayer, "请先在#G帝国嘉奖使#cffcf00处完成任务【个人】沙城日常的进阶", 8, 3)		
--		return 
--	end
	
	if IsHaveQuest( varMap, varPlayer, x330028_var_QuestId) > 0 then
		Msg2Player( varMap, varPlayer, x330028_var_QuestCommentCountOver, 8, 2)
		Msg2Player( varMap, varPlayer, x330028_var_QuestCommentCountOver, 8, 3)
		return
	end	
			

	if x330028_GetMD( varMap, varPlayer, MD_SHABAKE_XIAOJUNCHANG_DATE) == GetDayOfYear() then
		Msg2Player( varMap, varPlayer, x330028_var_QuestCommentCountOver, 8, 2)
		Msg2Player( varMap, varPlayer, x330028_var_QuestCommentCountOver, 8, 3)
		return
	end
	
	if GetPlayerPhysicalForce( varMap, varPlayer) < x330028_var_PlayerPhyForce then
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 2)
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 3)
		return	
	end	
	x330028_GetPlayerAward(varMap, varPlayer)	
	x330028_SetMD( varMap, varPlayer, MD_SHABAKE_XIAOJUNCHANG_DATE, GetDayOfYear())
end


function x330028_GetPlayerAward(varMap, varPlayer)
	local curForce = GetPlayerPhysicalForce( varMap, varPlayer)
	SetPlayerPhysicalForce(varMap, varPlayer, curForce - x330028_var_PlayerPhyForce)
	local varExp = GetLevel(varMap, varPlayer) * x330028_var_ExpParam
 	AddExp(varMap, varPlayer, varExp)
	local countryId = GetCurCountry(varMap, varPlayer)	
	AddCountryResourceWithRecall(varMap, countryId, 1, 1, x330028_var_FileId, "ProcRequestNpcBuffSubResValid", varPlayer) 
	GamePlayScriptLog( varMap, varPlayer, 3114)
	
	local varRand = random(1, 100)
	if varRand == 1 then
	    StartItemTask( varMap)
	    ItemAppendBind( varMap, x330028_var_CangBaoTu, 1)
	    if GetBagSpace(varMap, varPlayer) < 1 then
	        Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 3)
	        Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 2)
	        return
	    end
	    DeliverItemListSendToPlayer( varMap, varPlayer)	
	    local varName = GetName( varMap, varPlayer)
	    LuaAllScenceM2Wrold(varMap, varName.."使用体力值完成【校场练兵】任务时幸运获得黄金藏宝图碎片", CHAT_PLANE_SCROLL, 1)
	    Msg2Player( varMap, varPlayer, "额外获得黄金藏宝图碎片", 8, 2)
		  Msg2Player( varMap, varPlayer, "额外获得黄金藏宝图碎片", 8, 3) 
	end	
end

function x330028_ProcRequestNpcBuffSubResValid( varMap ,varCountry, varIndex, varResult, varPlayer)
	local varExp = GetLevel(varMap, varPlayer) * x330028_var_ExpParam
	if varResult == 1 then
	 	local varMessage = format("获得经验奖励：#R%s#cffcf00点\n你的国家增加#R1#cffcf00石粮草资源.", varExp)
	 	Msg2Player( varMap, varPlayer, format("已经完成任务：%s",x330028_var_QuestName), 8, 2) 
		Msg2Player( varMap, varPlayer, varMessage, 8, 2)
    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务：%s",x330028_var_QuestName));
    StopTalkTask(varMap) 
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..varExp.."#cffcf00点的奖励")
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)    
    TalkAppendString(varMap,"获得#R国家粮草资源"..x330028_var_CountryRes.."#cffcf00点的奖励")
    StopTalkTask(varMap)        
    DeliverTalkTips(varMap,varPlayer) 			
		return
	else
		AddCountryResourceWithRecall(varMap, varCountry, 1, 1, x330028_var_FileId, "ProcRequestNpcBuffSubResValid", varPlayer)    
	end
end

function x330028_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x330028_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end

function x330028_ProcEnumEventForMenu(varMap, varPlayer, varTalknpc, varQuest)
	if GetLevel(varMap, varPlayer) < x330028_var_Level then
		return	0
	end
	if x330028_GetMD( varMap, varPlayer, MD_SHABAKE_XIAOJUNCHANG_DATE) ~= GetDayOfYear() and IsHaveQuest( varMap, varPlayer, x330028_var_QuestId) <= 0 then
		TalkAppendButton(varMap, x330028_var_FileId, x330028_var_QuestName, 3, 1)
	else 
	  TalkAppendButton(varMap, x330028_var_FileId, x330028_var_QuestName1, 3, 1)
	end
	return 1
end
