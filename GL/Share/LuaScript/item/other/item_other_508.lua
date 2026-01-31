
--五孔钻礼包B





x418508_var_FileId 		= 418508

x418508_var_LevelMin		=	1





function x418508_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418508_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418508_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418508_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418508_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418508_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 11000142, 10 )	--昊金钻·副武器
	ItemAppendBind( varMap, 11000143, 10)	  --乾金钻·衣服
	ItemAppendBind( varMap, 11000144, 10 )	--辉金钻·腰带
	ItemAppendBind( varMap, 11000145, 10 )	--恪金钻·徽章
	ItemAppendBind( varMap, 11000146, 10 )	--尊金钻·护手
	ItemAppendBind( varMap, 11000147, 10 )	--镗金钻·鞋子

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得10个昊金钻·副武器、10个干金钻·衣服、10个辉金钻·腰带、10个恪金钻·徽章等",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得10个昊金钻·副武器、10个干金钻·衣服、10个辉金钻·腰带、10个恪金钻·徽章等",8,3) ;
		
			
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







function x418508_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
