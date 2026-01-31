--超凡将星特权卡





x418722_var_FileId 		= 418722
x418722_var_Name ="太平洋将星特权卡"
x418722_var_LevelMin		=	1





function x418722_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418722_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418722_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418722_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418722_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418722_ProcActivateOnce( varMap, varPlayer, varImpact )
	if GetLevel(varMap, varPlayer)< x418722_var_LevelMin then
		Msg2Player( varMap,varPlayer,"等级不足",8,2)
		return
	end

	StartItemTask(varMap)
	ItemAppendBind( varMap, 11000200, 20)	--世传水晶
 	ItemAppendBind( varMap, 11000205, 5)	--精致的世传水晶
 	ItemAppendBind( varMap, 12041101, 2)	--修行草
 	ItemAppendBind( varMap, 12030251, 2)	--三财月饼
 	ItemAppendBind( varMap, 12030016, 2)	--队招
 	ItemAppendBind( varMap, 11990011, 2)	--三番令
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		  varMsg =format("恭喜您获得#G%s#cffcc00奖励",x418722_var_Name)
			Msg2Player( varMap,varPlayer,varMsg,8,2) ;			
			Msg2Player( varMap,varPlayer,varMsg,8,3) ;
   		--GamePlayScriptLog( varMap, varPlayer, 3740)
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







function x418722_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
