
--DECLARE_QUEST_INFO_START--

x300938_var_FileId = 300938
x300938_var_QuestName="领主战场召集"
x300938_var_QuestDesc="\t使用此模块，会消耗50点战场积分，可以将本战场内的本帮成员传送至此。您确定要使用积分换取此次召集吗？"
x300938_var_QuestSuccess="消耗50点战场积分，您顺利的使用了领主战场召集！"
x300938_var_QuestScoreNotEnough="很抱歉，您的帮会战场积分不足50点,无法召集！"

x300938_var_Guild_Camp_A= 5
x300938_var_Guild_Camp_B= 6

x300938_var_Leader_Index= 5

x300938_var_CostScore   = 50

function x300938_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local nNpcCamp  = GetMonsterCamp(varMap,varTalknpc)
	local nSelfCamp = GetCurCamp(varMap,varPlayer)
	
	
	if nNpcCamp ~= nSelfCamp then
		return
	end
	
	
	local pos = GetGuildOfficial(varMap, varPlayer)
	if pos ~= x300938_var_Leader_Index then
		return
	end
	
	
	local nGuildA,nGuildB = LuaCallNoclosure(300918,"GetMatchGuild",varMap)
    if nGuildA == -1 and nGuildB == -1 then
    	return
    end
    
    
    if GetGuildID(varMap,varPlayer) ~= nGuildA and GetGuildID(varMap,varPlayer) ~= nGuildB then
    	return
    end

	TalkAppendButton(varMap,x300938_var_FileId,x300938_var_QuestName,3,0)

end


function x300938_ProcEventEntry( varMap, varPlayer, varTalknpc,idScript,idExt )

	local nNpcCamp  = GetMonsterCamp(varMap,varTalknpc)
	local nSelfCamp = GetCurCamp(varMap,varPlayer)
	
	
	if nNpcCamp ~= nSelfCamp then
		return
	end
	
	
	local pos = GetGuildOfficial(varMap, varPlayer)
	if pos ~= x300938_var_Leader_Index then
		return
	end
	
	
	local nGuildA,nGuildB = LuaCallNoclosure(300918,"GetMatchGuild",varMap)
    if nGuildA == -1 and nGuildB == -1 then
    	return
    end
    
    
    if GetGuildID(varMap,varPlayer) ~= nGuildA and GetGuildID(varMap,varPlayer) ~= nGuildB then
    	return
    end
	
	if idExt == 0 then
	
		StartTalkTask(varMap)
	    TalkAppendString(varMap, x300938_var_QuestDesc);
	    TalkAppendButton(varMap,x300938_var_FileId,"确定..",3,1);
	    StopTalkTask(varMap)
	    DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	    
	elseif idExt == 1 then
		
		
		if nNpcCamp == x300938_var_Guild_Camp_A then
		
			
			local nScore = LuaCallNoclosure(300918,"GetBattleScoreA",varMap)
			if nScore < x300938_var_CostScore then
				StartTalkTask(varMap)
			    TalkAppendString(varMap, x300938_var_QuestScoreNotEnough);
			    StopTalkTask(varMap)
			    DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			    return
			end
			
			
			
			nScore = nScore - x300938_var_CostScore
			LuaCallNoclosure(300918,"SetBattleScoreA",varMap,nScore)
		
			
			LuaCallNoclosure(300918,"TransGuildMemberToAround",varMap,varPlayer,nNpcCamp,58,186)
		elseif nNpcCamp == x300938_var_Guild_Camp_B then
		
			
			local nScore = LuaCallNoclosure(300918,"GetBattleScoreB",varMap)
			if nScore < x300938_var_CostScore then
				StartTalkTask(varMap)
			    TalkAppendString(varMap, x300938_var_QuestScoreNotEnough);
			    StopTalkTask(varMap)
			    DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			    return
			end
			
			
			
			nScore = nScore - x300938_var_CostScore
			LuaCallNoclosure(300918,"SetBattleScoreB",varMap,nScore)
		
			
			LuaCallNoclosure(300918,"TransGuildMemberToAround",varMap,varPlayer,nNpcCamp,212,96)
		end
		
		
		
		StartTalkTask(varMap)
	    TalkAppendString(varMap, x300938_var_QuestSuccess);
	    StopTalkTask(varMap)
	    DeliverTalkMenu(varMap,varPlayer,varTalknpc)

	end
end




function x300938_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300938_ProcAccept( varMap, varPlayer )
end




function x300938_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x300938_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x300938_CheckSubmit( varMap, varPlayer )
end




function x300938_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end

