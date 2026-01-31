





x418435_var_FileId 		= 418435

x418435_var_LevelMin		=	1






function x418435_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418435_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418435_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418435_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418435_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418435_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12050278, 1 )	--螳螂降世符
	ItemAppendBind( varMap, 12030012, 5 )	--路易十三
	ItemAppendBind( varMap, 12030016, 3 )	--队伍召集令
	ItemAppendBind( varMap, 11990050, 3 )	--回魂丹
	ItemAppendBind( varMap, 11990011, 2 )	--三番令

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			Msg2Player( varMap,varPlayer,"打开礼包，获得了螳螂降世符1个、路易十三5个、队伍召集令3个、回魂丹3个、三番令2个",8,3) ;
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







function x418435_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
