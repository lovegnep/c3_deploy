
--符石包





x418509_var_FileId 		= 418509

x418509_var_LevelMin		=	1





function x418509_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418509_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418509_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418509_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418509_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418509_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 11000909, 250)	--力量符石
	ItemAppendBind( varMap, 11000911, 250)	--敏捷符石
	ItemAppendBind( varMap, 11000913, 250)	--智力符石
	ItemAppendBind( varMap, 11000915, 250)	--体质符石

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得250个力量符石、250个敏捷符石、250个智力符石、250个体质符石",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得250个力量符石、250个敏捷符石、250个智力符石、250个体质符石",8,3) ;
		
			
			GamePlayScriptLog( varMap, varPlayer, 3049)
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







function x418509_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
