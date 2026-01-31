
--中级声望卡





x418589_var_FileId 		= 418589

x418589_var_LevelMin		=	1





function x418589_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418589_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418589_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418589_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418589_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418589_ProcActivateOnce( varMap, varPlayer, varImpact )
	

	

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
	
	
	
	
		AddExp(varMap, varPlayer, 1000000)
		Msg2Player(varMap,varPlayer,"您获得了1000000点经验",4,3)
		Msg2Player(varMap,varPlayer,"您获得了1000000点经验",4,2)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end

end







function x418589_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
