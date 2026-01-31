
--迅游成3大礼包





x418561_var_FileId 		= 418561

x418561_var_LevelMin		=	1





function x418561_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418561_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418561_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418561_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418561_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418561_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12266785, 1 )	--小钱包
	ItemAppendBind( varMap, 11000200, 5 )	--5个世传水晶
	ItemAppendBind( varMap, 11050001, 5 )	--5个初级龙眼石
	ItemAppendBind( varMap, 14040001, 1 )	--1个初级蓝玛瑙
	ItemAppendBind( varMap, 11000100, 1 )	--1个赤铜钻
	ItemAppendBind( varMap, 12010200, 3 )	--3个天罡止血散
	ItemAppendBind( varMap, 12050000, 1 )	--1个常乐草
	
	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
		
			Msg2Player( varMap,varPlayer,"打开礼包，获得1个小钱包，5个世传水晶，5个初级龙眼石，1个初级蓝玛瑙等。",8,2) ;
			
			Msg2Player( varMap,varPlayer,"打开礼包，获得1个小钱包，5个世传水晶，5个初级龙眼石，1个初级蓝玛瑙等。",8,3) ;
	
		
			GamePlayScriptLog( varMap, varPlayer, 3050)
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







function x418561_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
