--DECLARE_QUEST_INFO_START--
x300947_var_FileId 						= 300947
x300947_var_QuestName					= "【沙城】护送物资"
x300947_var_QuestInfo					= "\t战车虽然顺利抵达，但沙城前线形势依然不容乐观。我这里有一批物资，正好可供军前使用，你就替我跑一趟吧。\n\t(完成任务可获得一石国家粮草，同时有一定几率获得#R皇帝战回魂丹#W)"
x300947_var_QuestCompleted				= "\t辎重无损，大军破敌指日可待！"
x300947_var_QuestTarget		 			= "  将物资送到"
x300947_var_QuestHelp					= "  将军用物资运送给#G沙城军需官"
x300947_var_NPCName						= "@npc_401204"
x300947_var_QuestRuse					= "\t将战争物资送到@npc_401204。"
x300947_var_LevelLess	= 	60
x300947_var_ShiCai						= 12030011
x300947_var_ReliveItem					= 11990401
x300947_var_QuestId						= {9205, 9206, 9207, 9208}
x300947_var_SubmitNPCGUID				= 401204  --昆仑，楼兰，天山，敦煌(回复)

x300947_var_Material					= 
{itemid = 13011609, itemname = "战争物资"}

x300947_var_GetPlayerExp				=  
{
{level = 60, value = 1400}, 
{level = 70, value = 2000},
{level = 80, value = 2000},
{level = 90, value = 2000},
{level = 100, value = 2000},
{level = 110, value = 2000},
}
--DECLARE_QUEST_INFO_STOP--
function x300947_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	if GetLevel(varMap, varPlayer) >= 60 then
		local state = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
		if IsHaveQuestNM( varMap, varPlayer, x300947_VarQuest(varMap, varPlayer) ) <= 0 then
				TalkAppendButton(varMap, x300947_VarQuest(varMap, varPlayer), x300947_var_QuestName, state)
			end
	end
end

function x300947_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )
	if x300947_GetDayCount_ZhanZhengJiQi(varMap, varPlayer) == 0 then
		Msg2Player(varMap, varPlayer, "请先到#R边塞#cffcf00找到#R桑素#cffcf00，完成任务#R【沙城】运送战车", 8, 3)
		return		
	end
	
	if x300947_GetMD( varMap, varPlayer, MD_SHABAKE_JUANXIANWUZI_DATE) == GetDayOfYear() then
		Msg2Player(varMap, varPlayer, format("你今天已经完成过#R%s#0#cffcf00任务",x300947_var_QuestName), 8, 3)
		return		
	end
	
	
	if IsHaveQuestNM( varMap, varPlayer, x300947_VarQuest(varMap, varPlayer) ) > 0 then
		local bDone = x300947_CheckSubmit(varMap, varPlayer, varTalknpc, varQuest)
		if(bDone > 0) then

				x300947_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest) --完成任务显示

		end	
	else
				x300947_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )		--任务信息显示

	end			

end

function x300947_CheckSubmit(varMap, varPlayer, varTalknpc, varQuest)		
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		WriteLog(1, "varTalkNpcGUID="..varTalkNpcGUID)
		WriteLog(1, "x300947_var_SubmitNPCGUID="..x300947_var_SubmitNPCGUID)		
		if IsHaveQuestNM( varMap, varPlayer, x300947_VarQuest(varMap, varPlayer) ) > 0 then
				if x300947_var_SubmitNPCGUID == varTalkNpcGUID then
					return 1
				else
					return 0
				end
			end 
end

function x300947_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if GetLevel(varMap, varPlayer) < 60 then
		Msg2Player(varMap, varPlayer, "等级不足", 8, 3)
		return
	end
	
	if x300947_GetDayCount_ZhanZhengJiQi(varMap, varPlayer) == 0 then
		Msg2Player(varMap, varPlayer, "请先完成任务#R【沙城】运送战车", 8, 3)
		return		
	end
	
	if x300947_GetMD( varMap, varPlayer, MD_SHABAKE_JUANXIANWUZI_DATE) == GetDayOfYear() then
		Msg2Player(varMap, varPlayer, format("已经完成过#R%s#0任务",x300947_var_QuestName), 8, 3)
		return		
	end
	
	if IsQuestFullNM( varMap, varPlayer )==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 
	end
	
	if x300947_CheckPlayerBagFull( varMap ,varPlayer,selectId ) == 1 then
		return
	end

	if AddQuestNM( varMap, varPlayer, x300947_VarQuest(varMap, varPlayer)) == 1 then
		
		--接任务写日志


		StartTalkTask(varMap)
		TalkAppendString(varMap, format("你接受了任务：%s",x300947_var_QuestName))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = format("你接受了任务：%s",x300947_var_QuestName)
		Msg2Player(varMap,varPlayer,Readme,8,2)
		local misIndex = GetQuestIndexByID(varMap, varPlayer, x300947_VarQuest(varMap, varPlayer));
		SetQuestByIndex( varMap, varPlayer, misIndex, 7, 1 )
		GamePlayScriptLog(varMap, varPlayer, 2562)
	end

end

function x300947_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	
	StartTalkTask(varMap)

		--任务完成信息
		TalkAppendString(varMap,"#Y"..x300947_var_QuestName)
		TalkAppendString(varMap,x300947_var_QuestCompleted)
		TalkAppendString(varMap,"\n#Y奖励内容：  ")

		local level = GetLevel(varMap, varPlayer)
		
		local ExpBonus = x300947_YunBiaoExp(varMap, varPlayer)
		if ExpBonus > 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end

	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300947_var_FileId, x300947_VarQuest(varMap, varPlayer))

end



function x300947_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	local SubmitNPCGUID = 0
	if nCountryIdx == 0 then
		SubmitNPCGUID = x300947_var_SubmitNPCGUID
	elseif nCountryIdx == 1 then
		SubmitNPCGUID = x300947_var_SubmitNPCGUID	
	elseif nCountryIdx == 2 then	
		SubmitNPCGUID = x300947_var_SubmitNPCGUID	
	elseif nCountryIdx == 3 then
		SubmitNPCGUID = x300947_var_SubmitNPCGUID
	end	
	local QuestTarget = x300947_var_QuestTarget..x300947_var_NPCName
	StartTalkTask(varMap)

		--任务信息
		TalkAppendString(varMap,"#Y"..x300947_var_QuestName)
		TalkAppendString(varMap,format("%s", x300947_var_QuestInfo))
		TalkAppendString(varMap," ")

		--任务目标
		TalkAppendString( varMap,"#Y任务目标：")
		TalkAppendString( varMap,format("%s", QuestTarget))
		TalkAppendString( varMap," ")

		--提示信息
		if x300947_var_QuestHelp ~= "" then

			TalkAppendString(varMap,"#Y任务提示：")
			TalkAppendString(varMap,format("%s", x300947_var_QuestHelp))
			TalkAppendString(varMap," ")
		end

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x300947_YunBiaoExp(varMap, varPlayer)
		if ExpBonus > 0 then
			AddQuestExpBonus(varMap, ExpBonus )
		end
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300947_var_FileId, varQuest)
end

function x300947_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

	local bHaveMission = IsHaveQuestNM(varMap, varPlayer,varQuest )

	local QuestTarget = x300947_var_QuestTarget..x300947_var_NPCName	
	if bHaveMission > 0 then
		StartTalkTask(varMap)
		AddQuestLogCustomText( varMap,
								"",								-- 标题
								x300947_var_QuestName,			-- 任务名字
								QuestTarget,					--任务目标
								x300947_var_NPCName,						--任务NPC
								x300947_var_QuestRuse,			--任务攻略
								x300947_var_QuestInfo,			--任务描述
								x300947_var_QuestHelp								--任务小提示
								)
		local varExp = 	x300947_YunBiaoExp(varMap, varPlayer)				
	  if varExp > 0 then
        AddQuestExpBonus( varMap, varExp)
    end							
				
		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
	end

end


function x300947_ProcQuestSubmit(varMap, varPlayer, varTalknpc, SelectId,varQuest)
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

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, varQuest);
	if varHaveQuest > 0 then

		local GetItemNum = GetItemCount(varMap, varPlayer, x300947_var_Material.itemid)
		if GetItemNum < 1 then
			Msg2Player( varMap, varPlayer, format("你没有任务道具:#R%s", x300947_var_Material.itemname), 8, 2)
			Msg2Player( varMap, varPlayer, format("你没有任务道具:#R%s", x300947_var_Material.itemname), 8, 3)				
			return
		end

		if x300947_CheckPlayerBagFull2( varMap ,varPlayer,selectId ) == 1 then
			return
		end	
		
		x300947_CheckPlayerBagFull1( varMap ,varPlayer,selectId )			
				
		if DelQuest(varMap, varPlayer, varQuest) ~= 1 then
			return
		end						
	
		
		x300947_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
						
	else

		StartTalkTask( varMap )
			TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);

		return
	end		
end


function x300947_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )

		GamePlayScriptLog(varMap, varPlayer, 2563)
    AddExp(varMap, varPlayer, x300947_YunBiaoExp(varMap, varPlayer))
    
    local PlayerValue = x300947_GetMD( varMap, varPlayer, MD_SHABAKE_JUANXIANWUZI_DATE)
    if PlayerValue <= 511 then
    	x300947_SetMD( varMap, varPlayer, MD_SHABAKE_JUANXIANWUZI_DATE, GetDayOfYear())
    end



	
    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务：%s",x300947_var_QuestName));
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..x300947_YunBiaoExp(varMap, varPlayer).."点#cffcf00的奖励")

    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    Msg2Player(varMap,varPlayer,format("你完成了任务：%s",x300947_var_QuestName),8,2)
    Msg2Player(varMap,varPlayer,format("获得经验奖励#R%s#cffcf00点",x300947_YunBiaoExp(varMap, varPlayer)),8,2)
		DelItem(varMap, varPlayer, x300947_var_Material.itemid, 1)

end


function x300947_CheckPlayerBagFull( varMap ,varPlayer,selectId )

    StartItemTask( varMap)
    ItemAppend( varMap, x300947_var_Material.itemid, 1)
    local result = StopItemTask( varMap, varPlayer)
    if result == 0 then
        Msg2Player( varMap, varPlayer, "背包已满，无法领取任务", 8, 3)
        Msg2Player( varMap, varPlayer, "背包已满，无法领取任务", 8, 2)
        return 1
    end
    DeliverItemListSendToPlayer( varMap, varPlayer)
    Msg2Player( varMap, varPlayer, format("你得到了任务道具:#R%s", x300947_var_Material.itemname), 8, 2)
    Msg2Player( varMap, varPlayer, format("你得到了任务道具:#R%s", x300947_var_Material.itemname), 8, 3)
end



function x300947_CheckPlayerBagFull2( varMap ,varPlayer,selectId )
	if x300947_ItemRandom(varMap ,varPlayer) == 5 then
	    StartItemTask( varMap)
	    ItemAppendBind( varMap, x300947_var_ReliveItem, 1)
	    if GetBagSpace(varMap, varPlayer) < 1 then
	        Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 3)
	        Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 2)
	        return 1
	    end
	    DeliverItemListSendToPlayer( varMap, varPlayer)
	end
    
end

function x300947_CheckPlayerBagFull1( varMap ,varPlayer,selectId )
	local countryId = GetCurCountry(varMap, varPlayer)	
	AddCountryResourceWithRecall(varMap, countryId, 1, 1, x300947_var_FileId, "ProcRequestNpcBuffSubResValid", varPlayer) 
    Msg2Player( varMap, varPlayer, "你的国家增加1石粮草资源", 8, 2)
    Msg2Player( varMap, varPlayer, "你的国家增加1石粮草资源", 8, 3)	
end

function x300947_ProcRequestNpcBuffSubResValid( varMap ,varCountry, varIndex, varResult, varPlayer)

	if varResult == 1 then
		return
	else
		AddCountryResourceWithRecall(varMap, varCountry, 1, 1, x300947_var_FileId, "ProcRequestNpcBuffSubResValid", varPlayer)    
	end
end

function x300947_ItemRandom(varMap ,varPlayer)
	local varX =random(1, 10)
	return varX
end


function x300947_ProcQuestAbandon( varMap, varPlayer,varQuest )
	

	local varBusID  =  GetBusId(varMap, varPlayer)	
	DelQuestNM( varMap, varPlayer, x300947_VarQuest(varMap, varPlayer))
	if varBusID ~= -1 then
		DeleteBus(varMap, varBusID,1)
	end
	local Readme = format("你放弃了任务：%s",x300947_var_QuestName)
	StartTalkTask(varMap)
	TalkAppendString(varMap, Readme);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,Readme,8,2)
	DelItem(varMap, varPlayer, x300947_var_Material.itemid, 1)
end

function x300947_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,x300947_VarQuest(varMap, varPlayer) )
			local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	if varHaveQuest > 0 then
		if varTalkNpcGUID == x300947_var_SubmitNPCGUID  then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x300947_VarQuest(varMap, varPlayer))
			TalkAppendButton(varMap, x300947_VarQuest(varMap, varPlayer), x300947_var_QuestName,7, 1)
		end
	end
end

function x300947_YunBiaoExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = 0
	if nLevel < 60 then
		return 0
	end
	for i, j in x300947_var_GetPlayerExp do
		if nLevel >= j.level then
			nExp = nLevel * j.value
		else
			return nExp
		end
	end
	return nExp
end


function x300947_GetDayCount_ZhanZhengJiQi(varMap, varPlayer)

	local varToday = GetDayOfYear()
	local varLastday = x300947_GetMD( varMap, varPlayer, MD_SHABAKE_ZHANZHENGJIQI_DATE)

	if varLastday ~= varToday then
		return 0
	else
		return 1
	end



end

function x300947_VarQuest(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return x300947_var_QuestId[2]
	elseif nCountryIdx == 1 then
		return x300947_var_QuestId[3]
	elseif nCountryIdx == 2 then	
		return x300947_var_QuestId[1]
	elseif nCountryIdx == 3 then
		return x300947_var_QuestId[4]
	end	
end

function x300947_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x300947_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
