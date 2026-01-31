
x310073_var_SubQuest			=	{ 
									{ varQuest=8086, 
										varQuestName = "【个人】寿诞采办", 
										varQuestTarget = "  把货物安全送到@npc_139001处", 
										QuestInfo = "\t下官正是@npc_139109，前来为大元皇帝寿诞敬献贡品，此次纳贡事宜均由海总管负责，恰逢陛下寿诞宫中事务繁忙，下官一直在等待上差前来接受贺寿的贡品和我们对陛下的祝福。\n\t这些就是下官采办来敬献给陛下的贡品，我已经装上马车，请上差验查。如贡品无误请将此车交到@npc_139001处。\n",
										QuestHelp = "\t如果你在护送的过程中下线或者远离他超过5分钟，你的任务就会失败。请尽快完成吧，尽早完成的话朝廷会给你更多奖励的。", 
										NpcName="@npc_139001"
									}, 
									{ varQuest=8087, 
										varQuestName = "【个人】寿诞采办", 
										varQuestTarget = "  把货物安全送到@npc_139004处", 
										QuestInfo = "\t下官正是@npc_139110，前来为大元皇帝寿诞敬献贡品，此次纳贡事宜均由海总管负责，恰逢陛下寿诞宫中事务繁忙，下官一直在等待上差前来接受贺寿的贡品和我们对陛下的祝福。\n\t这些就是下官采办来敬献给陛下的贡品，我已经装上马车，请上差验查。如贡品无误请将此车交到@npc_139004处。\n",
										QuestHelp = "\t如果你在护送的过程中下线或者远离他超过5分钟，你的任务就会失败。请尽快完成吧，尽早完成的话朝廷会给你更多奖励的。", 
										NpcName="@npc_139004"
									}, 
									{ varQuest=8088, 
										varQuestName = "【个人】寿诞采办", 
										varQuestTarget = "  把货物安全送到@npc_139006处", 
										QuestInfo = "\t下官正是@npc_139111，前来为大元皇帝寿诞敬献贡品，此次纳贡事宜均由海总管负责，恰逢陛下寿诞宫中事务繁忙，下官一直在等待上差前来接受贺寿的贡品和我们对陛下的祝福。\n\t这些就是下官采办来敬献给陛下的贡品，我已经装上马车，请上差验查。如贡品无误请将此车交到@npc_139006处。\n",
										QuestHelp = "\t如果你在护送的过程中下线或者远离他超过5分钟，你的任务就会失败。请尽快完成吧，尽早完成的话朝廷会给你更多奖励的。", 
										NpcName="@npc_139006"
									}, 
									{ varQuest=8089, 
										varQuestName = "【个人】寿诞采办", 
										varQuestTarget = "  把货物安全送到@npc_139000处", 
										QuestInfo = "\t下官正是@npc_139112，前来为大元皇帝寿诞敬献贡品，此次纳贡事宜均由海总管负责，恰逢陛下寿诞宫中事务繁忙，下官一直在等待上差前来接受贺寿的贡品和我们对陛下的祝福。\n\t这些就是下官采办来敬献给陛下的贡品，我已经装上马车，请上差验查。如贡品无误请将此车交到@npc_139000处。\n",
										QuestHelp = "\t如果你在护送的过程中下线或者远离他超过5分钟，你的任务就会失败。请尽快完成吧，尽早完成的话朝廷会给你更多奖励的。", 
										NpcName="@npc_139000"
									}, 
									{ varQuest=8090, 
										varQuestName = "【个人】寿诞采办", 
										varQuestTarget = "  把货物安全送到@npc_139005处", 
										QuestInfo = "\t下官正是@npc_139113，前来为大元皇帝寿诞敬献贡品，此次纳贡事宜均由海总管负责，恰逢陛下寿诞宫中事务繁忙，下官一直在等待上差前来接受贺寿的贡品和我们对陛下的祝福。\n\t这些就是下官采办来敬献给陛下的贡品，我已经装上马车，请上差验查。如贡品无误请将此车交到@npc_139005处。\n",
										QuestHelp = "\t如果你在护送的过程中下线或者远离他超过5分钟，你的任务就会失败。请尽快完成吧，尽早完成的话朝廷会给你更多奖励的。", 
										NpcName="@npc_139005"
									}
										}


 
x310073_var_BusScriptId = 310071

x310073_var_FileId = 310073
x310073_var_BusId = { 26,27,28,29,30 }
x310073_var_AwardItem = 12110204

function x310073_PushAfterQuest(varMap, varPlayer , target, varLevel, varIndex)
	local isFull = IsQuestFullNM( varMap, varPlayer )

	if isFull > 0 then	
		local varText = "任务已满，添加任务失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local busObjId = LuaCallNoclosure( x310073_var_BusScriptId, "ProcCreateBus", varMap, varPlayer ,x310073_var_SubQuest[varIndex].varQuest, x310073_var_BusId[varIndex])

end

function x310073_ProcCreateBusOK(varMap, varPlayer, busObjId,varTalknpc,varQuest,varIndex)
	if busObjId < 0 then
		local varText = "无法创建镖车，添加任务失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, x310073_var_SubQuest[varIndex].varQuest )
	if varFrontQuest1 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
			return 
		end
	end
	if varFrontQuest2 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
			return 
		end
	end
	if varFrontQuest3 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
			return
		end
	end
 
	local varRet = AddQuestNM( varMap, varPlayer, x310073_var_SubQuest[varIndex].varQuest ) 

	if varRet <0 then
		if (IsObjValid (varMap,busObjId) ~= 1) or GetBusQuestID(varMap, busObjId) ~= x310073_var_SubQuest[varIndex].varQuest then
			return
		end
		DeleteBus(varMap, busObjId,1)

		if varRet == -2 then
			local varText = "任务已满，添加任务失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		elseif varRet == -1 then
			local varText = "背包已满,任务获取失败，添加失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		else
			local varText = "任务获取失败，添加失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		return
	end

	GamePlayScriptLog(varMap, varPlayer, 381)

	SetQuestParam( varMap, varPlayer, x310073_var_SubQuest[varIndex].varQuest, 7, 1 )

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310073_var_SubQuest[varIndex].varQuest )	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, GetLevel(varMap, varPlayer) )

	StartTalkTask( varMap);
		
		TalkAppendString(varMap, "#Y"..(x310073_var_SubQuest[varIndex].varQuestName));
		TalkAppendString(varMap, x310073_var_SubQuest[varIndex].QuestInfo)

		
		TalkAppendString( varMap, "#Y任务目标：")
		TalkAppendString( varMap, x310073_var_SubQuest[varIndex].varQuestTarget)
		
		if x310073_var_SubQuest[varIndex].QuestHelp ~= "" then
			TalkAppendString(varMap, "#Y任务提示：")
			TalkAppendString(varMap, x310073_var_SubQuest[varIndex].QuestHelp )
		end

	
		
		local varExperience = varLevel*1680
		AddQuestExpBonus( varMap, varExperience);
		AddQuestMoneyBonus2(varMap, varLevel*100 )

	StopTalkTask(varMap);
	DeliverTalkInfoNM(varMap, varPlayer, target, x310073_var_FileId, x310073_var_SubQuest[varIndex].varQuest, 1);

end

function x310073_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
  	
end



function x310073_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then	
		
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
			if QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) > 0 then 	
				StartTalkTask( varMap);
					
					TalkAppendString(varMap, "#y【个人】寿诞采办#w\n\谢谢你为陛下所做的一切，这是你应得的奖励，请笑纳。");

					local varLevel = GetLevel(varMap, varPlayer)
					AddQuestExpBonus(varMap, varLevel*1680 )
					
					AddQuestMoneyBonus2(varMap, varLevel*100 )
					
				StopTalkTask(varMap);
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x310073_var_FileId, varQuest);
				
			else
				QuestNotComplateInfoNM( varMap, varPlayer, varTalknpc, varQuest ) 				
			end

	end
		  
end





function x310073_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	
end





function x310073_ProcAccept( varMap, varPlayer )
	
end



function x310073_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return 
	end

	
	local varValid = IsValidMyselfBus(varMap, varPlayer, varQuest)

	if varValid == 0 then
		local varReadme = "您护送的马车离您太远了，无法提交任务！"
        StartTalkTask(varMap)
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 
	end

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	local varLevel = GetLevel( varMap, varPlayer )
	local awardMoney = varLevel*100

	local varIndex = GetPlayerGameData(varMap, varPlayer, MD_YUNYOU_RAND[1], MD_YUNYOU_RAND[2], MD_YUNYOU_RAND[3])
	
	local message = "您完成了任务：寿诞采办"
	StartTalkTask(varMap);
		TalkAppendString(varMap, message);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap,varPlayer, message,4,2)

	DelQuest( varMap, varPlayer, varQuest)

	GamePlayScriptLog(varMap, varPlayer, 382)
	
	local varBusID  =  GetBusId(varMap, varPlayer)
	if varBusID ~= -1 then
		
		DeleteBus(varMap, varBusID,1)
	end 

	local day = GetPlayerGameData(varMap, varPlayer, MD_YUNYOU_DATE[1], MD_YUNYOU_DATE[2], MD_YUNYOU_DATE[3])
	if day ~= GetDayOfYear() then
		local varExperience = varLevel*1680
		AddExp( varMap, varPlayer, varExperience )

		message = format("#Y获得#R经验%d点#Y奖励。", varExperience)
		StartTalkTask(varMap);
			TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, message,4,2)
		
		AddMoney( varMap, varPlayer,0, awardMoney )
		message = format( "获得了#R现银#{_MONEY%d}", awardMoney)
		StartTalkTask(varMap);
		TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, message,4,2)

		SetPlayerGameData(varMap, varPlayer, MD_YUNYOU_DATE[1], MD_YUNYOU_DATE[2], MD_YUNYOU_DATE[3], GetDayOfYear())
		return 
	end

	SetPlayerGameData(varMap, varPlayer, MD_YUNYOU_DATE[1], MD_YUNYOU_DATE[2], MD_YUNYOU_DATE[3], GetDayOfYear())
	
	YUNYOU_COMMIT_NUM = YUNYOU_COMMIT_NUM + 1
	local varExperience = varLevel*1680
	AddExp( varMap, varPlayer, varExperience )

	message = format("#Y获得#R经验%d点#Y奖励。", varExperience)
	StartTalkTask(varMap);
		TalkAppendString(varMap, message);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap,varPlayer, message,4,2)

	if YUNYOU_COMMIT_NUM == 1 then
	
		AddExp( varMap, varPlayer, varLevel*1680*0.5 )
		
		message = format("#Y获得第%d名的#R额外经验%d点#Y奖励", YUNYOU_COMMIT_NUM, varLevel*1680*0.5)
		StartTalkTask(varMap);
			TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, message,4,2)

		local varName = GetName(varMap, varPlayer)
		message = "恭喜"..varName.."以最快的速度将货物取到并送出城门，前三十名完成任务的玩家将获得额外奖励！"
		LuaAllScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
	elseif YUNYOU_COMMIT_NUM > 1 and YUNYOU_COMMIT_NUM <=30 then
		AddExp( varMap, varPlayer, varLevel*1680*0.5 )
		
		message = format("#Y获得第%d名的#R额外经验%d点#Y奖励", YUNYOU_COMMIT_NUM, varLevel*1680*0.5)
		StartTalkTask(varMap);
			TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, message,4,2)
	end

	AddMoney( varMap, varPlayer,0, awardMoney )
	message = format( "获得了#R现银#{_MONEY%d}", awardMoney)
	StartTalkTask(varMap);
	TalkAppendString(varMap, message);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap,varPlayer, message,4,2)

	return 
	
end





function x310073_ProcQuestAbandon( varMap, varPlayer,varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end

	DelQuestNM( varMap, varPlayer, varQuest)

	local message = "您放弃了任务：【个人】寿诞采办"
	StartTalkTask(varMap);
		TalkAppendString(varMap, message);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap,varPlayer, message,4,2)

	SetPlayerGameData(varMap, varPlayer, MD_YUNYOU_DATE[1], MD_YUNYOU_DATE[2], MD_YUNYOU_DATE[3], GetDayOfYear())
  	
  	local varBusID  =  GetBusId(varMap, varPlayer)
	if (IsObjValid (varMap,varBusID) ~= 1) or GetBusQuestID(varMap, varBusID) ~= varQuest then
			return
	end
  	if varBusID ~= -1 then
     	
  		DeleteBus(varMap, varBusID,1)
  	end

end


function x310073_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	local submitGuid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx )
	local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
	if varTalkNpcGUID == submitGuid then	
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, questState, -1 ) 
	end
end





function x310073_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,varQuest );
		if varHaveQuest > 0 then
			local varIndex = GetPlayerGameData(varMap, varPlayer, MD_YUNYOU_RAND[1], MD_YUNYOU_RAND[2], MD_YUNYOU_RAND[3])

			if x310073_var_SubQuest[varIndex].varQuest ~= varQuest then
				return
			end

			StartTalkTask(varMap)			
		    AddQuestLogCustomText( varMap,
									"",							
									x310073_var_SubQuest[varIndex].varQuestName,      
									x310073_var_SubQuest[varIndex].varQuestTarget,	
									x310073_var_SubQuest[varIndex].NpcName,			
									"",      
									x310073_var_SubQuest[varIndex].QuestInfo,		
									x310073_var_SubQuest[varIndex].QuestHelp							
									)
      AddQuestExpBonus(varMap, GetLevel(varMap, varPlayer)*1680)
	  AddQuestMoneyBonus2(varMap, GetLevel(varMap, varPlayer)*100 )
			StopTalkTask(varMap)
			DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
		end
end
