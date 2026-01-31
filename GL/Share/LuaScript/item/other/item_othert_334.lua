





x432334_var_FileId 		= 432334

x432334_var_LevelMin		=	60






function x432334_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x432334_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x432334_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x432334_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x432334_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x432334_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x432334_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 11990011, 20 )	--三番令
		ItemAppendBind( varMap, 12041108, 20 )	--荣誉之星
		ItemAppendBind( varMap, 11000501, 20 )	--紫檀木炭
		ItemAppendBind( varMap, 11990115, 2 )	--原生钻石矿
		ItemAppendBind( varMap, 11000550, 100 )	--微瑕星辰

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开老玩家十户长大礼包，获得荣誉之星20个、原生钻石矿2个、微瑕星辰100个等道具")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足，需要5个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x432334_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
