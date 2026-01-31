

x560338_var_FileId = 560338
x560338_var_QuestName="ÔªÏüÊ³²Ä"
x560338_var_ShopList={338}





function x560338_ProcEventEntry(varMap, varPlayer, varTalknpc)
	local day =GetDayOfYear()
	if day <= 39 then
	DispatchShopItem( varMap, varPlayer, varTalknpc, x560338_var_ShopList[1] )
	end
end









function x560338_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	local day =GetDayOfYear()
	if day > 39 then return end	
	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 0 then
		TalkAppendButton(varMap, x560338_var_FileId, x560338_var_QuestName,10)
	else
		return
	end
	
end









function x560338_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560338_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560338_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560338_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560338_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560338_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560338_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560338_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
