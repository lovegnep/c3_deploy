

x588048_var_FileId 		= 588048
x588048_var_ScriptName	= "传送至印度河"


x588048_var_TitleInfo		= "\t"

						
function x588048_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	
	StartTalkTask(varMap)		
		TalkAppendString(varMap,"#Y"..x588048_var_ScriptName.."#W")
		TalkAppendString(varMap,x588048_var_TitleInfo)
		
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588048_var_FileId, x588048_var_FileId)
end


function x588048_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap,x588048_var_FileId,x588048_var_ScriptName,3,0)

end

function x300479_ProcMapTimerTick( varMap, monsterobjid )

end
function x588048_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x588048_ProcAccept( varMap, varPlayer )
		local varguo=GetCurCountry(varMap, varPlayer)
	if varguo == 0 then
		  NewWorld(varMap,varPlayer,527,61,62,588048)
	elseif varguo == 1 then
		  NewWorld(varMap,varPlayer,527,61,62,588048)
	elseif varguo == 2 then
		 NewWorld(varMap,varPlayer,527,61,62,588048)
	elseif varguo == 3 then
		 NewWorld(varMap,varPlayer,527,61,62,588048)
	end


 
end
