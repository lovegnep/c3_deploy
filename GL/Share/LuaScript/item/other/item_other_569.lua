
--初级威望卡





x418569_var_FileId 		= 418569

x418569_var_LevelMin		=	1





function x418569_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418569_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418569_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418569_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418569_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418569_ProcActivateOnce( varMap, varPlayer, varImpact )
	

	

		if(DepletingUsedItem(varMap, varPlayer)) == 1 then

			
				local value = GetPlayerGoodBadValue(varMap, varPlayer)
				value = value + 1000
				SetPlayerGoodBadValue(varMap, varPlayer, value)
				Msg2Player(varMap,varPlayer,format("您获得了%d点威望", 1000),4,3)
				Msg2Player(varMap,varPlayer,format("您获得了%d点威望", 1000),4,2)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end

end







function x418569_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
