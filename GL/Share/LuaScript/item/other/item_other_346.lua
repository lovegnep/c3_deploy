





x418346_var_FileId 		= 418346 

x418346_var_LevelMin		=	1






function x418346_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418346_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418346_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418346_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418346_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418346_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418346_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 11000834, 1 )	--腰带图谱
		ItemAppendBind( varMap, 11000835, 1 )	--护手图谱
		ItemAppendBind( varMap, 11000836, 1 )	--战靴图谱
		ItemAppendBind( varMap, 11000837, 1 )	--项链图谱

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了1个腰带图谱和1个护手图谱等")
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
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有4个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418346_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
