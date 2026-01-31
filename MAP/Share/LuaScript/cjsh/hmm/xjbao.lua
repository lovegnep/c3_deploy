





x930139_var_FileId 		= 930139

x930139_var_LevelMin		=	60

--每级每天可以领取的现金系数
x930139_var_money		=	500*1000






function x930139_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x930139_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x930139_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x930139_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x930139_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x930139_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x930139_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local nItemID, nItemNum, nLevelPre = GetPeerVipInfo(varMap, varPlayer, 1);
		if nLevelPre <= 0 then
			Msg2Player(varMap, varPlayer,"贵族等级不足1级！",8,3)
        	Msg2Player(varMap, varPlayer,"贵族等级不足1级！",8,2)
        return
		end
		
		local nMoney = x930139_var_money * nLevelPre
		AddGold(varMap, varPlayer, nMoney)
		
		GamePlayScriptLog( varMap, varPlayer, 1484)
		
		Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}现金", nMoney),4,3)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x930139_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
