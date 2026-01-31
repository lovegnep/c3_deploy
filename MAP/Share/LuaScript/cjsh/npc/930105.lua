

x930105_var_FileId 		= 930105
x930105_var_ScriptName	= "ÍôÍôÍô£¡"

						
function x930105_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	

		
		SetMonsterCamp(varMap, varTalknpc, 21)
		boss = varTalknpc
end


function x930105_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap,x930105_var_FileId,x930105_var_ScriptName,15,0)

end

function x930105_ProcMapTimerTick( varMap, monsterobjid )

end
function x930105_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end

function x930105_ProcAccept( varMap, varPlayer )

end

function x930105_EnterScene( varMap, varPlayer)

end
function x930105_ProcDie(varMap, varPlayer, varKiller)
	
	SetMonsterCamp(varMap, boss, 20)
end