
--任务达人大礼包





x418556_var_FileId 		= 418556

x418556_var_LevelMin		=	1





function x418556_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418556_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418556_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418556_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418556_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418556_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12041101, 1)	--修行草1个
	ItemAppendBind( varMap, 11990050, 2)	--还魂丹2个
	ItemAppendBind( varMap, 12030016, 1)	--队伍召集令1个

 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得2两金卡，50两银卡，修行草1个，还魂丹2个，队伍召集令1个",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得2两金卡，50两银卡，修行草1个，还魂丹2个，队伍召集令1个",8,3) ;
			local nMoney = 50000
			AddMoney(varMap, varPlayer, 1, nMoney)
			Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}银卡", nMoney),4,3)
			local nMoney = 2000
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







function x418556_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
