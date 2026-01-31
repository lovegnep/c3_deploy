x800153_var_FileId 				= 800153                  
x800153_var_QuestName			= "±¦Ê¯ïÎ¿Ì"


function x800153_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	if GetLevel( varMap, varPlayer) < 80 then
    return 
  end
  
	TalkAppendButton(varMap,x800153_var_FileId,x800153_var_QuestName,3, 0)

end

function x800153_ProcEventEntry( varMap ,varPlayer, varTalknpc,idScript,idExt )

end

function x800153_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
end


function x800153_GiveReward( varMap, varPlayer, idExt)

 		
end
