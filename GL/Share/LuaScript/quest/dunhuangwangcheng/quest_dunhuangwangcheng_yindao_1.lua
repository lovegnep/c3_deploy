
x256200_var_FileId = 256200
x256200_var_QuestId = 1411
x256200_var_QuestName = "【个人】江湖生涯<五>"

function x256200_ProcEnumEvent(varMap, varPlayer, varTalknpc)

	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, x256200_var_QuestId )
	if varFrontQuest1 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
			return 0;
		end
	end
	if varFrontQuest2 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
			return 0;
		end
	end
	if varFrontQuest3 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
			return 0;
		end
	end
	
	if IsQuestHaveDoneNM( varMap, varPlayer, x256200_var_QuestId ) > 0 then
		return 0;
	end
	local zhiye = GetZhiye( varMap, varPlayer);
	if IsQuestHaveDoneNM( varMap, varPlayer, 1450+zhiye ) > 0 then
		return 0;
	end
	
	if IsHaveQuestNM(varMap, varPlayer, x256200_var_QuestId) > 0 then
		return 0;
	end
	
	TalkAppendButton( varMap, x256200_var_QuestId, x256200_var_QuestName, 5)

end

function x256200_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest, switch)

	local zhiye = GetZhiye( varMap, varPlayer);
	QuestCom(varMap, varPlayer, x256200_var_QuestId)
	LuaCallNoclosure(QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, 1450+zhiye)

end

function x256200_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)

	local zhiye = GetZhiye( varMap, varPlayer);
	QuestCom(varMap, varPlayer, x256200_var_QuestId)
	LuaCallNoclosure(QUEST_SCRIPT, "ProcQuestAccept", varMap, varPlayer, varTalknpc, 1450+zhiye)

end
