





x300393_var_FileId = 300393






function x300393_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x300393_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300393_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300393_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x300393_ProcDeplete( varMap, varPlayer )
	return 1;
end








function x300393_ProcActivateOnce( varMap, varPlayer, varImpact )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer,7535, 0);

		
		x300393_ProcTopListYanghua(varMap,varPlayer)

		StartTalkTask(varMap);
		TalkAppendString(varMap, "您使用了烟花");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您使用了烟花",CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
	end
end	







function x300393_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end




function x300393_ProcTopListYanghua(varMap,varPlayer)

	
	
	local lastweek = GetPlayerGameData( varMap, varPlayer, MD_YANHUA_WEEK[1], MD_YANHUA_WEEK[2], MD_YANHUA_WEEK[3] )
	local curcount = GetPlayerGameData( varMap, varPlayer, MD_YANHUA_COUNT[1], MD_YANHUA_COUNT[2], MD_YANHUA_COUNT[3] )
	
	
	local curweek = LuaCallNoclosure( 888888, "GetWorldWeek", varMap)
	if lastweek ~= curweek then
		curcount = 0
	end

	
	
	curcount = curcount + 1
	
	if curcount > MAX_WANFATOPLIST_COUNT then
		curcount = MAX_WANFATOPLIST_COUNT
	end
	
	SetPlayerGameData( varMap, varPlayer, MD_YANHUA_COUNT[1], MD_YANHUA_COUNT[2], MD_YANHUA_COUNT[3], curcount )
	SetPlayerGameData( varMap, varPlayer, MD_YANHUA_WEEK[1], MD_YANHUA_WEEK[2], MD_YANHUA_WEEK[3], curweek )

	
	SendToplistKeyValue2GL(varMap, varPlayer, YANHUA_TOPLIST, curcount)
	GamePlayScriptLog(varMap, varPlayer, 5000)
	
end
