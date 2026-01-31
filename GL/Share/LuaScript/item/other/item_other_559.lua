
--意外补偿礼包B





x418559_var_FileId 		= 418559

x418559_var_LevelMin		=	1





function x418559_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418559_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418559_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418559_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418559_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418559_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12041101, 4)	--修行草4个
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得修行草4个，20两金卡，100两银卡",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得修行草4个，20两金卡，100两银卡",8,3) ;
			local nMoney = 100000
			AddMoney(varMap, varPlayer, 1, nMoney)
			Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}银卡", nMoney),4,3)
			local nMoney = 20000
			AddMoney(varMap, varPlayer, 3, nMoney)
			Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,3)
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







function x418559_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
