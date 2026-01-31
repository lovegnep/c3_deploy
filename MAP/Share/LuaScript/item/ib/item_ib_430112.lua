




x430112_var_FileId 		= 430112 




function x430112_ProcEventEntry( varMap, varPlayer, varBagIdx)

end






function x430112_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430112_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end






function x430112_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end

	return 1; 
end







function x430112_ProcDeplete( varMap, varPlayer)
    
        
    

    return 1
end








function x430112_ProcActivateOnce( varMap, varPlayer, varImpact)
    LuaCallNoclosure( 430110, "ProcEnumEvent", varMap, varPlayer, varPlayer, 0)
end







function x430112_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

