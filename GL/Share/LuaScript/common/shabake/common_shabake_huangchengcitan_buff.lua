--DECLARE_QUEST_INFO_START--
x300949_var_FileId 						= 300949
x300949_var_QuestId						= 9213
x300949_var_QuestName					= "得到密信"
x300949_var_QuestInfo					= "..........."
x300949_var_CiTanBuff					= 7066
--x300949_var_CiTanBuff					= 7701
x300949_var_MenuSlect					= {}
x300949_var_PlayerBuff					= {}
--DECLARE_QUEST_INFO_STOP--


function x300949_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsHaveQuestNM( varMap, varPlayer, x300949_var_QuestId ) > 0 then
	--	local state = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x300949_var_FileId, x300949_var_QuestName, 13, 1)
	end	
		
end


function x300949_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )
print("wowowowo")

	local nlevel = GetLevel( varMap, varPlayer)
	if nlevel < 45 then
		return
	end		

	if IsHaveQuestNM( varMap, varPlayer, x300949_var_QuestId ) <= 0 then
		Msg2Player(varMap, varPlayer, "没有任务！", 8, 3)	
		return
	end
	
	if IsHaveSpecificImpact(varMap, varPlayer, x300949_var_CiTanBuff) == 1 then
		Msg2Player(varMap, varPlayer, "只能领取一次", 8, 3)
		return
	end		
	
	x300949_var_MenuSlect[GetGUID(varMap, varPlayer)] = varExtIdx
	if x300949_var_MenuSlect[GetGUID(varMap, varPlayer)] == 1 then
		print("------------------1")
		StartTalkTask(varMap)
		TalkAppendString(varMap, x300949_var_QuestName)
		TalkAppendString(varMap,x300949_var_QuestInfo)
		StopTalkTask()

		x300949_var_PlayerBuff[GetGUID(varMap, varPlayer)] = x300949_var_CiTanBuff
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x300949_var_PlayerBuff[GetGUID(varMap, varPlayer)], 0)
		Msg2Player(varMap, varPlayer, "获得密信", 8, 2)		
		Msg2Player(varMap, varPlayer, "获得密信", 8, 3)		
		local misIndex = GetQuestIndexByID(varMap, varPlayer, x300949_var_QuestId);
		SetQuestByIndex( varMap, varPlayer, misIndex, 0, 1 )
		SetQuestByIndex( varMap, varPlayer, misIndex, 7, 1 )
	end	
	
end

