
--DECLARE_QUEST_INFO_START--
x320044_var_FileId 						= 320044
x320044_var_QuestId						= 9213
x320044_var_QuestName					= "得到军旗"
x320044_var_QuestInfo					= "..........."
x320044_var_CiTanBuff					= 7067
x320044_var_QuestId						= {6665, 6666, 6667, 6668}
x320044_var_MenuSlect					= {}
x320044_var_PlayerBuff					= {}
--DECLARE_QUEST_INFO_STOP--


function x320044_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsHaveQuestNM( varMap, varPlayer, x320044_VarQuest(varMap, varPlayer) ) > 0 then
		TalkAppendButton(varMap, x320044_var_FileId, x320044_var_QuestName, 13, 1)
	end	
		
end


function x320044_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )
	local ChariotObjID = GetPlayerChariotObjID( varMap, varPlayer )
	local nlevel = GetLevel( varMap, varPlayer)
	if nlevel < 45 then
		return
	end		

	if IsHaveQuestNM( varMap, varPlayer, x320044_VarQuest(varMap, varPlayer) ) <= 0 then
		Msg2Player(varMap, varPlayer, "没有任务！", 8, 3)	
		return
	end

	if IsInChariot(varMap, varPlayer) ~= 1 then
		Msg2Player(varMap, varPlayer, "你没有驾驶战车，不能领取！", 8, 3)
		return
	end
	
		
	if IsHaveSpecificImpact(varMap, ChariotObjID, x320044_var_CiTanBuff) == 1 then
		Msg2Player(varMap, varPlayer, "只能领取一次", 8, 3)
		return
	end		
	
	x320044_var_MenuSlect[GetGUID(varMap, varPlayer)] = varExtIdx
	if x320044_var_MenuSlect[GetGUID(varMap, varPlayer)] == 1 then
		print("------------------1")
		StartTalkTask(varMap)
		TalkAppendString(varMap, x320044_var_QuestName)
		TalkAppendString(varMap,x320044_var_QuestInfo)
		StopTalkTask()

		x320044_var_PlayerBuff[GetGUID(varMap, varPlayer)] = x320044_var_CiTanBuff
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, ChariotObjID, x320044_var_CiTanBuff, 0)
		Msg2Player(varMap, varPlayer, "获得军旗", 8, 2)		
		Msg2Player(varMap, varPlayer, "获得军旗", 8, 3)		
		local misIndex = GetQuestIndexByID(varMap, varPlayer, x320044_VarQuest(varMap, varPlayer));
		SetQuestByIndex( varMap, varPlayer, misIndex, 1, 1 )
		SetQuestByIndex( varMap, varPlayer, misIndex, 7, 1 )
	end	
	
end


function x320044_VarQuest(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return x320044_var_QuestId[1]
	elseif nCountryIdx == 1 then
		return x320044_var_QuestId[2]
	elseif nCountryIdx == 2 then	
		return x320044_var_QuestId[3]
	elseif nCountryIdx == 3 then
		return x320044_var_QuestId[4]
	end		

end
