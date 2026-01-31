
--大钱包





x418573_var_FileId 		= 418573

x418573_var_LevelMin		=	1





function x418573_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418573_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418573_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418573_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418573_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418573_ProcActivateOnce( varMap, varPlayer, varImpact )
	


		if(DepletingUsedItem(varMap, varPlayer)) == 1 then

			
		
			local nMoney = 30000
			AddMoney(varMap, varPlayer, 1, nMoney)
			Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}银卡", nMoney),4,3)
   		GamePlayScriptLog( varMap, varPlayer, 3049)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end

end







function x418573_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
