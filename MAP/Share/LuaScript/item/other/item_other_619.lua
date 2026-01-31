





x418619_var_FileId 		= 418619 

x418619_var_LevelMin		=	1






function x418619_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418619_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418619_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418619_ProcConditionCheck( varMap, varPlayer )

	local Level = GetLevel(varMap, varPlayer)
	if Level < 80 then
		Msg2Player(varMap,varPlayer,"等级不足80级无法获得天赋奖励",4,3)
		Msg2Player(varMap,varPlayer,"等级不足80级无法获得天赋奖励",4,2)		
		return 0
	end	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418619_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418619_ProcActivateOnce( varMap, varPlayer, varImpact )

			if GetLevel(varMap, varPlayer)< x418619_var_LevelMin then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"等级不足")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return
			end

			if(DepletingUsedItem(varMap, varPlayer)) == 1 then
				local Exp = 270
				local temp = AddInherenceExp( varMap, varPlayer, Exp) 
				Msg2Player(varMap,varPlayer,format("您获得了%d点天赋", temp),8,3)
				Msg2Player(varMap,varPlayer,format("您获得了%d点天赋", temp),8,2)
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"使用物品异常！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
	
end







function x418619_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
