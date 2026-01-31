

--DECLARE_QUEST_INFO_START--
x550203_var_FileId = 550203
x550203_var_QuestName = "离开这里"
x550203_var_QuestInfo=" 我可以将你送回村里。"  
x550203_var_QuestInfo2=""

x550203_var_QuestComplete="  "					
x550203_var_ContinueInfo="    "
x550203_var_TransPos1 = "xinshoumigong2loulan"
x550203_var_TransPos2 = "xinshoumigong2laiyin"
x550203_var_TransPos3 = "xinshoumigong2kunlun"
x550203_var_TransPos4 = "xinshoumigong2dunhuang"

x550203_var_MoneyBonus = 10000

x550203_var_ItemBonus={}


x550203_var_RadioItemBonus={}

--DECLARE_QUEST_INFO_STOP--
x550203_var_ExpBonus = 1000






function x550203_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local varCountry = GetCurCountry(varMap,varPlayer)
	if varCountry == 0 then
			LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550203_var_TransPos1)
    elseif varCountry ==1 then
			LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550203_var_TransPos2)
		elseif varCountry ==2 then
			LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550203_var_TransPos3)
		elseif varCountry ==3 then
			LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550203_var_TransPos4)
 	end
 	 	   





	
end









function x550203_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x550203_var_FileId, x550203_var_QuestName,15)

			
end









function x550203_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end








function x550203_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550203_ProcAccept(varMap, varPlayer)
		
		
	  StartTalkTask(varMap)
					NewWorld(varMap,varPlayer,24,120,465,550202)
		StopTalkTask()
    
end









function x550203_ProcQuestAbandon(varMap, varPlayer, varQuest)


end









function x550203_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x550203_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

	
end






function x550203_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x550203_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end

