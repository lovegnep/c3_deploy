--冲级赛礼包（60级）





x418823_var_FileId 		= 418823

x418823_var_LevelMin		=	1
x418823_var_DayAndServerID ={{serverId = 2052,lastDay = 245},
															{serverId = 2092,lastDay = 252}
														}




function x418823_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418823_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418823_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418823_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418823_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418823_ProcActivateOnce( varMap, varPlayer, varImpact )
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
    if lv < 70 then
    Msg2Player( varMap, varPlayer, "请70级以后再使用此礼包", 8, 3)
        return
    end
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12031074, 1)	--冲级赛礼包（75级）1个
 	ItemAppendBind( varMap, 11000207, 5)	
 	ItemAppendBind( varMap, 11990110, 1)	
 	ItemAppendBind( varMap, 12054300, 2)	 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得金卡100两，冲级赛礼包（75级）1个和礼包道具",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得金卡100两，冲级赛礼包（75级）1个和礼包道具",8,3) ;
			local nMoney = 100000
			AddMoney(varMap, varPlayer, 3, nMoney)
			Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,3)
   		GamePlayScriptLog( varMap, varPlayer, 3873)
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







function x418823_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
