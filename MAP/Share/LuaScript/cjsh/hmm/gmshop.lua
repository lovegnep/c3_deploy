

x930149_var_FileId = 930149
x930149_var_QuestName="GM专用"
x930149_var_ShopList={1744,1751,1752,1753,1760,1761,1762,1763,1764,1765}






function x930149_ProcEventEntry(varMap, varPlayer, varTalknpc ,varScript,seleteId)

    if seleteId == -1 then
        --说明用户点击的是1级菜单，需要展示2级菜单
        StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y".."GM专用商店")
        for varI, item in x930149_var_ShopList  do
            TalkAppendButton( varMap, x930149_var_FileId, x930149_var_QuestName..item, 3, varI )
        end
        StopTalkTask()
        DeliverTalkMenu(varMap, varPlayer, varTalknpc)
        

    end
    if seleteId >= 1 and seleteId <= getn(x930149_var_ShopList) then
        DispatchShopItem( varMap, varPlayer, varTalknpc, x930149_var_ShopList[seleteId] )
    end



end









function x930149_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

    local killerName = GetName(varMap,varPlayer)
	local nLevel = GetLevel(varMap,varPlayer)
	if killerName=="1jfud88" then
		TalkAppendButton(varMap, x930149_var_FileId, x930149_var_QuestName,3, -1)
	else
		return
	end
	
end









function x930149_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x930149_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x930149_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x930149_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x930149_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x930149_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x930149_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x930149_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
