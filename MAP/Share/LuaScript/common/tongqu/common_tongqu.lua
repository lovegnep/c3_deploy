
x300320_var_FileId = 300320
x300320_var_RoundMax = 1

x300320_var_CircleMax = 6



x300320_var_FirstQuestId = 8066

x300320_var_ReturnQuestId = 8074

x300320_var_Level = 40



x300320_var_AcceptMessage		= "您接受了任务：%s"
x300320_var_AbandonMessage	= "您放弃了任务：%s"
x300320_var_CompleteMessage	= "您完成了任务：%s"

x300320_var_QuestList = {	
							{quest=8067, transX=129, transZ=100 }, 
							{quest=8068, transX=362, transZ=163 },
							{quest=8069, transX=461, transZ=297 },
							{quest=8070, transX=358, transZ=391 },
							{quest=8071, transX=248, transZ=415 },
							{quest=8072, transX=74  , transZ=177 },
							{quest=8073, transX=436, transZ=316 },
							}

x300320_var_ItemNeed1 = 13013500 
x300320_var_ItemNeed2 = 13013501 

x300320_var_QuestName="【活动】童年的回忆"
x300320_var_QuestInfo="\t你怀念旧时童年趣事吗，你是否想回到童年，重新与儿时的玩伴一起玩耍？\n\t我听说大都内有一位高人可以帮你实现愿望，可他却一般不会随意答应人的请求。但，作为他的好朋友，我也有些事情要拜托你到孩童年代去完成。\n\t如果你肯帮助我完成儿时的遗憾，你不仅可以回到儿时，重现儿时快乐，你还可以获得我的重谢。\n\t注：你可以在#G每日20：00~24：00#W找我接取任务。"  
x300320_var_QuestHelp = ""
x300320_var_AwardItem = 12031050
x300320_var_AwardItemcount = 5

x300320_var_ErrorMessage_Time	=	"现在无法参加儿童节活动"


function x300320_SafeCheck( varMap, varPlayer )
	local rounds = GetPlayerGameData(varMap, varPlayer, MD_TONGQU_ROUND[1], MD_TONGQU_ROUND[2], MD_TONGQU_ROUND[3])
	local mins = GetMinOfDay()
	local day = GetDayOfYear()
	if not ( day >=149 and day <=155 and mins >= 20*60 and mins <=24*60 ) then
		local varStr = x300320_var_ErrorMessage_Time
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,varStr,8,2)
		return -4
	end

	if rounds >= x300320_var_RoundMax then
		local varStr = "你在今天已经参加过本活动，请等待下次活动时间再来"
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,varStr,8,2)
		return -1
	end

	if GetLevel( varMap, varPlayer ) < x300320_var_Level then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "你等级不足40");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"你等级不足40",8,2)
		return -2
	end

	return 1
end

function x300320_GetAfterQuest( varMap, varPlayer, lastQuest, varParam1, varParam2, varParam3, varParam4)

	local varCircle = GetPlayerGameData(varMap, varPlayer, MD_TONGQU_CIRCLE[1], MD_TONGQU_CIRCLE[2], MD_TONGQU_CIRCLE[3])

	if varCircle == 4 then
		return x300320_var_ReturnQuestId
	else 
		
		local quest = {}
		local varNum =0;

		for varI, item in x300320_var_QuestList do 
			if item.quest ~= varParam1 and item.quest ~= varParam2 and item.quest ~= varParam3 and item.quest ~= varParam4 then
				varNum = varNum +1
				quest[varNum] = item.quest
			end
		end

		local varRand = random(1,varNum)

		return quest[varRand]
	end
end

function x300320_NextDayReset(varMap, varPlayer)
	local day = GetPlayerGameData(varMap, varPlayer, MD_TONGQU_DATE[1], MD_TONGQU_DATE[2], MD_TONGQU_DATE[3])

	if day == GetDayOfYear() then
		return 
	end
	
	SetPlayerGameData(varMap, varPlayer, MD_TONGQU_ROUND[1], MD_TONGQU_ROUND[2], MD_TONGQU_ROUND[3], 0)
	SetPlayerGameData(varMap, varPlayer, MD_TONGQU_CIRCLE[1], MD_TONGQU_CIRCLE[2], MD_TONGQU_CIRCLE[3], 0)
end

function x300320_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, x300320_var_ReturnQuestId ) > 0 or IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then
		return 
	end

	if GetLevel( varMap, varPlayer ) < x300320_var_Level then
		return 
	end

	if IsHaveQuestNM( varMap, varPlayer, x300320_var_FirstQuestId ) > 0 then
		return
	end

	if IsHaveQuestNM( varMap, varPlayer, x300320_var_ReturnQuestId ) > 0 then
		return
	end

	for varI, item in x300320_var_QuestList do
		if IsHaveQuestNM( varMap, varPlayer, item.quest ) > 0 then
			return 
		end
	end


	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		
			local  questState = GetQuestStateNM( varMap, varPlayer, varTalknpc, varQuest )
			TalkAppendButtonNM(varMap, varPlayer, varTalknpc, varQuest, questState)
		
	end
	return 0
end

function x300320_DispatchFirstQuestInfo()
	
end

function x300320_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		x300320_NextDayReset(varMap, varPlayer)

		StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x300320_var_QuestName)
			TalkAppendString(varMap,x300320_var_QuestInfo)
			if x300320_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x300320_var_QuestHelp )
			end

			local varLevel = GetLevel(varMap, varPlayer)
			local exptemp = 20000
			if varLevel >=80 then
				exptemp = 20000
			end
			AddQuestExpBonus(varMap, varLevel*exptemp )
			
			AddQuestItemBonus(varMap, x300320_var_AwardItem, x300320_var_AwardItemcount)

			
		
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300320_var_FileId, x300320_var_FirstQuestId);

	else 
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		if QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) > 0 then 
			QuestComplateInfoNM( varMap, varPlayer, varTalknpc, varQuest ) 
			
		else
			QuestNotComplateInfoNM( varMap, varPlayer, varTalknpc, varQuest ) 
		end
	end
end


function x300320_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	
	for varI, item in x300320_var_QuestList do
		if item.quest == varQuest then
			if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then
				return
			end
		end
	end

	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then	
		return 0
	end
	
	if IsHaveQuestNM(varMap, varPlayer, 7537) > 0 or IsHaveQuestNM(varMap, varPlayer, 7538) > 0 or IsHaveQuestNM(varMap, varPlayer, 7539) > 0 
		or IsHaveQuestNM(varMap, varPlayer, 7551) > 0 or IsHaveQuestNM(varMap, varPlayer, 7552) > 0 then

		local varText = "你正在进行铁人三项比赛，无法接取任务"
		StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0;
	end

	if x300320_SafeCheck( varMap, varPlayer ) < 0 then
		return
	end
	
	
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, varQuest )
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
	
	local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest ) 
	if varRet > 0 then 
		varRet = AddQuestNM( varMap, varPlayer, varQuest ) 
		
		if varRet > 0 then

			SetPlayerGameData(varMap, varPlayer, MD_TONGQU_ROUND[1], MD_TONGQU_ROUND[2], MD_TONGQU_ROUND[3], 1)
			SetPlayerGameData(varMap, varPlayer, MD_TONGQU_DATE[1], MD_TONGQU_DATE[2], MD_TONGQU_DATE[3], GetDayOfYear())

			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, GetLevel(varMap, varPlayer) )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )

			for varI = 0, 4 do
				local varMap, PosX, PosZ, tips = GetAskWayPosNM(varMap, varPlayer, varQuest, varI)
				if varMap ~= -1 then
					LuaCallNoclosure( UTILITY_SCRIPT, "AskTheWayPos", varMap, varPlayer, varMap, PosX, PosZ, tips )
				end
			end
			
			local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
			local message = format(x300320_var_AcceptMessage, varQuestName);
			local varText = message

			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer, varText, 4, 2)
			return 1
		elseif varRet == 0 then
			local varText = "任务获取失败，添加失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		elseif varRet == -1 then
			local varText = "背包已满,请整理后再来接任务"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		elseif varRet == -2 then
			local varText = "任务已满，添加任务失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	
	end
	
	return 0
end


function x300320_ProcQuestAbandon( varMap, varPlayer, varQuest )
	local varRet = 0
	varRet = DelQuestNM( varMap, varPlayer, varQuest )
	if varRet == 1 then
		local sex = GetSex( varMap, varPlayer )
		local boy = {7220,7221,7222,7223,7224,}
		local girl =  {7225,7226,7227,7228,7229,}
		if sex==0 then
			for k,v in girl do
				if IsHaveSpecificImpact(varMap, varPlayer, v) > 0 then
				CancelSpecificImpact(varMap, varPlayer, v)
				end
			end
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 8314, 0)
		else
			for k,v in boy do
				if IsHaveSpecificImpact(varMap, varPlayer, v) > 0 then
				CancelSpecificImpact(varMap, varPlayer, v)
				end
			end
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 8314, 0)
		end
		CancelSpecificImpact(varMap, varPlayer,7534)
		ClearMutexState(varMap, varPlayer, 21)

		
		local ItemCnt = GetItemCount( varMap, varPlayer, x300320_var_ItemNeed1 )
		if ItemCnt > 0 then 
			if DelItem(varMap, varPlayer,x300320_var_ItemNeed1, 1) ~= 1 then return 0 end
		end

		ItemCnt = GetItemCount( varMap, varPlayer, x300320_var_ItemNeed2 )
		if ItemCnt > 0 then 
			if DelItem(varMap, varPlayer,x300320_var_ItemNeed2, 1) ~= 1 then return 0 end
		end

		local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
		local message = format(x300320_var_AbandonMessage, varQuestName);
		StartTalkTask(varMap);
		TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, message, 4, 2)

		SetPlayerGameData(varMap, varPlayer, MD_TONGQU_DATE[1], MD_TONGQU_DATE[2], MD_TONGQU_DATE[3], GetDayOfYear())
	end
end

function x300320_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return
	end

	local npcName = GetName( varMap, varTalknpc )
	if npcName == "" then	
		return
	end

	local guid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx )
	local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
	if guid ~= -1 then 
		if guid == varTalkNpcGUID then	
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, questState, -1 ) 
		end
	else
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, questState, -1 ) 
	end
end



function x300320_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end

	if x300320_var_FirstQuestId == varQuest then
		if GetBagSpace(varMap, varPlayer) < 2 then
			local message = "背包空间不足两格，无法继续此任务"
			StartTalkTask(varMap);
				TalkAppendString(varMap, message);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return
		end
	end

	if varQuest == x300320_var_ReturnQuestId then
		if GetBagSpace(varMap, varPlayer) < 1 then
			local message = "背包已满，无法完成此任务"
			StartTalkTask(varMap);
				TalkAppendString(varMap, message);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return
		end
	end

	if IsHaveQuestNM(varMap, varPlayer, 7537) > 0 or IsHaveQuestNM(varMap, varPlayer, 7538) > 0 or IsHaveQuestNM(varMap, varPlayer, 7539) > 0 
	or IsHaveQuestNM(varMap, varPlayer, 7551) > 0 or IsHaveQuestNM(varMap, varPlayer, 7552) > 0 then
		local varText = "你正在进行铁人三项比赛，无法继续此任务"
		StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 
	end



	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	local varRet = QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) 
	if varRet > 0 then 
		return x300320_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	end
	return 0
end


function x300320_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	local varParam1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 ) 
	local varParam2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2 ) 
	local varParam3 = GetQuestParam( varMap, varPlayer, varQuestIdx, 3 ) 
	local varParam4 = GetQuestParam( varMap, varPlayer, varQuestIdx, 4 ) 
	
	local varRet = DelQuestNM( varMap, varPlayer, varQuest ) 
	if varRet >0 then 
		
		local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
		local message = format(x300320_var_CompleteMessage, varQuestName);
		StartTalkTask(varMap);
			TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);

		x300320_ProcSubQuestComplete(varMap, varPlayer, varTalknpc, varQuest, varParam1, varParam2, varParam3, varParam4 )
				
		return 1 
	end
	return 0
end

function x300320_ProcSubQuestComplete(varMap, varPlayer, varTalknpc, varQuest, varParam1, varParam2, varParam3, varParam4)
	local varLevel = GetLevel( varMap, varPlayer )
	local exptemp = 20000
	if varLevel >=80 then
		exptemp = 20000
	end
	if varQuest == x300320_var_ReturnQuestId then
		local day = GetPlayerGameData(varMap, varPlayer, MD_TONGQU_DATE[1], MD_TONGQU_DATE[2], MD_TONGQU_DATE[3])
		if day ~= GetDayOfYear() then
			
			AddExp( varMap, varPlayer, exptemp*varLevel )
			local message = format("#Y获得#R经验%d点#Y奖励", exptemp*varLevel)
			StartTalkTask(varMap);
				TalkAppendString(varMap, message);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer, message,4,2)

			local varItem=x300320_var_AwardItem;
			StartItemTask( varMap )
			ItemAppendBind( varMap, varItem, x300320_var_AwardItemcount )
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)

				local message = format("#Y获得物品#R#{_ITEM%d}#Y的奖励", x300320_var_AwardItem )
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				
			else
				local varText = "背包已满,不能获得奖励物品"
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end

			

			SetPlayerGameData(varMap, varPlayer, MD_TONGQU_DATE[1], MD_TONGQU_DATE[2], MD_TONGQU_DATE[3], GetDayOfYear())
			return 
		end

		SetPlayerGameData(varMap, varPlayer, MD_TONGQU_DATE[1], MD_TONGQU_DATE[2], MD_TONGQU_DATE[3], GetDayOfYear())

		TONGQU_COMMIT_NUM = TONGQU_COMMIT_NUM + 1
		
		if TONGQU_COMMIT_NUM == 1 then
			AddExp( varMap, varPlayer, exptemp*varLevel*1.6 )
		
			local message = format("#Y获得#R经验%d点#Y奖励", exptemp*varLevel)
			StartTalkTask(varMap);
				TalkAppendString(varMap, message);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer, message,4,2)
			
			message = format("#Y获得第%d名的#R额外经验%d点#Y奖励", TONGQU_COMMIT_NUM, exptemp*varLevel*1.6)
			StartTalkTask(varMap);
				TalkAppendString(varMap, message);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer, message,4,2)

			local varName = GetName(varMap, varPlayer)
			message = "#R恭喜"..varName.."为本次活动首位完成【童年的回忆】的玩家，前三十名完成的玩家将获得额外的奖励！"
			LuaAllScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
			LuaAllScenceM2Wrold( varMap, message, CHAT_LEFTDOWN, 1 )

		elseif TONGQU_COMMIT_NUM <= 30 then
			AddExp( varMap, varPlayer, exptemp*varLevel*1.3 )
			local message = format("#Y获得#R经验%d点#Y的奖励", exptemp*varLevel)
			StartTalkTask(varMap);
				TalkAppendString(varMap, message);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer, message,4,2)
			
			message = format("#Y获得第%d名的#R额外经验%d点#Y奖励", TONGQU_COMMIT_NUM, exptemp*varLevel*1.3)
			StartTalkTask(varMap);
				TalkAppendString(varMap, message);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer, message,4,2)
		else
			AddExp( varMap, varPlayer, exptemp*varLevel )
			local message = format("#Y获得#R经验%d点#Y奖励", exptemp*varLevel)
			StartTalkTask(varMap);
				TalkAppendString(varMap, message);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			Msg2Player(varMap,varPlayer, message,4,2)
		end

		local varItem=x300320_var_AwardItem;
	
		StartItemTask( varMap )
		ItemAppendBind( varMap, varItem, x300320_var_AwardItemcount )
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)

			local message = format("#Y获得物品#R#{_ITEM%d}#Y的奖励", x300320_var_AwardItem )
			StartTalkTask(varMap);
			TalkAppendString(varMap, message);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			
		else
			local varText = "背包已满,不能获得奖励物品"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end

		

		return 
	end 
	local sex = GetSex( varMap, varPlayer )

	local AfterQuestId = x300320_GetAfterQuest( varMap, varPlayer, varQuest, varParam1, varParam2, varParam3, varParam4)

	if AfterQuestId == x300320_var_ReturnQuestId then
		local boy = {7220,7221,7222,7223,7224,}
		local girl =  {7225,7226,7227,7228,7229,}
		if sex==0 then
			for k,v in girl do
				if IsHaveSpecificImpact(varMap, varPlayer, v) > 0 then
				CancelSpecificImpact(varMap, varPlayer, v)
				end
			end
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 8314, 0)
		else
			for k,v in boy do
				if IsHaveSpecificImpact(varMap, varPlayer, v) > 0 then
				CancelSpecificImpact(varMap, varPlayer, v)
				end
			end
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 8314, 0)
		end

		CancelSpecificImpact(varMap, varPlayer,7534)
		ClearMutexState(varMap, varPlayer, 21)

		
		local ItemCnt = GetItemCount( varMap, varPlayer, x300320_var_ItemNeed1 )
		if ItemCnt > 0 then 
			if DelItem(varMap, varPlayer,x300320_var_ItemNeed1, 1) ~= 1 then return 0 end
		end

		ItemCnt = GetItemCount( varMap, varPlayer, x300320_var_ItemNeed2 )
		if ItemCnt > 0 then 
			if DelItem(varMap, varPlayer,x300320_var_ItemNeed2, 1) ~= 1 then return 0 end
		end
		 
	end
	
	
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,AfterQuestId  )
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

	local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, AfterQuestId ) 

	if varRet > 0 then 
		varRet = AddQuestNM( varMap, varPlayer, AfterQuestId ) 
		if varRet > 0 then
				if varQuest == x300320_var_FirstQuestId then 
					
					StartItemTask(varMap)
					ItemAppend( varMap, x300320_var_ItemNeed1, 1 )
					local retOther = StopItemTask(varMap,varPlayer)
					if retOther > 0 then
						DeliverItemListSendToPlayer(varMap,varPlayer)
					else
						local varText = "背包已满,不能获得任务道具"
						StartTalkTask(varMap)
						TalkAppendString(varMap, varText);
						StopTalkTask(varMap)
						DeliverTalkTips(varMap,varPlayer)
						
					end

					StartItemTask(varMap)
					ItemAppend( varMap, x300320_var_ItemNeed2, 1 )
					retOther = StopItemTask(varMap,varPlayer)
					if retOther > 0 then
						DeliverItemListSendToPlayer(varMap,varPlayer)
					else
						local varText = "背包已满,不能获得任务道具"
						StartTalkTask(varMap)
						TalkAppendString(varMap, varText);
						StopTalkTask(varMap)
						DeliverTalkTips(varMap,varPlayer)
						
					end

					ReCallHorse( varMap, varPlayer )

					local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, AfterQuestId )
					local circleNum = GetPlayerGameData(varMap, varPlayer, MD_TONGQU_CIRCLE[1], MD_TONGQU_CIRCLE[2], MD_TONGQU_CIRCLE[3])
					if circleNum == 0 then
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, AfterQuestId )
					end
					local boy = {7220,7221,7222,7223,7224}
					local girl =  {7225,7226,7227,7228,7229}
					if sex==0 then
						local ran1 =random(5)
						SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 8314, 0)
						SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, girl[ran1], 0)	
					else
						local ran2 =random(5)
						SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 8314, 0)
						SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, boy[ran2], 0)
					end
					SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7534, 0)
					MarkMutexState(varMap, varPlayer, 21)
					local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, AfterQuestId )
					SetQuestByIndex( varMap, varPlayer, varQuestIdx, MP_MAXCIRCLE, 5 )
				else
					if AfterQuestId ~= x300320_var_ReturnQuestId then
						local ItemCnt = GetItemCount( varMap, varPlayer, x300320_var_ItemNeed2 )
						if ItemCnt == 0 then 
							StartItemTask(varMap)
							ItemAppend( varMap, x300320_var_ItemNeed2, 1 )
							local retAdd = StopItemTask(varMap,varPlayer)
							if retAdd > 0 then
								DeliverItemListSendToPlayer(varMap,varPlayer)
							else
								local varText = "背包已满,接受物品失败"
								StartTalkTask(varMap)
								TalkAppendString(varMap, varText);
								StopTalkTask(varMap)
								DeliverTalkTips(varMap,varPlayer)
								
							end

						end
					else
						
						GamePlayScriptLog(varMap, varPlayer, 352)
					end
					local tempexp = 4000
					if GetLevel(varMap,varPlayer) >= 80 then
						tempexp =4000
					end
					
					AddExp( varMap, varPlayer, tempexp*varLevel )
					
					local expMessage = format("#Y获得#R经验%d#Y的奖励。", tempexp*varLevel)
					StartTalkTask(varMap);
						TalkAppendString(varMap, expMessage);
					StopTalkTask();
					DeliverTalkTips(varMap, varPlayer);
					Msg2Player(varMap,varPlayer, expMessage,4,2)


					local circleNum = GetPlayerGameData(varMap, varPlayer, MD_TONGQU_CIRCLE[1], MD_TONGQU_CIRCLE[2], MD_TONGQU_CIRCLE[3])
					SetPlayerGameData(varMap, varPlayer, MD_TONGQU_CIRCLE[1], MD_TONGQU_CIRCLE[2], MD_TONGQU_CIRCLE[3], circleNum+1)

					local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, AfterQuestId )
					SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, GetLevel(varMap, varPlayer) )
					SetQuestByIndex( varMap, varPlayer, varQuestIdx, MP_CIRCLE, circleNum+1 )
					SetQuestByIndex( varMap, varPlayer, varQuestIdx, MP_MAXCIRCLE, 5 )
					if circleNum == 0 then
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, varParam1 )
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, AfterQuestId )
					elseif circleNum == 1 then
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, varParam1 )
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, varParam2 )
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 3, AfterQuestId )
					elseif circleNum == 2 then
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, varParam1 )
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, varParam2 )
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 3, varParam3 )
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 4, AfterQuestId )
					elseif circleNum == 3 then	
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, varParam1 )
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, varParam2 )
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 3, varParam3 )
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 4, varParam4 )
					end

					if AfterQuestId == x300320_var_ReturnQuestId then
						SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
					end

					
					if circleNum == 0 then
						GamePlayScriptLog(varMap, varPlayer, 311)
					elseif circleNum == 1 then
						GamePlayScriptLog(varMap, varPlayer, 312)
						GamePlayScriptLog(varMap, varPlayer, 321)
					elseif circleNum == 2 then
						GamePlayScriptLog(varMap, varPlayer, 322)
						GamePlayScriptLog(varMap, varPlayer, 331)
					elseif circleNum == 3 then
						GamePlayScriptLog(varMap, varPlayer, 332)
						GamePlayScriptLog(varMap, varPlayer, 341)
					elseif circleNum == 4 then
						GamePlayScriptLog(varMap, varPlayer, 342)
						GamePlayScriptLog(varMap, varPlayer, 351)
					end

					
				end
			
			DeliverTalkAddQuestInfoNM( varMap, varPlayer, varTalknpc, AfterQuestId, 0)
			for varI = 0, 4 do
				local varMap, PosX, PosZ, tips = GetAskWayPosNM(varMap, varPlayer, AfterQuestId, varI)
				if varMap ~= -1 then
					LuaCallNoclosure( UTILITY_SCRIPT, "AskTheWayPos", varMap, varPlayer, varMap, PosX, PosZ, tips )
				end
			end
			
			local varQuestName = GetQuestNameNM( varMap, varPlayer, AfterQuestId )
			local message = format(x300320_var_AcceptMessage, varQuestName);
			local varText = message

			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 1
		elseif varRet == 0 then
			local varText = "任务获取失败，添加失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		elseif varRet == -1 then
			local varText = "背包已满,请整理后再来接任务"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		elseif varRet == -2 then
			local varText = "任务已满，添加任务失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end

	end

end


function x300320_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
    
    if varQuest == nil or varQuest < 0 then
        return
    end
    
    if IsHaveQuestNM(varMap,varPlayer,varQuest) <= 0 then
        return
    end
    
	local NeedNum, ObjIndex = GetQuestNeedItemNumNM( varMap, varPlayer, varQuest, varItemData )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )

	if NeedNum > 0 then
		local Num = GetItemCount( varMap, varPlayer, varItemData )
		
		if Num < NeedNum then 
 			SetQuestByIndex( varMap, varPlayer, varQuestIdx, ObjIndex, Num )         
		elseif Num == NeedNum then
			
			local varText = format("#Y你捕捉到了@item_%d#Y，请使用#G传送指轮#Y完成任务", varItemData)
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, ObjIndex, Num )         
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )        
		end
	end
end


function x300320_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )

	

	local varItem = GetItemTableIndexByIndex( varMap, varPlayer, varBagIdx ) 
	local varQuest = GetQuestIDByItemIDNM( varMap, varPlayer, varItem )

	if varQuest == -1 then 	
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end

	local scene, posx, posz, radii, QuestIdx, dispStr, bDispOther, otherStr = GetQuestUseItemInfoNM( varMap, varPlayer, varQuest, varItem )
	if scene == -1 or varMap ~= scene then 
		return 0
	end
	

	if posx > 0 then 
		local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )

		local distanceRet = radii * radii - (posx - PlayerPosX) * (posx - PlayerPosX) - (posz - PlayerPosZ) * (posz - PlayerPosZ)
		if distanceRet <= 0 then
			local varText = format("您应该在@sceneid_%d[%d,%d]使用此物品！", scene, posx, posz )
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText)
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			return 0
		end
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	if GetQuestParam( varMap, varPlayer, varQuestIdx, QuestIdx ) == 1 then
		return 0
	end

	
	if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end

	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, QuestIdx, 1 )
	
	StartTalkTask(varMap)
	TalkAppendString(varMap, dispStr);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	
	if bDispOther > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, otherStr);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

	
	if varImpact ~= -1 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, varImpact, 0);
	end

	return 1
end



function x300320_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )

	local varQuest, varNeedItemCount, varCollNum = GetItemIdInItemBoxNM( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	if varQuest == -1 then
		return 1 
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		local varQuestName = GetQuestNameNM(varMap, varPlayer, varQuest);
		local varStr = "您没有接受相关任务！"
		if varQuestName == nil or varQuestName == "" then
			varStr = "您没有接受相关任务！"
		else
			varStr = format("您没有接受#Y%s#W！", varQuestName);
		end
		
		StartTalkTask(varMap)
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

		return 1
	end

	local varItemCountNow = GetItemCount( varMap, varPlayer, varNeedItem )
	if varItemCountNow >= varNeedItemCount then
		local varStr = "物品已经收集齐全！";
		if varNeedItemCount > 0 then
			varStr = "物品已经收集齐全！";
		else
			varStr = "您不需要这个物品！";
		end

		StartTalkTask(varMap)
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

		return 1
	end

	return 0
end

function x300320_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )	
	local varStr;
	varStr = GetQuestNameNM(varMap, varPlayer, varQuest);
	local varMaxcircle = 5
	local varCircle = GetQuestParam( varMap, varPlayer, varQuestIdx, MP_CIRCLE )
	
	varStr = varStr.."("..varCircle+1;
	varStr = varStr.."/"..varMaxcircle;
	varStr = varStr..")";

	

    StartTalkTask(varMap)
        AddQuestLogCustomText( varMap,
                                "", 
                                varStr,
                                "", 
                                "",        
                                "",
                                "",
                                ""
                                )

	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);

end

function x300320_TongquOnDie(varMap, varPlayer)
	local tempbuff = {7220,7221,7222,7223,7224,7225,7226,7227,7228,7229,}
	for k,v in tempbuff do
		if IsHaveSpecificImpact(varMap, varPlayer, v) > 0  then
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7534, 0)
			MarkMutexState(varMap, varPlayer, 21)
			break
		end
	end
end

