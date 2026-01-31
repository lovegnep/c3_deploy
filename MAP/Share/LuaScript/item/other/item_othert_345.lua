





x432345_var_FileId 		= 432345

x432345_var_LevelMin		=	1






function x432345_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x432345_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x432345_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x432345_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x432345_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x432345_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x432345_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12041085, 1 )--命中平衡神水1个
		ItemAppendBind( varMap, 12041086, 1 )--闪避平衡神水1个
		ItemAppendBind( varMap, 12041087, 1 )--暴击平衡神水1个
		ItemAppendBind( varMap, 12041088, 1 )--韧性平衡神水1个

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开平衡神水大礼包，获得命中，闪避，暴击和韧性平衡神水各一个。")
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
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x432345_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
