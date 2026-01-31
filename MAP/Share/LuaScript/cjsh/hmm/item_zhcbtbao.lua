





x930168_var_FileId 		= 930168

x930168_var_LevelMin		=	30

--每级每天可以领取的现金系数
x930168_var_money		=	500*1000
x930168_var_nummin = 100
x930168_var_nummax = 125

x930168_var_ExcObjID = {
	12274091
}



function x930168_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x930168_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x930168_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x930168_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x930168_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x930168_ProcActivateOnce( varMap, varPlayer, varImpact )

	if GetBagSpace( varMap, varPlayer) < 1 then
		Msg2Player( varMap, varPlayer, "背包空间不足3格，无法打开", 8, 3)
		Msg2Player( varMap, varPlayer, "背包空间不足3格，无法打开", 8, 2)
		return
	end
	
	if GetLevel(varMap, varPlayer)< x930168_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
        local targetID = x930168_var_ExcObjID[1]--战神寻宝图



        local num = random(x930168_var_nummin,x930168_var_nummax)

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







function x930168_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
