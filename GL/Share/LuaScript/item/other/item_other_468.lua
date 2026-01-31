
--玉麒麟龙年大礼包





x418468_var_FileId 		= 418468

x418468_var_LevelMin		=	1





function x418468_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418468_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418468_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418468_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418468_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418468_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
  ItemAppendBind( varMap, 12030861, 1 )	--魔君变身石（5小时）
	ItemAppendBind( varMap, 12050355, 1 )	--武威龙王降世符
	ItemAppendBind( varMap, 11000936, 100 )	--雪山之星
	ItemAppendBind( varMap, 11970023, 20 )	--黄金乱士符
	ItemAppendBind( varMap, 11990122, 20 )	--明亮的彩钻
	


	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			if GetSex(varMap,varPlayer) == 1 then
			Msg2Player( varMap,varPlayer,"打开礼包，获得魔君变身石（5小时）1个 武威龙王降世符1个 雪山之星100个 黄金乱士符20个 明亮的彩钻20个。 ",8,3) ;
			else
			Msg2Player( varMap,varPlayer,"打开礼包，获得魔君变身石（5小时）1个 武威龙王降世符1个 雪山之星100个 黄金乱士符20个 明亮的彩钻20个。 ",8,3) ;
			
			end
			GamePlayScriptLog( varMap, varPlayer, 3014)
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







function x418468_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
