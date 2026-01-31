
--至尊麒麟龙年大礼包





x418471_var_FileId 		= 418471

x418471_var_LevelMin		=	1





function x418471_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418471_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418471_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418471_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418471_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418471_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12030862, 1 )	--魔君变身石（3小时）
	ItemAppendBind( varMap, 12030803, 1 )	--梦魇龙王降世符
	ItemAppendBind( varMap, 11000950, 50 )	--精品地中海尖凿
	ItemAppendBind( varMap, 11970023, 80 )	--黄金乱士符
	ItemAppendBind( varMap, 11990122, 80 )	--明亮的彩钻
	


	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			if GetSex(varMap,varPlayer) == 1 then
			Msg2Player( varMap,varPlayer,"打开礼包，获得梦魇龙王降世符1个、精品地中海尖凿50个、黄金乱士符80个等。 ",8,3) ;
			else
			Msg2Player( varMap,varPlayer,"打开礼包，获得梦魇龙王降世符1个、精品地中海尖凿50个、黄金乱士符80个等。 ",8,3) ;
			
			end
			GamePlayScriptLog( varMap, varPlayer, 3045)
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







function x418471_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
