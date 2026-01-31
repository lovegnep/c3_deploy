
--2012情人节玫瑰排行榜礼包（天级90天）





x418504_var_FileId 		= 418504

x418504_var_LevelMin		=	1





function x418504_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418504_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418504_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418504_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418504_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418504_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
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
	ItemAppendBind( varMap, 10288213, 1 )	--天级心心相印戒指(90天)
	ItemAppendBind( varMap, 10298213, 1 )	--天级心心相印手镯(90天)


 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得心心相印戒指(90天)1个",8,3) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得心心相印手镯(90天)1个",8,3) ;
			
		
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







function x418504_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
