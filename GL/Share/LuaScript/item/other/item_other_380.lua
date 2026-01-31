





x418380_var_FileId 		= 418380

x418380_var_LevelMin		=	1






function x418380_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418380_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418380_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418380_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418380_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418380_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418380_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		local lv = GetLevel( varMap , varPlayer )
		
		local inherenceLevel = GetInherenceLevel( varMap, varPlayer )
		
		if lv < 68 then
			ItemAppendBind( varMap, 12030728, 1 )--多彩豆豆虎降世符（50级）
		elseif lv < 78 then
			ItemAppendBind( varMap, 12030729, 1 )--多彩豆豆虎降世符（70级）
		elseif lv >= 110 or (inherenceLevel > 64 and lv > 99 ) then
			ItemAppendBind( varMap, 12030731, 1 )--多彩豆豆虎降世符（110级）
		elseif lv < 110 then
			ItemAppendBind( varMap, 12030730, 1 )--多彩豆豆虎降世符（80级）
		end

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开多彩豆豆虎降世符大礼包，获得1个多彩豆豆虎降世符。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			GamePlayScriptLog( varMap, varPlayer, 2639)
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







function x418380_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
