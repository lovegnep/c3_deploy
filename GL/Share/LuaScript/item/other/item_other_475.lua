
--淘宝达人大礼包





x418475_var_FileId 		= 418475

x418475_var_LevelMin		=	1





function x418475_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418475_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418475_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418475_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418475_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418475_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12250002, 4 )	--4个精品芝华士
	ItemAppendBind( varMap, 12041108, 5 )	--5个荣誉之星
	ItemAppendBind( varMap, 11010001, 20)	--20个一级皇家秘银
	ItemAppendBind( varMap, 12054301, 50 )	--50个还龙书
	ItemAppendBind( varMap, 11000948, 30 )	--30个地中海尖凿
	ItemAppendBind( varMap, 11970023, 20 )	--20个黄金乱士符

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得4个精品芝华士、50个还龙书、30个地中海尖凿、20个黄金乱士符等",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得4个精品芝华士、50个还龙书、30个地中海尖凿、20个黄金乱士符等",8,3) ;
		
			
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







function x418475_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
