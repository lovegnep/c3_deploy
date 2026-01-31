
--DECLARE_QUEST_INFO_START--

x310401_var_FileId = 310401



x310401_var_QuestName="抢滩东瀛岛传出"

x310401_var_BuffId = 7061

x310401_var_TransportTable        = {
                                    { varX = 150.44, z = 180 }, 
                                    { varX = 150.44, z = 180 }, 
                                    { varX = 150.44, z = 180 }, 
                                    { varX = 155.44, z = 179 }, 
                                    { varX = 154.44, z = 182 }, 
                                    { varX = 147.44, z = 180 }, 
                                    { varX = 147.44, z = 180 }, 
                                    { varX = 158.44, z = 185 }, 
                                    { varX = 164.44, z = 182 }, 
}

function x310401_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

    TalkAppendButton(varMap,x310401_var_FileId,"离开东瀛岛",14,-1)
     
end


function x310401_ProcEventEntry( varMap, varPlayer, varTalknpc,idScript,idExt )
	
	  StartTalkTask(varMap)
	  local Readme_1 = "#Y【边境传送】#r"
	  local Readme_2 = "#w\t你要离开这里吗？那你今天无法再次进来了，真是浪费了这强大的勇武之力啊！"
	  local varReadme = Readme_1..Readme_2
		TalkAppendString(varMap,varReadme)
		StopTalkTask(varMap)
	DeliverTalkInfo(varMap,varPlayer,varTalknpc,x310401_var_FileId,-1)
	return 

end




function x310401_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x310401_ProcAccept( varMap, varPlayer )

	
	
	

	
    local varRand = random( 1, getn( x310401_var_TransportTable) )
	local PosX = x310401_var_TransportTable[ varRand].varX
	local PosZ = x310401_var_TransportTable[ varRand].z

	GamePlayScriptLog(varMap, varPlayer, 532)
	
	NewWorld(varMap, varPlayer, 15, PosX + random( 0, 3), PosZ + random( 0, 3), 310401 )

end




function x310401_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x310401_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x310401_CheckSubmit( varMap, varPlayer )
end




function x310401_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end

