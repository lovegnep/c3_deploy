





x418522_var_FileId 		= 418522

x418522_var_LevelMin		=	1






function x418522_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418522_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418522_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418522_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418522_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418522_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418522_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 11000200, 30 )	--11000200	世传水晶	30		
		ItemAppendBind( varMap, 11050001, 20 ) --11050001	初级龙眼石	20
		ItemAppendBind( varMap, 10236093, 1 ) --10236093	黄金铠甲	1

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开前辈的馈赠（五），获得30个世传水晶，20个初级龙眼石和1件黄金铠甲。")
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
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418522_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
