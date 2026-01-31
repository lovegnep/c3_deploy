






x300567_var_FileId = 300567




x300567_var_Buf1 = -1
x300567_var_Buf2 = -1 


x300567_var_QuestScriptId = 300566




function x300567_ProcEventEntry( varMap, varPlayer, varBagIdx )
    LuaCallNoclosure( x300567_var_QuestScriptId, "ProcUseItem", varMap, varPlayer)
end






function x300567_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x300567_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300567_ProcConditionCheck( varMap, varPlayer )
	
	if 1 ~= VerifyUsedItem( varMap, varPlayer) then
		return 0
	end
	
	return 1; 
end







function x300567_ProcDeplete( varMap, varPlayer )
	return DepletingUsedItem( varMap, varPlayer)
end








function x300567_ProcActivateOnce( varMap, varPlayer)
	return 1
end







function x300567_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x300567_LogicDeplete( varMap, varPlayer)
end

