





x418441_var_FileId 		= 418441

x418441_var_LevelMin		=	1






function x418441_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418441_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418441_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418441_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418441_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418441_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12041101, 5 )	--修行草
	ItemAppendBind( varMap, 12041108, 5 )	--荣誉之星
	ItemAppendBind( varMap, 12030011, 20 )	--4倍经验酒
	ItemAppendBind( varMap, 11990050, 3 )	--回魂丹
	ItemAppendBind( varMap, 11990115, 1 )	--原生钻石矿
	ItemAppendBind( varMap, 12030799, 1 )	--大航海回归大礼包（70级）

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,"打开礼包，获得了修行草5个、荣誉之星5个、4倍经验酒20个，回魂丹3个，原生钻石矿1个，大航海回归大礼包（70级）",8,3) ;
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







function x418441_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
