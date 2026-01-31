
--美团网团购装备包





x418543_var_FileId 		= 418543

x418543_var_LevelMin		=	1





function x418543_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418543_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418543_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418543_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418543_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418543_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	local nian, yue, ri = GetYearMonthDay()
	local shi,fen,miao = GetHourMinSec()	

	if yue == 3 and ri < 23 then
		Msg2Player( varMap, varPlayer, "请3月23号后开启", 8, 3)
		return	
	end
	
	
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12030201, 5)	--修理石
	ItemAppendBind( varMap, 10306039, 1)	--宫廷时装30天
	

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得修理石5个、宫廷时装30天",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得修理石5个、宫廷时装30天",8,3) ;
		
			
			GamePlayScriptLog( varMap, varPlayer, 3049)
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







function x418543_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
