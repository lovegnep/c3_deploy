





x300328_var_FileId = 300328






function x300328_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x300328_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300328_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300328_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x300328_ProcDeplete( varMap, varPlayer )
	return 1;
end








function x300328_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetBagSpace(varMap,varPlayer) < 1 then 
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 
	end
	
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local yanhua = {8310,8310,8310}
		local temp = random(3)
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer,yanhua[temp], 0);

		
		StartTalkTask(varMap);
		TalkAppendString(varMap, "父亲节快乐！");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"父亲节快乐！",CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
		
		local nMoney = 500
		AddMoney(varMap, varPlayer, 3, nMoney)
		
		GamePlayScriptLog( varMap, varPlayer, 3790)
		
		Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,3)
		
		local temp = random(10000)
		local itemid = -1 
		local temp2 = 0
		if temp <= 3 then
			itemid = 12050314
			GamePlayScriptLog( varMap, varPlayer, 3791)
			temp2 = 1
		elseif temp <= 503 then
			itemid = 12030059
			GamePlayScriptLog( varMap, varPlayer, 3792)
		elseif temp <=570  then
			itemid = 12030775
			GamePlayScriptLog( varMap, varPlayer, 3793)
			temp2 = 1
		elseif temp <=577  then
			itemid = 10306087
			GamePlayScriptLog( varMap, varPlayer, 3794)
			temp2 = 1
		elseif temp <=585  then
			local itemidzuhe = {11011485,11011486,11011487}
			local tempitem = random(3)
			itemid = itemidzuhe[tempitem]
			GamePlayScriptLog( varMap, varPlayer, 3795)
			temp2 = 1
		end
		if itemid ~=-1 then		
			StartItemTask(varMap)
			ItemAppendBind( varMap, itemid, 1 )	
	
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
					StartTalkTask(varMap)
					TalkAppendString(varMap,"使用烟花（父亲节版）意外获得了@item_"..itemid)
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					DeliverItemListSendToPlayer(varMap,varPlayer)
					
					local CounID = GetCurCountry(varMap, varPlayer)
					local CountryName = GetCountryName(CounID)
					local Name =  GetName(varMap, varPlayer)
					varMsg = format( "恭喜%s的%s使用烟花（父亲节版）获得了%d个#{_ITEM%d}!", CountryName, Name, 1, itemid )
					if temp2 ==1 then
					LuaAllScenceM2Wrold( varMap, varMsg, 5, 1)
					end
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
		end
	end
end	







function x300328_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end




function x300328_ProcTopListYanghua(varMap,varPlayer)

	
	
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
