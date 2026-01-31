
--公会推广礼包





x418588_var_FileId 		= 418588

x418588_var_LevelMin		=	1





function x418588_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418588_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418588_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418588_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418588_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418588_ProcActivateOnce( varMap, varPlayer, varImpact )
	


		if(DepletingUsedItem(varMap, varPlayer)) == 1 then

			
		
			local nMoney = 100000
			AddMoney(varMap, varPlayer, 1, nMoney)
			Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}银卡", nMoney),4,3)
   		GamePlayScriptLog( varMap, varPlayer, 3049)

		  local nMoney = 10000
			AddMoney(varMap, varPlayer, 3, nMoney)
			Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}金卡", nMoney),4,3)
   		GamePlayScriptLog( varMap, varPlayer, 3049)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end

end







function x418588_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
