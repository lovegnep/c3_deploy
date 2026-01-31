--冲级赛礼包（60级）





x418822_var_FileId 		= 418822

x418822_var_LevelMin		=	1
x418822_var_DayAndServerID ={{serverId = 2052,lastDay = 245},
															{serverId = 2092,lastDay = 252}
														}




function x418822_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418822_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418822_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418822_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418822_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418822_ProcActivateOnce( varMap, varPlayer, varImpact )
	local serverId = GetWorldIdEx()
	local  a = 0
	for i,v in x418822_var_DayAndServerID do
		if serverId == v.serverId then
				a = v.lastDay
		end
	end
	local nian, yue, ri = GetYearMonthDay()
	local day = GetDayOfYear()
		if a <= 0 then 
			Msg2Player( varMap, varPlayer, "当前服务器不可使用此礼包", 8, 3)
			return
		end
	if nian > 2012 then
		Msg2Player( varMap, varPlayer, "礼包已过期，系统自动删除礼包", 8, 3)
		DepletingUsedItem(varMap, varPlayer)
		return	
	end


	if day > a then
		Msg2Player( varMap, varPlayer, "礼包已过期，系统自动删除礼包", 8, 3)
		DepletingUsedItem(varMap, varPlayer)
		return	
	end
	
	local lv = GetLevel( varMap, varPlayer)
    if lv < 60 then
    Msg2Player( varMap, varPlayer, "请60级以后再使用此礼包", 8, 3)
        return
    end
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12031073, 1)	--冲级赛礼包（70级）1个
	ItemAppendBind( varMap, 12030016, 2) 	
	ItemAppendBind( varMap, 11050003, 20) 	
	ItemAppendBind( varMap, 11000501, 2) 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得金卡50两，冲级赛礼包（70级）1个和礼包道具。",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得金卡50两，冲级赛礼包（70级）1个和礼包道具",8,3) ;
			local nMoney = 50000
			AddMoney(varMap, varPlayer, 3, nMoney)
			Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,3)
   		GamePlayScriptLog( varMap, varPlayer, 3872)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418822_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
