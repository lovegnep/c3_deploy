





x418440_var_FileId 		= 418440

x418440_var_LevelMin		=	1






function x418440_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418440_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418440_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418440_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418440_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418440_ProcActivateOnce( varMap, varPlayer, varImpact )

	local day = GetDayOfYear()
    if day >= 325 or day<304 then
		DepletingUsedItem(varMap, varPlayer)
		Msg2Player( varMap,varPlayer,"已经超过活动时间，物品删除！",8,3)
		return
	end
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 11990050, 5 )	--回魂丹
	ItemAppendBind( varMap, 12041101, 5 )	--修行草
	ItemAppendBind( varMap, 12041108, 5 )	--荣誉之星
	ItemAppendBind( varMap, 11990115, 3 )	--原生钻石矿
	ItemAppendBind( varMap, 12030011, 20 )	--4倍经验酒
	ItemAppendBind( varMap, 12030012, 20 )	--4倍声望酒
	ItemAppendBind( varMap, 11000501, 5 )	--紫檀木碳
	ItemAppendBind( varMap, 11010001, 5 )	--一级皇家秘银

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,"打开礼包，获得了回魂丹5个、修行草5个、荣誉之星5个、原生钻石矿3个等",8,3) ;
			GamePlayScriptLog( varMap, varPlayer, 2689)
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







function x418440_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
