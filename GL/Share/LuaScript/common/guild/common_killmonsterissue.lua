
x300618_var_FileId =  300618


x300618_var_Leader_Index   = 5


function x300618_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
		local pos = GetGuildOfficial(varMap, varPlayer)
  		if pos == x300618_var_Leader_Index then			
  			if QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest ) > 0 then	
  				GetGuildQuestData(varMap, varPlayer, GD_GUILD_INDEX_KILL_ISSUE_TIME, x300618_var_FileId,varQuest,"ProcCallBackEnumerate",varTalknpc)

				return 1
			end
		end

	return 0
end

function x300618_ProcCallBackEnumerate( varMap, varPlayer,QuestData , varQuest,varTalknpc )

	local varCurDayTime = GetDayTime()
	if QuestData ~= varCurDayTime then					
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, 3, -1 ) 		
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	end
	return 0
end


function x300618_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
		local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest )

		if varRet > 0 then	
		
  			local pos = GetGuildOfficial(varMap, varPlayer)
  		
  			if pos ~= x300618_var_Leader_Index then			
  				return 0
 			end
 			DeliverTalkAddQuestInfoNM( varMap, varPlayer, varTalknpc, varQuest ) 
		else
			local varText = "未知错误，无法接新的任务"
			if varRet == -1 then
				varText = "等级不足，无法接新的任务"
			elseif varRet == -2 then
				varText = "等级过高，无法接新的任务"
			elseif varRet == -3 then
				varText = "金钱不足，无法接新的任务"
			elseif varRet == -4 then
				varText = "您不是本国玩家，无法接新的任务"
			elseif varRet == -5 then
				varText = "职业类型不符，无法接新的任务"
			elseif varRet == -6 then
				varText = "阵营不符，无法接新的任务"
			end
			StartTalkTask(varMap)
			
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
  
end




function x300618_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
 	local varLevel = GetLevel(varMap,varPlayer)
	if varLevel < 70 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，70级以后才能发布帮会杀怪任务！");
		StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			local varReadme = "很抱歉，70级以后才能发布帮会杀怪任务！"
			Msg2Player(varMap,varPlayer,varReadme,8,2)
		return
	end
   GetGuildQuestData(varMap, varPlayer, GD_GUILD_INDEX_KILL_ISSUE_TIME, x300618_var_FileId,varQuest,"ProcReturn")
end

function x300618_ProcReturn(varMap, varPlayer,QuestData,varQuest,varTalknpc)

	local varCurDayTime = GetDayTime()
	if QuestData == varCurDayTime then					
		StartTalkTask(varMap)
		TalkAppendString(varMap, "今天您已经发布过帮会杀怪，请改天在来吧！")
		StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			local varReadme = "今天您已经发布过帮会杀怪，请改天在来吧！"
			Msg2Player(varMap,varPlayer,varReadme,8,2)
	else
		local title =GetGuildTitle(varMap, varPlayer)
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您发布了今天的帮会杀怪任务!")
		StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			local varStr = format("%s发布了今天的帮会杀怪任务,稍候可以到帮战发布人处领取任务",title)
			Msg2Player(varMap, varPlayer,varStr,6,0)

 		local GuildID = GetGuildID(varMap,varPlayer)
		SetGuildQuestData(varMap, GuildID, GD_GUILD_INDEX_KILL_ISSUE_TIME, varCurDayTime)
	end
	
	
	
end



