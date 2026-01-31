
--大理时装礼包





x418544_var_FileId 		= 418544

x418544_var_LevelMin		=	1





function x418544_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418544_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418544_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418544_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418544_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418544_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 10306037, 1)	--大理时装30天
	

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得大理时装30天",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得大理时装30天",8,3) ;
		
			
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







function x418544_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
