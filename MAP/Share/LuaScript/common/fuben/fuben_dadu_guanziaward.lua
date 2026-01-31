x700129_var_FileId 		= 700129 

x700129_var_LevelMin		=	1

function x700129_ProcEventEntry( varMap, varPlayer, varBagIdx )
	
	local itemID = GetItemIDByIndexInBag( varMap, varPlayer, varBagIdx )
	
	if ( GetLevel(varMap, varPlayer)< x700129_var_LevelMin ) then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local bagCount = LuaCallNoclosure( 700121, "GetGuanZiItemCount", varMap, varPlayer, itemID )
	if ( GetBagSpace( varMap, varPlayer ) < bagCount ) then
		Msg2Player( varMap, varPlayer, "背包空间不足，需要至少"..bagCount.."个背包空间", 8, 3 )
		return
	end
	
	LuaCallNoclosure( 700121, "CreateItemToBag", varMap, varPlayer, varBagIdx, itemID )
	
end

function x700129_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end

function x700129_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x700129_ProcConditionCheck( varMap, varPlayer )
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x700129_ProcDeplete( varMap, varPlayer )
	return 1;
end

function x700129_ProcActivateOnce( varMap, varPlayer, varImpact )
end

function x700129_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
