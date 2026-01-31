





x418427_var_FileId 		= 418427

x418427_var_LevelMin		=	1






function x418427_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418427_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418427_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418427_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418427_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418427_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12030505, 1 )	--节日时装礼包
	ItemAppendBind( varMap, 12030203, 2 )	--朝廷请柬
	ItemAppendBind( varMap, 12030258, 50 )	--全福月饼
	ItemAppendBind( varMap, 11990113, 5 )	--钻石原石

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,"打开礼包，获得了节日时装礼包，朝廷请柬2个，全福月饼50个，钻石原石5个",8,3) ;
			GamePlayScriptLog( varMap, varPlayer, 2689)
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







function x418427_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
