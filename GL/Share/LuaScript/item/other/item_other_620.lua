





x418620_var_FileId 		= 418620 

x418620_var_LevelMin		=	1






function x418620_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418620_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418620_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418620_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418620_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418620_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	if GetLevel(varMap, varPlayer)< x418620_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

			if(DepletingUsedItem(varMap, varPlayer)) == 1 then
				local nMoney = 130
				AddMoney(varMap, varPlayer, 3, nMoney)
				
				Msg2Player(varMap,varPlayer,format("您获得了#{_MONEY%d}金卡", nMoney),8,3)
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"使用物品异常！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
	
end







function x418620_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
