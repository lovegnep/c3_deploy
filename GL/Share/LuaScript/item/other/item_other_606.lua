





x418606_var_FileId 		= 418606

x418606_var_LevelMin		=	1






function x418606_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418606_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418606_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418606_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418606_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418606_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418606_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 12052351, 1 )	--骑术宝典：一级无双
		ItemAppendBind( varMap, 12052361, 1 ) --骑术宝典：一级无畏
    ItemAppendBind( varMap, 12052391, 1 ) --骑术宝典：一级幻法
    ItemAppendBind( varMap, 12052321, 1 ) --骑术宝典：一级大喝


	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得一级无双、一级无畏、一级幻法、一级大喝。")
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







function x418606_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
