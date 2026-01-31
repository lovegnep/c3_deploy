
--美团网团购礼包





x418541_var_FileId 		= 418541

x418541_var_LevelMin		=	1





function x418541_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418541_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418541_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418541_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418541_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418541_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	local nian, yue, ri = GetYearMonthDay()
	local shi,fen,miao = GetHourMinSec()	

	if yue == 3 and ri < 23 then
		Msg2Player( varMap, varPlayer, "请3月23号后开启", 8, 3)
		return	
	end
	
	
	
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12030893, 1)	--美团网团购道具包
	ItemAppendBind( varMap, 12030894, 1)	--美团网团购装备包

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得美团网团购道具包、美团网团购装备包",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得美团网团购道具包、美团网团购装备包",8,3) ;
		
			
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







function x418541_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
