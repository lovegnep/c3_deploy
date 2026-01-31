





x418282_var_FileId 		= 418282

x418282_var_LevelMin		=	1






function x418282_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418282_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418282_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418282_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418282_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418282_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x418282_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	

	if IsNeedRename(varMap,varPlayer) == 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			SetNeedRename(varMap,varPlayer,1)
			Msg2Player(varMap,varPlayer,"道具使用完成，请重新登录进行改名操作",4,3)
			Msg2Player(varMap,varPlayer,"道具使用完成，请重新登录进行改名操作",4,2)
		else
			Msg2Player(varMap,varPlayer,"使用道具异常",4,3)
			Msg2Player(varMap,varPlayer,"使用道具异常",4,2)
		end
	else
			Msg2Player(varMap,varPlayer,"您已使用过改名卡，请重新登录进行改名操作",4,3)
			Msg2Player(varMap,varPlayer,"您已使用过改名卡，请重新登录进行改名操作",4,2)
	end

end







function x418282_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
