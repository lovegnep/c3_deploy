

--DECLARE_QUEST_INFO_START--
x550201_var_FileId = 550201
x550201_var_QuestName = "返回村里"
x550201_var_QuestInfo=" 我可以把你送回村子。"  
x550201_var_QuestInfo2=""

x550201_var_QuestComplete="  "					
x550201_var_ContinueInfo="    "
x550201_var_TransPos1 = "xinshoumigong1loulan"
x550201_var_TransPos2 = "xinshoumigong1laiyin"
x550201_var_TransPos3 = "xinshoumigong1kunlun"
x550201_var_TransPos4 = "xinshoumigong1dunhuang"

x550201_var_MoneyBonus = 10000

x550201_var_ItemBonus={}


x550201_var_RadioItemBonus={}

--DECLARE_QUEST_INFO_STOP--
x550201_var_ExpBonus = 1000






function x550201_ProcEventEntry(varMap, varPlayer, varTalknpc)	

	local varCountry = GetCurCountry(varMap,varPlayer)
		if varCountry == 0 then		
			LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550201_var_TransPos1)
    elseif varCountry ==1 then
			LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550201_var_TransPos2)
		elseif varCountry ==2 then
			LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550201_var_TransPos3)
		elseif varCountry ==3 then
			LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550201_var_TransPos4)
	end








	
end









function x550201_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap, x550201_var_FileId, x550201_var_QuestName,15)

			
end









function x550201_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end








function x550201_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550201_ProcAccept(varMap, varPlayer)
		

	
end









function x550201_ProcQuestAbandon(varMap, varPlayer, varQuest)


end









function x550201_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x550201_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

	
end






function x550201_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x550201_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end

