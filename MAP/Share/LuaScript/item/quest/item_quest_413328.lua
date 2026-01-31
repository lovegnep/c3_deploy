


x413328_var_FileId = 413328 
x413328_var_Buf1 = 3001 

function x413328_ProcEventEntry( varMap, varPlayer, varBagIdx )
		LuaCallNoclosure( 888894,"OpenWorldDirectory",varMap,varPlayer )
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 80,1 )




		

end

function x413328_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x413328_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x413328_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x413328_ProcDeplete( varMap, varPlayer )

	return 0
end

function x413328_ProcActivateOnce( varMap, varPlayer )
end

function x413328_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
