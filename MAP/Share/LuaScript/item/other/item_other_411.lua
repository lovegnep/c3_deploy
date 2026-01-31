





x418411_var_FileId 		= 418411

x418411_var_LevelMin		=	1

x418411_var_ChariotHonour = 15000




function x418411_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418411_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418411_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418411_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418411_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418411_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	local varLastweek = GetPlayerGameData(varMap, varPlayer, MD_CHARIOTHONOURITEM_WEEK[1], MD_CHARIOTHONOURITEM_WEEK[2], MD_CHARIOTHONOURITEM_WEEK[3])
	if varLastweek ~= GetWeekIndex() then
		SetPlayerGameData( varMap, varPlayer, MD_CHARIOTHONOURITEM_WEEK[ 1], MD_CHARIOTHONOURITEM_WEEK[ 2], MD_CHARIOTHONOURITEM_WEEK[ 3], GetWeekIndex())
		SetPlayerGameData( varMap, varPlayer, MD_CHARIOTHONOURITEM_WEEKCOUNT[ 1], MD_CHARIOTHONOURITEM_WEEKCOUNT[ 2], MD_CHARIOTHONOURITEM_WEEKCOUNT[ 3], 0)
	end	
	
	local varweekcount = GetPlayerGameData( varMap, varPlayer, MD_CHARIOTHONOURITEM_WEEKCOUNT[ 1], MD_CHARIOTHONOURITEM_WEEKCOUNT[ 2], MD_CHARIOTHONOURITEM_WEEKCOUNT[ 3])
	if varweekcount >=10 then
		Msg2Player( varMap,varPlayer,"您本周不能再使用此礼包了，请下周再使用",8,3) ;
		return
	end	
	
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then	
			AddPlayerChariotHonour(varMap, varPlayer, x418411_var_ChariotHonour) 		
			Msg2Player( varMap,varPlayer,format("打开礼包，获得%d点战车荣誉", x418411_var_ChariotHonour),8,3) ;
			GamePlayScriptLog( varMap, varPlayer, 2650)

			SetPlayerGameData( varMap, varPlayer, MD_CHARIOTHONOURITEM_WEEKCOUNT[ 1], MD_CHARIOTHONOURITEM_WEEKCOUNT[ 2], MD_CHARIOTHONOURITEM_WEEKCOUNT[ 3], varweekcount+1)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end

end







function x418411_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
