x310051_var_FileId = 310051 

x310051_var_Questlist = { 8060, 8061,8062,8063,8064,8065 }
x310051_var_Questlist2 = { 8054, 8055,8056,8057,8058,8059 }


function x310051_ProcEventEntry( varMap, varPlayer, varBagIdx )
	local varLevel = GetLevel( varMap, varPlayer )
	if varLevel < 40 then
		local varText = "您的等级太低，还无法领悟天龙魂的奥秘"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap,varPlayer,"您的等级太低，还无法领悟天龙魂的奥秘",8,2)
		return
	end
	
	local varRand = random(1,6)
	local varRet = 0
	if varLevel >=40 and varLevel<65 then
		for varI, item in x310051_var_Questlist do
			if IsHaveQuestNM( varMap, varPlayer, item ) > 0 then	
				local varText = "您已经有唤醒天龙魂任务了，无法重复领取"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText)
				StopTalkTask(varMap)
				DeliverTalkTips(varMap, varPlayer)
				Msg2Player(varMap,varPlayer,"您已经有唤醒天龙魂任务了，无法重复领取",8,2)
				return 
			end
		
		end

		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, x310051_var_Questlist[varRand] )
		if varFrontQuest1 ~= -1 then
			if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
				return 0
			end
		end
		if varFrontQuest2 ~= -1 then
			if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
				return 0
			end
		end
		if varFrontQuest3 ~= -1 then
			if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
				return 0
			end
		end

		varRet = AddQuestNM( varMap, varPlayer, x310051_var_Questlist[varRand])
	else
		for varI, item in x310051_var_Questlist2 do
			if IsHaveQuestNM( varMap, varPlayer, item ) > 0 then	
				local varText = "您已经有唤醒天龙魂任务了，无法重复领取"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText)
				StopTalkTask(varMap)
				DeliverTalkTips(varMap, varPlayer)
				Msg2Player(varMap,varPlayer,"您已经有唤醒天龙魂任务了，无法重复领取",8,2)
				return 
			end
		
		end

		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, x310051_var_Questlist2[varRand] )
		if varFrontQuest1 ~= -1 then
			if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
				return 0
			end
		end
		if varFrontQuest2 ~= -1 then
			if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
				return 0
			end
		end
		if varFrontQuest3 ~= -1 then
			if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
				return 0
			end
		end

		varRet = AddQuestNM( varMap, varPlayer, x310051_var_Questlist2[varRand])

	end				
	
	if varRet < 1 then
		if varRet == -2 then
			local varText = "任务已满，添加任务失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText)
			StopTalkTask(varMap)
			DeliverTalkTips(varMap, varPlayer)
			return
		end

		local varText = "任务获取失败，添加失败"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap, varPlayer)
		return 
	else
		if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
		local varText = "您获得了任务：唤醒天龙魂"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap, varPlayer)
		Msg2Player(varMap,varPlayer,"您获得了任务：唤醒天龙魂",8,2)

		GamePlayScriptLog(varMap, varPlayer, 541)
	end

	
end

function x310051_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x310051_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x310051_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x310051_ProcDeplete( varMap, varPlayer )

	return 0
end

function x310051_ProcActivateOnce( varMap, varPlayer )
end

function x310051_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
