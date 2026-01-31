

x588050_var_FileId 		= 588050
x588050_var_ScriptName	= "¥´ÀÕ÷¡ •…Ω"


x588050_var_TitleInfo		= "\t"

						
function x588050_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	
	StartTalkTask(varMap)		
		TalkAppendString(varMap,"#Y"..x588050_var_ScriptName.."#W")
		TalkAppendString(varMap,x588050_var_TitleInfo)
		
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588050_var_FileId, x588050_var_FileId)
end


function x588050_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap,x588050_var_FileId,x588050_var_ScriptName,3,0)

end

function x300479_ProcMapTimerTick( varMap, monsterobjid )

end
function x588050_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x588050_ProcAccept( varMap, varPlayer )
		local varguo=GetCurCountry(varMap, varPlayer)
	if varguo == 0 then
		  NewWorld(varMap,varPlayer,87,299,417,588050)
	elseif varguo == 1 then
		  NewWorld(varMap,varPlayer,187,299,417,588050)
	elseif varguo == 2 then
		 NewWorld(varMap,varPlayer,287,299,417,588050)
	elseif varguo == 3 then
		 NewWorld(varMap,varPlayer,387,299,417,588050)
	end


 
end
