





x418370_var_FileId 		= 418370

x418370_var_LevelMin		=	1






function x418370_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418370_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418370_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418370_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418370_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418370_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418370_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"打开记者团成员大礼包，获得“记者团成员”称号")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		AwardTitle(varMap,varPlayer,158) --“记者团成员”称号"
		Msg2Player(varMap, varPlayer, "获得#G记者团成员#o称号", 8, 2)
		Msg2Player(varMap, varPlayer, "获得#G记者团成员#o称号", 8, 3)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418370_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
