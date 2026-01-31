
x310182_var_FileId = 310182
x310182_var_GameId = 1019
x310182_var_LimitLevel = 20
x310182_var_MaxCount = 20
x310182_var_NextLimitLevel = 40

x310182_var_GameID_Right	= 971
x310182_var_GameID_Error	= 972

function x310182_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if GetGameOpenById(x310182_var_GameId) ~= 1 then
		return
	end
	
    TalkAppendButton(varMap,x310182_var_FileId,"我要参加乌龙词典海选！",3,x310182_var_FileId);
        
end

function x310182_CheckValid( varMap,varPlayer,varTalknpc)
	if GetGameOpenById(x310182_var_GameId) ~= 1 then
		
		StartTalkTask(varMap)
			TalkAppendString(varMap,"乌龙词典活动已经关闭！")				
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return -1
	end

	local varLevel = GetLevel(varMap,varPlayer)
	if varLevel<x310182_var_LimitLevel then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"\t只有20级以上的玩家才能参加乌龙辞典海选赛。")				
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return -2
	end
	local minute =  GetMinOfDay()
		
	if GetWeek() ~= 0 or minute> 840 then
		
		StartTalkTask(varMap)
			TalkAppendString(varMap,"\t很遗憾，乌龙辞典王国海选赛在下午14：00已经结束了！")				
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return -3
	end
	if GetWeek() ~= 0 or minute <780 then
		
		StartTalkTask(varMap)
			TalkAppendString(varMap,"\t别心急，乌龙辞典海选赛在下午13：00才正式开始！")				
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return -3
	end
		
	return 1

end

function x310182_AddAnswerOption( varMap,varAnswer1,varAnswer2,varAnswer3,varAnswer4)
	
	local answer = { {varAnswer1,12001},{varAnswer2,12002},{varAnswer3,12003},{varAnswer4,12004} }
	local varIndex = {1,2,3,4}
	for varI=1, 4 do
		local r = random(1, getn(varIndex))
		TalkAppendButton(varMap,x310182_var_FileId,answer[varIndex[r]][1],3,answer[varIndex[r]][2] )

		local tmp = varIndex;
		varIndex = {}
		local curIndex =1;
		for n=1, getn(tmp) do
			if n ~= r then
				varIndex[curIndex] = tmp[n]
				curIndex = curIndex + 1
			end
		end
	end
end

function x310182_AddAward(varMap ,varPlayer)
	local varExpBonus = GetLevel(varMap ,varPlayer)*800
	AddExp(varMap, varPlayer, varExpBonus);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o获得#R经验"..varExpBonus.."点#o的奖励");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
  		Msg2Player(varMap,varPlayer,"#o获得#R经验"..varExpBonus.."点#o的奖励",4,2)
end


function x310182_ProcEventEntry( varMap ,varPlayer, varTalknpc,idScript,idExt )
	if x310182_CheckValid( varMap,varPlayer,varTalknpc) < 0 then
		return
	end

	local step = GetPlayerGameData(varMap,varPlayer,MD_WULONG_STEP[1], MD_WULONG_STEP[2], MD_WULONG_STEP[3])

	if idExt == x310182_var_FileId then 

		local curDay = GetDayOfYear() 
		local nDate   = GetPlayerGameData(varMap,varPlayer,MD_WULONG_DATE[1], MD_WULONG_DATE[2], MD_WULONG_DATE[3] )
	
		if curDay ~= nDate then
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_DATE[1], MD_WULONG_DATE[2], MD_WULONG_DATE[3],curDay )
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_STEP[1], MD_WULONG_STEP[2], MD_WULONG_STEP[3],1 )
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3],1 )
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_RIGHT_COUNT[1], MD_WULONG_RIGHT_COUNT[2], MD_WULONG_RIGHT_COUNT[3],0 )
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_TIME_BEGIN[1], MD_WULONG_TIME_BEGIN[2], MD_WULONG_TIME_BEGIN[3],0 )
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3],60000 )
		else
			if step ~= 1 then
				return 
			end

			 local curCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )
			 if curCount > x310182_var_MaxCount then 
				local resultStr ="\t恭喜你顺利通过乌龙辞典海选赛！\n\t请在下午#G2点#W准时前往#G大都#W参加扣人心弦的#G乌龙辞典淘汰赛！\n\t#W您可以前往大都的#G（205，50）（295，50）#W中任意一处，找到#G大都一号主持人#W开始比赛。"
				if GetLevel(varMap,varPlayer) < x310182_var_NextLimitLevel then
					resultStr = format("很可惜，虽然你参加了乌龙辞典海选赛，但是你的等级不足%d级,无法进入下一轮。", x310182_var_NextLimitLevel)
				elseif GetPlayerGameData(varMap,varPlayer,MD_WULONG_RIGHT_COUNT[1], MD_WULONG_RIGHT_COUNT[2], MD_WULONG_RIGHT_COUNT[3]) < 10 then
					resultStr = format("很遗憾,你没能通过乌龙辞典海选。\n\t#G（至少需要回答正确%d道题才能进入下一轮）", 10)
				end

				StartTalkTask(varMap)	
				TalkAppendString(varMap, resultStr)						
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				return 
			 end

			 
		end
		
		local lastQuest = GetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3] ) 
		if lastQuest ~= 60000 then
			local varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer = QuestWulong_GetQuestionInfo(0, 1, lastQuest)
			if varAnswer == 0 then
				return
			end

			 local curCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )
			 local rightCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_RIGHT_COUNT[1], MD_WULONG_RIGHT_COUNT[2], MD_WULONG_RIGHT_COUNT[3] )

			SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_WULONG_CUR_ANSWER,varAnswer+12000)
			StartTalkTask(varMap)	
					TalkAppendString(varMap,varDesc)
					x310182_AddAnswerOption( varMap,varAnswer1,varAnswer2,varAnswer3,varAnswer4)						
					
					TalkAppendString(varMap,format("\t（当前第#G%d#W题，已答对#G%d#W题）",curCount, rightCount) )						
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)	
		else
		local curCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )
		local rightCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_RIGHT_COUNT[1], MD_WULONG_RIGHT_COUNT[2], MD_WULONG_RIGHT_COUNT[3] )
			local varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer, lastIndex = QuestWulong_GetQuestionInfo(0)
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3],lastIndex )
			SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_WULONG_CUR_ANSWER,varAnswer+12000)
			StartTalkTask(varMap)	
					TalkAppendString(varMap,varDesc)
					x310182_AddAnswerOption( varMap,varAnswer1,varAnswer2,varAnswer3,varAnswer4)							
					
					
					
						TalkAppendString(varMap,format("\t（当前第#G%d#W题，已答对#G%d#W题）",curCount, rightCount) )		
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			
		end
		
		
		
		return
	elseif idExt >= 12001 and idExt <= 12004 then
		if step ~= 1 then
				return 
		end

		 local curCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )
		 local lastAnswer = GetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_WULONG_CUR_ANSWER)
		 SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3],60000 )

		 if curCount > x310182_var_MaxCount then 
			local resultStr ="\t恭喜你顺利通过乌龙辞典海选赛！\n\t请在下午#G2点#W准时前往#G大都#W参加扣人心弦的#G乌龙辞典淘汰赛！\n\t#W您可以前往大都的#G（205，50）（295，50）#W中任意一处，找到#G大都一号主持人#W开始比赛。"
			if GetLevel(varMap,varPlayer) < x310182_var_NextLimitLevel then
				resultStr = format("很可惜，虽然你参加了乌龙辞典海选赛，但是你的等级不足%d级,无法进入下一轮。", x310182_var_NextLimitLevel)
			elseif GetPlayerGameData(varMap,varPlayer,MD_WULONG_RIGHT_COUNT[1], MD_WULONG_RIGHT_COUNT[2], MD_WULONG_RIGHT_COUNT[3]) < 10 then
				resultStr = format("很遗憾,你没能通过乌龙辞典海选。\n\t#G（至少需要回答正确%d道题才能进入下一轮）", 10)
			end

			StartTalkTask(varMap)	
			TalkAppendString(varMap, resultStr)						
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return 
		 end
			 
		if lastAnswer == idExt then 
			local curRightCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_RIGHT_COUNT[1], MD_WULONG_RIGHT_COUNT[2], MD_WULONG_RIGHT_COUNT[3] )
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_RIGHT_COUNT[1], MD_WULONG_RIGHT_COUNT[2], MD_WULONG_RIGHT_COUNT[3], curRightCount+1 )

			StartTalkTask(varMap);
			TalkAppendString(varMap, "回答正确，进入下一题！");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"回答正确！",8,2)

			
			x310182_AddAward(varMap ,varPlayer)

			
				GamePlayScriptLog( varMap, varPlayer, x310182_var_GameID_Right)
		else
			StartTalkTask(varMap);
			TalkAppendString(varMap, "很遗憾，你答错了");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"很遗憾，你答错了",8,2)
			
				GamePlayScriptLog( varMap, varPlayer, x310182_var_GameID_Error)
		end

		local curDay = GetDayOfYear() 
		local nDate   = GetPlayerGameData(varMap,varPlayer,MD_WULONG_DATE[1], MD_WULONG_DATE[2], MD_WULONG_DATE[3] )

		if curDay ~= nDate then
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_DATE[1], MD_WULONG_DATE[2], MD_WULONG_DATE[3],curDay )
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_STEP[1], MD_WULONG_STEP[2], MD_WULONG_STEP[3],1 )
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3],1 )
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_RIGHT_COUNT[1], MD_WULONG_RIGHT_COUNT[2], MD_WULONG_RIGHT_COUNT[3],0 )
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_TIME_BEGIN[1], MD_WULONG_TIME_BEGIN[2], MD_WULONG_TIME_BEGIN[3],0 )
			return 
		else	
			if curCount >= x310182_var_MaxCount then  
				local resultStr ="\t恭喜你顺利通过乌龙辞典海选赛！\n\t请在下午#G2点#W准时前往#G大都#W参加扣人心弦的#G乌龙辞典淘汰赛！"
				if GetLevel(varMap,varPlayer) < x310182_var_NextLimitLevel then
					resultStr = format("\t表现的不错,不过，可惜你的等级不足%d级,无法参加乌龙辞典第二轮淘汰赛。", x310182_var_NextLimitLevel)
				elseif GetPlayerGameData(varMap,varPlayer,MD_WULONG_RIGHT_COUNT[1], MD_WULONG_RIGHT_COUNT[2], MD_WULONG_RIGHT_COUNT[3]) < 10 then
					resultStr = format("\t很遗憾,你没能通过乌龙辞典首轮海选，至少需要答对%d题才能参加乌龙辞典第二轮淘汰赛。", 10)
				end

				StartTalkTask(varMap)	
				TalkAppendString(varMap, resultStr)						
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				if AddQuestNM( varMap, varPlayer, 9335 ) <= 0 then
					
					
					
					
					
				else
					SetQuestParam(varMap, varPlayer, 9335, 7, 1)
				end
				SetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3],curCount+1 )   
				return 
			end
			 SetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3],curCount+1 )
		end

		local varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer,lastIndex = QuestWulong_GetQuestionInfo(0)
		SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3],lastIndex )
		SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_WULONG_CUR_ANSWER,varAnswer+12000)
		local lastCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )
		local rightCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_RIGHT_COUNT[1], MD_WULONG_RIGHT_COUNT[2], MD_WULONG_RIGHT_COUNT[3] )
		StartTalkTask(varMap)	
				TalkAppendString(varMap,varDesc)
				x310182_AddAnswerOption( varMap,varAnswer1,varAnswer2,varAnswer3,varAnswer4)							
				
				
				
					TalkAppendString(varMap,format("\t（当前第#G%d#W题，已答对#G%d#W题）",lastCount, rightCount) )		
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

		return
	end

end
