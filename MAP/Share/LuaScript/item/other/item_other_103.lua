





x418103_var_FileId = 418103






function x418103_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418103_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418103_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418103_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418103_ProcDeplete( varMap, varPlayer )
	return 1;
end








function x418103_ProcActivateOnce( varMap, varPlayer, varImpact )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
	local j=random(1,10);
	if j==1 then
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer,8338, 0);
	elseif j==2 then
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer,8339, 0);
	elseif j==3 then
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer,8340, 0);
	elseif j==4 then
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer,8341, 0);
	elseif j==5 then
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer,8342, 0);
	elseif j==6 then
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer,8343, 0);
	elseif j==7 then
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer,8344, 0);
	elseif j==8 then
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer,8345, 0);
	elseif j==9 then
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer,8346, 0);
	elseif j==10 then
	SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer,8347, 0);
  end

  		
		x418103_ProcTopListYanghua(varMap,varPlayer)

		StartTalkTask(varMap);
		TalkAppendString(varMap, "您使用了烟花");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您使用了烟花",CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
	end
end	







function x418103_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end




function x418103_ProcTopListYanghua(varMap,varPlayer)

	
	
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
