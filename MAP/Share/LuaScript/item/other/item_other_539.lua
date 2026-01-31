
--高朋网团购道具包





x418539_var_FileId 		= 418539

x418539_var_LevelMin		=	1





function x418539_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418539_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418539_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418539_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418539_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418539_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	local nian, yue, ri = GetYearMonthDay()
	local shi,fen,miao = GetHourMinSec()	

	if yue == 3 and ri < 23 then
		Msg2Player( varMap, varPlayer, "请3月23号后开启", 8, 3)
		return	
	end
	
	
	
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12250002, 1)	--精品芝华士
	ItemAppendBind( varMap, 11990100, 2)	--混沌之星
	ItemAppendBind( varMap, 12030200, 1)	--小喇叭
	ItemAppendBind( varMap, 12030031, 1)	--神行符
	ItemAppendBind( varMap, 12010021, 1)	--中生命清露
	ItemAppendBind( varMap, 11990050, 3)	--回魂丹
	ItemAppendBind( varMap, 12030016, 3)	--队伍召集令

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得精品芝华士、中生命清露、小喇叭、神行符等",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得精品芝华士、中生命清露、小喇叭、神行符等",8,3) ;
		
			
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







function x418539_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
