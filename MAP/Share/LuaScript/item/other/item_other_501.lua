
--2012情人节玫瑰排行榜礼包（天级永久）





x418501_var_FileId 		= 418501

x418501_var_LevelMin		=	1





function x418501_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418501_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418501_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418501_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418501_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418501_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	local year,month,day =GetYearMonthDay()
	if year ~= 2012 then
		if DepletingUsedItem(varMap, varPlayer) == 1 then 
			StartTalkTask(varMap)
			TalkAppendString(varMap,"礼包已过期")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		return
	end

	StartItemTask(varMap)
	ItemAppendBind( varMap, 10288195, 1 )	--天级心心相印戒指(永久)
	ItemAppendBind( varMap, 10298195, 1 )	--天级心心相印手镯(永久)


 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得心心相印戒指(永久)1个",8,3) ;
		
			Msg2Player( varMap,varPlayer,"打开礼包，获得心心相印手镯(永久)1个",8,3) ;
			
			
	
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418501_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
