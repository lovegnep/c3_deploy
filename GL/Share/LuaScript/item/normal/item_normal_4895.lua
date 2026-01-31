






x404895_var_FileId 		= 404895 

x404895_var_LevelMin		=	20






function x404895_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404895_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404895_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404895_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404895_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x404895_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if x404895_IsOneWeekPassed(varMap, varPlayer)<=0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"本威望包一周只能开启一次,请您尝试其他威望包")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local varLevel = GetLevel( varMap,varPlayer )
		local nValue = varLevel*72
		AddHonor(varMap, varPlayer, nValue)
		Msg2Player(varMap,varPlayer,"#o获得#R荣誉"..nValue.."点#o的奖励",8,2)

		x404895_SaveDoTime(varMap, varPlayer)
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x404895_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end





function x404895_IsOneWeekPassed(varMap, varPlayer)

	
	local curWeek = GetWeekIndex();

	local lastWeek = GetPlayerGameData(varMap, varPlayer, MD_WEIWANG_HONOR_WEEK[1], MD_WEIWANG_HONOR_WEEK[2],MD_WEIWANG_HONOR_WEEK[3] );

	if curWeek ~= lastWeek then
		return 1
	else
		return 0;
	end
	
	
	

end




function x404895_SaveDoTime(varMap, varPlayer)

	local curWeek = GetWeekIndex();
	SetPlayerGameData(varMap, varPlayer, MD_WEIWANG_HONOR_WEEK[1], MD_WEIWANG_HONOR_WEEK[2], MD_WEIWANG_HONOR_WEEK[3], curWeek)
	
	
	
end
