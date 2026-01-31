





x414034_var_FileId 		= 414034 

x414034_var_LevelMin		=	1






function x414034_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x414034_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x414034_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x414034_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x414034_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x414034_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x414034_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end


    --获取贵族等级
    local nItemID, nItemNum, level = GetPeerVipInfo(varMap, varPlayer, 1);
    if level < 1 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"贵族等级不足，请至少升级到1级")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return
    end

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
        local addNum = level * 500
		local allscore = GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] )
        SetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3], allscore + addNum)
        SetFeastScore( varMap, varPlayer, allscore + addNum)
        Msg2Player( varMap, varPlayer, format( "您获得#R%d#cffcc00点个人节日积分，总积分#G%d", addNum, addNum + allscore ), 4, 3)
        Msg2Player( varMap, varPlayer, format( "您获得#R%d#cffcc00点个人节日积分，总积分#G%d", addNum, addNum + allscore ), 4, 2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x414034_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
