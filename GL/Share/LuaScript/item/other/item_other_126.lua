





x418126_var_FileId 		= 418126 

x418126_var_LevelMin		=	-1






function x418126_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418126_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418126_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418126_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418126_ProcDeplete( varMap, varPlayer )

		if x418126_IsOneWeekPassed(varMap, varPlayer)<=0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,format("#Y还有#R%d#Y天才可再次使用",x418126_GetNextOpenDays(varMap, varPlayer)))
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
		end
	
    local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
    local curTimes = GetBagItemMultTimes( varMap, varPlayer, varBagIdx)
    local result = 1

    if curTimes <= 1 then
        
        if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
        
        x418126_GiveBonus( varMap,varPlayer)
    else
        
        SetBagItemMultTimes( varMap, varPlayer, varBagIdx, curTimes - 1)
        result = 0
        x418126_GiveBonus( varMap,varPlayer)
    end

	return result
end




function x418126_GiveBonus( varMap,varPlayer)
	
	if x418126_IsOneWeekPassed(varMap, varPlayer)<=0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,format("还有#R%d#Y天才可再次使用",x418126_GetNextOpenDays(varMap, varPlayer)))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local nMoney = 100*1000
	AddMoney(varMap, varPlayer, 3, nMoney)
	
	x418126_SaveDoTime(varMap, varPlayer)
	GamePlayScriptLog( varMap, varPlayer, 1401)
	
	local varStr = format("获得了#{_MONEY%d}金卡的奖励。", nMoney)
	Msg2Player(varMap,varPlayer,varStr,8,2)
	Msg2Player(varMap,varPlayer,varStr,8,3)	
	
end








function x418126_ProcActivateOnce( varMap, varPlayer, varImpact )

end







function x418126_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end





function x418126_IsOneWeekPassed(varMap, varPlayer)

	
	local nowtime = (GetCurrentTime()+8*3600)/86400 - 14000;
	local lasttime = GetPlayerGameData(varMap, varPlayer, MD_CUXIAO1_DAY[1], MD_CUXIAO1_DAY[2],MD_CUXIAO1_DAY[3] );
	
	nowtime = format("%u", nowtime)	
	lasttime = format("%u", lasttime)
	if (nowtime-lasttime)>=30 then
		return 1;
	else
		return 0;
	end

end




function x418126_SaveDoTime(varMap, varPlayer)

	local nowtime = (GetCurrentTime()+8*3600)/86400 - 14000;
	SetPlayerGameData(varMap, varPlayer, MD_CUXIAO1_DAY[1], MD_CUXIAO1_DAY[2], MD_CUXIAO1_DAY[3], nowtime)
end




function x418126_GetNextOpenDays(varMap, varPlayer)

	
	local nowtime = (GetCurrentTime()+8*3600)/86400 - 14000;
	local lasttime = GetPlayerGameData(varMap, varPlayer, MD_CUXIAO1_DAY[1], MD_CUXIAO1_DAY[2],MD_CUXIAO1_DAY[3] );
	nowtime = format("%u", nowtime)	
	lasttime = format("%u", lasttime)
	local Days = nowtime-lasttime
	Days = 30 - Days  
	return Days

end
