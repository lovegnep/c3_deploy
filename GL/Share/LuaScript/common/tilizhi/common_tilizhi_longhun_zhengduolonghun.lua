--DECLARE_QUEST_INFO_START--
x330044_var_FileId          			= 330044
x330044_var_QuestName       			= "【体力】完成争夺龙魂"
x330044_var_QuestInfo					= "\t想必你一定知道各国龙魂争夺之事，如果你无法分身亲自去争夺，不如在我这里用体力值来完成。"
x330044_var_QuestSuggest				= "\t当你今天已经领取了争夺龙魂任务，就不可以用体力值兑换完成了。当然，如果你今天使用了体力值兑换完成争夺龙魂任务，也不可以再领取争夺龙魂任务了。"
x330044_var_QuestId						= {10304,10329,10330,10331}
x330044_var_QuestCommentCountOver  		= "你今天不能再领取任务了，明天再来吧。"
x330044_var_ExpParam					= 12000
x330044_var_Genius						= 5
x330044_var_Level								=70
x330044_var_LevelLess 					= 80
x330044_var_PlayerPhyForce				= 200
x330044_var_QuestName1 = "#cb4b4b4【体力】完成争夺龙魂"

--DECLARE_QUEST_INFO_START--

function x330044_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetMonsterGUID(varMap, varTalknpc) == 139093 then		--体力值减负大师处不显示此按钮，改为分页
		return
	end
	if GetLevel(varMap, varPlayer) < x330044_var_Level then
		return
	end
	if x330044_GetMD( varMap, varPlayer, MD_CURRENT_BANZHUAN_DAYCOUNT) < 3  and IsHaveQuest( varMap, varPlayer, x330044_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1]) <= 0 then
		TalkAppendButton(varMap, x330044_var_FileId, x330044_var_QuestName, 3, 1)
		else 
		 TalkAppendButton(varMap, x330044_var_FileId, x330044_var_QuestName1, 3, 1)
	end
end


function x330044_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)
	local varExp = GetLevel(varMap, varPlayer) * x330044_var_ExpParam
	local localinh = GetLevel(varMap, varPlayer) * x330044_var_Genius
	local refixInh = RefixInherenceExp( varMap, varPlayer, localinh)
	
	StartTalkTask(varMap)

		--任务信息
		TalkAppendString(varMap,"#Y"..x330044_var_QuestName)
		TalkAppendString(varMap,format("%s\n\t需要扣除#R%d#W点体力值，直接完成任务。你将获得#R经验值#W#G%s#W点、#R天赋#W#G%s#W点奖励。", x330044_var_QuestInfo,x330044_var_PlayerPhyForce, varExp, refixInh))
		TalkAppendString(varMap," ")

		--提示信息
		TalkAppendString( varMap,"#Y小提示：")
		TalkAppendString( varMap,format("%s", x330044_var_QuestSuggest))
		TalkAppendString( varMap," ")

		--奖励信息
		TalkAppendString( varMap,"#Y奖励内容：")
		TalkAppendString( varMap,format("经验值：%s点\n天赋：%s点", varExp, refixInh))		
		TalkAppendString( varMap," ")		

		
	StopTalkTask(varMap)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x330044_var_FileId, -1)

end



function x330044_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	if GetLevel(varMap, varPlayer) < x330044_var_LevelLess then
		local str =format("您的等级不足#R%d级#cffcf00，还不能使用此功能", x330044_var_LevelLess)
		Msg2Player( varMap, varPlayer, str, 8, 3)
		return
	end
--	if IsQuestHaveDone(varMap, varPlayer, 1405) <= 0 then
--		Msg2Player( varMap, varPlayer, "请先在#G帝国嘉奖使#cffcf00处完成任务【个人】争夺龙魂的传说", 8, 2)
--		Msg2Player( varMap, varPlayer, "请先在#G帝国嘉奖使#cffcf00处完成任务【个人】争夺龙魂的传说", 8, 3)		
--		return 
--	end
	
	if x330044_GetMD( varMap, varPlayer, MD_CURRENT_BANZHUAN_DATE) ~= GetDayOfYear() then
		x330044_SetMD( varMap, varPlayer, MD_CURRENT_BANZHUAN_DAYCOUNT, 0)
	end
	local nWorldId = GetWorldIdEx()
	if GetToplistCount(nWorldId, WORLDCUP_TOPLIST_A) <= 0 then
		Msg2Player(varMap, varPlayer, "【国家】争夺龙魂任务尚未达到开放条件", 8, 2)
		Msg2Player(varMap, varPlayer, "【国家】争夺龙魂任务尚未达到开放条件", 8, 3)
		return
	end
	
	--如果排行榜上刷新数据前四都为帮会已不存在，则不开放任务
	local Emp =0
	for i=0, 3 do
		local snid, key, country = GetToplistInfo(nWorldId, WORLDCUP_TOPLIST_A, i)
		if nil == country or country < 0 or country > 3 then
			Emp = Emp + 1
		end
	end
	if Emp == 4 then
		Msg2Player(varMap, varPlayer, "【国家】争夺龙魂任务尚未达到开放条件", 8, 2)
		Msg2Player(varMap, varPlayer, "【国家】争夺龙魂任务尚未达到开放条件", 8, 3)	
		return
	end
	--------
	if IsHaveQuest( varMap, varPlayer, x330044_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1]) > 0 then
		Msg2Player( varMap, varPlayer, x330044_var_QuestCommentCountOver, 8, 2)
		Msg2Player( varMap, varPlayer, x330044_var_QuestCommentCountOver, 8, 3)
		return
	end

	if x330044_GetMD( varMap, varPlayer, MD_CURRENT_BANZHUAN_DAYCOUNT) >= 3 then
		Msg2Player( varMap, varPlayer, x330044_var_QuestCommentCountOver, 8, 2)
		Msg2Player( varMap, varPlayer, x330044_var_QuestCommentCountOver, 8, 3)
		return
	end
	
	if GetPlayerPhysicalForce( varMap, varPlayer) < x330044_var_PlayerPhyForce then
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 2)
		Msg2Player( varMap, varPlayer, "体力值不够", 8, 3)
		return	
	end	
	x330044_GetPlayerAward(varMap, varPlayer)	
	local count = x330044_GetMD( varMap, varPlayer, MD_CURRENT_BANZHUAN_DAYCOUNT)
	x330044_SetMD( varMap, varPlayer, MD_CURRENT_BANZHUAN_DAYCOUNT, count + 1)	
	x330044_SetMD( varMap, varPlayer, MD_CURRENT_BANZHUAN_DATE, GetDayOfYear())
end


function x330044_GetPlayerAward(varMap, varPlayer)
	local varExp = GetLevel(varMap, varPlayer) * x330044_var_ExpParam
	local localinh = GetLevel(varMap, varPlayer) * x330044_var_Genius
	local Genius = RefixInherenceExp( varMap, varPlayer, localinh)
	local curForce = GetPlayerPhysicalForce( varMap, varPlayer)	
	SetPlayerPhysicalForce(varMap, varPlayer, curForce - x330044_var_PlayerPhyForce)
 	AddExp(varMap, varPlayer, varExp)
 		LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,15)

 	
	AddInherenceExp( varMap, varPlayer, localinh)
	GamePlayScriptLog( varMap, varPlayer, 3092)
 	local varMessage = format("获得经验奖励：#R%s#cffcf00点\n获得天赋奖励：#R%s#cffcf00点.", varExp, Genius)
	Msg2Player( varMap, varPlayer, format("已经完成任务：%s",x330044_var_QuestName), 8, 2) 
	Msg2Player( varMap, varPlayer, varMessage, 8, 2)
    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务：%s",x330044_var_QuestName));
    StopTalkTask(varMap) 
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..varExp.."#cffcf00点的奖励")
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)    
    TalkAppendString(varMap,"获得#R天赋"..Genius.."#cffcf00点的奖励")
    StopTalkTask(varMap)        
    DeliverTalkTips(varMap,varPlayer)  	
	
end



function x330044_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x330044_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end

function x330044_ProcEnumEventForMenu(varMap, varPlayer, varTalknpc, varQuest)
	if GetLevel(varMap, varPlayer) < x330044_var_Level then
		return	0
	end
	if x330044_GetMD( varMap, varPlayer, MD_CURRENT_BANZHUAN_DAYCOUNT) < 3  and IsHaveQuest( varMap, varPlayer, x330044_var_QuestId[ GetCurCountry( varMap, varPlayer) + 1]) <= 0 then
		TalkAppendButton(varMap, x330044_var_FileId, x330044_var_QuestName, 3, 1)
		else 
		 TalkAppendButton(varMap, x330044_var_FileId, x330044_var_QuestName1, 3, 1)
	end
	return 1
end
