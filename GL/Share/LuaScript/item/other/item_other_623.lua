





x418623_var_FileId 		= 418623 

x418623_var_LevelMin		=	1






function x418623_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418623_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418623_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418623_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418623_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418623_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418623_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
		
	local rand = random(1,3)
	local varMark = 0
	StartItemTask( varMap)
		local year, month, day = GetYearMonthDay();
		local day1 = GetDayOfYear()
		if year == 2012 and day1 >=145 and day1 <= 147 then
			if rand == 1 then 
				ItemAppendBind( varMap, 11000307, 1)
				varMark = 1
			end
		end
		if StopItemTask( varMap, varPlayer) == 0 then
    	Msg2Player( varMap, varPlayer, "背包已满，无法获得奖励", 8, 3)
    	return
    else			
			if(DepletingUsedItem(varMap, varPlayer)) == 1 then
				local nMoney = 550
				AddMoney(varMap, varPlayer, 3, nMoney)
			  GamePlayScriptLog( varMap, varPlayer, 1481)
				Msg2Player(varMap,varPlayer,format("您获得了#{_MONEY%d}金卡", nMoney),8,3)
				if varMark == 1 then
					Msg2Player(varMap,varPlayer,format("恭喜您获得#G星魂碎片"),8,3)
					Msg2Player(varMap,varPlayer,format("您获得了#G星魂碎片"),8,2)
					DeliverItemListSendToPlayer( varMap, varPlayer)
				end				
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"使用物品异常！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		end

end







function x418623_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
