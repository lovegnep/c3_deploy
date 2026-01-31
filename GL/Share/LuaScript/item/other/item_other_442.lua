





x418442_var_FileId 		= 418442

x418442_var_LevelMin		=	1






function x418442_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418442_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418442_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418442_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418442_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418442_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12041101, 8 )	--修行草
	ItemAppendBind( varMap, 12041108, 7 )	--荣誉之星
	ItemAppendBind( varMap, 12030011, 20 )	--4倍经验酒
	ItemAppendBind( varMap, 11990050, 5 )	--回魂丹
	ItemAppendBind( varMap, 11990115, 2 )	--原生钻石矿
	ItemAppendBind( varMap, 12030800, 1 )	--大航海回归大礼包（75级）

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,"打开礼包，获得了修行草8个、荣誉之星7个、大航海回归大礼包（75级）等",8,3) ;
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







function x418442_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
