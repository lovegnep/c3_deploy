

x310904_var_FileId 		= 310904
x310904_var_ScriptName	= "´«ËÍÖÁ¿¨µÏ×È¸Û"


x310904_var_TitleInfo		= "\t"

						
function x310904_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	
	StartTalkTask(varMap)		
		TalkAppendString(varMap,"#Y"..x310904_var_ScriptName.."#W")
		TalkAppendString(varMap,x310904_var_TitleInfo)
		
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310904_var_FileId, x310904_var_FileId)
end


function x310904_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		TalkAppendButton(varMap,x310904_var_FileId,x310904_var_ScriptName,3,0)

end

function x300479_ProcMapTimerTick( varMap, monsterobjid )

end
function x310904_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x310904_ProcAccept( varMap, varPlayer )
		local varguo=GetCurCountry(varMap, varPlayer)
	if varguo == 0 then
		  NewWorld(varMap,varPlayer,569,206,354,310904)
	elseif varguo == 1 then
		  NewWorld(varMap,varPlayer,569,206,354,310904)
	elseif varguo == 2 then
		  NewWorld(varMap,varPlayer,569,206,354,310904)
	elseif varguo == 3 then
		  NewWorld(varMap,varPlayer,569,206,354,310904)
	end


 
end
