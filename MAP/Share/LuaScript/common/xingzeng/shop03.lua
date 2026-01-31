

x588003_var_FileId = 588003
x588003_var_QuestName="【商店】#R积分宝石#W"
x588003_var_ShopList={1743}

x588003_var_needID=12274011
x588003_var_needName="积分宝石币"
x588003_var_needNum=1


x588003_var_needLevel = 120



function x588003_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,seleteId)
    local nLevel = GetLevel(varMap,varPlayer)
    if nLevel <x588003_var_needLevel then
        Msg2Player(varMap, varPlayer,format("等级不足%d级",x588003_var_needLevel),8,3)
        Msg2Player(varMap, varPlayer,format("等级不足%d级",x588003_var_needLevel),8,2)
        return
    end
    local num = GetItemCount(varMap, varPlayer, x588003_var_needID)
    if num < x588003_var_needNum then
        Msg2Player(varMap, varPlayer,format("您背包中没有%d个%s，无法进入积分宝石商店", x588003_var_needNum, x588003_var_needName),8,3)
        Msg2Player(varMap, varPlayer,format("您背包中没有%d个%s，无法进入积分宝石商店", x588003_var_needNum, x588003_var_needName),8,2)
        return
    end
    for i=1 , x588003_var_needNum  do
        if DelItem(varMap,varPlayer,x588003_var_needID,1) ~= 1 then
            Msg2Player(varMap, varPlayer,format("您背包中没有%d个%s，无法进入积分宝石商店", x588003_var_needNum, x588003_var_needName),8,3)
            Msg2Player(varMap, varPlayer,format("您背包中没有%d个%s，无法进入积分宝石商店", x588003_var_needNum, x588003_var_needName),8,2)
            return
        end
    end

    Msg2Player(varMap, varPlayer,format("成功扣除%d个%s，打开积分宝石商店成功", x588003_var_needNum, x588003_var_needName),8,3)
    Msg2Player(varMap, varPlayer,format("成功扣除%d个%s，打开积分宝石商店成功", x588003_var_needNum, x588003_var_needName),8,2)

	DispatchShopItem( varMap, varPlayer, varTalknpc, x588003_var_ShopList[1] )
end









function x588003_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)	

	local nLevel = GetLevel(varMap,varPlayer)
	if nLevel >= 60 then
		TalkAppendButton(varMap, x588003_var_FileId, x588003_var_QuestName,10)
	else
		return
	end
	
end









function x588003_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

end







function x588003_ProcAccept(varMap, varPlayer)
                                                                   
	     
end









function x588003_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x588003_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x588003_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
end









function x588003_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x588003_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x588003_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
