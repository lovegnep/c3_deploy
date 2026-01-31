





x418239_var_FileId 		= 418239 

x418239_var_LevelMin		=	60






function x418239_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418239_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418239_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418239_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418239_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418239_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418239_var_LevelMin then
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
		if varLevel <=64 then
			varXp = 10847520
		elseif varLevel <=69 then
			varXp = 11722320
		elseif varLevel <=74 then
			varXp = 12597120
		elseif varLevel <=79 then
			varXp = 45280620
		elseif varLevel <=84 then
			varXp = 48220920
		elseif varLevel <=89 then
			varXp = 51161220
		elseif varLevel <=94 then
			varXp = 54101520
		elseif varLevel <=99 then
			varXp = 57041820		
		elseif varLevel <=104 then
			varXp = 59982120	
		elseif varLevel <=109 then
			varXp = 62922420			
		else
			varXp = 65862720	
		end								
			
		AddExp(varMap, varPlayer, varXp)
		GamePlayScriptLog(varMap, varPlayer, 2510)
		Msg2Player(varMap,varPlayer,format("你获得了%d点经验", varXp),4,3)
		Msg2Player(varMap,varPlayer,format("你获得了%d点经验", varXp),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418239_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
