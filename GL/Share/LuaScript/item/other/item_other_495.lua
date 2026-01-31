
--英雄再临礼包





x418495_var_FileId 		= 418495

x418495_var_LevelMin		=	1





function x418495_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418495_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418495_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418495_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418495_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418495_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
	--StartItemTask(varMap)
		AwardTitle(varMap,varPlayer,175) --“英雄再临”称号"
		Msg2Player(varMap, varPlayer, "获得#G英雄再临#o称号", 8, 2)
		Msg2Player(varMap, varPlayer, "获得#G英雄再临#o称号", 8, 3)


	
 	
	--local ret = StopItemTask(varMap,varPlayer)
	--if ret > 0 then 

			--DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
--			Msg2Player( varMap,varPlayer,"打开英雄再临礼包，获得英雄再临称号",8,2) ;
--			Msg2Player( varMap,varPlayer,"打开英雄再临礼包，获得英雄再临称号",8,3) ;
		
		
			GamePlayScriptLog( varMap, varPlayer, 3054)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	--else
	--	StartTalkTask(varMap)
	--	TalkAppendString(varMap,"背包空间不足！")	
	--	StopTalkTask(varMap)
	--	DeliverTalkTips(varMap,varPlayer)
	--end

end







function x418495_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
