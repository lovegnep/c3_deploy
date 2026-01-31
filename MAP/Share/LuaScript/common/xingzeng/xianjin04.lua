





x588046_var_FileId 		= 588046
x588046_var_FileItemId 		= 12031056

x588046_var_LevelMin		=	60
x588046_var_gold = 5000






function x588046_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x588046_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x588046_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x588046_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x588046_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x588046_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x588046_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local nMoney = x588046_var_gold
		AddGold(varMap, varPlayer, nMoney)
		
		GamePlayScriptLog( varMap, varPlayer, 1484)
		
		Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}现金", nMoney),4,3)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end

function x588046_Procautousexj4( varMap, varPlayer )


	if GetLevel(varMap, varPlayer)< x588046_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end



	local Num = GetItemCount( varMap, varPlayer, x588046_var_FileItemId )
	if Num > 0 then
		if DelItem(varMap,varPlayer,x588046_var_FileItemId,Num) == 1 then
			local nMoney = x588046_var_gold*Num
			AddGold(varMap, varPlayer, nMoney)
			Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}现金", nMoney),4,3)
			Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}现金", nMoney),4,2)
		end
	end

end






function x588046_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
