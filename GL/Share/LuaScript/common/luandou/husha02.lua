

x589002_var_FileId 		= 589002
x589002_var_ScriptName	= "#R¡¾´«ËÍ¡¿´óÂÒ¶·"


x589002_var_TitleInfo		= "\t"

						
function x589002_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	
	StartTalkTask(varMap)		
		TalkAppendString(varMap,"#Y"..x589002_var_ScriptName.."#W")
		TalkAppendString(varMap,x589002_var_TitleInfo)
		
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x589002_var_FileId, x589002_var_FileId)
end


function x589002_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap,x589002_var_FileId,x589002_var_ScriptName,3,0)

end

function x300479_ProcMapTimerTick( varMap, monsterobjid )

end
function x589002_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x589002_ProcAccept( varMap, varPlayer )
	local varguo=GetCurCountry(varMap, varPlayer)
	if varguo == 0 then
		  NewWorld(varMap,varPlayer,545,130,103,589002)
	elseif varguo == 1 then
		  NewWorld(varMap,varPlayer,545,130,103,589002)
	elseif varguo == 2 then
		  NewWorld(varMap,varPlayer,545,130,103,589002)
	elseif varguo == 3 then
		  NewWorld(varMap,varPlayer,545,130,103,589002)
	end



 
end
