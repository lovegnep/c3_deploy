
--2012情人节玫瑰排行榜礼包（冥级永久）





x418502_var_FileId 		= 418502

x418502_var_LevelMin		=	1





function x418502_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418502_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418502_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418502_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418502_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418502_ProcActivateOnce( varMap, varPlayer, varImpact )
	
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
	ItemAppendBind( varMap, 10288198, 1 )	--冥级心心相印戒指(永久)
	ItemAppendBind( varMap, 10298198, 1 )	--冥级心心相印手镯(永久)


 	
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







function x418502_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
