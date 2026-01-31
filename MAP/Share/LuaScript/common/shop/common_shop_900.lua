

x560900_var_FileId = 560900
x560900_var_QuestName="ÆßÏ¦ÒöÔµµê"
x560900_var_ShopList={900,900,900,900,900,900}
x560900_var_QuestDay = 812








function x560900_ProcEventEntry(varMap, varPlayer, varTalknpc)	

		DispatchShopItem( varMap, varPlayer, varTalknpc, x560900_var_ShopList[1] )


end









function x560900_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if x560900_CheckDay( varMap,varPlayer ) == 1 then
		TalkAppendButton(varMap, x560900_var_FileId, x560900_var_QuestName,10)
	else 
		return
	end

end









function x560900_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560900_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560900_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560900_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560900_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560900_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560900_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560900_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end






function x560900_CheckDay( varMap,varPlayer )

	local year,month,day = GetYearMonthDay()
	local nDay = month*100+day

	if x560900_var_QuestDay == nDay then
		return 1
	end

	return 0

end
