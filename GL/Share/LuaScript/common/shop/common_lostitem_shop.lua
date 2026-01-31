x560934_var_FileId = 560934
x560934_var_QuestName="取回丢失物品"

function x560934_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	OpenLostItemShop( varMap, varPlayer)
end

function x560934_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    TalkAppendButton( varMap, x560934_var_FileId, x560934_var_QuestName, 10)
end
