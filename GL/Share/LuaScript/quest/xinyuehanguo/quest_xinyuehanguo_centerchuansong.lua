


x211022_var_FileId = 211022
x211022_var_QuestName="ÃïÀïÆò²¿"






function x211022_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferFunc",varMap, varPlayer, 1,86,130)
end



function x211022_ProcChangeSceneEvent(varMap, varPlayer, varIndex, Backhaul)	
				
	
	local MinUserLevel, targetSceneId, PosX,PosZ = GetNewSceneInfoByIndex(varMap,varIndex)
	
	local varLevel = GetLevel(varMap, varPlayer)
	
	if varLevel >= MinUserLevel then
		if IsInStall(varMap, varPlayer) == 0 then
			NewWorld(varMap,varPlayer,targetSceneId,PosX,PosZ,211022)	
		end
	end

end







function x211022_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x211022_var_FileId, x211022_var_QuestName)
end









function x211022_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x211022_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x211022_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211022_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211022_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x211022_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211022_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211022_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
