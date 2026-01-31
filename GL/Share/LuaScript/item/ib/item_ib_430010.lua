




x430010_var_FileId 		= 430010 




function x430010_ProcEventEntry( varMap, varPlayer, varBagIdx)

end






function x430010_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430010_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end






function x430010_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end

	return 1; 
end







function x430010_ProcDeplete( varMap, varPlayer)
    
        
    

    return 1
end








function x430010_ProcActivateOnce( varMap, varPlayer, varImpact)
    LuaCallNoclosure( 430009, "ProcEnumEvent", varMap, varPlayer, varPlayer, 0)
end







function x430010_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

