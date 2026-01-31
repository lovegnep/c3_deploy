





x418359_var_FileId 		= 418359

x418359_var_LevelMin		=	70

x418359_var_ItemID  = 12269025





function x418359_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418359_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418359_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418359_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418359_ProcDeplete( varMap, varPlayer )
	
	
	return 1;
end








function x418359_ProcActivateOnce( varMap, varPlayer, varImpact )

local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x418359_var_ItemID)
local varMP = GetPlayerChariotMP(varMap, varPlayer)
	
	if GetSceneType(varMap)~=1 then
		Msg2Player(varMap,varPlayer,"此道具只能在副本中使用",8, 2)
		Msg2Player(varMap,varPlayer,"此道具只能在副本中使用",8, 3)
	  return  
	end
	
	if GetLevel(varMap, varPlayer)< x418359_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	if 0 == IsHaveChariot(varMap, varPlayer) then
			Msg2Player(varMap,varPlayer,"拥有战车才可以修理",8, 2)
			Msg2Player(varMap,varPlayer,"拥有战车才可以修理",8, 3)
			return
	end
	
	if GetPlayerChariotHP(varMap, varPlayer)> 0 then
		Msg2Player(varMap,varPlayer,"您的战车不需要此道具",8, 2)
		Msg2Player(varMap,varPlayer,"您的战车不需要此道具",8, 3)
		return
	end
	
	if (1 == RepaireChariot( varMap, varPlayer, bagindex, 2000, varMP)) then
		Msg2Player(varMap, varPlayer, "战车修理完成", 8, 3)
		Msg2Player(varMap, varPlayer, "战车修理完成", 8, 2)
	end


end







function x418359_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
