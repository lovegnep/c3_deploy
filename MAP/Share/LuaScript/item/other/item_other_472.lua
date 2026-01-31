
--天尊麒麟龙年大礼包





x418472_var_FileId 		= 418472

x418472_var_LevelMin		=	1





function x418472_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418472_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418472_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418472_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418472_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418472_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12030863, 1 )	--魔君变身石（1小时）
	ItemAppendBind( varMap, 12030803, 1 )	--梦魇龙王降世符
	ItemAppendBind( varMap, 11000950, 80 )	--精品地中海尖凿
	ItemAppendBind( varMap, 11970023, 100 )	--黄金乱士符
	ItemAppendBind( varMap, 11990122, 100 )	--明亮的彩钻
	


	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			if GetSex(varMap,varPlayer) == 1 then
			Msg2Player( varMap,varPlayer,"打开礼包，获得梦魇龙王降世符1个、精品地中海尖凿80个、黄金乱士符100个等。 ",8,3) ;
			else
			Msg2Player( varMap,varPlayer,"打开礼包，获得梦魇龙王降世符1个、精品地中海尖凿80个、黄金乱士符100个等。 ",8,3) ;
			
			end
			GamePlayScriptLog( varMap, varPlayer, 3046)
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







function x418472_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
