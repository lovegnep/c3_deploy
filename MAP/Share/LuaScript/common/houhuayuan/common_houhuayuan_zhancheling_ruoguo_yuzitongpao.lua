--DECLARE_QUEST_INFO_START--
x320046_var_FileId 						= 320046
x320046_var_QuestName					= "与子同袍"
x320046_var_QuestInfo					= "\t嗯，有了盟国的支持，这样我们不怕了。"
x320046_var_QuestCompleted				= "\t看你志得意满的样子一定是大有收获。呵呵，不过要记住，每天的磨练是必不可少的！"
x320046_var_QuestRuse					= "\t联络盟国的战车宣抚使"
x320046_var_QuestHelp					= "\t只能在驾驶战车状态才能完成任务。如果你是在#R战车令发布期间#W完成任务，会获得#R三倍奖励#W"
x320046_var_strQuestFinishTip			= "\t任务已经完成，快点回去汇报吧！"
x320046_var_QuestNPC					= {401246, 401247, 401248, 401249}
x320046_var_QuestId						= {
{6677, 6678, 6679, 6680},
{6681, 6682, 6683, 6684},
{6685, 6686, 6687, 6688},
{6689, 6690, 6691, 6692},
}
x320046_var_LevelLess					= 	70
x320046_var_PlayerGUID					= {}
--DECLARE_QUEST_INFO_STOP--

function x320046_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local varCountry = GetCurCountry(varMap, varPlayer)
	local QuestNPC = -1
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	
	for i,item in x320046_var_QuestId[varCountry+1] do
			
		
						if IsHaveQuestNM( varMap, varPlayer, item ) > 0 then
								QuestNPC = x320046_var_QuestNPC[i]
						end
			
			
	end
	if IsHaveQuestNM( varMap, varPlayer, x320046_VarQuest(varMap, varPlayer) ) > 0  and QuestNPC == varTalkNpcGUID then	
		TalkAppendButton(varMap, x320046_var_FileId, x320046_var_QuestName, 13, 1)
	end		
end

function x320046_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varIndex )

	x320046_var_PlayerGUID[GetGUID(varMap, varPlayer)] = varIndex
	if x320046_var_PlayerGUID[GetGUID(varMap, varPlayer)] == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, x320046_var_QuestInfo)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x320046_var_FileId, -1)		
	end

end

function x320046_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	local questId = x320046_VarQuest( varMap, varPlayer )
	if  questId < 0 then --IsHaveQuestNM( varMap, varPlayer, x320046_VarQuest(varMap, varPlayer) ) <= 0 then
		Msg2Player(varMap, varPlayer, "没有任务！", 8, 2)
		return
	end	
	
	if IsInChariot(varMap, varPlayer) ~= 1 then
		Msg2Player(varMap, varPlayer, "你没有驾驶战车，不能完成任务！", 8, 3)
		return
	end
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, questId )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
end

function x320046_VarQuest(varMap, varPlayer)
	local varCountry = GetCurCountry(varMap, varPlayer)
--	local questid = -1
--	for m = 0, 3 do
--		if LuaCallNoclosure(305015, "CheckCountryColleague", varMap, varCountry, m) == 1 then
--			questid = x320046_var_QuestId[varCountry + 1][m + 1]
--			return questid
--		end
--	end		
--	return questid

		for i,item in x320046_var_QuestId[varCountry+1] do
			
			
						if IsHaveQuestNM( varMap, varPlayer, item ) > 0 then
								return item
						end
		
			
	end
	
	return -1
	
end
