





x588039_var_FileId 		= 588039
x588039_var_FileItemId 		= 12030099

x588039_var_LevelMin		=	60
x588039_var_gold = 500000





function x588039_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x588039_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x588039_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x588039_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x588039_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x588039_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x588039_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local nMoney = x588039_var_gold
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


function x588039_Procautousexj2( varMap, varPlayer )


	if GetLevel(varMap, varPlayer)< x588039_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end



	local Num = GetItemCount( varMap, varPlayer, x588039_var_FileItemId )
	if Num > 0 then
		if DelItem(varMap,varPlayer,x588039_var_FileItemId,Num) == 1 then
			local nMoney = x588039_var_gold*Num
			AddGold(varMap, varPlayer, nMoney)
			Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}现金", nMoney),4,3)
			Msg2Player(varMap,varPlayer,format("你获得了#{_MONEY%d}现金", nMoney),4,2)
		end
	end

end





function x588039_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
