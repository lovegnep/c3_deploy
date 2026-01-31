





x418289_var_FileId 		= 418289 

x418289_var_LevelMin		=	60






function x418289_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418289_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418289_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418289_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418289_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418289_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418289_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local year,month,day = GetYearMonthDay()		
	if year > 2011 then
		Msg2Player( varMap, varPlayer, "很抱歉，此道具已过使用期", 8, 2)
		DepletingUsedItem( varMap, varPlayer)
		GamePlayScriptLog( varMap, varPlayer, 1414)
		return 0
	elseif year == 2011	and month >4 then
		Msg2Player( varMap, varPlayer, "很抱歉，此道具已过使用期", 8, 2)
		DepletingUsedItem( varMap, varPlayer)
		GamePlayScriptLog( varMap, varPlayer, 1414)
		return 0
	elseif  month ==4 and day >20 then	
		Msg2Player( varMap, varPlayer, "很抱歉，此道具已过使用期", 8, 2)
		DepletingUsedItem( varMap, varPlayer)
		GamePlayScriptLog( varMap, varPlayer, 1414)
		return 0
	end
	
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local varLevel = GetLevel( varMap, varPlayer)
		local varXp = 1
		if varLevel < 70 then
			varXp = 600000000
		elseif varLevel < 80 then
			varXp = 2100000000
		elseif varLevel < 90 then
			varXp = 4000000000		
		elseif 	varLevel < 100 then
			varXp = 4500000000
		elseif 	varLevel < 110 then
			varXp = 5000000000
		elseif 	varLevel < 120 then
			varXp = 5500000000
		else
			varXp = 6000000000	
		end								
			
		AddExp(varMap, varPlayer, varXp)
		GamePlayScriptLog(varMap, varPlayer, 2513)
		Msg2Player(varMap,varPlayer,"你获得了".. varXp.."点经验",4,3)
		Msg2Player(varMap,varPlayer,"你获得了"..varXp.."点经验",4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418289_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
