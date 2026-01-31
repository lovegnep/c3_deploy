
--风云再起礼包





x418496_var_FileId 		= 418496

x418496_var_LevelMin		=	1





function x418496_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418496_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418496_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418496_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418496_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418496_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12271020, 1 )	--那些年，我们一起打过的魔君


	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开风云再起礼包，获得那些年，我们一起打过的魔君1个",8,2) ;

			Msg2Player( varMap,varPlayer,"打开风云再起礼包，获得那些年，我们一起打过的魔君1个",8,3) ;
		
		
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







function x418496_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
