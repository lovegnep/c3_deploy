






x404900_var_FileId 		= 404900 

x404900_var_LevelMin		=	20






function x404900_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x404900_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x404900_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x404900_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x404900_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x404900_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if x404900_IsOneWeekPassed(varMap, varPlayer)<=0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"本威望包一周只能开启一次,请您尝试其他威望包")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local nValue = 4000
		local varShengWang = GetShengWang( varMap, varPlayer )
		varShengWang = varShengWang + nValue
		SetShengWang( varMap, varPlayer, varShengWang )
		Msg2Player(varMap,varPlayer,"#o获得#R声望"..nValue.."点#o的奖励",8,2)

		x404900_SaveDoTime(varMap, varPlayer)
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x404900_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end





function x404900_IsOneWeekPassed(varMap, varPlayer)

	
	local curWeek = GetWeekIndex();

	local lastWeek = GetPlayerGameData(varMap, varPlayer, MD_WEIWANG_SHENGWANG_WEEK[1], MD_WEIWANG_SHENGWANG_WEEK[2],MD_WEIWANG_SHENGWANG_WEEK[3] );

	if curWeek ~= lastWeek then
		return 1
	else
		return 0;
	end
	
	
	

end




function x404900_SaveDoTime(varMap, varPlayer)

	local curWeek = GetWeekIndex();
	SetPlayerGameData(varMap, varPlayer, MD_WEIWANG_SHENGWANG_WEEK[1], MD_WEIWANG_SHENGWANG_WEEK[2], MD_WEIWANG_SHENGWANG_WEEK[3], curWeek)
	
	
	
end
