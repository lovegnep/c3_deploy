





x418383_var_FileId 		= 418383

x418383_var_LevelMin		=	1






function x418383_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418383_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418383_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418383_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418383_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418383_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418383_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	StartItemTask(varMap)
		ItemAppendBind( varMap, 11000501, 50 )--紫檀木炭50个
		ItemAppend( varMap, 12030735, 1 )--精准仪组件碎片1个

	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开紫檀木炭包：获得紫檀木炭50个和精准仪元件碎片1个")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			GamePlayScriptLog( varMap, varPlayer, 2645)
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







function x418383_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
