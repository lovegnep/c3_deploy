x300101_var_FileId 		= 300101
x300101_var_QuestKind 	= 	1                       
x300101_var_QuestId		= 9251			
x300101_var_QuestName	= "【个人】仕官晋级"


x300101_var_MaxCount		= 15			

x300101_var_GameId		= 1038			
x300101_var_LimitLevel	= 50			

function x300101_GetTurnCount( varMap, varPlayer, varDaycount )
	local t = 1
	local d = varDaycount
	while d > 3 do
		t = t + 1
		d = d - 3
	end
	return t, d
end

function x300101_GetBonusExp( varMap, varPlayer, Right, varDaycount )
	local t, d = x300101_GetTurnCount( varMap, varPlayer, varDaycount )
	
	local varLevel = GetLevel(varMap,varPlayer)
	local bonusExp = 0
	local bonusMoney = 0
	if t == 1 then
		if Right > 0 then
			bonusExp = varLevel*700
		else
			bonusExp = varLevel*350
		end
		bonusMoney = 5000
	elseif t == 2 then
		if Right > 0 then
			bonusExp = varLevel*1400
		else
			bonusExp = varLevel*700
		end
		bonusMoney = 10000
	elseif t == 3 then
		if Right > 0 then
			bonusExp = varLevel*2800
		else
			bonusExp = varLevel*1400
		end
		bonusMoney = 20000
	elseif t == 4 then
		if Right > 0 then
			bonusExp = varLevel*5600
		else
			bonusExp = varLevel*2800
		end
		bonusMoney = 40000
	elseif t == 5 then
		if Right > 0 then
			bonusExp = varLevel*8400
		else
			bonusExp = varLevel*4200
		end
		bonusMoney = 60000
	end

	if varLevel >= 80 and varLevel <90 then
		bonusExp = bonusExp*2
	elseif varLevel >= 90 and varLevel <160 then
		bonusExp = bonusExp*2.6
	end
	
	return t, d, bonusExp, bonusMoney
end




function x300101_GiveBonus( varMap,varPlayer, Right, varDaycount )

	
	if GetGameOpenById(x300101_var_GameId) ~= 1 then
		return
	end
	
	local t, d, bonusExp, bonusMoney = x300101_GetBonusExp( varMap, varPlayer, Right, varDaycount - 1)
	
	AddExp(varMap,varPlayer,bonusExp)
	
	local varMsg = format("#cffcf00您获得了#G%d点经验#cffcf00的奖励",bonusExp)
	Msg2Player(varMap,varPlayer,varMsg,8,3)
	Msg2Player(varMap,varPlayer,varMsg,8,2)
end




function x300101_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
	local varLevel = GetLevel(varMap,varPlayer)
	if varLevel<x300101_var_LimitLevel then
		return
	end
	
	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x300101_var_QuestId)
	if varHaveQuest <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x300101_var_QuestId)
		TalkAppendButton(varMap,x300101_var_QuestId,x300101_var_QuestName,varState,-1)
	end
end




function x300101_AddDengmiAnswerOption( varMap,varAnswer1,varAnswer2,varAnswer3,varAnswer4)

	
	local arr_answer = { {varAnswer1,11001},{varAnswer2,11002},{varAnswer3,11003},{varAnswer4,11004} }
	for j = 1, 2 do
		local n = random(1, 4)
		local m =  random(1, 4)
		if n ~= m then
			local t = arr_answer[n]
			arr_answer[n] = arr_answer[m]
			arr_answer[m] = t
		end
	end
	
	for varI=1,4 do
		TalkAppendButton(varMap,x300101_var_FileId,arr_answer[varI][1],3,arr_answer[varI][2] )
	end
end


function x300101_ShowQuiz(varMap, varPlayer, varTalknpc)

	
	if GetGameOpenById(x300101_var_GameId) ~= 1 then
		
		local strMsg = format("DML:<Info>x300101_ProcMapTimerTick GM close varMap = %d", varMap )
    	WriteLog( 1, strMsg )
		return		
	end
	
	local varCount = QuestQuiz_GetQuestionCount()
	local idx = GetPlayerGameData(varMap, varPlayer, MD_QUIZ_ANSWER[1], MD_QUIZ_ANSWER[2], MD_QUIZ_ANSWER[3])-1
	if idx < 0 or idx > varCount then
		idx = random(1,varCount)
	end
	
	
	local varId,varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer = QuestQuiz_GetQuestionInfo(idx-1)
	
	SetPlayerGameData(varMap, varPlayer, MD_QUIZ_ANSWER[1], MD_QUIZ_ANSWER[2], MD_QUIZ_ANSWER[3], idx+1)
	
	
	StartTalkTask(varMap)
		
		local varDaycount = x300101_GetDayCount(varMap, varPlayer)
		local t, d = x300101_GetTurnCount( varMap,varPlayer, varDaycount+1 )
		TalkAppendString(varMap,format("第%d轮第%d道题目\n", t, d))
		
		TalkAppendString(varMap,varDesc)
		x300101_AddDengmiAnswerOption( varMap, 
										varAnswer1, 
										varAnswer2, 
										varAnswer3, 
										varAnswer4 )
									
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)	
end

function x300101_AnswerRight( varMap, varPlayer, varTalknpc )
	
	local varDaycount = x300101_GetDayCount(varMap, varPlayer)+1
	local t, d = x300101_GetTurnCount( varMap, varPlayer, varDaycount )
	local varMsg = "恭喜你答对了。"
	Msg2Player(varMap,varPlayer,varMsg,8,3)
	Msg2Player(varMap,varPlayer,varMsg,8,2)
	if d ~= 1 then
		x300101_ShowQuiz(varMap, varPlayer, varTalknpc)
	else
		if varDaycount >= x300101_var_MaxCount then
			StartTalkTask(varMap)
				TalkAppendString(varMap,"恭喜你完成了此轮仕官晋级，你今天已完成了所有的考验。请明天再来挑战，祝您明天有更多的收获。")	
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		else
			StartTalkTask(varMap)
				if x300101_var_MaxCount - varDaycount <1 then
					TalkAppendString(varMap,format("\t恭喜你完成了此轮仕官晋级，你今天已完成了所有的考验。请明天再来挑战，祝您明天有更多的收获。") )				
				else
					TalkAppendString(varMap,format("\t恭喜你完成了此轮仕官晋级，你今天还可以进行#R%d轮#W。你还想参加下一轮的考验吗？",(x300101_var_MaxCount - varDaycount)/3 + 1 ) )
				end	
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		end
	end

	x300101_GiveBonus( varMap,varPlayer, 1 , varDaycount)

	GamePlayScriptLog( varMap, varPlayer, 1501)
end

function x300101_AnswerError( varMap, varPlayer, varTalknpc )
	local varDaycount = x300101_GetDayCount(varMap, varPlayer)+1
	local t, d = x300101_GetTurnCount( varMap, varPlayer, varDaycount )
	local varMsg = "很遗憾，你答错了。"
    Msg2Player(varMap,varPlayer,varMsg,8,3)
    Msg2Player(varMap,varPlayer,varMsg,8,2)
	if d ~= 1 then
		x300101_ShowQuiz(varMap, varPlayer, varTalknpc)		
	else
		if varDaycount >= x300101_var_MaxCount then
			StartTalkTask(varMap)
				TalkAppendString(varMap,"\t恭喜你完成了此轮仕官晋级，你今天已完成了所有的考验。请明天再来挑战，祝您明天有更多的收获。")	
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		else
			StartTalkTask(varMap)
				if x300101_var_MaxCount - varDaycount <1 then
					TalkAppendString(varMap,format("\t恭喜你完成了此轮仕官晋级，你今天已完成了所有的考验。请明天再来挑战。祝您明天有更多的收获。") )				
				else
					TalkAppendString(varMap,format("\t恭喜你完成了此轮仕官晋级，你今天还可以进行#R%d轮#W。你还想参加下一轮次的仕官晋级吗？",(x300101_var_MaxCount - varDaycount)/3 + 1 ) )
				end				
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		end
	end

	x300101_GiveBonus( varMap,varPlayer, 0, varDaycount )

	GamePlayScriptLog( varMap, varPlayer, 1502)
end




function x300101_ProcEventEntry( varMap ,varPlayer, varTalknpc,idScript,idExt )
	if GetGameOpenById(x300101_var_GameId) ~= 1 then
		QuestDengmi_SendDengmiInfo( varMap, varPlayer, -1, -1 )

		StartTalkTask(varMap)
			TalkAppendString(varMap,"仕官晋级任务已经关闭！")				
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return
	end

	local varDaycount = x300101_GetDayCount(varMap, varPlayer)
	if varDaycount >= x300101_var_MaxCount then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"\t今天你已经完成了所有的仕官晋级考验了，请明天再来吧。")				
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return
	end
	
	local t, d, bonusExp, bonusMoney = x300101_GetBonusExp( varMap, varPlayer, 1, varDaycount+1 )
	
	if idExt == 12000 then
		if d == 1 and GetPlayerGameData(varMap, varPlayer, MD_QUIZ_ANSWER[1], MD_QUIZ_ANSWER[2], MD_QUIZ_ANSWER[3]) == 0 then
			local varRet, type = SpendMoney( varMap , varPlayer ,bonusMoney,301)
			if varRet ~= 1 then
				local sillerMode
				if GetSillerMode(varMap,varPlayer) == 1 then
					sillerMode = "现银"
				else
					sillerMode = "银卡"
				end
				local varReadme = "很抱歉，此轮仕官晋级需要"..(bonusMoney/1000).."两"..sillerMode
				Msg2Player(varMap,varPlayer,varReadme,8,3)
				Msg2Player(varMap,varPlayer,varReadme,8,2)
				return
			else
				local sillerMode
				if type == 0 then
					sillerMode = "现银"
				else
					sillerMode = "银卡"
				end
				local varReadme = format("参与仕官晋级达成，扣除#R%s#{_MONEY%d}。", sillerMode, bonusMoney)
				Msg2Player(varMap,varPlayer,varReadme,8,3)
				Msg2Player(varMap,varPlayer,varReadme,8,2)
			end
		end
		x300101_ShowQuiz(varMap, varPlayer, varTalknpc)
	elseif idExt >= 11001 and idExt <= 11004 then
		
		local varCount = QuestQuiz_GetQuestionCount()
		local idx = GetPlayerGameData(varMap, varPlayer, MD_QUIZ_ANSWER[1], MD_QUIZ_ANSWER[2], MD_QUIZ_ANSWER[3])-1
		if idx < 0 or idx > varCount then
			return
		end

		local varId,varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer = QuestQuiz_GetQuestionInfo(idx-1)

		SetPlayerGameData(varMap, varPlayer, MD_QUIZ_ANSWER[1], MD_QUIZ_ANSWER[2], MD_QUIZ_ANSWER[3], 0)

		x300101_SetDayCount(varMap, varPlayer)
		if 11000+varAnswer == idExt then
			x300101_AnswerRight( varMap, varPlayer, varTalknpc )
		else
			x300101_AnswerError( varMap, varPlayer, varTalknpc )
		end	
	else
		local varDaycount = x300101_GetDayCount(varMap, varPlayer)
		local t, d = x300101_GetTurnCount( varMap,varPlayer, varDaycount+1 )

		StartTalkTask(varMap)
			TalkAppendString(varMap,"【个人】仕官晋级")
			if GetPlayerGameData(varMap, varPlayer, MD_QUIZ_ANSWER[1], MD_QUIZ_ANSWER[2], MD_QUIZ_ANSWER[3]) == 0 then
				TalkAppendString(varMap,format("\t我这里每天为每人准备了#G五套#W考题作为仕官晋级的考验，每套题有#G三道#W题目。\n\t答对我出的题会获得高额的经验,如果回答错误，你的经验奖励将会减半。\n\t今天你还可以参加#R%d轮#W考验，只要交付我#R%d两#W银币，就可以参加本轮的仕官晋级，共三题，每答对一题你会得到#R%d经验#W。", 6-t, bonusMoney/1000, bonusExp))
				TalkAppendButton(varMap,x300101_var_FileId,"开始考验",0,12000)
			else
				TalkAppendString(varMap,format("\t我这里每天为每人准备了#G五套#W考题作为仕官晋级的考验，每套题有#G三道#W题目。答对我出的题会获得高额经验；如果回答错误，你的经验奖励将会减半。\n\t请继续本轮的考验，每答对一题你会得到%d经验。", bonusExp))
				TalkAppendButton(varMap,x300101_var_FileId,"继续本轮考验",0,12000)
		  end						
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)	
	end
		    
end

function x300101_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 0
end




function x300101_ProcAccept( varMap, varPlayer )
end




function x300101_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x300101_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x300101_CheckSubmit( varMap, varPlayer )
end




function x300101_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x300101_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x300101_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300101_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end




function x300101_GetDayCount(varMap, varPlayer)
	if x300101_var_MaxCount > 0 then
		local varToday = GetDayOfYear()
		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_QUIZ_DATE[1], MD_QUIZ_DATE[2], MD_QUIZ_DATE[3])
		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_QUIZ_COUNT[1], MD_QUIZ_COUNT[2], MD_QUIZ_COUNT[3])
		return varDaycount

	end
	return 0
end




function x300101_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_QUIZ_DATE[1], MD_QUIZ_DATE[2], MD_QUIZ_DATE[3])
	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_QUIZ_DATE[1], MD_QUIZ_DATE[2], MD_QUIZ_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_QUIZ_COUNT[1], MD_QUIZ_COUNT[2], MD_QUIZ_COUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_QUIZ_COUNT[1], MD_QUIZ_COUNT[2], MD_QUIZ_COUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_QUIZ_COUNT[1], MD_QUIZ_COUNT[2], MD_QUIZ_COUNT[3], varDaycount+1)
	end
end
