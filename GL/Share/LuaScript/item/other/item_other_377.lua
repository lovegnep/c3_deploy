





x418377_var_FileId 		= 418377

x418377_var_LevelMin		=	1






function x418377_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418377_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418377_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418377_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418377_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418377_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418377_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 11000215, 1 )--国传水火钻石1个
		ItemAppendBind( varMap, 11000216, 1 )--国传晕光钻石1个
		ItemAppendBind( varMap, 11990115, 1 )--原生钻石矿1个
		ItemAppendBind( varMap, 20000007, 1 )--qq战车1个
		ItemAppendBind( varMap, 12266814, 10 )--合金材料10个
		ItemAppendBind( varMap, 12267000, 5 )--赤铁铸件5个
		ItemAppendBind( varMap, 12267001, 5 )--青铜铸件5个
		ItemAppendBind( varMap, 12267002, 5 )--墨钢铸件5个
		
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开QQ年费会员礼包，获得1个原生钻石矿，1个QQ会员专属战车和1个原生钻石矿等。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			GamePlayScriptLog( varMap, varPlayer, 2636)
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







function x418377_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
