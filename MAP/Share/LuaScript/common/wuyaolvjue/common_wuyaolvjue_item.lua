x310021_var_FileId = 310021 
x310021_var_Buf1 = 3001 

function x310021_ProcEventEntry( varMap, varPlayer, varBagIdx )
	local varItem = GetItemTableIndexByIndex( varMap, varPlayer, varBagIdx ) 
	local varQuest = GetQuestIDByItemIDNM( varMap, varPlayer, varItem )

	if varQuest == -1 then 	
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	local varLevel = GetQuestParam( varMap, varPlayer, varQuestIdx, 2 ) 

	if varQuest>= 8000 and varQuest<=8004 then
		LuaCallNoclosure( 310020, "PositionUseItem", varMap, varPlayer, varBagIdx, x310021_var_Buf1 )
	elseif varQuest>=8005 and varQuest<=8009 then
		LuaCallNoclosure( 310022, "PositionUseItem", varMap, varPlayer, varBagIdx, x310021_var_Buf1 )
	end

end

function x310021_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x310021_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x310021_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x310021_ProcDeplete( varMap, varPlayer )

	return 0
end

function x310021_ProcActivateOnce( varMap, varPlayer )
end

function x310021_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
