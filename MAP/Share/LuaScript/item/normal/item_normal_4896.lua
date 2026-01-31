






x404896_var_FileId 		= 404896 

x404896_var_LevelMin		=	20






function x404896_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404896_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404896_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404896_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404896_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x404896_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetGuildID(varMap, varPlayer) < 0 then
		
		StartTalkTask(varMap)
		TalkAppendString(varMap,"没有加入帮会，不能使用此物品。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	if x404896_IsOneWeekPassed(varMap, varPlayer)<=0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"本威望包一周只能开启一次,请您尝试其他威望包")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
	    local varLevel = GetLevel( varMap,varPlayer )
		local nValue = varLevel*30
		AddGuildUserPoint(varMap, varPlayer, nValue)	
		Msg2Player(varMap,varPlayer,"#o获得#R帮贡"..nValue.."点#o的奖励",8,2)

		x404896_SaveDoTime(varMap, varPlayer)
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x404896_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end





function x404896_IsOneWeekPassed(varMap, varPlayer)

	
	local curWeek = GetWeekIndex();

	local lastWeek = GetPlayerGameData(varMap, varPlayer, MD_WEIWANG_GUILD_WEEK[1], MD_WEIWANG_GUILD_WEEK[2],MD_WEIWANG_GUILD_WEEK[3] );

	if curWeek ~= lastWeek then
		return 1
	else
		return 0;
	end
	
	
	

end




function x404896_SaveDoTime(varMap, varPlayer)

	local curWeek = GetWeekIndex();
	SetPlayerGameData(varMap, varPlayer, MD_WEIWANG_GUILD_WEEK[1], MD_WEIWANG_GUILD_WEEK[2], MD_WEIWANG_GUILD_WEEK[3], curWeek)
	
	
	
end
