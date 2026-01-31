
--DECLARE_QUEST_INFO_START--
x300607_var_FileId =  300607
x300607_var_QuestName = "【帮会】召集"
--DECLARE_QUEST_INFO_STOP--


x300607_var_Leader_Index = 5


function x300607_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
 	  	local pos = GetGuildOfficial(varMap, varPlayer)
      	if pos == x300607_var_Leader_Index then			
  			if QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest ) > 0 then	
  				
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, 3, -1 )	 
				return 1
			end
		end
end















function x300607_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
                                   
		local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest )
		if varRet > 0 then	
  			local pos = GetGuildOfficial(varMap, varPlayer)
  			if pos ~= x300607_var_Leader_Index then			
  				return 0
 			end         
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y【帮会】帮会召集")
			TalkAppendString(varMap,"\t您可以通过我，向全体帮会成员发送召集信息，若对方同意则会出现在您的身边；若对方处于特殊状态或不同意则不会出现在您的身边。\n\t此模块每天只能使用一次。")
			TalkAppendString( varMap, "")
			StopTalkTask()
			DeliverTalkInfo(varMap, varPlayer, varTalknpc, varQuest, -1)
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




function x300607_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
  			GetGuildQuestData(varMap, varPlayer, GD_GUILD_INDEX_YUNBIAO_SSUE_TIME, x300607_var_FileId,varQuest,"ProcReturn")
end


function x300607_ProcReturn(varMap, varPlayer,QuestData,varQuest,varTalknpc)
	local varCurDayTime = GetDayTime()
	if QuestData == varCurDayTime then					
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，【帮会】帮会召集每天只能进行一次！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "很抱歉，【帮会】帮会召集每天只能进行一次！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap, "【帮会】帮会召集发布完成，您的兄弟们会尽快赶来！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "【帮会】帮会召集发布完成，您的兄弟们会尽快赶来！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		
		
		GamePlayScriptLog(varMap,varPlayer,871)

 		local GuildID = GetGuildID(varMap,varPlayer)
		SetGuildQuestData(varMap, GuildID, GD_GUILD_INDEX_YUNBIAO_SSUE_TIME, varCurDayTime)
		RecruitGuildConvoy(varMap, varPlayer)
	end	
	
	
end



