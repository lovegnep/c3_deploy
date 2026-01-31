





x930165_var_FileId 		= 930165

x930165_var_LevelMin		=	30

--每级每天可以领取的现金系数
x930165_var_money		=	500*1000
x930165_var_nummin = 15
x930165_var_nummax = 45

x930165_var_ExcObjID = {
    11000304,11000317,11000309,11000306,11000331,11000379,11000340,11000316,11000315
}



function x930165_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x930165_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x930165_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x930165_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x930165_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x930165_ProcActivateOnce( varMap, varPlayer, varImpact )

	if GetBagSpace( varMap, varPlayer) < 5 then
		Msg2Player( varMap, varPlayer, "背包空间不足5格，无法打开", 8, 3)
		Msg2Player( varMap, varPlayer, "背包空间不足5格，无法打开", 8, 2)
		return
	end
	
	if GetLevel(varMap, varPlayer)< x930165_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
        local targetID = 12274025--五品幻兽内丹



        local num = random(x930165_var_nummin,x930165_var_nummax)

        StartItemTask(varMap)
        ItemAppendBind( varMap, targetID, num)
        ItemAppendBind( varMap, 12220122, 10)--五代生命源龙
        ItemAppendBind( varMap, 12220120, 5)--三代生命源龙

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







function x930165_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
