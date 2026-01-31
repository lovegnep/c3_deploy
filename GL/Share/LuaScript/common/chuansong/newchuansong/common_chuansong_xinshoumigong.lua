

--DECLARE_QUEST_INFO_START--
x550200_var_FileId = 550200
x550200_var_QuestName = "进入废弃的兵器库"
x550200_var_QuestInfo=" 我送你进入酒窖吧。"  
x550200_var_QuestInfo2=""
x550200_var_QuestQuestID	=	2722
x550200_var_QuestComplete="  "					
x550200_var_ContinueInfo="    "
x550200_var_TransPos1 = "xinshoumigong1loulanin"
x550200_var_TransPos2 = "xinshoumigong1laiyinin"
x550200_var_TransPos3 = "xinshoumigong1kunlunin"
x550200_var_TransPos4 = "xinshoumigong1dunhuangin"

x550200_var_MoneyBonus = 10000

x550200_var_ItemBonus={}


x550200_var_RadioItemBonus={}

--DECLARE_QUEST_INFO_STOP--
x550200_var_ExpBonus = 1000






function x550200_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local varCountry = GetCurCountry(varMap,varPlayer)
	if varCountry == 0 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550200_var_TransPos1)
	elseif varCountry ==1 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550200_var_TransPos2)
	elseif varCountry ==2 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550200_var_TransPos3)
	elseif varCountry ==3 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550200_var_TransPos4)
	end





	
end









function x550200_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)



		TalkAppendButton(varMap, x550200_var_FileId, x550200_var_QuestName,16)




			
end









function x550200_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end








function x550200_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550200_ProcAccept(varMap, varPlayer)
		
		



    
end









function x550200_ProcQuestAbandon(varMap, varPlayer, varQuest)


end









function x550200_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x550200_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

	
end






function x550200_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x550200_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end

