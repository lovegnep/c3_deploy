
--新浪特权礼包





x418715_var_FileId 		= 418715

x418715_var_LevelMin		=	1





function x418715_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418715_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418715_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418715_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418715_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418715_ProcActivateOnce( varMap, varPlayer, varImpact )
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12266785, 1)	--小钱包1个
	ItemAppendBind( varMap, 11000600, 3)	--初级绿水晶3个
	ItemAppendBind( varMap, 12050258, 1)	--多玩浣熊降世符1个
	ItemAppendBind( varMap, 12110206, 5)	--钟情一生5个
	ItemAppendBind( varMap, 12031002, 10)	--五彩缤纷烟花10个
	ItemAppendBind( varMap, 12030934, 1)	--皇权贵族时装1个

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得小钱包1个，皇权贵族时装1个，多玩浣熊降世符1个等",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得小钱包1个，皇权贵族时装1个，多玩浣熊降世符1个等",8,3) ;
		
			
			GamePlayScriptLog( varMap, varPlayer, 3063)
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







function x418715_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
