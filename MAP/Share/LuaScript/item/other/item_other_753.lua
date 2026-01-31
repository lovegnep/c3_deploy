





x418753_var_FileId 		= 418753

x418753_var_LevelMin		=	50






function x418753_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418753_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418753_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418753_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418753_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418753_ProcActivateOnce( varMap, varPlayer, varImpact )
	local lv = GetLevel( varMap, varPlayer)
    if lv < 50 then
    Msg2Player( varMap, varPlayer, "请50级以后再使用此礼包", 8, 3)
        return
    end

	StartItemTask(varMap)
	ItemAppendBind( varMap, 10222015, 1 )	
	ItemAppendBind( varMap, 12035315, 1 )
	ItemAppendBind( varMap, 11990110, 1 )	
	ItemAppendBind( varMap, 12041101, 2 )
	ItemAppendBind( varMap, 12030016, 2 )		
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			AwardTitle(varMap,varPlayer,181)
			Msg2Player( varMap,varPlayer,"打开礼包，获得称号：开国名将、开国名将纪念披风、开国名将纪念时装（10天）等。",8,3) ;
			GamePlayScriptLog( varMap, varPlayer, 2689)
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







function x418753_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
