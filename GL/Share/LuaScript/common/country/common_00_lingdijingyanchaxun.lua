x302506_var_FileId 		= 302506
x302506_var_QuestKind 	= 	1                       
x302506_var_QuestName	= "【国家】图腾经验查询"


x302506_var_IsEnableId    = 1050
x302506_var_LimitLevel	= 40			


x302506_var_LairdMap		= { 6, 9, 13, 18, 21, 24, 27, 31, 34 }

x302506_var_LairdNpcId	= { 400600, 400601, 400602, 400603, 400604, 400605, 400606, 400607, 400608 }

x302506_var_LairdExpMax	= { 10500, 11667, 12834, 14001 }



function x302506_CallbackEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetGameOpenById( x302506_var_IsEnableId) <= 0 then
        return
    end
    
    local varIndex = -1
    local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
    for varI, item in x302506_var_LairdNpcId do
    	if varTalkNpcGUID == item then
    		varIndex = varI
    		break
    	end
    end
	if varIndex == -1 then
		return
	end
    
    local varCountry = GetCurCountry(varMap, varPlayer)
    local nLairdCountry = GetSceneLairdCountryId(x302506_var_LairdMap[varIndex])
    if nLairdCountry ~= varCountry then
		return
	end
    
	TalkAppendButton(varMap,x302506_var_FileId, x302506_var_QuestName, 3, -1)
end




function x302506_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
end




function x302506_ProcEventEntry( varMap ,varPlayer, varTalknpc, idScript, idExt )

	if GetGameOpenById( x302506_var_IsEnableId) <= 0 then
        return
    end
    
    local varIndex = -1
    local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
    for varI, item in x302506_var_LairdNpcId do
    	if varTalkNpcGUID == item then
    		varIndex = varI
    		break
    	end
    end
	if varIndex == -1 then
		return
	end
    
    local varCountry = GetCurCountry(varMap, varPlayer)
    local nLairdCountry = GetSceneLairdCountryId(x302506_var_LairdMap[varIndex])
    if nLairdCountry ~= varCountry then
		return
	end
	
	local nGuildID = GetSceneLairdGuildId(x302506_var_LairdMap[varIndex])
	if nGuildID < 0 then
		
		return
	end
	
	local nLairdLevel = GetSceneLairdLevel(x302506_var_LairdMap[varIndex])
	local nCurLairdExp = GetGuildParam(nGuildID,GD_GUILD_LAIRDBATTLE_CURRENT_EXP)
	
	StartTalkTask(varMap)          
	TalkAppendString(varMap, "#Y"..x302506_var_QuestName.."#W")
	
	if nLairdLevel == 5 then
		TalkAppendString(varMap, "#Y".."当前领地等级已达到满级".."#W")
	else
	local percent = nCurLairdExp*100/x302506_var_LairdExpMax[nLairdLevel]-0.05
	if percent < 0 then
		percent = 0
	end
	TalkAppendString(varMap, format("\n\t领地图腾的经验来源于#Y【国家】图腾进贡#W任务。当图腾的经验到达100%%时，图腾将会升级。领地图腾升级后可以为#G占领领地的帮会#W增加领地津贴和领地经验，同时也会提升#G全国玩家#W出国任务的奖励。\n \n当前经验：#R%.1f%%", percent))
	end
	
	StopTalkTask()
	DeliverTalkInfo(varMap ,varPlayer, varTalknpc, x302506_var_FileId, -1, 1)
end

function x302506_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x302506_ProcAccept( varMap, varPlayer )
end




function x302506_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x302506_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x302506_CheckSubmit( varMap, varPlayer )

end




function x302506_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x302506_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x302506_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x302506_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
