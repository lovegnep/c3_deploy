





x930194_var_FileId 		= 930194 
x930194_var_FileItemId 		= 12274010

x930194_var_LevelMin		=	30
x930194_var_exp		=	100






function x930194_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x930194_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x930194_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x930194_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x930194_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x930194_ProcActivateOnce( varMap, varPlayer, varImpact )

	local curjy = x930193_GetRefreshTimes(varMap, varPlayer)

	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		x930193_SetRefreshTimes(varMap, varPlayer,curjy+x930194_var_exp)
		Msg2Player(varMap,varPlayer,format("您获得了%d点经验", x930194_var_exp),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了%d点经验", x930194_var_exp),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end





function x930194_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end


-- 获取刷新次数
function x930193_GetRefreshTimes(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_ITEM_OTHER_321_DATE[1], MD_ITEM_OTHER_321_DATE[2], MD_ITEM_OTHER_321_DATE[3])
end

-- 设置刷新次数
function x930193_SetRefreshTimes(varMap, varPlayer, times)
	SetPlayerGameData(varMap, varPlayer, MD_ITEM_OTHER_321_DATE[1], MD_ITEM_OTHER_321_DATE[2], MD_ITEM_OTHER_321_DATE[3], times)
end
