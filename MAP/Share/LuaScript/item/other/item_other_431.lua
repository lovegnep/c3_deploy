





x418431_var_FileId 		= 418431

x418431_var_LevelMin		=	1






function x418431_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418431_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418431_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418431_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418431_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418431_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 10310002, 1 )	--小四喜
	ItemAppendBind( varMap, 12030505, 1 )	--节日时装礼包
	ItemAppendBind( varMap, 12030258, 200 )	--全福月饼
	ItemAppendBind( varMap, 12030766, 1 )	--幽铠魇虎降世符
	ItemAppendBind( varMap, 11990122, 100 )	--明亮的彩钻

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,"打开礼包，获得了小四喜（永不磨损），节日时装礼包，幽铠魇虎降世符等",8,3) ;
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







function x418431_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
