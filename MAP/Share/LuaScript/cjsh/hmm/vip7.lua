

x930148_var_FileId = 930148
x930148_var_QuestName="贵族商店"
x930148_var_ShopList={
	{name="vip7商店",id=1754,level=7,items={11000906,14010044,14020044,14020040,14040015}},
	{name="vip8商店",id=1755,level=8,items={11000934,14010033,14010037,14010041}},
	{name="vip9商店",id=1756,level=9,items={11000935,14030033,14030041,14030037}},
	--{name="vip10商店",id=1757,level=10,items={11000907,14050005,14050105,14050205,14050305,14050405,14050505,14050605,14050705,14050805,12274053,12050085,12050075,12050065,12050055}},
	{name="vip10商店",id=1757,level=10,items={11000907,12274053,12050085,12050075,12050065,12050055}},
}






function x930148_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,seleteId)
	local nItemID, nItemNum, nLevelPre = GetPeerVipInfo(varMap, varPlayer, 1);
	if seleteId == -1 then
		--说明用户点击的是1级菜单，需要展示2级菜单
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..format("您当前贵族等级是#R%d#W级",nLevelPre))
		for varI, item in x930148_var_ShopList  do
			TalkAppendButton( varMap, x930148_var_FileId, "【打开】"..item.name, 3, varI )
		end
        for varI, item in x930148_var_ShopList  do
            TalkAppendButton( varMap, x930148_var_FileId, item.name.."【说明】", 0, varI+getn(x930148_var_ShopList) )
        end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end

	if seleteId >= 1 and seleteId <= getn(x930148_var_ShopList) then
		local item = x930148_var_ShopList[seleteId]
		if nLevelPre < item.level then
			Msg2Player(varMap, varPlayer,"贵族等级不足！",8,2)
			Msg2Player(varMap, varPlayer,"贵族等级不足！",8,3)
			return
		end
		DispatchShopItem( varMap, varPlayer, varTalknpc, item.id )
	end

    if seleteId >=  getn(x930148_var_ShopList)+1 then
        --展示说明
        local index = seleteId-getn(x930148_var_ShopList)
        StartTalkTask( varMap)
        TalkAppendString( varMap, format("#Y%s【说明】",x930148_var_ShopList[index].name) )
        TalkAppendString( varMap, "\n\t以下是商店出售的道具。#r" )
        for varI, aitem in x930148_var_ShopList[index].items  do
            AddQuestItemBonus(varMap, aitem, 1)
        end
        StopTalkTask()
        DeliverTalkInfo( varMap, varPlayer, varTalknpc, x930148_var_FileId, -1)
    end

end









function x930148_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

    local killerName = GetName(varMap,varPlayer)
	local nLevel = GetLevel(varMap,varPlayer)
	TalkAppendButton(varMap, x930148_var_FileId, x930148_var_QuestName,3,-1)

	
end









function x930148_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x930148_ProcAccept(varMap, varPlayer)
                                                                   
	     return 0
end









function x930148_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x930148_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x930148_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x930148_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x930148_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x930148_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
