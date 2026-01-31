





x930153_var_FileId 		= 930153

x930153_var_LevelMin		=	30

--每级每天可以领取的现金系数
x930153_var_money		=	500*1000
x930153_var_nummin = 15
x930153_var_nummax = 25

x930153_var_ExcObjID = {
    {level = 1 ,num = 100, needID = 12273000, needNum = 100, needName = "初级肝帝之证"},
    {level = 2 ,num = 200, needID = 12273000, needNum = 100, needName = "初级肝帝之证"},
    {level = 3 ,num = 300, needID = 12273001, needNum = 200, needName = "中级肝帝之证"},
    {level = 4 ,num = 400, needID = 12273001, needNum = 200, needName = "中级肝帝之证"},
    {level = 5 ,num = 500, needID = 12273002, needNum = 400, needName = "高级肝帝之证"},
    {level = 6 ,num = 600, needID = 12273002, needNum = 400, needName = "高级肝帝之证"},
    {level = 7 ,num = 700, needID = 12273003, needNum = 600, needName = "传说肝帝之证"},
    {level = 8 ,num = 800, needID = 12273003, needNum = 600, needName = "传说肝帝之证"},
    {level = 9 ,num = 900, needID = 12273004, needNum = 1000, needName = "神话肝帝之证"},
    {level = 10 ,num = 1000, needID = 12273004, needNum = 1000, needName = "神话肝帝之证"},

}



function x930153_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x930153_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x930153_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x930153_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x930153_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x930153_ProcActivateOnce( varMap, varPlayer, varImpact )
    if GetBagSpace( varMap, varPlayer) < 1 then
        Msg2Player( varMap, varPlayer, "背包空间不足1格，无法打开", 8, 3)
        Msg2Player( varMap, varPlayer, "背包空间不足1格，无法打开", 8, 2)
        return
    end
	
	if GetLevel(varMap, varPlayer)< x930153_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local nItemID, nItemNum, nLevelPre = GetPeerVipInfo(varMap, varPlayer, 1);

        if nLevelPre >=  10 then
            StartTalkTask(varMap)
            TalkAppendString(varMap,"您贵族等级已满，不需要这种物品了")
            StopTalkTask(varMap)
            DeliverTalkTips(varMap,varPlayer)
            return
        end

        local targetID = 0
        for i = 1, getn(x930153_var_ExcObjID) do
            if x930153_var_ExcObjID[i].level > nLevelPre then
                targetID = x930153_var_ExcObjID[i].needID
                break
            end
        end

        local num = random(x930153_var_nummin,x930153_var_nummax)

        StartItemTask(varMap)
        ItemAppendBind( varMap, targetID, num)

        local varRet = StopItemTask(varMap,varPlayer)
        if varRet > 0 then
            DeliverItemListSendToPlayer(varMap,varPlayer)
            Msg2Player(varMap, varPlayer,"发放奖励完成",8,3)
            GamePlayScriptLog( varMap, varPlayer, 2670)
        else
            StartTalkTask(varMap)
            TalkAppendString(varMap,"物品栏已满，无法获得物品！")
            StopTalkTask(varMap)
            DeliverTalkTips(varMap,varPlayer)
        end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x930153_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
