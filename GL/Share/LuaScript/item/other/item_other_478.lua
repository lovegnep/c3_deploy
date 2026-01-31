
--陈旧的缚魂之匣





x418478_var_FileId 		= 418478

x418478_var_LevelMin		=	1





function x418478_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418478_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418478_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418478_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418478_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418478_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	StartItemTask(varMap)
	ItemAppendBind( varMap, 11000304, 1 )	--陈旧的缚魂之匣


	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开陈旧的缚魂之匣，获得残破的神兵之魂1个",8,2) ;

			Msg2Player( varMap,varPlayer,"打开陈旧的缚魂之匣，获得残破的神兵之魂1个",8,3) ;
		
		
			GamePlayScriptLog( varMap, varPlayer, 3014)
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







function x418478_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
