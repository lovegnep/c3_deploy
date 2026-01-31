





x418241_var_FileId 		= 418241 

x418241_var_LevelMin		=	60






function x418241_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418241_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418241_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418241_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418241_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418241_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418241_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local year,month,day = GetYearMonthDay()
	if year >2011 then
		Msg2Player(varMap,varPlayer,"很抱歉,此道具已经过期。",4,3)
		return
	end
	
	if month >3 then
		Msg2Player(varMap,varPlayer,"很抱歉,此道具已经过期。",4,3)
		return
	end
	
	if month ==3 and day > 8 then
		Msg2Player(varMap,varPlayer,"很抱歉,此道具已经过期。",4,3)
		return
	end

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local varLevel = GetLevel( varMap, varPlayer)
		local varXp = 1
		if varLevel <=74 then
			varXp = varLevel*16000*3
		elseif varLevel <=84 then
			varXp = varLevel*16000*4
		else	
			varXp = varLevel*16000*5
		end								
			
		AddExp(varMap, varPlayer, varXp)
		GamePlayScriptLog(varMap, varPlayer, 2512)
		Msg2Player(varMap,varPlayer,format("你获得了%d点经验", varXp),4,3)
		Msg2Player(varMap,varPlayer,format("你获得了%d点经验", varXp),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418241_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
