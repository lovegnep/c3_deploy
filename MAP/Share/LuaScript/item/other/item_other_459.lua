
--YY平民新年特权卡





x418459_var_FileId 		= 418459

x418459_var_LevelMin		=	1





function x418459_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418459_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418459_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418459_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418459_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418459_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12050289, 1 )	--神马降世符
  ItemAppendBind( varMap, 12054300, 5 )	--还童书



	

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			local nMoney = 200000
			AddMoney(varMap,varPlayer,1,nMoney)
		
			Msg2Player( varMap,varPlayer,"打开礼包，获得神马降世符1个、还童书5个、银卡200两",8,3) ;
		
			GamePlayScriptLog( varMap, varPlayer, 3018)
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







function x418459_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
