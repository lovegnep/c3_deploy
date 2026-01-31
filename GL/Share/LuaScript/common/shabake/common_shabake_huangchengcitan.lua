--DECLARE_QUEST_INFO_START--
x300948_var_FileId 						= 300948
x300948_var_QuestName					= "【沙城】刺探军情"
x300948_var_QuestInfo					= "\t所谓知己知彼，百战不殆。沙城内部现在不知如何，须有勇士前往探听，但这一路艰险无比，你可要自己小心。\n\t(完成任务可获得一石国家粮草，同时有一定几率获得#R皇帝战回魂丹#W)"
x300948_var_QuestCompleted				= "\t如此一来，沙城情况尽在我军掌握之中，真是天助我也！"
x300948_var_QuestTarget		 			= "  去沙城内部，找到#R@npc_401208#W，打探沙城情报"
x300948_var_QuestHelp					= "  中途死亡会导致失去情报"
x300948_var_SubmitNPCGUID						= "@npc_401204"
x300948_var_LevelLess	= 	60
x300948_var_SubmitNPCGUID1				= "@npc_401204"   --昆仑，楼兰，天山，敦煌
--x300948_var_SubmitNPCGUID1				= 401204    --昆仑，楼兰，天山，敦煌
x300948_var_QuestRuse					= "\t沙城中有我军布下的@npc_401208，只要找到他，就可知道沙城情况。"
x300948_var_QuestId						= 9213
x300948_var_CiTanBuff					= 7066
x300948_var_ShiCai						= 12030011
x300948_var_ReliveItem					= 11990401
x300948_var_BonusChoiceItem				= {}
x300948_var_GetPlayerExp				=  
{
{level = 60, value = 4500},
{level = 70, value = 8500},
{level = 80, value = 8500},
{level = 90, value = 8500},
{level = 100, value = 8500},
{level = 110, value = 8500},
}
--DECLARE_QUEST_INFO_STOP--

function x300948_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetLevel(varMap, varPlayer) >= 60 then
		local state = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x300948_var_QuestId, x300948_var_QuestName, state)
	end
end

function x300948_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )

	if x300948_GetDayCount_BeforeQuestDate(varMap, varPlayer) == 0 then
		Msg2Player(varMap, varPlayer, "请先完成任务#R【沙城】校场练兵", 8, 3)
		return		
	end
	
	if x300948_GetMD( varMap, varPlayer, MD_SHABAKE_HUANGCHENGCITAN_DATE) == GetDayOfYear() then
		Msg2Player(varMap, varPlayer, format("你今天已经完成过#R%s#0#cffcf00任务",x300948_var_QuestName), 8, 3)
		return		
	end
	
	if IsHaveQuestNM( varMap, varPlayer,x300948_var_QuestId ) > 0 then
	
	
		local bDone = x300948_CheckSubmit(varMap, varPlayer, varTalknpc, varIndex)
		if(bDone > 0) then

				x300948_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest) --完成任务显示

		end	
	else
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		x300948_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )		--任务信息显示

	end			

end

function x300948_CheckSubmit(varMap, varPlayer, varTalknpc, varIndex)

	if IsHaveSpecificImpact(varMap, varPlayer, x300948_var_CiTanBuff) == 0 then
		return 0
	else

		return 1
	end
end

function x300948_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	if GetLevel(varMap, varPlayer) < 60 then
		Msg2Player(varMap, varPlayer, "等级不足", 8, 3)
		return
	end
	
	if IsInChariot(varMap, varPlayer) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"抱歉，乘坐战车状态不能领取任务。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end			

	
	if x300948_GetDayCount_BeforeQuestDate(varMap, varPlayer) == 0 then
		Msg2Player(varMap, varPlayer, "请先完成任务#R【沙城】校场练兵", 8, 3)
		return		
	end
	
	if x300948_GetMD( varMap, varPlayer, MD_SHABAKE_HUANGCHENGCITAN_DATE) == GetDayOfYear() then
		Msg2Player(varMap, varPlayer, format("已经完成过#R%s#0#Y任务",x300948_var_QuestName), 8, 3)
		return		
	end
	
	if IsQuestFullNM( varMap, varPlayer )==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 
	end


	if AddQuest( varMap, varPlayer, x300948_var_QuestId,x300948_var_FileId,0,0,0,1) == 1 then
		
		--接任务写日志


		StartTalkTask(varMap)
		TalkAppendString(varMap, format("你接受了任务：%s",x300948_var_QuestName))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = format("你接受了任务：%s",x300948_var_QuestName)
		Msg2Player(varMap,varPlayer,Readme,8,2)
		local misIndex = GetQuestIndexByID(varMap, varPlayer, x300948_var_QuestId);
		SetQuestByIndex( varMap, varPlayer, misIndex, 0, 0 )
		SetQuestByIndex( varMap, varPlayer, misIndex, 7, 0 )
		GamePlayScriptLog(varMap, varPlayer, 2566)
	end

end

function x300948_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )

	
	StartTalkTask(varMap)

		--任务完成信息
		TalkAppendString(varMap,"#Y"..x300948_var_QuestName)
		TalkAppendString(varMap,x300948_var_QuestCompleted)
		TalkAppendString(varMap,"\n#Y奖励内容：  ")

		local level = GetLevel(varMap, varPlayer)

		local ExpBonus = x300948_YunBiaoExp(varMap, varPlayer)
		if ExpBonus > 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end

	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300948_var_FileId, x300948_var_QuestId)

end

function x300948_ProcPlayerDie(varMap, varPlayer, varKiller)
			
			if IsHaveQuestNM( varMap, varPlayer,x300948_var_QuestId ) > 0 then
						Msg2Player(varMap,varPlayer,format("#R%s#Y失败，请重新领取任务！", x300948_var_QuestName),8,2)
						Msg2Player(varMap,varPlayer,format("#R%s#Y失败，请重新领取任务！", x300948_var_QuestName),8,3)
						DelQuestNM( varMap, varPlayer, x300948_var_QuestId)
			end
end



function x300948_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	local SubmitNPCGUID = 0
	if nCountryIdx == 0 then
		SubmitNPCGUID = x300948_var_SubmitNPCGUID1
	elseif nCountryIdx == 1 then
		SubmitNPCGUID = x300948_var_SubmitNPCGUID1	
	elseif nCountryIdx == 2 then	
		SubmitNPCGUID = x300948_var_SubmitNPCGUID1
	elseif nCountryIdx == 3 then
		SubmitNPCGUID = x300948_var_SubmitNPCGUID1	
	end	
	local QuestTarget = x300948_var_QuestTarget
	StartTalkTask(varMap)

		--任务信息
		TalkAppendString(varMap,"#Y"..x300948_var_QuestName)
		TalkAppendString(varMap,format("%s", x300948_var_QuestInfo))
		TalkAppendString(varMap," ")

		--任务目标
		TalkAppendString( varMap,"#Y任务目标：")
		TalkAppendString( varMap,format("%s", QuestTarget))
		TalkAppendString( varMap," ")

		--提示信息
		if x300948_var_QuestHelp ~= "" then

			TalkAppendString(varMap,"#Y任务提示：")
			TalkAppendString(varMap,format("%s", x300948_var_QuestHelp))
			TalkAppendString(varMap," ")
		end

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x300948_YunBiaoExp(varMap, varPlayer)
		if ExpBonus > 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300948_var_FileId, varQuest)
end

function x300948_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

	local bHaveMission = IsHaveQuestNM(varMap, varPlayer,varQuest );
		
	if bHaveMission > 0 then
		StartTalkTask(varMap)
		AddQuestLogCustomText( varMap,
								"",								-- 标题
								x300948_var_QuestName,			-- 任务名字
								x300948_var_QuestTarget,					--任务目标
								x300948_var_SubmitNPCGUID,				--任务NPC
								x300948_var_QuestRuse,			--任务攻略
								x300948_var_QuestInfo,			--任务描述
								x300948_var_QuestHelp								--任务小提示
								)
		local varExp = 	x300948_YunBiaoExp(varMap, varPlayer)				
	  if varExp > 0 then
        AddQuestExpBonus( varMap, varExp)
    end							
				
		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
	end

end


function x300948_ProcQuestSubmit(varMap, varPlayer, varTalknpc, SelectId,varQuest)

	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local nlevel = GetLevel( varMap, varPlayer)

		
	if nlevel < 60 then
		Msg2Player(varMap,varPlayer,"等级过低，无法提交此任务！",8,3)
		return
	end

	if IsHaveSpecificImpact(varMap, varPlayer, x300948_var_CiTanBuff) == 0 then
		Msg2Player(varMap,varPlayer,"没有BUFF",8,3)
		return
	end
				

	if IsHaveSpecificImpact(varMap, varPlayer, x300948_var_CiTanBuff) == 0 then
		Msg2Player(varMap, varPlayer, "没有BUFF，无法提交！", 8, 3)
		return
	end	 

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

	if varHaveQuest > 0 then
		if x300948_CheckPlayerBagFull2( varMap ,varPlayer,selectId ) == 1 then
			return
		end	
		
		x300948_CheckPlayerBagFull1( varMap ,varPlayer,selectId )	
		
		if DelQuest(varMap, varPlayer, varQuest) ~= 1 then
			return
		end						
		x300948_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
						
	else

		StartTalkTask( varMap )
			TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);

		return
	end		
end


function x300948_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
     GamePlayScriptLog(varMap, varPlayer, 2567)
    AddExp(varMap, varPlayer, x300948_YunBiaoExp(varMap, varPlayer))
    DispelSpecificImpact(varMap, varPlayer, x300948_var_CiTanBuff, 1)
    local PlayerValue = x300948_GetMD( varMap, varPlayer, MD_SHABAKE_HUANGCHENGCITAN_DATE)
    if PlayerValue <= 511 then
    	x300948_SetMD( varMap, varPlayer, MD_SHABAKE_HUANGCHENGCITAN_DATE, GetDayOfYear())
    end
    
    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务：%s",x300948_var_QuestName));
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..x300948_YunBiaoExp(varMap, varPlayer).."点#cffcf00的奖励")

    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    Msg2Player(varMap,varPlayer,format("你完成了任务：%s",x300948_var_QuestName),8,2)
    Msg2Player(varMap,varPlayer,format("获得经验奖励#R%s#cffcf00点",x300948_YunBiaoExp(varMap, varPlayer)),8,2)

end


function x300948_CheckPlayerBagFull( varMap ,varPlayer,selectId )
	local result = 1

	local j = 0

	local bAdd = 0 

	
	StartItemTask(varMap)
	for j, item in x300948_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
    end

	for j, item in x300948_var_BonusChoiceItem do
		if item.item == selectRadio then
			ItemAppend( varMap, item.item, item.n )
			break
		end
	end

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet <= 0 then
		result = 0
	end

	return result
end

function x300948_CheckPlayerBagFull2( varMap ,varPlayer,selectId )
	if x300948_ItemRandom(varMap ,varPlayer) == 5 then
	    StartItemTask( varMap)
	    ItemAppendBind( varMap, x300948_var_ReliveItem, 1)
	    if GetBagSpace(varMap, varPlayer) < 1 then
	        Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 3)
	        Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 2)
	        return 1
	    end
	    DeliverItemListSendToPlayer( varMap, varPlayer)
	end
    
end

function x300948_CheckPlayerBagFull1( varMap ,varPlayer,selectId )
	local countryId = GetCurCountry(varMap, varPlayer)	
	AddCountryResourceWithRecall(varMap, countryId, 1, 1, x300948_var_FileId, "ProcRequestNpcBuffSubResValid", varPlayer) 
    Msg2Player( varMap, varPlayer, "你的国家增加1石粮草资源", 8, 2)
    Msg2Player( varMap, varPlayer, "你的国家增加1石粮草资源", 8, 3)	
end

function x300948_ProcRequestNpcBuffSubResValid( varMap ,varCountry, varIndex, varResult, varPlayer)

	if varResult == 1 then
		return
	else
		AddCountryResourceWithRecall(varMap, varCountry, 1, 1, x300948_var_FileId, "ProcRequestNpcBuffSubResValid", varPlayer)    
	end
end

function x300948_ItemRandom(varMap ,varPlayer)
	local varX =random(1, 10)
	return varX
end

function x300948_ProcQuestAbandon( varMap, varPlayer,varQuest )
	


	DelQuestNM( varMap, varPlayer, x300948_var_QuestId)

	local Readme = format("你放弃了任务：%s",x300948_var_QuestName)
	StartTalkTask(varMap)
	TalkAppendString(varMap, Readme);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,Readme,8,2)
    DispelSpecificImpact(varMap, varPlayer, x300948_var_CiTanBuff, 1)
end

function x300948_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,x300948_var_QuestId )

	if varHaveQuest > 0 then
		if varTalkNpcGUID == x300948_var_SubmitNPCGUID  then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x300948_var_QuestId)
			if IsHaveSpecificImpact(varMap, varPlayer, x300948_var_CiTanBuff) == 0 then
				TalkAppendButton(varMap, x300948_var_QuestId, x300948_var_QuestName,6, 1)				
			else
				TalkAppendButton(varMap, x300948_var_QuestId, x300948_var_QuestName,7, 1)
			end
		end
	end
end

function x300948_YunBiaoExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = 0
	if nLevel < 60 then
		return 0 
	end
	for i, j in x300948_var_GetPlayerExp do
		if nLevel >= j.level then
			nExp = nLevel * j.value
		else
			return nExp
		end
	end
	return nExp
end


function x300948_GetDayCount_BeforeQuestDate(varMap, varPlayer)

	local varToday = GetDayOfYear()
	local varLastday = x300948_GetMD( varMap, varPlayer, MD_SHABAKE_XIAOJUNCHANG_DATE)

	if varLastday ~= varToday then
		return 0
	else
		return 1
	end

end




function x300948_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x300948_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
