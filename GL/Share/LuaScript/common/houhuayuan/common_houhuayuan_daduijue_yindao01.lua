--DECLARE_QUEST_INFO_START--

x320031_var_FileId 						= 320031
x320031_var_QuestName					= "【个人】后花园大对决"
x320031_var_QuestName1					= "完成引导"
x320031_var_QuestInfo					= "\t冥王军重振雄风，忽必烈黄金家族捍卫尊严，且看后花园大决战。"
x320031_var_QuestTarget					= "  在活动时间内尽可能获得更多的本方资源和个人积分。\n可前往@npcsp_大元军左统领_1447471或@npcsp_大元军右统领_1447481接取#G运送寒玉#W任务（低难度）\n或去@npcsp_冥王军前锋统领_144753突袭对方#G玉海窑#W将寒玉提交给@npcsp_大元军前锋统领_144749。（高奖高难度）"
x320031_var_QuestRuse					= "\t获取更多的本方资源积分和个人积分将决定最后的胜利。"
x320031_var_QuestCompleted				= "ssssss"
x320031_var_NPCName						= "@npc_144060"
x320031_var_NPCName1						= "@npc_144060"
x320031_var_QuestId						= 6655
x320031_var_BanZhuanBuff				= 5090
x320031_var_PlayerBuff					= {}
x320031_var_MenuSlect					= {}
x320031_var_GetPlayerExp				=
{
{level = 40, value = 1600},
{level = 65, value = 2400},
{level = 85, value = 4320},
}

--DECLARE_QUEST_INFO_STOP--

function x320031_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local GetWeekcount = mod (GetWeekIndex() , 2)
	local nlevel = GetLevel( varMap, varPlayer)
	
	if GetWeekcount == 1 then
		return
	end
	
	if varMap ~= 44 then
		return
	end	
	
	if minOfDay < 869 or minOfDay > 900 then
		return
	end

	if weekIdx ~= 6 then
		return
	end	
	
	if nlevel < 40 then
		return
	end
	local state = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x320031_var_QuestId, x320031_var_QuestName, state)	

end

function x320031_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varidx)
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local GetWeekcount = mod (GetWeekIndex() , 2)
	local nlevel = GetLevel( varMap, varPlayer)
	
	if GetWeekcount == 1 then
		return
	end
	
	if varMap ~= 44 then
		return
	end	
	
	if minOfDay < 869 or minOfDay > 900 then
		return
	end

	if weekIdx ~= 6 then
		return
	end	
	
	if nlevel < 40 then
		return
	end
	if IsQuestHaveDone(varMap, varPlayer, x320031_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest( varMap, varPlayer, x320031_var_QuestId ) > 0 then	-- 如果有这个任务

		x320031_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest) --完成任务显示

	else
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		if x320031_var_NPCName ~= varTalkNpcGUID  then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"你没有此任务！")
			StopTalkTask()
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		end
	end
	if x320031_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
	local NPCName = x320031_var_NPCName
	if GetCurCamp == 5 then
		NPCName = x320031_var_NPCName
	elseif GetCurCamp == 6 then
		NPCName = x320031_var_NPCName1	
	end
	 
	local bHaveMission = IsHaveQuestNM(varMap, varPlayer,varQuest );
	if bHaveMission > 0 then
		StartTalkTask(varMap)
		AddQuestLogCustomText( varMap,
								"",								-- 标题
								x320031_var_QuestName,			-- 任务名字
								x320031_var_QuestTarget,		--任务目标
								x320031_var_NPCName,						--任务NPC
								x320031_var_QuestRuse,			--任务攻略
								
								x320031_var_QuestInfo,			--任务描述
								""								--任务小提示
								)
		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
	end		
	end
end

function x320031_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end


function x320031_CheckSubmit( varMap, varPlayer, varTalknpc)
	return 1
end

function x320031_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x320031_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		
		if x320031_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x320031_var_QuestId, x320031_var_FileId)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x320031_Msg2toplayer( varMap, varPlayer,0)
						if x320031_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x320031_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			end
		  		end
	 	end                                                                    
	     
end

function x320031_ProcQuestSubmit(varMap, varPlayer, varTalknpc, SelectId,varQuest)

	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, varQuest);
	if(varHaveQuest <= 0) then
        StartTalkTask(varMap)
		TalkAppendString(varMap, "你没有这个任务，不能提交！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "你没有这个任务，不能提交！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0		
	end
	
	if DelQuest(varMap, varPlayer, varQuest) ~= 1 then
		return
	end
	
	StartTalkTask( varMap )
		TalkAppendString( varMap,"完成任务引导")
	StopTalkTask()
	DeliverTalkTips(varMap, varPlayer);	
end

function x320031_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end



function x320031_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	local SingleValue = x320031_GetMD( varMap, varPlayer, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL)	
	local RedVlue, BlueValue = LuaCallNoclosure( 320016, "GetTwoCampResource", varMap, varPlayer)
	StartTalkTask(varMap)

		--任务完成信息
		TalkAppendString(varMap,"#Y"..x320031_var_QuestName)
		TalkAppendString(varMap,x320031_var_QuestCompleted)
		TalkAppendString(varMap,format("#Y红方资源积分为：%d", RedVlue))
		TalkAppendString(varMap,format("#Y蓝方资源积分为：%d", BlueValue))
		TalkAppendString(varMap,format("#Y您的个人积分为：%d", SingleValue))
	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x320031_var_FileId, x320031_var_QuestId)

end


function x320031_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	local SingleValue = x320031_GetMD( varMap, varPlayer, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL)	
	local RedVlue, BlueValue = LuaCallNoclosure( 320016, "GetTwoCampResource", varMap, varPlayer)
	local NPCName = x320031_var_NPCName
	if GetCurCamp == 5 then
		NPCName = x320031_var_NPCName
	elseif GetCurCamp == 6 then
		NPCName = x320031_var_NPCName1	
	end 
	local gongnue = x320031_var_QuestRuse..format("\n#Y大元怯薛军资源积分为：%d", RedVlue).. format("\n#Y幻化冥王军资源积分为：%d", BlueValue) ..format("\n#Y您的个人积分为：%d", SingleValue)
	local bHaveMission = IsHaveQuestNM(varMap, varPlayer,varQuest );
	if bHaveMission > 0 then
		StartTalkTask(varMap)
		AddQuestLogCustomText( varMap,
								"",								-- 标题
								x320031_var_QuestName,			-- 任务名字
								x320031_var_QuestTarget,		--任务目标
								x320031_var_NPCName,						--任务NPC
								gongnue,			--任务攻略
								
								x320031_var_QuestInfo,			--任务描述
								""								--任务小提示
								)
		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
	end

end

function x320031_ProcQuestAbandon( varMap, varPlayer,varQuest )

	if IsHaveQuestNM( varMap, varPlayer, x320031_var_QuestId) == 0 then	-- 如果没有这个任务
		return
	end
	local varBusID  =  GetBusId(varMap, varPlayer)	
	DelQuestNM( varMap, varPlayer, x320031_var_QuestId)
	if varBusID ~= -1 then
		DeleteBus(varMap, varBusID,1)
	end
	local Readme = "你放弃了任务：运送寒玉任务引导"
	StartTalkTask(varMap)
	TalkAppendString(varMap, Readme);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,Readme,8,2)

end


function x320031_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x320031_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end

