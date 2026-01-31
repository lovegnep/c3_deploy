





x930131_var_FileId 		= 930131
x930131_var_FileItemId 		= 12272432

x930131_var_LevelMin		=	1
x930131_var_Nummabi		=	10






function x930131_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x930131_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x930131_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x930131_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x930131_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x930131_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x930131_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
        AddHorseMoney(varMap, varPlayer, x930131_var_Nummabi )
		Msg2Player(varMap,varPlayer,format("您获得了%d点马币", x930131_var_Nummabi),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了%d点马币", x930131_var_Nummabi),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end

function x930131_Procautousemabibao( varMap, varPlayer )


	if GetLevel(varMap, varPlayer)< x930131_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end



	local Num = GetItemCount( varMap, varPlayer, x930131_var_FileItemId )
	if Num > 0 then
		if DelItem(varMap,varPlayer,x930131_var_FileItemId,Num) == 1 then
			AddHorseMoney(varMap, varPlayer, x930131_var_Nummabi*Num )
			Msg2Player(varMap,varPlayer,format("您获得了%d点马币", x930131_var_Nummabi*Num),4,3)
			Msg2Player(varMap,varPlayer,format("您获得了%d点马币", x930131_var_Nummabi*Num),4,2)

		end
	end

end






function x930131_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
