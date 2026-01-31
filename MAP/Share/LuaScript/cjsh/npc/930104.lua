





x930104_var_FileId 		= 930104

x930104_var_LevelMin		=	1






function x930104_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x930104_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x930104_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x930104_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x930104_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x930104_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x930104_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
			ItemAppendBind( varMap, 20000010, 1 ) --车身·踏云战车
			ItemAppendBind( varMap,	20010008, 1 )
			ItemAppendBind( varMap,	20020008, 1 )
			ItemAppendBind( varMap,	20030008, 1 )
			ItemAppendBind( varMap,	20040008, 1 )
			ItemAppendBind( varMap,	20050008, 1 )
			ItemAppendBind( varMap,	20060008, 1 )
			ItemAppendBind( varMap,	20070008, 1 )


	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			message = "恭喜你打开了七杀战车大礼包"
			Msg2Player( varMap, varPlayer, message, 8, 2)
			Msg2Player( varMap, varPlayer, message, 8, 3)

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
		StartItemTask(varMap)

			ItemAppendBind( varMap,	20080006, 1 )

	local ret0 = StopItemTask(varMap,varPlayer)
	if ret0 > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x930104_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
