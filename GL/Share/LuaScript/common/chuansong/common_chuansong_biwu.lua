

--DECLARE_QUEST_INFO_START--
x300314_var_FileId = 300314


x300314_var_QuestName = "离开比武场"
x300314_var_QuestInfo=" 你确定要离开比武场吗？"  
x300314_var_QuestInfo2=""
x300314_var_QuestTarget="    "
x300314_var_QuestComplete="  "					
x300314_var_ContinueInfo="    "
x300314_var_TransPos1 = "biwu2loulan"
x300314_var_TransPos2 = "biwu2laiyin"
x300314_var_TransPos3 = "biwu2kunlun"
x300314_var_TransPos4 = "biwu2dunhuang"

x300314_var_MoneyBonus = 10000

x300314_var_ItemBonus={}


x300314_var_RadioItemBonus={}

--DECLARE_QUEST_INFO_STOP--
x300314_var_ExpBonus = 1000






function x300314_ProcEventEntry(varMap, varPlayer, varTalknpc)	

	StartTalkTask(varMap)
		TalkAppendString(varMap, x300314_var_QuestInfo)
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300314_var_FileId, x300314_var_QuestName)

end









function x300314_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


		TalkAppendButton(varMap, x300314_var_FileId, x300314_var_QuestName)



end









function x300314_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
return 1
end








function x300314_CheckPushList(varMap, varPlayer, varTalknpc)

end







function x300314_ProcAccept(varMap, varPlayer)
	local varCountry = GetCurCountry(varMap, varPlayer)

    LuaCallNoclosure(700005,"RestorePlayerCamp", varMap,varPlayer)
    SetPlayerMutexState( varMap,varPlayer,PLAYER_STATE_DIE,0) 

	if varCountry == 0 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x300314_var_TransPos1)
	elseif varCountry == 1 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x300314_var_TransPos2)
	elseif varCountry == 2 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x300314_var_TransPos3)
	elseif varCountry == 3 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x300314_var_TransPos4)
	end

end









function x300314_ProcQuestAbandon(varMap, varPlayer, varQuest)


end









function x300314_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x300314_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)


end






function x300314_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x300314_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end

