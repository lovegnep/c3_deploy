





x432330_var_FileId 		= 432330

x432330_var_LevelMin		=	60






function x432330_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x432330_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x432330_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x432330_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x432330_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x432330_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x432330_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	
	StartItemTask(varMap)
		ItemAppendBind( varMap, 11990051, 15 )	--回魂丹
		ItemAppendBind( varMap, 12041101, 15 )	--修行草
		ItemAppendBind( varMap, 12041108, 15 )	--荣誉之星
		ItemAppendBind( varMap, 11990110, 15 )	--募集券
		ItemAppendBind( varMap, 11990115, 9 )	--原生钻石矿
		ItemAppendBind( varMap, 11000300, 9 )	--灵魂印

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开怯薛军饷大礼包，获得修行草15个、募集券15个、原生钻石矿9个等道具")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足，需要6个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x432330_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
