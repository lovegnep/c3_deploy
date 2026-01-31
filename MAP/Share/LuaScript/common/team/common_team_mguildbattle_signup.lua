


--DECLARE_QUEST_INFO_START--
x303119_var_FileId              = 303119
x303119_var_Leader_Index        = 5
x303119_var_QuestName           = "【帮会】跨服帮会战报名"

--Gameopen
x303119_var_GameOpen = 1096

--DECLARE_QUEST_INFO_STOP--



function x303119_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		if GetGameOpenById( x303119_var_GameOpen ) <= 0 then
   		return
  	end

	  if GetMergeDBToggle() == 1 then
	    return
	  end
	    
		local UpdateDBflag = GetUpdateDBBeforeToggle()
		if UpdateDBflag==1 then
			return
		end
    
    -- 是否已加入帮会
    local nGuildId = GetGuildID(varMap,varPlayer )    
    if nGuildId < 0 then
        return
    end
    
    -- 职务
    local pos = GetGuildOfficial(varMap, varPlayer)
		if pos ~= x303119_var_Leader_Index then
        return
    end
    
    TalkAppendButton(varMap, x303119_var_FileId, x303119_var_QuestName, 3)
    
end


function x303119_ProcEventEntry( varMap, varPlayer, varTalknpc,varScript,idExt )

    MGuildBattleSignup( varMap,varPlayer )

    return 1

end


function x303119_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x303119_ProcAccept( varMap, varPlayer )
end


function x303119_ProcQuestAbandon( varMap, varPlayer, varQuest )
end


function x303119_ProcContinue( varMap, varPlayer, varTalknpc )
end


function x303119_CheckSubmit( varMap, varPlayer )
end


function x303119_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end


function x303119_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


function x303119_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end


function x303119_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
