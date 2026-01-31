
x310183_var_FileId = 310183
x310183_var_GameId = 1019
x310183_var_LimitLevel = 40
x310183_var_MaxCount = 20

x310183_var_GameID_Right	= 971
x310183_var_GameID_Error	= 972

x310183_var_NpcList = {141512, 141513, 141514,141515,141516,
						141517,141518,141519,141520,141521,
						141522,141523,141524,141525,141526,
						141527,141528,141529,141530,141531}

function x310183_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	

	if GetGameOpenById(x310183_var_GameId) ~= 1 then
		return
	end
	
    TalkAppendButton(varMap,x310183_var_FileId,"我要参加乌龙词典淘汰赛！",3,x310183_var_FileId);
        
end

function x310183_CheckValid( varMap,varPlayer,varTalknpc)


	if GetGameOpenById(x310183_var_GameId) ~= 1 then
		
		StartTalkTask(varMap)
			TalkAppendString(varMap,"\t乌龙词典活动已经关闭！")				
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return -1
	end

	local varLevel = GetLevel(varMap,varPlayer)
	if varLevel<x310183_var_LimitLevel then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"\t你的等级不足，请40级之后再来。")				
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return -2
	end
	local minute =  GetMinOfDay()

	
	
	
	
	
	
	
	
	
	
	
	
	
	

		if GetWeek() ~= 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"\t乌龙辞典大都淘汰赛在周日下午2：00才正式开始，别心急。")				
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return -3
		elseif 	minute>16*60 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"\t很遗憾，乌龙辞典大都淘汰赛在下午16：00已经结束了。")				
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return -3
		elseif 	minute <14*60 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"\t乌龙辞典大都淘汰赛在下午2：00才正式开始，别心急。")				
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return -3
		end
		
	local curDay = GetDayOfYear() 
	local nDate   = GetPlayerGameData(varMap,varPlayer,MD_WULONG_DATE[1], MD_WULONG_DATE[2], MD_WULONG_DATE[3] )
	if curDay ~= nDate then
		StartTalkTask(varMap)
				TalkAppendString(varMap,"\t很遗憾，您没有通过乌龙辞典王国海选。")		
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return -6
	end
	
	local step = GetPlayerGameData(varMap,varPlayer,MD_WULONG_STEP[1], MD_WULONG_STEP[2], MD_WULONG_STEP[3])
	local curCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )
	
	--如果已经答完两轮则不再给任务
	if step == 3 and curCount > x310183_var_MaxCount then
		Msg2Player(varMap, varPlayer, "\t你顺利的完成了乌龙辞典淘汰赛的全部比赛。", 0, 3)
		return -99
	end

	if IsHaveQuest(varMap,varPlayer, 9335) <= 0 then
  	if AddQuestNM( varMap, varPlayer, 9335 ) <= 0 then
  			
				Msg2Player(varMap, varPlayer, "您的任务已满，请清理后继续参加乌龙词典淘汰赛", 0, 3)
  	end
  end  
	
	if step == 1 or step == 0 then
		 if curCount < 20 then
			StartTalkTask(varMap)
				TalkAppendString(varMap,"\t很遗憾，您没有通过乌龙辞典王国海选。")				
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return -4
		elseif curCount > 20 then
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3], 20 )
		 end
		 local curRightCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_RIGHT_COUNT[1], MD_WULONG_RIGHT_COUNT[2], MD_WULONG_RIGHT_COUNT[3] )
		 if curRightCount <10 then
			StartTalkTask(varMap)
				TalkAppendString(varMap,"\t很遗憾，您没有通过乌龙辞典王国海选。")				
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return -5
		 end
	end
	
	local curCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )
	if step == 1 and curCount == 20 then
		if GetMonsterGUID(varMap, varTalknpc) ~= x310183_var_NpcList[1] then
			StartTalkTask(varMap)
				TalkAppendString(varMap,"\t你应该去找@npc_"..x310183_var_NpcList[1].."接受考验。")				
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return -7
		end
	end

	if step == 2 or step == 3 then
		if curCount>=1 and curCount<=20 then
			if GetMonsterGUID(varMap, varTalknpc) ~= x310183_var_NpcList[curCount] then

				StartTalkTask(varMap)
					TalkAppendString(varMap,"\t你应该去找@npc_"..x310183_var_NpcList[curCount].."接受考验。")				
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				return -7
			end
		end
	end

	return 1

end

function x310183_AddAnswerOption( varMap,varPlayer,varAnswer1,varAnswer2,varAnswer3,varAnswer4)
	
	local answer = { {varAnswer1,12001},{varAnswer2,12002},{varAnswer3,12003},{varAnswer4,12004} }
	local varIndex = {1,2,3,4}
	for varI=1, 4 do
		local r = random(1, getn(varIndex))
		TalkAppendButton(varMap,x310183_var_FileId,answer[varIndex[r]][1],3,answer[varIndex[r]][2] )

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
	TalkAppendButton(varMap,x310183_var_FileId, format("过关令（一定正确，剩余%d次）",guoguan),13,12005 )
	TalkAppendButton(varMap,x310183_var_FileId, format("黑白令（可能正确，剩余%d次）",heibai),13,12006 )

end

function x310183_AddAward(varMap ,varPlayer)
	local varExpBonus = GetLevel(varMap ,varPlayer)*2400
	AddExp(varMap, varPlayer, varExpBonus);
		StartTalkTask(varMap);
		TalkAppendString(varMap, "#o获得#R经验"..varExpBonus.."点#o的奖励");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
  		Msg2Player(varMap,varPlayer,"#o获得#R经验"..varExpBonus.."点#o的奖励",4,2)
	
end

function x310183_GetValidTime()

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

function x310183_ModifyCount(varMap ,varPlayer, value)
	
	
		
	
	SetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3], value )
	SetPlayerGameData(varMap,varPlayer,MD_WULONG_ERROR_COUNT[1], MD_WULONG_ERROR_COUNT[2], MD_WULONG_ERROR_COUNT[3], 0)
	x310183_ProcQuestLogRefresh( varMap, varPlayer, 9335)

end




function x310183_PushToPool(varMap ,varPlayer, costTime)

	local varName = GetName(varMap ,varPlayer)
	local tblSort = function(a,b) return a[2] < b[2] end
	
	SendToplistKeyValue2GL(varMap,varPlayer,WULONG_TOPLIST,costTime)

	
	
	
	if WULONGCIDIAN_STEPIN_COUNT == 0 then
		WULONGCIDIAN_STEPIN_COUNT = 1
		
		
		WULONGCIDIAN_STEPIN_NAME[WULONGCIDIAN_STEPIN_COUNT] = varName
		WULONGCIDIAN_STEPIN_TIME[WULONGCIDIAN_STEPIN_COUNT] = costTime
		
		
		return
	end
	
	
	
	
	local tblTmp = {}
	local bFind = 0
	for varI=1, WULONGCIDIAN_STEPIN_COUNT do
		
		tblTmp[varI] = { WULONGCIDIAN_STEPIN_NAME[varI], WULONGCIDIAN_STEPIN_TIME[varI] }
		
		if WULONGCIDIAN_STEPIN_NAME[varI] == varName then
			if WULONGCIDIAN_STEPIN_TIME[varI] > costTime then
				tblTmp[varI][2] = costTime
			end

			bFind = 1
		end
	end
	
	
	
	
	if bFind == 1 then
	
		
		sort(tblTmp,tblSort)
		
		WULONGCIDIAN_STEPIN_NAME = {}
		WULONGCIDIAN_STEPIN_TIME = {}

		for varI=1, WULONGCIDIAN_STEPIN_COUNT do
			WULONGCIDIAN_STEPIN_NAME[varI] = tblTmp[varI][1]
			WULONGCIDIAN_STEPIN_TIME[varI] = tblTmp[varI][2]
		end

		
		return
	end
	
	
	
	
	if WULONGCIDIAN_STEPIN_COUNT < 30 then
		
		WULONGCIDIAN_STEPIN_COUNT = WULONGCIDIAN_STEPIN_COUNT + 1
		
		WULONGCIDIAN_STEPIN_NAME[WULONGCIDIAN_STEPIN_COUNT] = varName
		WULONGCIDIAN_STEPIN_TIME[WULONGCIDIAN_STEPIN_COUNT] = costTime
		
	else
		
		WULONGCIDIAN_STEPIN_NAME[WULONGCIDIAN_STEPIN_COUNT] = varName
		WULONGCIDIAN_STEPIN_TIME[WULONGCIDIAN_STEPIN_COUNT] = costTime
	end
	
	
	
	
	tblTmp = {}
	for varI=1, WULONGCIDIAN_STEPIN_COUNT do
		tblTmp[varI] = {WULONGCIDIAN_STEPIN_NAME[varI],WULONGCIDIAN_STEPIN_TIME[varI]}
	end
	
	sort(tblTmp,tblSort)
	
	WULONGCIDIAN_STEPIN_NAME = {}
	WULONGCIDIAN_STEPIN_TIME = {}
		
	for varI=1, WULONGCIDIAN_STEPIN_COUNT do
		WULONGCIDIAN_STEPIN_NAME[varI] = tblTmp[varI][1]
		WULONGCIDIAN_STEPIN_TIME[varI] = tblTmp[varI][2]
	end
	
	
	return
end


function x310183_AfterAnswer(varMap ,varPlayer)
	local step = GetPlayerGameData(varMap,varPlayer,MD_WULONG_STEP[1], MD_WULONG_STEP[2], MD_WULONG_STEP[3])
	if step == 2 then
		if GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )> x310183_var_MaxCount then
			local costTime = x310183_GetValidTime() - GetPlayerGameData(varMap,varPlayer,MD_WULONG_TIME_BEGIN[1], MD_WULONG_TIME_BEGIN[2], MD_WULONG_TIME_BEGIN[3])
			x310183_PushToPool(varMap ,varPlayer, costTime)
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_STEP[1], MD_WULONG_STEP[2], MD_WULONG_STEP[3], 3)
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3], 60000 )
			x310183_ModifyCount(varMap ,varPlayer, 1)
			SetPlayerGameData( varMap, varPlayer, MD_WULONG_LAST_ANSWER[1], MD_WULONG_LAST_ANSWER[2], MD_WULONG_LAST_ANSWER[3], 0 )
			return 1
		end
	elseif step == 3 then
		if GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )> x310183_var_MaxCount then
			local costTime = x310183_GetValidTime() - GetPlayerGameData(varMap,varPlayer,MD_WULONG_TIME_BEGIN[1], MD_WULONG_TIME_BEGIN[2], MD_WULONG_TIME_BEGIN[3])
			x310183_PushToPool(varMap ,varPlayer, costTime)
			return 2
		end
	end
	return 0
end

function x310183_NextNpcName(varMap ,varPlayer)
	local curCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )
	local varName = ""
	if curCount > 20 then
		curCount = 1
	end

	if curCount>=1 and curCount<=20 then
			
			
			varName = "@npc_"..x310183_var_NpcList[curCount]	
	end
	return varName
end

function x310183_DisplayTimeCost(varMap ,varPlayer)
local costTime = x310183_GetValidTime() - GetPlayerGameData(varMap,varPlayer,MD_WULONG_TIME_BEGIN[1], MD_WULONG_TIME_BEGIN[2], MD_WULONG_TIME_BEGIN[3])

TalkAppendString(varMap,format("\t此轮比赛你已经用时#G%d#W秒", costTime)	)
end

function x310183_ProcEventEntry( varMap ,varPlayer, varTalknpc,idScript,idExt )
	if x310183_CheckValid( varMap,varPlayer,varTalknpc) < 0 then
		return
	end
	local step = GetPlayerGameData(varMap,varPlayer,MD_WULONG_STEP[1], MD_WULONG_STEP[2], MD_WULONG_STEP[3])

	if idExt == 12005 then
		if step ~= 2 and step ~= 3 then
				return 
		end			
		if GetPlayerGameData(varMap,varPlayer,MD_WULONG_GUOGUANLING[1], MD_WULONG_GUOGUANLING[2], MD_WULONG_GUOGUANLING[3]) == 1 then
			StartTalkTask(varMap);
			TalkAppendString(varMap, "你已经用过过关令了！");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"你已经用过过关令了！",8,2)
			return 
		end

		SetPlayerGameData(varMap,varPlayer,MD_WULONG_GUOGUANLING[1], MD_WULONG_GUOGUANLING[2], MD_WULONG_GUOGUANLING[3], 1)

		local curCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )

		if x310183_IsCompleteQuestion(varMap,varPlayer,varTalknpc, step, curCount) > 0 then
			return
		end

		SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3], 60000)
		StartTalkTask(varMap);
		TalkAppendString(varMap, "恭喜你,回答正确！");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"恭喜你,回答正确！",8,2)

		
		x310183_AddAward(varMap ,varPlayer)
		local resultStr ="";
		local toggle = 0
		
			GamePlayScriptLog( varMap, varPlayer, x310183_var_GameID_Right)
			x310183_ModifyCount(varMap ,varPlayer, curCount+1)
			SetPlayerGameData( varMap, varPlayer, MD_WULONG_LAST_ANSWER[1], MD_WULONG_LAST_ANSWER[2], MD_WULONG_LAST_ANSWER[3], curCount )
			if x310183_AfterAnswer(varMap ,varPlayer) ==1 then
				resultStr = format( "\t你顺利的完成了一轮乌龙辞典淘汰赛，你可以再参加一次淘汰赛,去找%s开始新一轮吧。", x310183_NextNpcName(varMap ,varPlayer) )
				toggle = 1
			elseif x310183_AfterAnswer(varMap ,varPlayer) == 2 then
				resultStr = "\t你顺利的完成了乌龙辞典淘汰赛的全部比赛。请耐心等待，进入下一轮决赛的优胜者名单将会在16:00公布！"
				toggle = 1
				DelQuestNM( varMap, varPlayer, 9335 )
			end
			
			if toggle == 0 then
				resultStr = format( "\t恭喜你通过了我这里的考验,你可以去找%s了。", x310183_NextNpcName(varMap ,varPlayer) )
			end

			StartTalkTask(varMap);
			TalkAppendString(varMap,resultStr)							
			
				x310183_DisplayTimeCost(varMap ,varPlayer)
			
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)

		return
	end

	if idExt == 12006 then
		if step ~= 2 and step ~= 3 then
				return 
		end

		local useHeiBai = GetPlayerGameData(varMap,varPlayer,MD_WULONG_HEIBAILING[1], MD_WULONG_HEIBAILING[2], MD_WULONG_HEIBAILING[3]) 
		if useHeiBai>= 3 then
			StartTalkTask(varMap);
			TalkAppendString(varMap, "你已经用过3次黑白令了！");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"你已经用过3次黑白令了！",8,2)
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
		
		local curCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )

		if x310183_IsCompleteQuestion(varMap,varPlayer,varTalknpc, step, curCount) > 0 then
			return
		end

		if bRight == 1 then
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3], 60000)
			StartTalkTask(varMap);
			TalkAppendString(varMap, "恭喜你,回答正确！");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"恭喜你,回答正确！",8,2)

			
			x310183_AddAward(varMap ,varPlayer)
			local resultStr ="";
			local toggle = 0
			
				GamePlayScriptLog( varMap, varPlayer, x310183_var_GameID_Right)
				x310183_ModifyCount(varMap ,varPlayer, curCount+1)
				SetPlayerGameData( varMap, varPlayer, MD_WULONG_LAST_ANSWER[1], MD_WULONG_LAST_ANSWER[2], MD_WULONG_LAST_ANSWER[3], curCount )
				if x310183_AfterAnswer(varMap ,varPlayer) ==1 then
					resultStr = format( "\t你顺利的完成了一轮乌龙辞典淘汰赛，你可以再参加一次淘汰赛,去找%s开始新一轮吧。", x310183_NextNpcName(varMap ,varPlayer) )
					toggle = 1
				elseif x310183_AfterAnswer(varMap ,varPlayer) == 2 then
					resultStr = "\t你顺利的完成了乌龙辞典淘汰赛的全部比赛。"
					toggle = 1
					DelQuestNM( varMap, varPlayer, 9335 )
				end
				
				if toggle == 0 then
					resultStr = format( "\t恭喜你通过了我这里的考验,你可以去找%s了。", x310183_NextNpcName(varMap ,varPlayer) )
				end

				StartTalkTask(varMap);
				TalkAppendString(varMap,resultStr)							
				
					x310183_DisplayTimeCost(varMap ,varPlayer)
				
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			return
		end

		if bRight == 0 then
			local lastTime = GetPlayerGameData(varMap,varPlayer,MD_WULONG_TIME_BEGIN[1], MD_WULONG_TIME_BEGIN[2], MD_WULONG_TIME_BEGIN[3] )
			StartTalkTask(varMap);
			TalkAppendString(varMap, "\t很遗憾，你答错了，你的总答题时间增加了15秒。");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"很遗憾，你答错了，你的总答题时间增加了15秒。",8,2)
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_ERROR_COUNT[1], MD_WULONG_ERROR_COUNT[2], MD_WULONG_ERROR_COUNT[3], GetPlayerGameData(varMap,varPlayer,MD_WULONG_ERROR_COUNT[1], MD_WULONG_ERROR_COUNT[2], MD_WULONG_ERROR_COUNT[3])+1)
			
				GamePlayScriptLog( varMap, varPlayer, x310183_var_GameID_Error)

				local errorCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_ERROR_COUNT[1], MD_WULONG_ERROR_COUNT[2], MD_WULONG_ERROR_COUNT[3])
				
			if errorCount == 1 then
				SetPlayerGameData(varMap,varPlayer,MD_WULONG_TIME_BEGIN[1], MD_WULONG_TIME_BEGIN[2], MD_WULONG_TIME_BEGIN[3], lastTime-15 )
				Msg2Player(varMap,varPlayer,"很遗憾，你答错了一次。",8,2)
				local varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer, lastIndex = QuestWulong_GetQuestionInfo(1)
				SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3], lastIndex)
				SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_WULONG_CUR_ANSWER,varAnswer+12000)

					TalkAppendString(varMap,varDesc)
					x310183_AddAnswerOption( varMap,varPlayer,varAnswer1,varAnswer2,varAnswer3,varAnswer4)							
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				
				return
			elseif errorCount >= 2 then
				SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3], 60000)
				SetPlayerGameData(varMap,varPlayer,MD_WULONG_TIME_BEGIN[1], MD_WULONG_TIME_BEGIN[2], MD_WULONG_TIME_BEGIN[3], lastTime-15 )
				Msg2Player(varMap,varPlayer,"很遗憾，两次你都答错了,你还是去下一位主持人那里接受考验吧。",8,2)
				
				x310183_ModifyCount(varMap ,varPlayer, curCount+1)
				SetPlayerGameData( varMap, varPlayer, MD_WULONG_LAST_ANSWER[1], MD_WULONG_LAST_ANSWER[2], MD_WULONG_LAST_ANSWER[3], curCount )
				local toggle = 0
				if x310183_AfterAnswer(varMap ,varPlayer) ==1 then
					Msg2Player(varMap,varPlayer,"你顺利的完成了本轮答题，你可以前往一号主持人那里开始，再参加一次乌龙辞典大都淘汰赛。",8,2)
					toggle = 1
				elseif x310183_AfterAnswer(varMap ,varPlayer) == 2 then
					Msg2Player(varMap,varPlayer,"你顺利的完成了乌龙辞典淘汰赛的全部比赛。",8,2)
					DelQuestNM( varMap, varPlayer, 9335 )
					toggle = 2
				end

				if toggle == 0 then
					TalkAppendString(varMap,"很遗憾，两次你都答错了,你还是去下一位主持人那里接受考验吧。")
					x310183_DisplayTimeCost(varMap ,varPlayer)
					StopTalkTask(varMap)
					DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				elseif toggle == 1 then
					TalkAppendString(varMap,"\t你顺利的完成了本轮答题，你可以前往一号主持人那里开始，再参加一次乌龙辞典大都淘汰赛。")							
					x310183_DisplayTimeCost(varMap ,varPlayer)
					StopTalkTask(varMap)
					DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				elseif toggle == 2 then
					TalkAppendString(varMap,"\t你顺利的完成了乌龙辞典淘汰赛的全部比赛。")
					x310183_DisplayTimeCost(varMap ,varPlayer)
					StopTalkTask(varMap)
					DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				end
				
				return
			end

			return
		end

		return
	end

	if idExt == x310183_var_FileId then 
		StartTalkTask(varMap)	
			if step ~= 1 and step ~= 2 and step ~= 3 then
				return 
			end
		
			if step == 1 then
				SetPlayerGameData(varMap,varPlayer,MD_WULONG_STEP[1], MD_WULONG_STEP[2], MD_WULONG_STEP[3], 2)
				SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3], 60000 )
				SetPlayerGameData( varMap, varPlayer, MD_WULONG_GUOGUANLING[1], MD_WULONG_GUOGUANLING[2], MD_WULONG_GUOGUANLING[3], 0 )
				SetPlayerGameData( varMap, varPlayer, MD_WULONG_HEIBAILING[1], MD_WULONG_HEIBAILING[2], MD_WULONG_HEIBAILING[3], 0 )
				x310183_ModifyCount(varMap ,varPlayer, 1)
				SetPlayerGameData( varMap, varPlayer, MD_WULONG_LAST_ANSWER[1], MD_WULONG_LAST_ANSWER[2], MD_WULONG_LAST_ANSWER[3], 0 )
				SetPlayerGameData(varMap,varPlayer,MD_WULONG_TIME_BEGIN[1], MD_WULONG_TIME_BEGIN[2], MD_WULONG_TIME_BEGIN[3], x310183_GetValidTime() )
			end

			 local curCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )
			
			if step == 3 and curCount > x310183_var_MaxCount then
				TalkAppendString(varMap,"\t你顺利的完成了乌龙辞典淘汰赛的全部比赛。")							
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				return
			end

			 if step == 3 and curCount == 1 then
				SetPlayerGameData(varMap,varPlayer,MD_WULONG_TIME_BEGIN[1], MD_WULONG_TIME_BEGIN[2], MD_WULONG_TIME_BEGIN[3], x310183_GetValidTime() )
			 end

		if GetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3] ) ~= 60000 then
			local varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer = QuestWulong_GetQuestionInfo(1, 1, GetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3] ))
			SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_WULONG_CUR_ANSWER,varAnswer+12000)

				TalkAppendString(varMap,varDesc)
				x310183_AddAnswerOption( varMap,varPlayer,varAnswer1,varAnswer2,varAnswer3,varAnswer4)							
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		else
			local varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer, lastIndex = QuestWulong_GetQuestionInfo(1)
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3], lastIndex)
			SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_WULONG_CUR_ANSWER,varAnswer+12000)

				TalkAppendString(varMap,varDesc)
				x310183_AddAnswerOption( varMap,varPlayer,varAnswer1,varAnswer2,varAnswer3,varAnswer4)							
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		end
		
		return
	elseif idExt >= 12001 and idExt <= 12004 then
		if step ~= 2 and step ~= 3 then
				return 
		end

		 local curCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )
		 local lastAnswer = GetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_WULONG_CUR_ANSWER)

		if x310183_IsCompleteQuestion(varMap,varPlayer,varTalknpc, step, curCount) > 0 then
			return
		end

		if lastAnswer == idExt then 
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3], 60000)
			StartTalkTask(varMap);
			TalkAppendString(varMap, "\t恭喜你,回答正确！");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"恭喜你,回答正确！",8,2)

			
			x310183_AddAward(varMap ,varPlayer)
			local resultStr ="";
			local toggle = 0
			
				GamePlayScriptLog( varMap, varPlayer, x310183_var_GameID_Right)
				x310183_ModifyCount(varMap ,varPlayer, curCount+1)
				SetPlayerGameData( varMap, varPlayer, MD_WULONG_LAST_ANSWER[1], MD_WULONG_LAST_ANSWER[2], MD_WULONG_LAST_ANSWER[3], curCount )
				if x310183_AfterAnswer(varMap ,varPlayer) ==1 then
					resultStr = format( "\t你顺利的完成了一轮乌龙辞典淘汰赛，你可以再参加一次淘汰赛,去找%s开始新一轮吧。", x310183_NextNpcName(varMap ,varPlayer) )
					toggle = 1
				elseif x310183_AfterAnswer(varMap ,varPlayer) == 2 then
					resultStr = "\t你顺利的完成了乌龙辞典淘汰赛的全部比赛。"
					toggle = 1
					DelQuestNM( varMap, varPlayer, 9335 )
				end
				
				if toggle == 0 then
					resultStr = format( "\t恭喜你通过了我这里的考验,你可以去找%s了。", x310183_NextNpcName(varMap ,varPlayer) )
				end

				StartTalkTask(varMap);
				TalkAppendString(varMap,resultStr)							
				
					x310183_DisplayTimeCost(varMap ,varPlayer)
				
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)

		else
			local lastTime = GetPlayerGameData(varMap,varPlayer,MD_WULONG_TIME_BEGIN[1], MD_WULONG_TIME_BEGIN[2], MD_WULONG_TIME_BEGIN[3] )
			StartTalkTask(varMap);
			TalkAppendString(varMap, "\t很遗憾，你答错了，你的总答题时间增加了15秒。");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"很遗憾，你答错了，你的总答题时间增加了15秒。",8,2)
			SetPlayerGameData(varMap,varPlayer,MD_WULONG_ERROR_COUNT[1], MD_WULONG_ERROR_COUNT[2], MD_WULONG_ERROR_COUNT[3], GetPlayerGameData(varMap,varPlayer,MD_WULONG_ERROR_COUNT[1], MD_WULONG_ERROR_COUNT[2], MD_WULONG_ERROR_COUNT[3])+1)
			
				GamePlayScriptLog( varMap, varPlayer, x310183_var_GameID_Error)

				local errorCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_ERROR_COUNT[1], MD_WULONG_ERROR_COUNT[2], MD_WULONG_ERROR_COUNT[3])
				
			if errorCount == 1 then
				SetPlayerGameData(varMap,varPlayer,MD_WULONG_TIME_BEGIN[1], MD_WULONG_TIME_BEGIN[2], MD_WULONG_TIME_BEGIN[3], lastTime-15 )
				Msg2Player(varMap,varPlayer,"很遗憾，你答错了一次。",8,2)
				local varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer, lastIndex = QuestWulong_GetQuestionInfo(1)
				SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3], lastIndex)
				SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_WULONG_CUR_ANSWER,varAnswer+12000)

					TalkAppendString(varMap,varDesc)
					x310183_AddAnswerOption( varMap,varPlayer,varAnswer1,varAnswer2,varAnswer3,varAnswer4)							
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				
				return
			elseif errorCount >= 2 then
				SetPlayerGameData(varMap,varPlayer,MD_WULONG_LAST_QUESTION[1], MD_WULONG_LAST_QUESTION[2], MD_WULONG_LAST_QUESTION[3], 60000)
				SetPlayerGameData(varMap,varPlayer,MD_WULONG_TIME_BEGIN[1], MD_WULONG_TIME_BEGIN[2], MD_WULONG_TIME_BEGIN[3], lastTime-15 )
				Msg2Player(varMap,varPlayer,"很遗憾，两次你都答错了,你还是去下一位主持人那里接受考验吧。",8,2)
				x310183_ModifyCount(varMap ,varPlayer, curCount+1)
				SetPlayerGameData( varMap, varPlayer, MD_WULONG_LAST_ANSWER[1], MD_WULONG_LAST_ANSWER[2], MD_WULONG_LAST_ANSWER[3], curCount )
				local toggle = 0
				if x310183_AfterAnswer(varMap ,varPlayer) ==1 then
					toggle = 1
					Msg2Player(varMap,varPlayer,"你顺利的完成了本轮答题，你可以前往一号主持人那里开始，再参加一次乌龙辞典大都淘汰赛。",8,2)
				elseif x310183_AfterAnswer(varMap ,varPlayer) == 2 then
					toggle = 2
					Msg2Player(varMap,varPlayer,"你顺利的完成了乌龙辞典淘汰赛的全部比赛。",8,2)
					DelQuestNM( varMap, varPlayer, 9335 )
				end

				if toggle == 0 then
					TalkAppendString(varMap,"很遗憾，两次你都答错了,你还是去下一位主持人那里接受考验吧。")
					x310183_DisplayTimeCost(varMap ,varPlayer)
					StopTalkTask(varMap)
					DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				elseif toggle == 1 then
					TalkAppendString(varMap,"\t你顺利的完成了本轮答题，你可以前往一号主持人那里开始，再参加一次乌龙辞典大都淘汰赛。")							
					x310183_DisplayTimeCost(varMap ,varPlayer)
					StopTalkTask(varMap)
					DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				elseif toggle == 2 then
					TalkAppendString(varMap,"\t你顺利的完成了乌龙辞典淘汰赛的全部比赛。")
					x310183_DisplayTimeCost(varMap ,varPlayer)
					StopTalkTask(varMap)
					DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				end
				
				return
			end
		end
		
		return
	end

end

function x310183_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	return
end

function x310183_ProcQuestAbandon( varMap, varPlayer,varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) <= 0 then	
		return 0
	end
	DelQuestNM( varMap, varPlayer, varQuest )
end


function x310183_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	local step = GetPlayerGameData(varMap,varPlayer,MD_WULONG_STEP[1], MD_WULONG_STEP[2], MD_WULONG_STEP[3]) 
	local npcIndex = 0
	if step == 1 then
		npcIndex = 1
	elseif step == 2 or step ==3 then
		local varCount = GetPlayerGameData(varMap,varPlayer,MD_WULONG_COUNT[1], MD_WULONG_COUNT[2], MD_WULONG_COUNT[3] )
		if varCount >20 then
			varCount = 20 
		end
		
		npcIndex = varCount
	end

	if npcIndex == 0 then
		return
	end
	
	

	local varStr = "通过@npc_"..x310183_var_NpcList[npcIndex].."的考验";	
	StartTalkTask(varMap)		
	AddQuestLogCustomText( varMap,
							"",						
							"",        
							varStr,		
							"@npc_"..x310183_var_NpcList[npcIndex],			
							"通过@npc_"..x310183_var_NpcList[npcIndex].."的考验",               
							"\t下午14：00，可以前往大都（205，50）（295，50）任意一处找到一号主持人，参加乌龙辞典大都淘汰赛！",	
							""					
							)
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
		
end

function x310183_IsCompleteQuestion(varMap,varPlayer,varTalknpc, varStep, varCurCount)
	if 1 ~= varStep and 2~= varStep and 3~=varStep then
		local longGuid = GetPlayerGUID(varMap, varPlayer)
		local msgTip = "x310184_IsCompleteQuestion:".."varStep"..varStep.."map ="..varMap.."PlayerGuid ="..longGuid.."可能使用了外挂"
		WriteLog(1, msgTip)
		return 1
	end
	
	if tonumber(3) == tonumber(varStep) and tonumber(varCurCount) > tonumber(x310183_var_MaxCount) then
		resultStr = "\t你顺利的完成了乌龙辞典淘汰赛的全部比赛。请耐心等待，进入下一轮决赛的优胜者名单将会在16:00公布！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, resultStr)
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		local longGuid = GetPlayerGUID(varMap, varPlayer)
		local msgTip = "x310183_IsCompleteQuestion:".."varStep"..varStep.."varCurCount="..varCurCount.."map ="..varMap.."PlayerGuid ="..longGuid.."可能使用了外挂"
		WriteLog(1, msgTip)
		return 1
	elseif tonumber(2) == tonumber(varStep) and tonumber(varCurCount) > tonumber(x310183_var_MaxCount) then
		local resultStr = format( "\t你顺利的完成了一轮乌龙辞典淘汰赛，你可以再参加一次淘汰赛,去找%s开始新一轮吧。", x310183_NextNpcName(varMap ,varPlayer) )
		StartTalkTask(varMap)
		TalkAppendString(varMap, resultStr)
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		local longGuid = GetPlayerGUID(varMap, varPlayer)
		local msgTip = "x310183_IsCompleteQuestion:".."varStep"..varStep.."varCurCount="..varCurCount.."map ="..varMap.."PlayerGuid ="..longGuid.."可能使用了外挂"
		WriteLog(1, msgTip)
		return 1
	elseif tonumber(1) == tonumber(varStep) and tonumber(varCurCount) > tonumber(x310183_var_MaxCount) then
		local resultStr ="\t恭喜你顺利通过乌龙辞典海选赛！\n\t请在下午#G2点#W准时前往#G大都#W参加扣人心弦的#G乌龙辞典淘汰赛！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, resultStr)
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		local longGuid = GetPlayerGUID(varMap, varPlayer)
		local msgTip = "x310183_IsCompleteQuestion:".."varStep"..varStep.."varCurCount="..varCurCount.."map ="..varMap.."PlayerGuid ="..longGuid.."可能使用了外挂"
		WriteLog(1, msgTip)
		return 1
	elseif tonumber(varCurCount) > tonumber(x310183_var_MaxCount) then
			resultStr = "\t你顺利的完成了乌龙辞典淘汰赛的全部比赛。请耐心等待，进入下一轮决赛的优胜者名单将会在16:00公布！"
			StartTalkTask(varMap)
			TalkAppendString(varMap, resultStr)
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			local longGuid = GetPlayerGUID(varMap, varPlayer)
			local msgTip = "x310183_IsCompleteQuestion:".."varStep="..varStep.."varCurCount="..varCurCount.."map ="..varMap.."PlayerGuid ="..longGuid.."可能使用了外挂"
			WriteLog(1, msgTip)
			return 1
	else
		return 0
	end
end
