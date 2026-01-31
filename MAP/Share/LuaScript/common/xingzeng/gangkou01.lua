

x588015_var_FileId 		= 588015
x588015_var_ScriptName	= "´«ËÍÖÁÅîÀ³µº"


x588015_var_TitleInfo		= "\t"

						
function x588015_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	
	StartTalkTask(varMap)		
		TalkAppendString(varMap,"#Y"..x588015_var_ScriptName.."#W")
		TalkAppendString(varMap,x588015_var_TitleInfo)
		
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588015_var_FileId, x588015_var_FileId)
end


function x588015_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local level = GetLevel(varMap, varPlayer)
    if level >= 40 then
        TalkAppendButton(varMap,x588015_var_FileId,x588015_var_ScriptName,3,0)
    end

end

function x300479_ProcMapTimerTick( varMap, monsterobjid )

end
function x588015_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x588015_ProcAccept( varMap, varPlayer )
		local varguo=GetCurCountry(varMap, varPlayer)
	if varguo == 0 then
		  NewWorld(varMap,varPlayer,570,128,92,588015)
	elseif varguo == 1 then
		  NewWorld(varMap,varPlayer,570,128,92,588015)
	elseif varguo == 2 then
		  NewWorld(varMap,varPlayer,570,128,92,588015)
	elseif varguo == 3 then
		  NewWorld(varMap,varPlayer,570,128,92,588015)
	end


 
end
