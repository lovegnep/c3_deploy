

x588016_var_FileId 		= 588016
x588016_var_ScriptName	= "传送至大都"


x588016_var_TitleInfo		= "\t"

						
function x588016_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	
	StartTalkTask(varMap)		
		TalkAppendString(varMap,"#Y"..x588016_var_ScriptName.."#W")
		TalkAppendString(varMap,x588016_var_TitleInfo)
		
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588016_var_FileId, x588016_var_FileId)
end


function x588016_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap,x588016_var_FileId,x588016_var_ScriptName,3,0)

end

function x300479_ProcMapTimerTick( varMap, monsterobjid )

end
function x588016_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x588016_ProcAccept( varMap, varPlayer )
		local varguo=GetCurCountry(varMap, varPlayer)
	if varguo == 0 then
		  NewWorld(varMap,varPlayer,0,268,310,588016)
	elseif varguo == 1 then
		  NewWorld(varMap,varPlayer,0,268,310,588016)
	elseif varguo == 2 then
		  NewWorld(varMap,varPlayer,0,268,310,588016)
	elseif varguo == 3 then
		  NewWorld(varMap,varPlayer,0,268,310,588016)
	end


 
end
