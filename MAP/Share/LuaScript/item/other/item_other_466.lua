
--金麒麟龙年大礼包





x418466_var_FileId 		= 418466

x418466_var_LevelMin		=	1





function x418466_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418466_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418466_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418466_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418466_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418466_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12050355, 1 )	--武威龙王降世符
	ItemAppendBind( varMap, 11000936, 50 )	--雪山之星
	ItemAppendBind( varMap, 12030203, 1 )	--朝廷请柬
	ItemAppendBind( varMap, 11990113, 2 )	--钻石原石
	


	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			if GetSex(varMap,varPlayer) == 1 then
			Msg2Player( varMap,varPlayer,"打开礼包，获得武威龙王降世符1个 雪山之星50个 朝廷请柬1个 钻石原石2个",8,3) ;
			else
			Msg2Player( varMap,varPlayer,"打开礼包，获得武威龙王降世符1个 雪山之星50个 朝廷请柬1个 钻石原石2个",8,3) ;
			
			end
			GamePlayScriptLog( varMap, varPlayer, 3040)
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







function x418466_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
