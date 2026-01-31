




x430113_var_FileId 		= 430113 




function x430113_ProcEventEntry( varMap, varPlayer, varBagIdx)

end






function x430113_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430113_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end






function x430113_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end

	return 1; 
end







function x430113_ProcDeplete( varMap, varPlayer)
    
        
    

    return 1
end








function x430113_ProcActivateOnce( varMap, varPlayer, varImpact)
    LuaCallNoclosure( 430111, "ProcEnumEvent", varMap, varPlayer, varPlayer, 0)
end







function x430113_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

