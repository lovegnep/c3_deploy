
--天外焚石礼包





x418528_var_FileId 		= 418528

x418528_var_LevelMin		=	1

x418528_var_ItemNum		= 11000715 	--天外焚石10个	
x418528_var_ItemCount	= 10



function x418528_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418528_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418528_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418528_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418528_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end

function x418528_ProcActivateOnce( varMap, varPlayer, varImpact )

	StartItemTask(varMap)
	ItemAppendBind( varMap, x418528_var_ItemNum, x418528_var_ItemCount)
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)				
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得天外焚石10个",8,2) ;			
			Msg2Player( varMap,varPlayer,"打开礼包，获得天外焚石10个",8,3) ;		
			
			GamePlayScriptLog( varMap, varPlayer, 3049)
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







function x418528_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
