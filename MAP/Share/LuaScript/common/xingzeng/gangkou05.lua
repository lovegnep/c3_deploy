

x930125_var_FileId 		= 930125
x930125_var_ScriptName	= "传送至大都"


x930125_var_TitleInfo		= "\t"

						
function x930125_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	
	StartTalkTask(varMap)		
		TalkAppendString(varMap,"#Y"..x930125_var_ScriptName.."#W")
		TalkAppendString(varMap,x930125_var_TitleInfo)
		
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930125_var_FileId, x930125_var_FileId)
end


function x930125_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetLevel( varMap, varPlayer) >= 40 then
		TalkAppendButton(varMap,x930125_var_FileId,x930125_var_ScriptName,3,0)
	end
end

function x300479_ProcMapTimerTick( varMap, monsterobjid )

end
function x930125_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x930125_ProcAccept( varMap, varPlayer )
		local varguo=GetCurCountry(varMap, varPlayer)
	if varguo == 0 then
		  NewWorld(varMap,varPlayer,0,256,226,930125)
	elseif varguo == 1 then
		  NewWorld(varMap,varPlayer,0,256,226,930125)
	elseif varguo == 2 then
		  NewWorld(varMap,varPlayer,0,256,226,930125)
	elseif varguo == 3 then
		  NewWorld(varMap,varPlayer,0,256,226,930125)
	end


 
end
