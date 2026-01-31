
--风云再起礼包





x418565_var_FileId 		= 581591

x418565_var_LevelMin		=	1





function x418565_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418565_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418565_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418565_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418565_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418565_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	
	StartItemTask(varMap)
	ItemAppendBind( varMap, 12271020, 1 )	--那些年，我们一起打过的魔君
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开再世英豪礼包，获得那些年，我们一起打过的魔君1个",8,2) ;

			Msg2Player( varMap,varPlayer,"打开再世英豪礼包，获得那些年，我们一起打过的魔君1个",8,3) ;
			AwardTitle(varMap,varPlayer,178) --“再世英豪”称号"
	    Msg2Player(varMap, varPlayer, "获得#G再世英豪#o称号", 8, 2)
	    Msg2Player(varMap, varPlayer, "获得#G再世英豪#o称号", 8, 3)
		
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







function x418565_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
