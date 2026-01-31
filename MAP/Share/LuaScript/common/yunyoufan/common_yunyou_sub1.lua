
x310072_var_SubQuest			=	{ 
									{ varQuest=8081, 
										varQuestName = "【个人】寿诞采办", 
										varQuestTarget = "  把空马车护送到@npc_139109处", 
										QuestInfo = "\t我已经接到上谕，正等着你的到来。这是给你备下的马车，速去@npc_139109处接受贡品吧！",
										QuestHelp = "\t如果你在护送的过程中下线或者远离他超过5分钟，你的任务就会失败。请尽快完成吧，尽早完成的话朝廷会给你更多奖励的。", 
										NpcName="@npc_139109"
									}, 
									{ varQuest=8082, 
										varQuestName = "【个人】寿诞采办", 
										varQuestTarget = "  把空马车护送到@npc_139110处", 
										QuestInfo = "\t我已经接到上谕，正等着你的到来。这是给你备下的马车，速去@npc_139110处接受贡品吧！",
										QuestHelp = "\t如果你在护送的过程中下线或者远离他超过5分钟，你的任务就会失败。请尽快完成吧，尽早完成的话朝廷会给你更多奖励的。", 
										NpcName="@npc_139110"
									}, 
									{ varQuest=8083, 
										varQuestName = "【个人】寿诞采办", 
										varQuestTarget = "  把空马车护送到@npc_139111处", 
										QuestInfo = "\t我已经接到上谕，正等着你的到来。这是给你备下的马车，速去@npc_139111处接受贡品吧！",
										QuestHelp = "\t如果你在护送的过程中下线或者远离他超过5分钟，你的任务就会失败。请尽快完成吧，尽早完成的话朝廷会给你更多奖励的。", 
										NpcName="@npc_139111"
									}, 
									{ varQuest=8084, 
										varQuestName = "【个人】寿诞采办", 
										varQuestTarget = "  把空马车护送到@npc_139112处", 
										QuestInfo = "\t我已经接到上谕，正等着你的到来。这是给你备下的马车，速去@npc_139112处接受贡品吧！",
										QuestHelp = "\t如果你在护送的过程中下线或者远离他超过5分钟，你的任务就会失败。请尽快完成吧，尽早完成的话朝廷会给你更多奖励的。", 
										NpcName="@npc_139112"
									}, 
									{ varQuest=8085, 
										varQuestName = "【个人】寿诞采办", 
										varQuestTarget = "  把空马车护送到@npc_139113处", 
										QuestInfo = "\t我已经接到上谕，正等着你的到来。这是给你备下的马车，速去@npc_139113处接受贡品吧！",
										QuestHelp = "\t如果你在护送的过程中下线或者远离他超过5分钟，你的任务就会失败。请尽快完成吧，尽早完成的话朝廷会给你更多奖励的。", 
										NpcName="@npc_139113"
									}
								}


 
x310072_var_BusScriptId = 310071

x310072_var_FileId = 310072
x310072_var_BusId = { 21,22,23,24,25 }

function x310072_PushAfterQuest(varMap, varPlayer , target, varLevel, varIndex)

	local isFull = IsQuestFullNM( varMap, varPlayer )

	if isFull > 0 then	
		local varText = "任务已满，添加任务失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local busObjId = LuaCallNoclosure( x310072_var_BusScriptId, "ProcCreateBus", varMap, varPlayer ,x310072_var_SubQuest[varIndex].varQuest, x310072_var_BusId[varIndex])
end

function x310072_ProcCreateBusOK(varMap, varPlayer, busObjId,varTalknpc,varQuest,varIndex)

	if busObjId < 0 then
		local varText = "无法创建镖车，添加任务失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, x310072_var_SubQuest[varIndex].varQuest )
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

	local varRet = AddQuestNM( varMap, varPlayer, x310072_var_SubQuest[varIndex].varQuest ) 

	if varRet <0 then
		if (IsObjValid (varMap,busObjId) ~= 1) or GetBusQuestID(varMap, busObjId) ~= x310072_var_SubQuest[varIndex].varQuest then
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

	GamePlayScriptLog(varMap, varPlayer, 371)

	SetQuestParam( varMap, varPlayer, x310072_var_SubQuest[varIndex].varQuest, 7, 1 )

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310072_var_SubQuest[varIndex].varQuest )	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, GetLevel(varMap, varPlayer) )

	StartTalkTask( varMap);
		
		TalkAppendString(varMap, "#Y"..(x310072_var_SubQuest[varIndex].varQuestName));
		TalkAppendString(varMap, x310072_var_SubQuest[varIndex].QuestInfo)

		
		TalkAppendString( varMap, "#Y任务目标：")
		TalkAppendString( varMap, x310072_var_SubQuest[varIndex].varQuestTarget)
		
		if x310072_var_SubQuest[varIndex].QuestHelp ~= "" then
			TalkAppendString(varMap, "#Y任务提示：")
			TalkAppendString(varMap, x310072_var_SubQuest[varIndex].QuestHelp )
		end

	
		
		local varExperience = varLevel*1680
		AddQuestExpBonus( varMap, varExperience);
		
		AddQuestMoneyBonus2(varMap, varLevel*100 )

	StopTalkTask(varMap);
	DeliverTalkInfoNM(varMap, varPlayer, target, x310072_var_FileId, x310072_var_SubQuest[varIndex].varQuest, 1);

end

function x310072_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
  	
end



function x310072_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then	
		
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
			if QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) > 0 then 	
				
				x310072_ProcQuestSubmit( varMap, varPlayer, varTalknpc, -1, varQuest )
			else
				QuestNotComplateInfoNM( varMap, varPlayer, varTalknpc, varQuest ) 				
			end

	end
		  
end





function x310072_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	
end





function x310072_ProcAccept( varMap, varPlayer )
	
end



function x310072_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

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

	local varReadme = "恭喜您完成护送马车任务"
	StartTalkTask(varMap)
	TalkAppendString(varMap, varReadme);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,varReadme,8,2)

	DelQuest( varMap, varPlayer, varQuest)
	GamePlayScriptLog(varMap, varPlayer, 372)
	
	local varBusID  =  GetBusId(varMap, varPlayer)
	if varBusID ~= -1 then
		
		DeleteBus(varMap, varBusID,1)
	end 
	
	LuaCallNoclosure( 310073, "PushAfterQuest", varMap, varPlayer ,varTalknpc, varLevel, varIndex)  
	
	return 0
	
end





function x310072_ProcQuestAbandon( varMap, varPlayer,varQuest )

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


function x310072_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
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





function x310072_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,varQuest );
		if varHaveQuest > 0 then
			local varIndex = GetPlayerGameData(varMap, varPlayer, MD_YUNYOU_RAND[1], MD_YUNYOU_RAND[2], MD_YUNYOU_RAND[3])

			if x310072_var_SubQuest[varIndex].varQuest ~= varQuest then
				return
			end

			StartTalkTask(varMap)			
		    AddQuestLogCustomText( varMap,
									"",							
									x310072_var_SubQuest[varIndex].varQuestName,      
									x310072_var_SubQuest[varIndex].varQuestTarget,	
									x310072_var_SubQuest[varIndex].NpcName,			
									"",      
									x310072_var_SubQuest[varIndex].QuestInfo,		
									x310072_var_SubQuest[varIndex].QuestHelp							
									)
      AddQuestExpBonus(varMap, GetLevel(varMap, varPlayer)*1680)
     
	  AddQuestMoneyBonus2(varMap, GetLevel(varMap, varPlayer)*100 )
			StopTalkTask(varMap)
			DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
		end
end
