
--DECLARE_QUEST_INFO_START--

x310036_var_FileId = 310036



x310036_var_QuestName="圣山地宫传传出"

--DECLARE_QUEST_INFO_STOP--

x310036_var_SceneId = { 50, 150, 250, 350 }

	
	
	
	
	
	
	

x310036_var_BuffId = 7040

function x310036_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

    TalkAppendButton(varMap,x310036_var_FileId,"离开圣山地宫",14,-1)
     
end


function x310036_ProcEventEntry( varMap, varPlayer, varTalknpc,idScript,idExt )
	
	  StartTalkTask(varMap)
	  local Readme_1 = "#Y【地宫传送】#r"
	  local Readme_2 = "#W\t你要离开这里吗？一周只能进入这里7次，真是浪费了这强大的五耀之力啊！"
	  local varReadme = Readme_1..Readme_2
		TalkAppendString(varMap,varReadme)
		StopTalkTask(varMap)
	DeliverTalkInfo(varMap,varPlayer,varTalknpc,x310036_var_FileId,-1)
	return 

end




function x310036_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x310036_ProcAccept( varMap, varPlayer )

	
	
	local countryId = GetCurCountry(varMap, varPlayer)

	local NewSceneId = x310036_var_SceneId[countryId+1]
    

                                
 local PosX={ 454,454,454,454}  
 local PosZ={ 322,322,322,322} 
	GamePlayScriptLog(varMap, varPlayer, 532)
	
	local Posx = PosX[countryId+1]
	local Posz = PosZ[countryId+1]
	NewWorld(varMap, varPlayer, NewSceneId, Posx + random( 0, 3), Posz + random( 0, 3), 310036 )

end




function x310036_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x310036_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x310036_CheckSubmit( varMap, varPlayer )
end




function x310036_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end

