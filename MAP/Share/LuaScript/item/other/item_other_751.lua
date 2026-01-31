





x418751_var_FileId 		= 418751

x418751_var_LevelMin		=	50






function x418751_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418751_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418751_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418751_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418751_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418751_ProcActivateOnce( varMap, varPlayer, varImpact )
	----if GetLevel(varMap,varPlayer) <= x418751_var_LevelMin ten
	local lv = GetLevel( varMap, varPlayer)
    if lv < 50 then
    Msg2Player( varMap, varPlayer, "请50级以后再使用此礼包", 8, 3)
        return
    end

	StartItemTask(varMap)
	ItemAppendBind( varMap, 10222013, 1 )	
	ItemAppendBind( varMap, 12035313, 1 )
	ItemAppendBind( varMap, 11990110, 3 )	
	ItemAppendBind( varMap, 12041101, 5 )
	ItemAppendBind( varMap, 12030016, 5 )	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			AwardTitle(varMap,varPlayer,179)
			Msg2Player( varMap,varPlayer,"打开礼包，获得称号：开国元勋、开国元勋纪念披风、开国元勋纪念时装（30天）等。",8,3) ;
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







function x418751_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
