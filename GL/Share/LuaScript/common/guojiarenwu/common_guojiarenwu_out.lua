x300510_var_FileId = 300510
x300510_var_QuestName = "·µ»ØÍõ³Ç"

x300510_var_CountrySceneList	= {50, 150, 250, 350}

function x300510_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	TalkAppendButton(varMap, x300510_var_FileId, x300510_var_QuestName, 14)

end

function x300510_ProcEventEntry(varMap, varPlayer, varTalknpc)
	
	local aimscene = x300510_var_CountrySceneList[GetCurCountry(varMap, varPlayer)+1];
	NewWorld(varMap, varPlayer, aimscene , 208, 40, 300510);

end
