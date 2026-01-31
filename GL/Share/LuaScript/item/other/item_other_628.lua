--冲级赛礼包（70级）





x418628_var_FileId 		= 418628

x418628_var_LevelMin		=	1





function x418628_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418628_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418628_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418628_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418628_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418628_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	local nian, yue, ri = GetYearMonthDay()
	local day = GetDayOfYear()
	if nian > 2012 then
		Msg2Player( varMap, varPlayer, "礼包已过期，系统自动删除礼包", 8, 3)
		DepletingUsedItem(varMap, varPlayer)
		return	
	end


	if day > 148 then
		Msg2Player( varMap, varPlayer, "礼包已过期，系统自动删除礼包", 8, 3)
		DepletingUsedItem(varMap, varPlayer)
		return	
	end
	
	local lv = GetLevel( varMap, varPlayer)
    if lv < 75 then
    Msg2Player( varMap, varPlayer, "请75级以后再使用此礼包", 8, 3)
        return
    end
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12031048, 1)	--冲级赛礼包（80级）1个
 	
 	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得金卡150两，冲级赛礼包（80级）1个",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得金卡150两，冲级赛礼包（80级）1个",8,3) ;
			local nMoney = 150000
			AddMoney(varMap, varPlayer, 3, nMoney)
			Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,3)
   		GamePlayScriptLog( varMap, varPlayer, 3733)
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







function x418628_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
