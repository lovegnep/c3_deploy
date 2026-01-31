

--DECLARE_QUEST_INFO_START--
x550202_var_FileId = 550202
x550202_var_QuestName = "进入古老的祭坛"
x550202_var_QuestInfo=" 我可以送你入山谷，请点确定"  
x550202_var_QuestInfo2=""
x550202_var_QuestQuestID	=	2723
x550202_var_QuestComplete="  "					
x550202_var_ContinueInfo="    "
x550202_var_TransPos1 = "xinshoumigong2loulanin"
x550202_var_TransPos2 = "xinshoumigong2laiyinin"
x550202_var_TransPos3 = "xinshoumigong2kunlunin"
x550202_var_TransPos4 = "xinshoumigong2dunhuangin"

x550202_var_MoneyBonus = 10000

x550202_var_ItemBonus={}


x550202_var_RadioItemBonus={}

--DECLARE_QUEST_INFO_STOP--
x550202_var_ExpBonus = 1000






function x550202_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local varCountry = GetCurCountry(varMap,varPlayer)
	if varCountry == 0 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550202_var_TransPos1)
	elseif varCountry ==1 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550202_var_TransPos2)
	elseif varCountry ==2 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550202_var_TransPos3)
	elseif varCountry ==3 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550202_var_TransPos4)
	end	
		
		





	
end









function x550202_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	

		TalkAppendButton(varMap, x550202_var_FileId, x550202_var_QuestName,16)

	
		
	
			
end









function x550202_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end








function x550202_CheckPushList(varMap, varPlayer, varTalknpc)
	
end







function x550202_ProcAccept(varMap, varPlayer)
		
		



    
end









function x550202_ProcQuestAbandon(varMap, varPlayer, varQuest)


end









function x550202_CheckSubmit( varMap, varPlayer, varTalknpc)


end









function x550202_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

	
end






function x550202_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x550202_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end

