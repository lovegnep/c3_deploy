
--白金麒麟龙年大礼包





x418467_var_FileId 		= 418467

x418467_var_LevelMin		=	1





function x418467_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418467_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418467_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418467_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418467_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418467_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12050355, 1 )	--武威龙王降世符
	ItemAppendBind( varMap, 11000936, 70 )	--雪山之星
	ItemAppendBind( varMap, 12030203, 2 )	--朝廷请柬
	ItemAppendBind( varMap, 11990113, 4 )	--钻石原石
	


	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			if GetSex(varMap,varPlayer) == 1 then
			Msg2Player( varMap,varPlayer,"打开礼包，获得武威龙王降世符1个 雪山之星70个 朝廷请柬2个 钻石原石4个",8,3) ;
			else
			Msg2Player( varMap,varPlayer,"打开礼包，获得武威龙王降世符1个 雪山之星70个 朝廷请柬2个 钻石原石4个",8,3) ;
			
			end
			GamePlayScriptLog( varMap, varPlayer, 3041)
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







function x418467_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
