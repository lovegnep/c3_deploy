--修行草囊



x418728_var_FileId 		= 418728

x418728_var_LevelMin		=	1




function x418728_ProcEventEntry( varMap, varPlayer, varBagIdx )
	if GetBagSpace(varMap, varPlayer) < 1 then			
		Msg2Player(varMap,varPlayer, "至少需要一个背包空间,才能使用此道具",4,3)
		return
	end
	local varToday = GetDayOfYear()
	print("背包位置是："..varBagIdx)
	if GetItemIsOverTimeByBagPos(varMap ,varPlayer ,varBagIdx) == 1 then
		EraseItem(varMap, varPlayer,varBagIdx)
		Msg2Player(varMap, varPlayer, "您使用的物品已过期,道具自动删除！", 8, 3)
		return
	end
	if varToday == GetItemParam( varMap, varPlayer, varBagIdx, 4, 2) then
		Msg2Player(varMap,varPlayer, "您今日已使用过此道具，请明天再使用",8,3)
		return
	else
		SetItemParam( varMap, varPlayer, varBagIdx, 4, 2, varToday)
	end

	StartItemTask(varMap)
 		ItemAppendBind( varMap, 12041101, 24)  --24个修行草

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
			Msg2Player(varMap, varPlayer, "恭喜您获得24株#G修行草#cffcc00", 8, 3)
  		DeliverItemListSendToPlayer( varMap, varPlayer)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	
end



function x418728_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418728_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418728_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418728_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418728_ProcActivateOnce( varMap, varPlayer, varImpact )

end







function x418728_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
