





x930160_var_FileId 		= 930160

x930160_var_LevelMin		=	30

--每级每天可以领取的现金系数
x930160_var_money		=	500*1000
x930160_var_nummin = 15
x930160_var_nummax = 45

x930160_var_ExcObjID = {
    11000304,11000317,11000309,11000306,11000331,11000379,11000340,11000316,11000315
}



function x930160_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x930160_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x930160_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x930160_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x930160_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x930160_ProcActivateOnce( varMap, varPlayer, varImpact )

	if GetBagSpace( varMap, varPlayer) < 1 then
		Msg2Player( varMap, varPlayer, "背包空间不足1格，无法打开", 8, 3)
		Msg2Player( varMap, varPlayer, "背包空间不足1格，无法打开", 8, 2)
		return
	end
	if GetLevel(varMap, varPlayer)< x930160_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
        local targetID = x930160_var_ExcObjID[random(1,getn(x930160_var_ExcObjID))]



        local num = random(x930160_var_nummin,x930160_var_nummax)

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







function x930160_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
