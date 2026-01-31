





x418546_var_FileId 		= 418546 

x418546_var_LevelMin		=	1






function x418546_ProcEventEntry( varMap, varPlayer, varBagIdx )

	if GetLevel(varMap, varPlayer)< x418546_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1)) == 1 then
		local nMoney = random(40,50)
		AddMoney(varMap, varPlayer, 1, nMoney)
		
		GamePlayScriptLog( varMap, varPlayer, 1485)
		
		Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}银卡", nMoney),4,3)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
end






function x418546_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418546_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418546_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418546_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418546_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

end







function x418546_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
