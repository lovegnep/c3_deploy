
--天天向上新手包





x418497_var_FileId 		= 418497

x418497_var_LevelMin		=	1





function x418497_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418497_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418497_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418497_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418497_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418497_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12050248, 1 )	--红虎降世符
	ItemAppendBind( varMap, 12030758, 1 )	--五道杠时装
	ItemAppendBind( varMap, 11000200, 10 )	--世传水晶*10
	ItemAppendBind( varMap, 12266785, 1 )	--小钱包
	ItemAppendBind( varMap, 12041101, 4 )	--修行草*4
	ItemAppendBind( varMap, 12110206, 5 )	--钟情一生*5
	ItemAppendBind( varMap, 12031001, 10 )	--单凤求凰*10


	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开天天向上新手包，获得红虎降世符，五道杠时装，修行草等",8,2) ;

			Msg2Player( varMap,varPlayer,"打开天天向上新手包，获得红虎降世符，五道杠时装，修行草等",8,3) ;
		
		
			GamePlayScriptLog( varMap, varPlayer, 3055)
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







function x418497_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
