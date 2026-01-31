





x418131_var_FileId = 418131






function x418131_ProcEventEntry( varMap, varPlayer, varBagIdx)

end






function x418131_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418131_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end






function x418131_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end

	return 1; 
end







function x418131_ProcDeplete( varMap, varPlayer)
    
        
    

    return 1
end








function x418131_ProcActivateOnce( varMap, varPlayer, varImpact)
	LuaCallNoclosure( 418132, "ProcEnumEvent", varMap, varPlayer, varPlayer, 0)
end







function x418131_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

