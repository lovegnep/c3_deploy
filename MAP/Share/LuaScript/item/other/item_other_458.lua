
--YY平民新年特权卡





x418458_var_FileId 		= 418458

x418458_var_LevelMin		=	1





function x418458_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418458_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418458_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418458_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418458_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418458_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12050276, 1 )	--黄金虎降世符
  ItemAppendBind( varMap, 11990011, 5 )	--三番令




	

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			local nMoney = 100000
			AddMoney(varMap,varPlayer,1,nMoney)
		
			Msg2Player( varMap,varPlayer,"打开礼包，获得黄神马降世符1个、还童书5个、银卡100两",8,3) ;
		
			GamePlayScriptLog( varMap, varPlayer, 3017)
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







function x418458_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
