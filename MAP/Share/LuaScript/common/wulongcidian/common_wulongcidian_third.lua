
x310184_var_FileId = 310184
x310184_var_GameId = 1019
x310184_var_LimitLevel = 40
x310184_var_MaxCount = 20

x310184_var_GameID_Right	= 971
x310184_var_GameID_Error	= 972

function x310184_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	if GetGameOpenById(x310184_var_GameId) ~= 1 then
		return
	end
	
    TalkAppendButton(varMap,x310184_var_FileId,"我要参加乌龙词典终极挑战！",3,x310184_var_FileId);
        
end

function x310184_IsInPool(varMap,varPlayer)
	local varName = GetName(varMap,varPlayer)

	for varI=1, WULONGCIDIAN_STEPIN_COUNT do
		if WULONGCIDIAN_STEPIN_NAME[varI] == varName then
			return 1
		end
	end
	return -1
end

function x310184_CheckValid( varMap,varPlayer,varTalknpc)
	if GetGameOpenById(x310184_var_GameId) ~= 1 then
		
		StartTalkTask(varMap)
			TalkAppendString(varMap,"\t乌龙词典活动已经关闭！")				
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return -1
	end

	local varLevel = GetLevel(varMap,varPlayer)
	if varLevel<x310184_var_LimitLevel then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"\t你似乎没有取得参加乌龙辞典终极挑战的资格。")				
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return -2
	end
	local minute =  GetMinOfDay()
		if GetWeek() ~= 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"\t乌龙辞典终极挑战赛在周日下午16：30才正式开始，别心急。")				
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return -3
		elseif 	minute>17*60 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"\t很遗憾，乌龙辞典终极挑战赛在下午17：00已经结束了。")				
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return -3
		elseif 	minute <16*60+30 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"\t乌龙辞典终极挑战赛在下午16：30才正式开始，别心急。")				
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return -3
		end

	local curDay = GetDayOfYear() 
	local nDate   = GetPlayerGameData(varMap,varPlayer,MD_WULONG_DATE[1], MD_WULONG_DATE[2], MD_WULONG_DATE[3] )
	if curDay ~= nDate then
		StartTalkTask(varMap)
				TalkAppendString(varMap,"\t你似乎没有取得参加乌龙辞典终极挑战的资格。")				
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return -5
	end

	if x310184_IsInPool(varMap,varPlayer) < 0 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"\t你似乎没有取得参加乌龙辞典终极挑战的资格。")				
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return -4
	end

	return 1

end

function x310184_AddAnswerOption( varMap,varPlayer,varAnswer1,varAnswer2,varAnswer3,varAnswer4)
	
	local answer = { {varAnswer1,12001},{varAnswer2,12002},{varAnswer3,12003},{varAnswer4,12004} }
	local varIndex = {1,2,3,4}
	for varI=1, 4 do
		local r = random(1, getn(varIndex))
		TalkAppendButton(varMap,x310184_var_FileId,answer[varIndex[r]][1],3,answer[varIndex[r]][2] )

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
	local guoguan = 1 - GetPlayerGameData(varMap,varPlayer,MD_WULONG_GUOGUANLING[1], MD_WULONG_GUOGUANLING[2], MD_WULONG_GUOGUANLING[3])
	local heibai = 3 - GetPlayerGameData(varMap,varPlayer,MD_WULONG_HEIBAILING[1], MD_WULONG_HEIBAILING[2], MD_WULONG_HEIBAILING[3])
	if guoguan < 0 then
		guoguan = 0
	end
	if heibai < 0 then
		heibai = 0
	end
	TalkAppendButton(varMap,x310184_var_FileId, format("过关令（一定正确，剩余%d次）",guoguan),13,12005 )
	TalkAppendButton(varMap,x310184_var_FileId, format("黑白令（可能正确，剩余%d次）",heibai),13,12006 )
end

function x310184_AddAward(varMap ,varPlayer)
	local varExpBonus = GetLevel(varMap ,varPlayer)*2400
	AddExp(varMap, varPlayer, varExpBonus);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o获得#R经验"..varExpBonus.."点#o的奖励");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
  		Msg2Player(varMap,varPlayer,"#o获得#R经验"..varExpBonus.."点#o的奖励",4,2)
end

function x310184_PushToPool(varMap ,varPlayer, costTime)
	
	local varName = GetName(varMap ,varPlayer)
	if WULONGCIDIAN_AWARD_COUNT == 0 then
		WULONGCIDIAN_AWARD_COUNT = 1
		WULONGCIDIAN_AWARD_NAME[WULONGCIDIAN_AWARD_COUNT] = varName
		WULONGCIDIAN_AWARD_TIME[WULONGCIDIAN_AWARD_COUNT] = costTime
		return
	end

	for varI=1, WULONGCIDIAN_AWARD_COUNT do
		if WULONGCIDIAN_AWARD_NAME[varI] == varName then
			if WULONGCIDIAN_AWARD_TIME[varI] > costTime then
				WULONGCIDIAN_AWARD_TIME[varI] = costTime	
			end
			return
		end
	end
	
	if WULONGCIDIAN_AWARD_COUNT == 30 then
		for varI=1, WULONGCIDIAN_AWARD_COUNT do
			if WULONGCIDIAN_AWARD_TIME[varI] > costTime then
				
				for j=WULONGCIDIAN_AWARD_COUNT, varI, -1 do
					if (j-1>0) then
						WULONGCIDIAN_AWARD_NAME[j] = WULONGCIDIAN_AWARD_NAME[j-1]
						WULONGCIDIAN_AWARD_TIME[j] = WULONGCIDIAN_AWARD_TIME[j-1]
					end
				end

				WULONGCIDIAN_AWARD_NAME[varI] = varName
				WULONGCIDIAN_AWARD_TIME[varI] = costTime
				return
			end
		end
	elseif WULONGCIDIAN_AWARD_COUNT < 30 then
		for varI=1, WULONGCIDIAN_AWARD_COUNT do
			if WULONGCIDIAN_AWARD_TIME[varI] > costTime then
				
				for j=(WULONGCIDIAN_AWARD_COUNT+1), varI, -1 do
					if (j-1>0) then
						WULONGCIDIAN_AWARD_NAME[j] = WULONGCIDIAN_AWARD_NAME[j-1]
						WULONGCIDIAN_AWARD_TIME[j] = WULONGCIDIAN_AWARD_TIME[j-1]
					end
				end

				WULONGCIDIAN_AWARD_NAME[varI] = varName
				WULONGCIDIAN_AWARD_TIME[varI] = costTime
				WULONGCIDIAN_AWARD_COUNT = WULONGCIDIAN_AWARD_COUNT + 1
				return
			end
		end
	end
	
	if WULONGCIDIAN_AWARD_COUNT < 30 then
		WULONGCIDIAN_AWARD_COUNT = WULONGCIDIAN_AWARD_COUNT + 1
		WULONGCIDIAN_AWARD_NAME[WULONGCIDIAN_AWARD_COUNT] = varName
		WULONGCIDIAN_AWARD_TIME[WULONGCIDIAN_AWARD_COUNT] = costTime
		return
	end

end

function x310184_GetValidTime()

	local n1 = GetCurrentTime()
	local n2 = GetCurrentTime()
	
	local nResult = n2 - n1 
	while nResult > 5 or nResult < 0 do
		n1 = GetCurrentTime()
		n2 = GetCurrentTime()
		nResult = n2 - n1 
	end
	
	return n2
end

function x310184_AfterAnswer(varMap ,varPlayer)
	
	if GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )> x310184_var_MaxCount then
		local costTime = x310184_GetValidTime() - GetPlayerGameData(varMap,varPlayer,MD_WULONG_TIME_BEGIN[1], MD_WULONG_TIME_BEGIN[2], MD_WULONG_TIME_BEGIN[3])
		x310184_PushToPool(varMap ,varPlayer, costTime)
		return 1
	end
	return -1
end


function x310184_ProcEventEntry( varMap ,varPlayer, varTalknpc,idScript,idExt )
	if x310184_CheckValid( varMap,varPlayer,varTalknpc) < 0 then
		return
	end

	local step = GetPlayerGameData(varMap,varPlayer,MD_WULONG_STEP[1], MD_WULONG_STEP[2], MD_WULONG_STEP[3])
	
	if idExt ==  12005 then
		if step ~= 4 then
				return 
		end

		if GetPlayerGameData(varMap,varPlayer,MD_WULONG_GUOGUANLING[1], MD_WULONG_GUOGUANLING[2], MD_WULONG_GUOGUANLING[3]) == 1 then
			StartTalkTask(varMap);
			TalkAppendString(varMap, "\t已经用过过关令！");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"已经用过过关令！",8,2)
			return 
		end

		SetPlayerGameData(varMap,varPlayer,MD_WULONG_GUOGUANLING[1], MD_WULONG_GUOGUANLING[2], MD_WULONG_GUOGUANLING[3], 1)
		
		 local lastAnswer = GetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_WULONG_CUR_ANSWER)
		 local curCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )

		if x310184_IsCompleteQuestion(varMap,varPlayer,varTalknpc, step, curCount) > 0 then
			return
		end
			
		SetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3],curCount+1 )
			
		local curRightCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_RIGHT_COUNT[1], MD_WULONG_RIGHT_COUNT[2], MD_WULONG_RIGHT_COUNT[3] )
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_RIGHT_COUNT[1], MD_WULONG_RIGHT_COUNT[2], MD_WULONG_RIGHT_COUNT[3], curRightCount+1 )
			
			StartTalkTask(varMap);
			TalkAppendString(varMap, "恭喜你,回答正确！");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"恭喜你,回答正确！",8,2)

			
			x310184_AddAward(varMap ,varPlayer)

			
				GamePlayScriptLog( varMap, varPlayer, x310184_var_GameID_Right)
			if x310184_AfterAnswer(varMap ,varPlayer) > 0 then
				Msg2Player(varMap,varPlayer,"你顺利闯过了乌龙辞典终极挑战。",8,2)
				StartTalkTask(varMap)	
				TalkAppendString(varMap,"\t你顺利闯过了乌龙辞典终极挑战。")						
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				return
			end



			local varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer, nQuest = QuestWulong_GetQuestionInfo(1)
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3], nQuest)
			SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_WULONG_CUR_ANSWER,varAnswer+12000)

			StartTalkTask(varMap)	
					TalkAppendString(varMap,varDesc)
					x310184_AddAnswerOption( varMap,varPlayer,varAnswer1,varAnswer2,varAnswer3,varAnswer4)							
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)

		return
	end

	if idExt == 12006 then
		if step ~= 4 then
				return 
		end

		local useHeiBai = GetPlayerGameData(varMap,varPlayer,MD_WULONG_HEIBAILING[1], MD_WULONG_HEIBAILING[2], MD_WULONG_HEIBAILING[3]) 
		if useHeiBai>= 3 then
			StartTalkTask(varMap);
			TalkAppendString(varMap, "\t已经用过3次黑白令！");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"已经用过3次黑白令！",8,2)
			return 
		end

		SetPlayerGameData(varMap,varPlayer,MD_WULONG_HEIBAILING[1], MD_WULONG_HEIBAILING[2], MD_WULONG_HEIBAILING[3], useHeiBai+1)
		local bRight;
		local r = random(1, 100)
		if r>=1 and r<=50 then
			bRight = 1
		else
			bRight = 0
		end

		local lastAnswer = GetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_WULONG_CUR_ANSWER)
		 local curCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )

		if x310184_IsCompleteQuestion(varMap,varPlayer,varTalknpc, step, curCount) > 0 then
			return
		end
				
		SetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3],curCount+1 )
		
		if bRight == 1 then

			local curRightCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_RIGHT_COUNT[1], MD_WULONG_RIGHT_COUNT[2], MD_WULONG_RIGHT_COUNT[3] )
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_RIGHT_COUNT[1], MD_WULONG_RIGHT_COUNT[2], MD_WULONG_RIGHT_COUNT[3], curRightCount+1 )
			
			StartTalkTask(varMap);
			TalkAppendString(varMap, "恭喜你,回答正确！");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"恭喜你,回答正确！",8,2)

			
			x310184_AddAward(varMap ,varPlayer)

			
				GamePlayScriptLog( varMap, varPlayer, x310184_var_GameID_Right)
			if x310184_AfterAnswer(varMap ,varPlayer) > 0 then
				Msg2Player(varMap,varPlayer,"你顺利闯过了乌龙辞典终极挑战。",8,2)
				StartTalkTask(varMap)	
				TalkAppendString(varMap,"\t你顺利闯过了乌龙辞典终极挑战。")						
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				return
			end



			local varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer, nQuest = QuestWulong_GetQuestionInfo(1)
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3], nQuest)
			SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_WULONG_CUR_ANSWER,varAnswer+12000)

			StartTalkTask(varMap)	
					TalkAppendString(varMap,varDesc)
					x310184_AddAnswerOption( varMap,varPlayer,varAnswer1,varAnswer2,varAnswer3,varAnswer4)							
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return 
		else
			StartTalkTask(varMap);
			TalkAppendString(varMap, "\t回答错误！你的答题总时间增加了15秒。");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"回答错误！你的答题总时间增加了15秒。",8,2)
			
			GamePlayScriptLog( varMap, varPlayer, x310184_var_GameID_Error)
			local curTime = GetPlayerGameData(varMap,varPlayer,MD_WULONG_TIME_BEGIN[1], MD_WULONG_TIME_BEGIN[2], MD_WULONG_TIME_BEGIN[3])
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_TIME_BEGIN[1], MD_WULONG_TIME_BEGIN[2], MD_WULONG_TIME_BEGIN[3], curTime-15 )
			
			if x310184_AfterAnswer(varMap ,varPlayer) > 0 then
				Msg2Player(varMap,varPlayer,"你顺利闯过了乌龙辞典终极挑战。",8,2)
				StartTalkTask(varMap)	
				TalkAppendString(varMap,"\t你顺利闯过了乌龙辞典终极挑战。")						
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				return
			end


			local varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer, nQuest = QuestWulong_GetQuestionInfo(1)
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3], nQuest)
			SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_WULONG_CUR_ANSWER,varAnswer+12000)

			StartTalkTask(varMap)	
					TalkAppendString(varMap,varDesc)
					x310184_AddAnswerOption( varMap,varPlayer,varAnswer1,varAnswer2,varAnswer3,varAnswer4)							
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return
		end

		return
	end

	if idExt == x310184_var_FileId then 

		if step ~= 4 then
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_STEP[1], MD_WULONG_STEP[2], MD_WULONG_STEP[3], 4)
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3], 60000 )
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3], 1 )
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_RIGHT_COUNT[1], MD_WULONG_RIGHT_COUNT[2], MD_WULONG_RIGHT_COUNT[3],0 )
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_TIME_BEGIN[1], MD_WULONG_TIME_BEGIN[2], MD_WULONG_TIME_BEGIN[3], x310184_GetValidTime())
		else
			local curCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )
			 if curCount > x310184_var_MaxCount then 
				x310184_AfterAnswer(varMap ,varPlayer)
				StartTalkTask(varMap)	
				TalkAppendString(varMap,"\t你顺利的闯过了终极挑战！请等待名次的公布。")						
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				return 
			 end
		end

		local curCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )
		
		local lastquest = GetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3])
		if lastquest ~= 60000 then
			local varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer = QuestWulong_GetQuestionInfo(1, 1, lastquest)
			SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_WULONG_CUR_ANSWER,varAnswer+12000)
			StartTalkTask(varMap)
				TalkAppendString(varMap,varDesc)
				x310184_AddAnswerOption( varMap,varPlayer,varAnswer1,varAnswer2,varAnswer3,varAnswer4)							
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		else
			local varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer, nQuest = QuestWulong_GetQuestionInfo(1)
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3], nQuest)
			SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_WULONG_CUR_ANSWER,varAnswer+12000)

			StartTalkTask(varMap)	
					TalkAppendString(varMap,varDesc)
					x310184_AddAnswerOption( varMap,varPlayer,varAnswer1,varAnswer2,varAnswer3,varAnswer4)							
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		end

		return
	elseif idExt >= 12001 and idExt <= 12004 then
		if step ~= 4 then
				return 
		end

		 local lastAnswer = GetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_WULONG_CUR_ANSWER)
		 local curCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )
		 SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3], 60000)
		
		if x310184_IsCompleteQuestion(varMap,varPlayer,varTalknpc, step, curCount) > 0 then
			return
		end

		SetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3],curCount+1 )

		if lastAnswer == idExt then 
			local curRightCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_RIGHT_COUNT[1], MD_WULONG_RIGHT_COUNT[2], MD_WULONG_RIGHT_COUNT[3] )
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_RIGHT_COUNT[1], MD_WULONG_RIGHT_COUNT[2], MD_WULONG_RIGHT_COUNT[3], curRightCount+1 )
			
			StartTalkTask(varMap);
			TalkAppendString(varMap, "\t恭喜你,回答正确！");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"恭喜你,回答正确！",8,2)

			
			x310184_AddAward(varMap ,varPlayer)

			
				GamePlayScriptLog( varMap, varPlayer, x310184_var_GameID_Right)
			if x310184_AfterAnswer(varMap ,varPlayer) > 0 then
				Msg2Player(varMap,varPlayer,"你顺利闯过了乌龙辞典终极挑战。",8,2)
				StartTalkTask(varMap)	
				TalkAppendString(varMap,"\t你顺利闯过了乌龙辞典终极挑战。")						
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				return
			end
		else
			StartTalkTask(varMap);
			TalkAppendString(varMap, "\t回答错误！你的答题总时间增加了15秒。");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"回答错误！你的答题总时间增加了15秒。",8,2)
			
			GamePlayScriptLog( varMap, varPlayer, x310184_var_GameID_Error)
			local curTime = GetPlayerGameData(varMap,varPlayer,MD_WULONG_TIME_BEGIN[1], MD_WULONG_TIME_BEGIN[2], MD_WULONG_TIME_BEGIN[3])
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_TIME_BEGIN[1], MD_WULONG_TIME_BEGIN[2], MD_WULONG_TIME_BEGIN[3], curTime-15 )

			if x310184_AfterAnswer(varMap ,varPlayer) > 0 then
				Msg2Player(varMap,varPlayer,"你顺利闯过了乌龙辞典终极挑战。",8,2)
				StartTalkTask(varMap)	
				TalkAppendString(varMap,"\t你顺利闯过了乌龙辞典终极挑战。")						
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				return
			end
		end

		local varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer, nQuest = QuestWulong_GetQuestionInfo(1)
		SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3], nQuest)
		SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_WULONG_CUR_ANSWER,varAnswer+12000)

		StartTalkTask(varMap)	
				TalkAppendString(varMap,varDesc)
				x310184_AddAnswerOption( varMap,varPlayer,varAnswer1,varAnswer2,varAnswer3,varAnswer4)							
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

		return
	end

end

function x310184_IsCompleteQuestion(varMap,varPlayer,varTalknpc, varStep, varCurCount)
	if 4 ~= varStep then
		local longGuid = GetPlayerGUID(varMap, varPlayer)
		local msgTip = "x310184_IsCompleteQuestion:".."varStep"..varStep.."varCurCount="..varCurCount.."map ="..varMap.."PlayerGuid ="..longGuid.."可能使用了外挂"
		WriteLog(1, msgTip)
		return 1
	end

	if tonumber(4) == tonumber(varStep) and tonumber(varCurCount) > tonumber(x310184_var_MaxCount) then
		resultStr = "\t你顺利的闯过了终极挑战！请等待名次的公布。"
		StartTalkTask(varMap)
		TalkAppendString(varMap, resultStr)
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

		local longGuid = GetPlayerGUID(varMap, varPlayer)
		local msgTip = "x310184_IsCompleteQuestion:".."varStep"..varStep.."varCurCount="..varCurCount.."map ="..varMap.."PlayerGuid ="..longGuid.."可能使用了外挂"
		WriteLog(1, msgTip)
		return 1
	elseif tonumber(varCurCount) > tonumber(x310184_var_MaxCount) then
		resultStr = "\t你顺利的闯过了终极挑战！请等待名次的公布。"
		StartTalkTask(varMap)
		TalkAppendString(varMap, resultStr)
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)

		local longGuid = GetPlayerGUID(varMap, varPlayer)
		local msgTip = "x310184_IsCompleteQuestion:".."varStep"..varStep.."varCurCount="..varCurCount.."map ="..varMap.."PlayerGuid ="..longGuid.."可能使用了外挂"
		WriteLog(1, msgTip)
		return 1
	else
		return 0
	end
end
