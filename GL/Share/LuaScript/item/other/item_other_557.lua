
--老玩家回归礼包





x418557_var_FileId 		= 418557

x418557_var_LevelMin		=	1





function x418557_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418557_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418557_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418557_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418557_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418557_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	
	


	StartItemTask(varMap)
	ItemAppendBind( varMap, 12041101, 5)	--修行草5个
	ItemAppendBind( varMap, 11990110, 1)	--募集券1个
	ItemAppendBind( varMap, 11990011, 3)	--三番令3个
	ItemAppendBind( varMap, 12054300, 20)	--还童书20本

 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得修行草5个、500两银卡、还童书20本、200两金卡等",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得修行草5个、500两银卡、还童书20本、200两金卡等",8,3) ;
			local nMoney = 500000
			AddMoney(varMap, varPlayer, 1, nMoney)
			Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}银卡", nMoney),4,3)
			local nMoney = 200000
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







function x418557_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
