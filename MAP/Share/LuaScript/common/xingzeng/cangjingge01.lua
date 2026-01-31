

x588044_var_FileId 		= 588044
x588044_var_ScriptName	= "#R¡¾´«ËÍ¡¿²Ø¾­¸ó"


x588044_var_TitleInfo		= "\t"

						
function x588044_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	
	StartTalkTask(varMap)		
		TalkAppendString(varMap,"#Y"..x588044_var_ScriptName.."#W")
		TalkAppendString(varMap,x588044_var_TitleInfo)
		
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588044_var_FileId, x588044_var_FileId)
end


function x588044_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap,x588044_var_FileId,x588044_var_ScriptName,3,0)

end

function x300479_ProcMapTimerTick( varMap, monsterobjid )

end
function x588044_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x588044_ProcAccept( varMap, varPlayer )
		local varguo=GetCurCountry(varMap, varPlayer)
	if varguo == 0 then
		  NewWorld(varMap,varPlayer,530,83,128,588044)
	elseif varguo == 1 then
		  NewWorld(varMap,varPlayer,530,172,128,588044)
	elseif varguo == 2 then
		  NewWorld(varMap,varPlayer,530,127,75,588044)
	elseif varguo == 3 then
		  NewWorld(varMap,varPlayer,530,127,75,588044)
	end


 
end
