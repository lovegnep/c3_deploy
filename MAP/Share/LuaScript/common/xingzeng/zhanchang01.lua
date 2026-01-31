

x588013_var_FileId 		= 588013
x588013_var_ScriptName	= "´«ËÍÖÁ¿¨µÏ×È¸Û"


x588013_var_TitleInfo		= "\t"

						
function x588013_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	
	StartTalkTask(varMap)		
		TalkAppendString(varMap,"#Y"..x588013_var_ScriptName.."#W")
		TalkAppendString(varMap,x588013_var_TitleInfo)
		
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588013_var_FileId, x588013_var_FileId)
end


function x588013_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap,x588013_var_FileId,x588013_var_ScriptName,3,0)

end

function x300479_ProcMapTimerTick( varMap, monsterobjid )

end
function x588013_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x588013_ProcAccept( varMap, varPlayer )
		local varguo=GetCurCountry(varMap, varPlayer)
	if varguo == 0 then
		  NewWorld(varMap,varPlayer,569,206,354,588013)
	elseif varguo == 1 then
		  NewWorld(varMap,varPlayer,569,206,354,588013)
	elseif varguo == 2 then
		  NewWorld(varMap,varPlayer,569,206,354,588013)
	elseif varguo == 3 then
		  NewWorld(varMap,varPlayer,569,206,354,588013)
	end


 
end
