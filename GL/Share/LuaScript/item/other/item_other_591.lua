
--绿色将星包





x418591_var_FileId 		= 418591

x418591_var_LevelMin		=	1





function x418591_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418591_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418591_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418591_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418591_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418591_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 45011031, 5)	--巴图

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得5个巴图。",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得5个巴图。",8,3) ;
		
			
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







function x418591_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
