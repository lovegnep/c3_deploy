





x432532_var_FileId 		= 432532

x432532_var_LevelMin		=	1

x432532_var_Bonus = {
{level = 92 , varitem =10299900 , varcount = 1},
{level = 161, varitem =10299901 , varcount = 1},  --夏日狂欢冠军手镯
}





function x432532_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x432532_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x432532_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x432532_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x432532_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x432532_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	local level = GetLevel(varMap, varPlayer)
	if GetLevel(varMap, varPlayer)< x432532_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local index 
	for i , item in x432532_var_Bonus do 
		if level <= item.level then
			index = i 
		break
		end
	end
	

	StartItemTask(varMap)
	ItemAppend( varMap, x432532_var_Bonus[index].varitem, x432532_var_Bonus[index].varcount ) 
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			Msg2Player( varMap,varPlayer,format("打开礼包，获得了%d个@item_%d",x432532_var_Bonus[index].varcount ,x432532_var_Bonus[index].varitem),8,3);
			GamePlayScriptLog( varMap, varPlayer, 2593)
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







function x432532_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
