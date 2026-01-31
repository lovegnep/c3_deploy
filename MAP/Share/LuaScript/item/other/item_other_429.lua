





x418429_var_FileId 		= 418429

x418429_var_LevelMin		=	1






function x418429_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418429_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418429_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418429_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418429_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418429_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 10310040, 1 )	--小四喜
	ItemAppendBind( varMap, 12030505, 1 )	--节日时装礼包
	ItemAppendBind( varMap, 12030258, 100 )	--全福月饼
	ItemAppendBind( varMap, 12050295, 1 )	--羊驼降世符
	ItemAppendBind( varMap, 11990113, 10 )	--钻石原石

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,"打开礼包，获得了小四喜(30天)、节日时装礼包、全福月饼100个，羊驼降世符等",8,3) ;
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







function x418429_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
