





x432320_var_FileId 		= 432320

x432320_var_LevelMin		=	1






function x432320_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x432320_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x432320_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x432320_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x432320_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x432320_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x432320_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		local varRand = random (1,3)
		if varRand <= 1 then
			ItemAppendBind( varMap, 10300162, 1 ) --皇家时装
		elseif varRand <= 2 then
			ItemAppendBind( varMap, 10300163, 1 ) --皇家时装
		elseif varRand <= 3 then
			ItemAppendBind( varMap, 10300164, 1 ) --皇家时装	
		end

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得1件皇家时装。")
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







function x432320_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
