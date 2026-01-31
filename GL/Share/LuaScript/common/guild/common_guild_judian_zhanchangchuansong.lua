
--DECLARE_QUEST_INFO_START--

x300933_var_FileId = 300933
x300933_var_QuestName="前线传送"

x300933_var_ChuanSong_X = 205
x300933_var_ChuanSong_Z = 125



function x300933_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
    
	local varTalknpc = GetMonsterGUID( varMap, varTalknpc)
	if varTalknpc == 170033 then
		TalkAppendButton(varMap,x300933_var_FileId,"离开战场",3,2)
	end

    
    local nGuildA,nGuildB = LuaCallNoclosure(300918,"GetMatchGuild",varMap)
    if nGuildA == -1 and nGuildB == -1 then
    	return
    end
    
    local nGuildId = GetGuildID( varMap,varPlayer )
    
	if varTalknpc == 170030 then
		if nGuildId == nGuildA or LuaCallNoclosure(300918,"IsPlayerAidA",varMap,varPlayer) == 1 then
			 TalkAppendButton(varMap,x300933_var_FileId,"前线传送",14,1)
		end
	end
	
	if varTalknpc == 170031 then
		if nGuildId == nGuildA or LuaCallNoclosure(300918,"IsPlayerAidA",varMap,varPlayer) == 1 then
			 TalkAppendButton(varMap,x300933_var_FileId,"回援本阵",14,3)
		end
	end
end


function x300933_ProcEventEntry( varMap, varPlayer, varTalknpc,idScript,idExt )
	if idExt == 1 then
		
	    local nGuildA,nGuildB = LuaCallNoclosure(300918,"GetMatchGuild",varMap)
	    if nGuildA == -1 and nGuildB == -1 then
	    	return
	    end
	    local varTimeCount = LuaCallNoclosure(300918,"GetCountTime",varMap)
	    if varTimeCount > 29 * 60 then
	    	StartTalkTask(varMap)
	        TalkAppendString(varMap,"战斗还没开始，无法传送")
	        StopTalkTask(varMap)
	        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	        return 0
	    end
	    local nGuildId = GetGuildID( varMap,varPlayer )
	
	    
	    if nGuildId == nGuildA  or LuaCallNoclosure(300918,"IsPlayerAidA",varMap,varPlayer) == 1 then
	        SetPos(varMap,varPlayer,190,50)
	    end
	elseif idExt == 2 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"你真的要离开战场吗？")
        StopTalkTask(varMap)
        DeliverTalkInfo(varMap,varPlayer,varTalknpc,x300933_var_FileId,-1)
		return 1
    end
	if idExt == 3 then
		local varTalknpc = GetMonsterGUID( varMap, varTalknpc)
		local nGuildA,nGuildB = LuaCallNoclosure(300918,"GetMatchGuild",varMap)
	    if nGuildA == -1 and nGuildB == -1 then
	    	return
	    end
		
		local nGuildId = GetGuildID( varMap,varPlayer )
		if varTalknpc == 170031 then
			if nGuildId == nGuildA  or LuaCallNoclosure(300918,"IsPlayerAidA",varMap,varPlayer) == 1 then
				SetPos(varMap,varPlayer,55,73)
			end
		end
	end
end




function x300933_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300933_ProcAccept( varMap, varPlayer )
	LuaCallNoclosure(300918,"LairdBattleKickPlayer",varMap,varPlayer)
end




function x300933_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x300933_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x300933_CheckSubmit( varMap, varPlayer )
end




function x300933_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end

