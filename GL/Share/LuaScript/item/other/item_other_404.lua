





x418404_var_FileId 		= 418404 

x418404_var_LevelMin		=	40






function x418404_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418404_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418404_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418404_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418404_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418404_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418404_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12050276, 1 )	--30级黄金虎坐骑
		ItemAppendBind( varMap, 11010001, 5 )	--一级皇家秘银
		ItemAppendBind( varMap, 12010020, 1 )	--小生命清露
		ItemAppendBind( varMap, 12030011, 40 )	--杰克丹尼
		ItemAppendBind( varMap, 12030012, 20 )	--路易十三

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了30级黄金虎坐骑、一级皇家秘银、小生命清露、杰克丹尼和路易十三。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			AddMoney(varMap, varPlayer, 1, 200000)
			GamePlayScriptLog(varMap, varPlayer, 2662) 
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有5个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418404_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
