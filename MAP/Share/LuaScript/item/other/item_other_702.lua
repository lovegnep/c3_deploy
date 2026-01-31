





x418702_var_FileId 		= 418702

x418702_var_LevelMin		=	1






function x418702_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418702_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418702_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418702_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418702_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418702_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	--判断背包剩余
	if GetBagSpace(varMap, varPlayer,0)+GetBagSpace(varMap, varPlayer,1) < 5 then
		Msg2Player(varMap, varPlayer, "背包空间不足！", 0, 2)
		Msg2Player(varMap, varPlayer, "背包空间不足！", 0, 3)
		return
	end
	
	if GetLevel(varMap, varPlayer)< x418702_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 45013120, 1 )	  --5星拔都
		ItemAppendBind( varMap, 45012664, 1 )   --4星术赤
    ItemAppendBind( varMap, 45011714, 1 )		--4星忽必烈
    ItemAppendBind( varMap, 45013670, 1 )		--5星铁篾赤
    ItemAppendBind( varMap, 45012180, 1 )   --5星铁木真



	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得5星拔都、4星术赤、4星忽必烈、5星铁篾赤、5星铁木真。")
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







function x418702_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
