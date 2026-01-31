
x270356_var_FileId = 270356

x270356_var_QuestScriptTab 		= 	{ 270350,270351,270352,270353}		

function x270356_ProcEventEntry( varMap, varPlayer, varBagIdx )
	print("x270356_ProcEventEntry")
	local nCountryId = GetCurCountry(varMap,varPlayer )
	local varCanPlay =  LuaCallNoclosure( x270356_var_QuestScriptTab[nCountryId+1], "DenoteMonsterPosition", varMap, varPlayer, varBagIdx )
end

function x270356_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	

 end

function x270356_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
 
end

function x270356_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x270356_ProcDeplete( varMap, varPlayer )
	return 0
end

function x270356_ProcActivateOnce( varMap, varPlayer )
	print("x270356_ProcActivateOnce")
end

function x270356_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
