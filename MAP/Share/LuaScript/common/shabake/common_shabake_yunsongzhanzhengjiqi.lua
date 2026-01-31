--DECLARE_QUEST_INFO_START--
x300943_var_FileId 						= 300943
x300943_var_QuestName					= "【沙城】运送战车"
x300943_var_QuestInfo					= "\t战车只要运到沙城，必然会在战场上大发神威，使我军如虎添翼。 \n\t(完成任务可获得一石国家粮草，同时有一定几率获得#R皇帝战回魂丹#W)"
x300943_var_QuestCompleted				= "\t战车抵达，可使我军心大振！勇士不畏艰险，立一首功！"
x300943_var_QuestTarget		 			= "  护送#G战车#W到沙城战场"
x300943_var_LevelLess	= 	60
x300943_var_QuestHelp					= "  #W沿途保护#G战车#W，将其顺利运送到沙城战场"
x300943_var_NPCName						= "@npc_125511"
x300943_var_QuestRuse					= "\t沿途保护#G战车#W，将其顺利运送到沙城战场"
x300943_var_QuestId						= {9201, 9202, 9203, 9204}
x300943_var_SubmitNPCGUID				= {401201, 401200, 401202, 401203}   --楼兰，昆仑，天山，敦煌
x300943_var_ShiCai						= 12030011
x300943_var_ReliveItem					= 11990401
x300943_var_BonusItem					= {}
x300943_var_BonusChoiceItem				= {}
x300943_var_GetPlayerExp				= 
{
{level = 60, value = 1400},
{level = 70, value = 1800},
{level = 80, value = 1800},
{level = 90, value = 1800},
{level = 100, value = 1800},
{level = 110, value = 1800},
}
x300943_var_GetBossPos				  = 
{
{x = 436, y = 330},
{x = 261, y = 442},
{x = 111, y = 449},
{x = 437, y = 429},
}
--DECLARE_QUEST_INFO_STOP--

function x300943_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetLevel(varMap, varPlayer) >= 60 then
	if IsHaveQuestNM( varMap, varPlayer, x300943_VarQuest(varMap, varPlayer) ) <= 0 then	
		local state = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButton(varMap, x300943_VarQuest(varMap, varPlayer), x300943_var_QuestName, state)
	end
	end
end

function x300943_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )
	if IsHaveQuestNM( varMap, varPlayer, x300943_VarQuest(varMap, varPlayer) ) > 0 then
		local bDone = x300943_CheckSubmit(varMap, varPlayer, varTalknpc, varIndex)
		if(bDone > 0) then
				
				x300943_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest) --完成任务显示

		end	
	else
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		local SubmitNPCGUID = 0
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		local nCountryIdx = GetCurCountry(varMap, varPlayer)
		if nCountryIdx == 0 then
			SubmitNPCGUID = x300943_var_SubmitNPCGUID[1]
		elseif nCountryIdx == 1 then
			SubmitNPCGUID = x300943_var_SubmitNPCGUID[3]
		elseif nCountryIdx == 2 then
			SubmitNPCGUID = x300943_var_SubmitNPCGUID[2]
		elseif nCountryIdx == 3 then
			SubmitNPCGUID = x300943_var_SubmitNPCGUID[4]
		end			
		if SubmitNPCGUID ~= varTalkNpcGUID  then
			x300943_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )		--任务信息显示
		end
	end			

end



function x300943_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if GetLevel(varMap, varPlayer) < 60 then
		Msg2Player(varMap, varPlayer, "等级不足", 8, 3)
		return
	end


	if IsHaveQuestNM( varMap, varPlayer, x300943_VarQuest(varMap, varPlayer)) == 1 then	-- 如果有这个任务
		Msg2Player(varMap, varPlayer, "请删除#R【沙城】运送战车#cffcf00任务之后，再重新领取", 8, 3)	
		return
	end

	
	if x300943_GetMD( varMap, varPlayer, MD_SHABAKE_ZHANZHENGJIQI_DATE) == GetDayOfYear() then
		Msg2Player(varMap, varPlayer, format("你今天已经完成过#R%s#cffcf00任务",x300943_var_QuestName), 8, 3)
		return		
	end
	
	if IsHaveSpecificImpact(varMap, varPlayer, 7661) == 1 or IsHaveSpecificImpact(varMap, varPlayer, 7662) == 1 then
		Msg2Player(varMap ,varPlayer,"抱歉，蒙面状态不能领取此任务",8,3)
		return
	end

	local varBusID = IsBusMember(varMap, varPlayer);
	if(varBusID == 1) then
		local varText = "您已处于护送状态，无法领取新的护送任务！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "#o您已处于护送状态，无法领取新的护送任务！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
	
			
	if IsQuestFullNM( varMap, varPlayer )==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 
	end

	if AddQuest( varMap, varPlayer, x300943_VarQuest(varMap, varPlayer), x300943_var_FileId, 0, 0, 0, 1) == 1 then
		
		--接任务写日志


		StartTalkTask(varMap)
		TalkAppendString(varMap, "你接受了任务：【沙城】运送战车")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = "你接受了任务：【沙城】运送战车"
		Msg2Player(varMap,varPlayer,Readme,8,2)
		local misIndex = GetQuestIndexByID(varMap, varPlayer, x300943_VarQuest(varMap, varPlayer));
		SetQuestByIndex( varMap, varPlayer, misIndex, 0, 0 )
			GamePlayScriptLog(varMap, varPlayer, 2560)
	end
	LuaCallNoclosure( 300944, "ProcCreateBus", varMap, varPlayer ,varQuest)
end


function x300943_CheckSubmit(varMap, varPlayer, varTalknpc, varIndex)

	local SubmitNPCGUID = 0
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)

	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	if nCountryIdx == 0 then
		SubmitNPCGUID = x300943_var_SubmitNPCGUID[1]
	elseif nCountryIdx == 1 then
		SubmitNPCGUID = x300943_var_SubmitNPCGUID[3]
	elseif nCountryIdx == 2 then
		SubmitNPCGUID = x300943_var_SubmitNPCGUID[2]
	elseif nCountryIdx == 3 then
		SubmitNPCGUID = x300943_var_SubmitNPCGUID[4]
	end	

			
	if SubmitNPCGUID ~= varTalkNpcGUID  then
		return 0
	else
		return 1
	end
end

function x300943_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

	local bHaveMission = IsHaveQuestNM(varMap, varPlayer,varQuest );
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	local SubmitNPCGUID = 0
	if nCountryIdx == 0 then
		SubmitNPCGUID = x300943_var_SubmitNPCGUID[1]
	elseif nCountryIdx == 1 then
		SubmitNPCGUID = x300943_var_SubmitNPCGUID[3]	
	elseif nCountryIdx == 2 then	
		SubmitNPCGUID = x300943_var_SubmitNPCGUID[2]	
	elseif nCountryIdx == 3 then
		SubmitNPCGUID = x300943_var_SubmitNPCGUID[4]	
	end	
	local QuestTarget = x300943_var_QuestTarget..format("@npc_%d",SubmitNPCGUID)
	local NPCName = format("@npc_%d",SubmitNPCGUID)
	if bHaveMission > 0 then
		StartTalkTask(varMap)
		AddQuestLogCustomText( varMap,
								"",								-- 标题
								x300943_var_QuestName,			-- 任务名字
								QuestTarget,					--任务目标
								NPCName,				--任务NPC
								x300943_var_QuestRuse,			--任务攻略
								x300943_var_QuestInfo,			--任务描述
								x300943_var_QuestHelp								--任务小提示
								)
		local varExp = 	x300943_YunBiaoExp(varMap, varPlayer)				
	  if varExp > 0 then
        AddQuestExpBonus( varMap, varExp)
    end							
				
		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
	end

end


function x300943_ProcQuestSubmit(varMap, varPlayer, varTalknpc, SelectId,varQuest)
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local nlevel = GetLevel( varMap, varPlayer)

		
	if nlevel < 60 then
		Msg2Player(varMap,varPlayer,"等级过低，无法提交此任务！",8,3)
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

	
	if IsValidMyselfBus(varMap, varPlayer,varQuest) == 0 then
    StartTalkTask(varMap)
		TalkAppendString(varMap, "战车离你太远了，不能提交！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "战车离你太远了，不能提交！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, varQuest);
	if varHaveQuest > 0 then

		if x300943_CheckPlayerBagFull2( varMap ,varPlayer,selectId ) == 1 then
			return
		end	
		
		x300943_CheckPlayerBagFull1( varMap ,varPlayer,selectId )	

		if DelQuest(varMap, varPlayer, varQuest) ~= 1 then
			return
		end
		

		
		x300943_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
			GamePlayScriptLog(varMap, varPlayer, 2561)		
		local varBusID  =  GetBusId(varMap, varPlayer)
	  	if varBusID ~= -1  then
	     	
			if GetBusQuestID(varMap, varBusID) == varQuest then
	  			DeleteBus(varMap, varBusID,1)
	  				
			end
	  	end 


	else

		StartTalkTask( varMap )
			TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);

		return
	end		
end

function x300943_CheckPlayerBagFull( varMap ,varPlayer,selectId )

	local result = 1

	local j = 0

	local bAdd = 0 

	
	StartItemTask(varMap)
	for j, item in x300943_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
    end

	for j, item in x300943_var_BonusChoiceItem do
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

function x300943_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
 
    AddExp(varMap, varPlayer, x300943_YunBiaoExp(varMap, varPlayer))
    
    local PlayerValue = x300943_GetMD( varMap, varPlayer, MD_SHABAKE_ZHANZHENGJIQI_DATE)
    if PlayerValue <= 511 then
    	x300943_SetMD( varMap, varPlayer, MD_SHABAKE_ZHANZHENGJIQI_DATE, GetDayOfYear())
    end
    
    StartTalkTask(varMap)
    TalkAppendString(varMap,"您完成了任务：【沙城】运送战车");
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..x300943_YunBiaoExp(varMap, varPlayer).."点#cffcf00的奖励")

    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    Msg2Player(varMap,varPlayer,format("你完成了任务：%s",x300943_var_QuestName),8,2)
    Msg2Player(varMap,varPlayer,format("获得经验奖励#R%s#cffcf00点",x300943_YunBiaoExp(varMap, varPlayer)),8,2)
    --local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )
    local varRand = random (1,10000)
		if varRand <= 75 then
			local nCountryIdx1 = GetCurCountry(varMap, varPlayer)
			local SubmitNPCGUID1 = 0
			local message = ""
			local message1 = ""
			if nCountryIdx1 == 0 then
				SubmitNPCGUID1 = x300943_var_GetBossPos[1]
				message = "#cffcf00在沙城#R楼兰传送人#cffcf00附近"
				message1 = "在沙城楼兰传送人附近"
			elseif nCountryIdx1 == 1 then
				SubmitNPCGUID1 = x300943_var_GetBossPos[2]
				message = "#cffcf00在沙城#R天山传送人#cffcf00附近"
				message1 = "在沙城天山传送人附近"
			elseif nCountryIdx1 == 2 then	
				SubmitNPCGUID1 = x300943_var_GetBossPos[3]
				message = "#cffcf00在沙城#R昆仑传送人#cffcf00附近"
				message1 = "在沙城昆仑传送人附近"
			elseif nCountryIdx1 == 3 then
				SubmitNPCGUID1 = x300943_var_GetBossPos[4]
				message = "#cffcf00在沙城#R敦煌传送人#cffcf00附近"
				message1 = "在沙城敦煌传送人附近"	
			end	
			
			local Rand = random (1,2)
			if Rand <= 1 then
				CreateMonster( varMap, 56614, SubmitNPCGUID1.x, SubmitNPCGUID1.y, 1, -1, -1, -1, 21, 3600*1000)
			elseif Rand <= 2 then
				CreateMonster( varMap, 56615, SubmitNPCGUID1.x, SubmitNPCGUID1.y, 1, -1, -1, -1, 21, 3600*1000)
			end
			message = message.."出现了战车之灵逃亡者"
			message1 = message1.."出现了战车之灵逃亡者"
			--LuaAllScenceM2Wrold( varMap, message, CHAT_PLANE_SCROLL, 1 )
			LuaAllScenceM2Wrold( varMap, message1, CHAT_LEFTDOWN, 1 )
			LuaAllScenceM2Wrold( varMap, message, 5, 1 )
		end

end


function x300943_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	
	StartTalkTask(varMap)

		--任务完成信息
		TalkAppendString(varMap,"#Y"..x300943_var_QuestName)
		TalkAppendString(varMap,x300943_var_QuestCompleted)
		TalkAppendString(varMap,"\n#Y奖励内容：  ")

		local level = GetLevel(varMap, varPlayer)

		local ExpBonus = x300943_YunBiaoExp(varMap, varPlayer)
		if ExpBonus > 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end

	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300943_var_FileId, x300943_VarQuest(varMap, varPlayer))

end



function x300943_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	local SubmitNPCGUID = 0
	if nCountryIdx == 0 then
		SubmitNPCGUID = x300943_var_SubmitNPCGUID[1]
	elseif nCountryIdx == 1 then
		SubmitNPCGUID = x300943_var_SubmitNPCGUID[3]	
	elseif nCountryIdx == 2 then	
		SubmitNPCGUID = x300943_var_SubmitNPCGUID[2]	
	elseif nCountryIdx == 3 then
		SubmitNPCGUID = x300943_var_SubmitNPCGUID[4]	
	end	
	local QuestTarget = x300943_var_QuestTarget..format("@npc_%d",SubmitNPCGUID)
	StartTalkTask(varMap)

		--任务信息
		TalkAppendString(varMap,"#Y"..x300943_var_QuestName)
		TalkAppendString(varMap,format("%s", x300943_var_QuestInfo))
		TalkAppendString(varMap," ")

		--任务目标
		TalkAppendString( varMap,"#Y任务目标：")
		TalkAppendString( varMap,format("%s", QuestTarget))
		TalkAppendString( varMap," ")

		--提示信息
		if x300943_var_QuestHelp ~= "" then

			TalkAppendString(varMap,"#Y任务提示：")
			TalkAppendString(varMap,format("%s", x300943_var_QuestHelp))
			TalkAppendString(varMap," ")
		end

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x300943_YunBiaoExp(varMap, varPlayer)
		if ExpBonus > 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300943_var_FileId, varQuest)
end


function x300943_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,x300943_VarQuest(varMap, varPlayer) )
	local SubmitNPCGUID = 0
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	if nCountryIdx == 0 then
		SubmitNPCGUID = x300943_var_SubmitNPCGUID[1]
	elseif nCountryIdx == 1 then
		SubmitNPCGUID = x300943_var_SubmitNPCGUID[3]
	elseif nCountryIdx == 2 then
		SubmitNPCGUID = x300943_var_SubmitNPCGUID[2]
	elseif nCountryIdx == 3 then
		SubmitNPCGUID = x300943_var_SubmitNPCGUID[4]
	end	
	if varHaveQuest > 0 then
		if varTalkNpcGUID == SubmitNPCGUID then
				TalkAppendButton(varMap, x300943_VarQuest(varMap, varPlayer), x300943_var_QuestName, 7, 1)
		end
	end
end


function x300943_ProcQuestAbandon( varMap, varPlayer,varQuest )
	
--	if IsHaveQuestNM( varMap, varPlayer, x300943_VarQuest(varMap, varPlayer)) == 0 then	-- 如果没有这个任务
--		return
--	end
	local varBusID  =  GetBusId(varMap, varPlayer)	
	DelQuestNM( varMap, varPlayer, x300943_VarQuest(varMap, varPlayer))
	if varBusID ~= -1 then
		DeleteBus(varMap, varBusID,1)
	end
	local Readme = "你放弃了任务：【沙城】运送战车"
	StartTalkTask(varMap)
	TalkAppendString(varMap, Readme);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,Readme,8,2)

end

function x300943_YunBiaoExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = 0
	if nLevel < 60 then
		return 0
	end
	for i, j in x300943_var_GetPlayerExp do
		if nLevel >= j.level then
			nExp = nLevel * j.value
		else
			return nExp
		end
	end
	return nExp
end


function x300943_CheckPlayerBagFull2( varMap ,varPlayer,selectId )
	if x300943_ItemRandom(varMap ,varPlayer) == 5 then
	    StartItemTask( varMap)
	    ItemAppendBind( varMap, x300943_var_ReliveItem, 1)
	    if GetBagSpace(varMap, varPlayer) < 1 then
	        Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 3)
	        Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 2)
	        return 1
	    end
	    DeliverItemListSendToPlayer( varMap, varPlayer)
	end
    
end

function x300943_CheckPlayerBagFull1( varMap ,varPlayer,selectId )
	local countryId = GetCurCountry(varMap, varPlayer)	
	AddCountryResourceWithRecall(varMap, countryId, 1, 1, x300943_var_FileId, "ProcRequestNpcBuffSubResValid", varPlayer) 
    Msg2Player( varMap, varPlayer, "你的国家增加1石粮草资源", 8, 2)
    Msg2Player( varMap, varPlayer, "你的国家增加1石粮草资源", 8, 3)	
end

function x300943_ProcRequestNpcBuffSubResValid( varMap ,varCountry, varIndex, varResult, varPlayer)

	if varResult == 1 then
		return
	else
		AddCountryResourceWithRecall(varMap, varCountry, 1, 1, x300943_var_FileId, "ProcRequestNpcBuffSubResValid", varPlayer)    
	end
end

function x300943_ItemRandom(varMap ,varPlayer)
	local varX =random(1, 10)
	return varX
end


function x300943_VarQuest(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return x300943_var_QuestId[1]
	elseif nCountryIdx == 1 then
		return x300943_var_QuestId[2]
	elseif nCountryIdx == 2 then	
		return x300943_var_QuestId[3]
	elseif nCountryIdx == 3 then
		return x300943_var_QuestId[4]
	end	
end

function x300943_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x300943_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
