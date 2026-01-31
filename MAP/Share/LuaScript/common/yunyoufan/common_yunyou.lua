--DECLARE_QUEST_INFO_START--
x310070_var_FileId 	  = 310070


x310070_var_QuestName = "【个人】寿诞采办"

x310070_var_QuestInfo = "\t@npc_%d采购了一批#g%s#w，请你帮忙去把它们运送到驿站，以便驿站将贡品转运到皇宫内库。不过首先请你#g将这匹御马交给皇宫门口处的大元御卫兵#w，他会把一辆运货马车交给你使用。\n\t在宫内当差诸事都要操心，唯恐办不好差事，辜负了皇恩。\n\t注：本活动于#g每日19：30~24：00#w开放，#g等级在40或以上#w的玩家可以领取任务。\n"

x310070_var_QuestHelp = "\t#G如果你在护送的过程中下线或者远离他超过5分钟，你的任务就会失败。\n\t请尽快完成吧，尽早完成的话朝廷会给你更多奖励的。"

x310070_var_QuestTarget = "  把马护送到@npc_139235处。"
x310070_var_NPCName = "@npc_139235"
x310070_TargetNPCList	=	{139109, 139110, 139111, 139112, 139113}
x310070_var_QuestComment = "\t下月十五是圣上寿诞之日，我大元皇帝天威远播，十路采办已经纷至踏来，詹事院应接不暇。本总管有一事相请，劳烦你到尚未接待的各路采办处，帮我将他们敬献给皇帝陛下的礼物运送到各大驿站，在由驿站转运到皇宫内库。\n\t注：本活动于#g每日19：30~24：00#w开放，#g等级在40或以上#g的，今日没有接过任务的玩家可以领取任务。"


--DECLARE_QUEST_INFO_STOP--



x310070_var_MinLevel = 40


x310070_TargetList ={ "河南贡米", "金山田黄", "深海玉鲍", "南国龙果", "紫金圣物" }
x310070_var_BusScriptId = 310071

x310070_var_BusId = { 16,17,18,19,20 }
x310070_var_QuestId = 8080
x310070_var_QuestAcceptTime1 = { 1170, 1440 }	

function x310070_ProcAcceptChecked( varMap, varPlayer )
	
	
		
		local minspan = GetMinOfDay();
		
			if minspan >= x310070_var_QuestAcceptTime1[1] and minspan < x310070_var_QuestAcceptTime1[2] then
				return 1
			end
		
	
	return -1
end

function x310070_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
  	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then		
		
		local playerLevel = GetLevel( varMap, varPlayer);
		if( playerLevel >= x310070_var_MinLevel ) then
			local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButtonNM(varMap, varPlayer, varTalknpc, varQuest, questState);
		end
		
	end

	return 0
end



function x310070_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varIndex)
	StartTalkTask( varMap);
		
		TalkAppendString(varMap, "#Y"..x310070_var_QuestName);
		TalkAppendString(varMap, format(x310070_var_QuestInfo, x310070_TargetNPCList[varIndex], x310070_TargetList[varIndex]))

		
		TalkAppendString( varMap, "#Y任务目标：")
		TalkAppendString( varMap, "把马匹安全护送到@npc_139235处")
		
		if x310070_var_QuestHelp ~= "" then
			TalkAppendString(varMap, "#Y任务提示：")
			TalkAppendString(varMap, x310070_var_QuestHelp )
		end
		
		
		
		
		local playerLevel = GetLevel( varMap, varPlayer);
		
		local varExperience = playerLevel*1680
		AddQuestExpBonus( varMap, varExperience);
      
	  AddQuestMoneyBonus2(varMap, playerLevel*100 )

	StopTalkTask(varMap);
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x310070_var_FileId, x310070_var_QuestId, 1);
end

function x310070_DispatchComment(varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap);
		TalkAppendString(varMap, "#Y"..x310070_var_QuestName);
		TalkAppendString(varMap, x310070_var_QuestComment);
		local playerLevel = GetLevel( varMap, varPlayer);
		local varExperience = playerLevel*1680
		AddQuestExpBonus( varMap, varExperience);
   
	AddQuestMoneyBonus2(varMap, playerLevel*100 )
	StopTalkTask(varMap);
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x310070_var_FileId, x310070_var_QuestId);
end



function x310070_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		local day = GetPlayerGameData(varMap, varPlayer, MD_YUNYOU_DATE[1], MD_YUNYOU_DATE[2], MD_YUNYOU_DATE[3])
	
		if day ~= GetDayOfYear() then
			SetPlayerGameData(varMap, varPlayer, MD_YUNYOU_DATE[1], MD_YUNYOU_DATE[2], MD_YUNYOU_DATE[3], 0)
		end
		x310070_DispatchComment(varMap, varPlayer, varTalknpc)
	else
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
			if QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) > 0 then 	
				
				x310070_ProcQuestSubmit( varMap, varPlayer, varTalknpc, -1, varQuest )
			else
				QuestNotComplateInfoNM( varMap, varPlayer, varTalknpc, varQuest ) 				
			end

	end
		  
end





function x310070_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if IsBusMember(varMap, varPlayer) > 0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "很抱歉，护送中不能来参与活动");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"很抱歉，护送中不能来参与活动",8,2)
		return 
	end

	if IsTeamFollow(varMap, varPlayer) == 1 then
		local varReadme = "组队跟随状态下不可以接护送任务！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 
	end

	if IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_TIESAN ) > 0 then
		local varReadme = "您在做铁人三项，不可以接护送任务！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 
	end
		
	if x310070_ProcAcceptChecked( varMap, varPlayer ) < 0 then
			local varText = "本活动在每日19：30~24：00举办"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,varText,8,2)
			return 
	end	

	local day = GetPlayerGameData(varMap, varPlayer, MD_YUNYOU_DATE[1], MD_YUNYOU_DATE[2], MD_YUNYOU_DATE[3])

	if day ~= 0 then

		local varText = "你今日已经接过任务，请明天再来"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varText,8,2)
		return
	end

	local isFull = IsQuestFullNM( varMap, varPlayer )

	if isFull > 0 then	
		local varText = "任务已满，添加任务失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		return
	end

	local varIndex = random(1, 5)
	SetPlayerGameData(varMap, varPlayer, MD_YUNYOU_RAND[1], MD_YUNYOU_RAND[2], MD_YUNYOU_RAND[3], varIndex)
	
	
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
	
	
	local busObjId = LuaCallNoclosure( x310070_var_BusScriptId, "ProcCreateBus", varMap, varPlayer ,varQuest, x310070_var_BusId[varIndex])
		
end

function x310070_ProcCreateBusOK(varMap, varPlayer, busObjId,varTalknpc,varQuest)

	if busObjId > 0 then
		local varRet = AddQuestNM( varMap, varPlayer, varQuest ) 

		if varRet > 0 then
			x310070_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varIndex);	

			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )	
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, GetLevel(varMap, varPlayer) )

			SetPlayerGameData(varMap, varPlayer, MD_YUNYOU_DATE[1], MD_YUNYOU_DATE[2], MD_YUNYOU_DATE[3], GetDayOfYear())
			SetQuestParam( varMap, varPlayer, varQuest, 7, 1 )

				local message = "您接受了任务：【个人】寿诞采办"
				StartTalkTask(varMap);
				TalkAppendString(varMap, message);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				Msg2Player(varMap,varPlayer, message,4,2)

				GamePlayScriptLog(varMap, varPlayer, 361)

		elseif varRet == -2 then
			local varText = "任务已满，添加任务失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			  	
			if (IsObjValid (varMap,busObjId) ~= 1) or GetBusQuestID(varMap, busObjId) ~= varQuest then
				return
			end
			DeleteBus(varMap, busObjId,1)
		elseif varRet == -1 then
			local varText = "背包已满,任务获取失败，添加失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			if (IsObjValid (varMap,busObjId) ~= 1) or GetBusQuestID(varMap, busObjId) ~= varQuest then
				return
			end
			DeleteBus(varMap, busObjId,1)
		else
			local varText = "任务获取失败，添加失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			if (IsObjValid (varMap,busObjId) ~= 1) or GetBusQuestID(varMap, busObjId) ~= varQuest then
				return
			end
			DeleteBus(varMap, busObjId,1)
		end
	end
		
end



function x310070_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return 0
	end

	
	local varValid = IsValidMyselfBus(varMap, varPlayer, varQuest)

	if varValid == 0 then
		local varReadme = "您护送的马车离您太远了，无法提交任务！"
        StartTalkTask(varMap)
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	local varLevel = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )

	local varIndex = GetPlayerGameData(varMap, varPlayer, MD_YUNYOU_RAND[1], MD_YUNYOU_RAND[2], MD_YUNYOU_RAND[3])

	local varReadme = "恭喜您完成护送马匹任务"
	StartTalkTask(varMap)
	TalkAppendString(varMap, varReadme);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,varReadme,8,2)

	DelQuest( varMap, varPlayer, varQuest)

	GamePlayScriptLog(varMap, varPlayer, 362)
	
	local varBusID  =  GetBusId(varMap, varPlayer)
	if varBusID ~= -1 then
		
		DeleteBus(varMap, varBusID,1)
	end 
	
	LuaCallNoclosure( 310072, "PushAfterQuest", varMap, varPlayer ,varTalknpc, varLevel, varIndex) 
	
	return 0
	
end





function x310070_ProcQuestAbandon( varMap, varPlayer,varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end
	DelQuest( varMap, varPlayer, varQuest)
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


function x310070_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
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





function x310070_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,varQuest );
		if varHaveQuest > 0 then
		
		local varIndex = GetPlayerGameData(varMap, varPlayer, MD_YUNYOU_RAND[1], MD_YUNYOU_RAND[2], MD_YUNYOU_RAND[3])	
			StartTalkTask(varMap)			
		    AddQuestLogCustomText( varMap,
									"",							
									x310070_var_QuestName,      
									x310070_var_QuestTarget,	
									x310070_var_NPCName,			
									"",      
									format(x310070_var_QuestInfo, x310070_TargetNPCList[varIndex], x310070_TargetList[varIndex]),		
									x310070_var_QuestHelp							
									)
      AddQuestExpBonus(varMap, GetLevel(varMap, varPlayer)*1680)
      
	  AddQuestMoneyBonus2(varMap, GetLevel(varMap, varPlayer)*100 )
			StopTalkTask(varMap)
			DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
		end
end
