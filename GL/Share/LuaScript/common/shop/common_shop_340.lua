


x560340_var_FileId = 560340
x560340_var_QuestName="Ë¿³ñÉÌµê"
x560340_var_ShopList={340}





function x560340_ProcEventEntry(varMap, varPlayer, varTalknpc)

	local year, month, day = GetYearMonthDay(); 
		local day1 = GetDayOfYear()
		if year ==2012 then
			if day1 >66 and day1 <71 then 
				DispatchShopItem( varMap, varPlayer, varTalknpc, x560340_var_ShopList[1] )
			end
		end
end









function x560340_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)



local year, month, day = GetYearMonthDay(); 
		local day1 = GetDayOfYear()
		if year ==2012 then
			if day1 >66 and day1 <71 then 
				local day =GetDayOfYear()
			
				local nLevel = GetLevel(varMap,varPlayer)
				if nLevel >= 0 then
				
				
				
					TalkAppendButton(varMap, x560340_var_FileId, x560340_var_QuestName,10)
				else
					return
				end
			end
		end
	
end









function x560340_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x560340_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x560340_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x560340_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x560340_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x560340_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x560340_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x560340_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
