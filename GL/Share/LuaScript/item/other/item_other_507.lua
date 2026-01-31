
--五孔钻礼包A





x418507_var_FileId 		= 418507

x418507_var_LevelMin		=	1





function x418507_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418507_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418507_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418507_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418507_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418507_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 11000134, 10 )	--炼金钻·主武器
	ItemAppendBind( varMap, 11000135, 10 )	--淬金钻·帽子
	ItemAppendBind( varMap, 11000136, 10 )	--血金钻·披风
	ItemAppendBind( varMap, 11000137, 10 )	--玄金钻·戒指
	ItemAppendBind( varMap, 11000138, 10 )	--铭金钻·手镯
	ItemAppendBind( varMap, 11000141, 10 )	--庚金钻·项链

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得10个炼金钻·主武器、10个淬金钻·帽子、10个血金钻·披风、10个玄金钻·戒指等",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得10个炼金钻·主武器、10个淬金钻·帽子、10个血金钻·披风、10个玄金钻·戒指等",8,3) ;
		
			
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







function x418507_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
