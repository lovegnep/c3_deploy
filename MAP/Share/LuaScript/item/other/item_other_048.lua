





x418048_var_FileId = 418048
x418048_var_ItemList = {}
x418048_var_LevelMin = 1






function x418048_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418048_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418048_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418048_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418048_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418048_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418048_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local varItem =  x418048_Yuebing(varMap,varPlayer)	

	
	StartItemTask(varMap)
		if varItem ~= -1 then
			ItemAppendBind( varMap,varItem,3 )	
		end	

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)

			StartTalkTask(varMap)
			TalkAppendString(varMap,"打开礼包，获得了礼包道具！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x418048_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x418048_Yuebing(varMap,varPlayer)
	
	local nLevel = GetLevel(varMap,varPlayer)
	local yuebing = -1
	if nLevel < 40  then
		yuebing = 12030251
	elseif nLevel >=40 and nLevel < 50 then
		yuebing = 12030252
	elseif nLevel >=50 and nLevel < 60 then	
		yuebing = 12030253
	elseif nLevel >=60 and nLevel < 70 then
		yuebing = 12030254
	elseif nLevel >=70 and nLevel < 80 then
		yuebing = 12030255
	elseif nLevel >=80 and nLevel < 90 then
		yuebing = 12030256
	elseif nLevel >=90 then
		yuebing = 12030257	
	end
	
	return yuebing

end
