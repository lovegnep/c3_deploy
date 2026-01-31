

x930166_var_FileId = 930166
x930166_var_QuestName="王牌兑换"
x930166_var_ShopList={
    {id=1770,name="王牌莉莉丝"},
    {id=1771,name="王牌青龙"},
    {id=1772,name="王牌白虎"},
    --{id=1773,name="王牌朱雀"},
    --{id=1774,name="王牌玄武"},
}






function x930166_ProcEventEntry(varMap, varPlayer, varTalknpc ,varScript,seleteId)

    if seleteId == -1 then
        --说明用户点击的是1级菜单，需要展示2级菜单
        StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y"..x930166_var_QuestName)
        for varI, item in x930166_var_ShopList  do
            TalkAppendButton( varMap, x930166_var_FileId, format("【%s】%s",x930166_var_QuestName,item.name), 3, varI )
        end
        StopTalkTask()
        DeliverTalkMenu(varMap, varPlayer, varTalknpc)
        

    end
    if seleteId >= 1 and seleteId <= getn(x930166_var_ShopList) then
        DispatchShopItem( varMap, varPlayer, varTalknpc, x930166_var_ShopList[seleteId].id )
    end



end









function x930166_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

    local killerName = GetName(varMap,varPlayer)
	local nLevel = GetLevel(varMap,varPlayer)
    TalkAppendButton(varMap, x930166_var_FileId, x930166_var_QuestName,3, -1)

	
end









function x930166_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x930166_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x930166_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x930166_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x930166_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x930166_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x930166_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x930166_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
