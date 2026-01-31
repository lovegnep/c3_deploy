--一级皇家秘银礼包





x418725_var_FileId 		= 418725

x418725_var_LevelMin		=	1


function x418725_ProcEventEntry( varMap, varPlayer, varBagIdx )
	if GetBagSpace(varMap, varPlayer) < 3 then
			Msg2Player(varMap, varPlayer, "背包空间少于3个，请整理后再试", 0, 2)
			Msg2Player(varMap, varPlayer, "背包空间少于3个，请整理后再试", 0, 3)
			return
	end

	StartItemTask(varMap)
	local rand =random(2,3)
	if rand == 2 then
		ItemAppendBind( varMap, 12271046, 1)	--金环麦种子,
 		ItemAppendBind( varMap, 12271050, 1)  --白凡豆种子
 	elseif rand == 3 then
 		ItemAppendBind( varMap, 12271046, 1)	--金环麦种子,
 		ItemAppendBind( varMap, 12271050, 1)  --白凡豆种子 
 		ItemAppendBind( varMap, 12271058, 1)  --白凡豆种子
 	end
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DelItem(varMap, varPlayer,12035272 ,1)) == 1 then
			if rand == 2 then
				Msg2Player(varMap, varPlayer, "恭喜您获得2颗种子", 0, 2)
			elseif rand == 3 then
				Msg2Player(varMap, varPlayer, "恭喜您获得3颗种子", 0, 2)
   		--GamePlayScriptLog( varMap, varPlayer, 3740)
   		end
   		DeliverItemListSendToPlayer( varMap, varPlayer)
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






function x418725_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418725_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418725_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418725_ProcDeplete( varMap, varPlayer )
	return 1;
end








function x418725_ProcActivateOnce( varMap, varPlayer, varImpact )


end







function x418725_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
