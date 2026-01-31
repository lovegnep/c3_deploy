





x414016_var_FileId 		= 414016 


x414016_Item_Id			=	11000201
x414016_var_ItemCount		=	10







function x414016_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x414016_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x414016_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x414016_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x414016_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x414016_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	StartItemTask(varMap)
	ItemAppendBind( varMap, x414016_Item_Id, x414016_var_ItemCount )
	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then


		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			
			StartTalkTask(varMap)
			TalkAppendString(varMap,"兑换物品完成")
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
		TalkAppendString(varMap,"背包空间不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		
	end

end







function x414016_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
