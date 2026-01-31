
--蓝色将星包





x418592_var_FileId 		= 418592

x418592_var_LevelMin		=	1





function x418592_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418592_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418592_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418592_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418592_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418592_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 45011076, 5)	--阿默德

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得5个阿默德。",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得5个阿默德。",8,3) ;
		
			
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







function x418592_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
