--DECLARE_QUEST_INFO_START--
x300960_var_FileId 						= 300960
x300960_var_QuestName					= "【沙城】军前破敌"
x300960_var_QuestInfo					= "\t探马来报，沙城皇帝派#R失烈门#W驻守沙城中央塔下。\n\t素闻#R失烈门#W骁勇善战，有万夫不当之勇，我军若要攻克沙城，必先取此人首级！ \n\t(完成任务有一定几率获得#R黄金藏宝图#W)"
x300960_var_QuestCompleted				= "\t#R失烈门#W一死，沙城前防尽破，沙城十有八九为我军所有！"
x300960_var_QuestHelp					= "  杀死沙城大将#R@npc_82006"
x300960_var_NPCName						= "@npc_401204"
x300960_var_SubmitNPCGUID				= 401204
x300960_var_LevelLess					= 	60
x300960_var_QuestRuse					= "\t杀死沙城大将#R失烈门"
x300960_var_strQuestFinishTip			= "\t任务已经完成，快点回去汇报吧！"
x300960_var_ReliveItem					= 12035016
x300960_var_QuestId						= {9217, 9218, 9219, 9220}
x300960_var_SubmitNPCGUID				= {401260, 401261, 401262, 401263}   --楼兰，昆仑，天山，敦煌
x300960_var_varHonour         = 500    --战车荣誉
x300960_var_KillPlayerNumberSave		= {}

x300960_var_KillMonsterTable          	= {
                                        	{ level = 60, varX = 103,z = 103, monsterId = 10452, posId = 82006, varCount = 1, varName = "沙城大将失烈门", target = "  杀死沙城大将#R@npc_82006#W(%d/%d)"}
}

x300960_var_GetPlayerExp				=  
{
{level = 60, value = 20000},
{level = 70, value = 20000},
{level = 80, value = 20000},
{level = 90, value = 20000},
{level = 100, value = 20000},
{level = 110, value = 20000},
}
x300960_var_HasKaiserScript		=	310122 --有皇帝的脚本
--DECLARE_QUEST_INFO_STOP--

function x300960_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()	
	if weekIdx ~= 6 then
		return
	end
	
--	if minOfDay < 1200 or minOfDay > 1260 then
--		return
--	end


	if 	GetEmpireCountry() == GetCurCountry(varMap, varPlayer)  or GetEmpireCountry() == -1 then
		return
	end

	if GetLevel(varMap, varPlayer) < 60 then
		return
	end

--	if (LuaCallNoclosure(x300960_var_HasKaiserScript, "IsBattleStarted", varMap) ~= 1) then
--    	Msg2Player(varMap, varPlayer, "请在皇帝战期间领取本任务", 8, 3)
--		return
--	end

		if IsHaveQuestNM( varMap, varPlayer, x300960_VarQuest(varMap, varPlayer) ) <= 0 then
			local state = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x300960_VarQuest(varMap, varPlayer), x300960_var_QuestName, state)
		end

end


function x300960_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )


	if IsHaveQuestNM( varMap, varPlayer, x300960_VarQuest(varMap, varPlayer) ) > 0 then
		local bDone = x300960_CheckSubmit(varMap, varPlayer, varTalknpc, varQuest)
		if(bDone > 0) then

				x300960_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest) --完成任务显示

		else

				x300960_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest ) --未完成任务显示

		end	
	else
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		local SubmitNPCGUID = 0
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		local nCountryIdx = GetCurCountry(varMap, varPlayer)
		if nCountryIdx == 0 then
			SubmitNPCGUID = x300960_var_SubmitNPCGUID[2]
		elseif nCountryIdx == 1 then
			SubmitNPCGUID = x300960_var_SubmitNPCGUID[3]
		elseif nCountryIdx == 2 then
			SubmitNPCGUID = x300960_var_SubmitNPCGUID[1]
		elseif nCountryIdx == 3 then
			SubmitNPCGUID = x300960_var_SubmitNPCGUID[4]
		end			
		if SubmitNPCGUID == varTalkNpcGUID  then
			x300960_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )		--任务信息显示
		end
	end			

end

function x300960_CheckSubmit(varMap, varPlayer, varTalknpc, varQuest)
	local SubmitNPCGUID = 0
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	local num = 1
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	if nCountryIdx == 0 then
		SubmitNPCGUID = x300960_var_SubmitNPCGUID[2]
	elseif nCountryIdx == 1 then
		SubmitNPCGUID = x300960_var_SubmitNPCGUID[3]
	elseif nCountryIdx == 2 then
		SubmitNPCGUID = x300960_var_SubmitNPCGUID[1]
	elseif nCountryIdx == 3 then
		SubmitNPCGUID = x300960_var_SubmitNPCGUID[4]
	end	

		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300960_VarQuest(varMap, varPlayer))
		local KilledNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 1) 	
 
		if SubmitNPCGUID == varTalkNpcGUID  then
				if KilledNum < x300960_var_KillMonsterTable[num].varCount then
						return 0
				else
						return 1
				end
			
		end
end

function x300960_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )


	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()	
	if weekIdx ~= 6 then
		return
	end
	
--	if minOfDay < 1200or minOfDay > 1260 then
--		return
--	end

	if 	GetEmpireCountry() == GetCurCountry(varMap, varPlayer)  or GetEmpireCountry() == -1 then  --皇帝的国家id
		return
	end


	
	if GetLevel(varMap, varPlayer) < 60 then
		Msg2Player(varMap, varPlayer, "等级不足", 8, 3)
		return
	end
	
	if (LuaCallNoclosure(x300960_var_HasKaiserScript, "IsBattleStarted", varMap) ~= 1) then
	   Msg2Player(varMap, varPlayer, "请在皇帝战期间领取本任务", 8, 3)
		return
	end	
	
	
	if x300960_GetMD( varMap, varPlayer, MD_SHABAKE_JUNQIANPODI_DATE) == GetDayOfYear() then
		Msg2Player(varMap, varPlayer, format("你在本次战斗中已经完成过#R%s#cffcf00任务",x300960_var_QuestName), 8, 3)
		return		
	end
	
	if IsQuestFullNM( varMap, varPlayer )==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 
	end
	


	if AddQuest( varMap, varPlayer, x300960_VarQuest(varMap, varPlayer),x300960_var_FileId,1,0,0,1) == 1 then
	
		
		--接任务写日志


		StartTalkTask(varMap)
		TalkAppendString(varMap, format("你接受了任务：%s",x300960_var_QuestName))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = format("你接受了任务：%s",x300960_var_QuestName)
		Msg2Player(varMap,varPlayer,Readme,8,2)
		local misIndex = GetQuestIndexByID(varMap, varPlayer, x300960_VarQuest(varMap, varPlayer));
		SetQuestByIndex( varMap, varPlayer, misIndex, 0, 0 )
		GamePlayScriptLog(varMap, varPlayer, 2568)
	end

end

function x300960_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	
	StartTalkTask(varMap)

		--任务完成信息
		TalkAppendString(varMap,"#Y"..x300960_var_QuestName)
		TalkAppendString(varMap,x300960_var_QuestCompleted)

		local level = GetLevel(varMap, varPlayer)

		local ExpBonus = x300960_YunBiaoExp(varMap, varPlayer)
		if ExpBonus > 0 then
				TalkAppendString(varMap,"#Y奖励内容：")
				TalkAppendString(varMap,"#W经验值："..ExpBonus)
				TalkAppendString(varMap,"#W战车荣誉:"..x300960_var_varHonour.."点")
		end

	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300960_var_FileId, x300960_VarQuest(varMap, varPlayer))

end


function x300960_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	
	StartTalkTask(varMap)

		--任务继续信息
		TalkAppendString(varMap,"#Y"..x300960_var_QuestName)
		TalkAppendString(varMap,format("%s", x300960_var_QuestInfo))
		TalkAppendString(varMap," ")

		--任务目标
		TalkAppendString( varMap,"#Y完成情况：")
		TalkAppendString(varMap, "未完成");

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x300960_YunBiaoExp(varMap, varPlayer)
		if ExpBonus> 0 then
				TalkAppendString(varMap,"#Y奖励内容：")
				TalkAppendString(varMap,"#W经验值："..ExpBonus)
				TalkAppendString(varMap,"#W战车荣誉:"..x300960_var_varHonour.."点")
		end

	StopTalkTask(varMap)
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300960_var_FileId, varQuest,0);



end

function x300960_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )
	local num = 1
  local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300960_VarQuest(varMap, varPlayer))
	local KilledNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 1) 	
	StartTalkTask(varMap)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300960_VarQuest(varMap, varPlayer))
	if x300960_var_KillPlayerNumberSave[GetGUID(varMap, varPlayer)] == nil then
		x300960_var_KillPlayerNumberSave[GetGUID(varMap, varPlayer)] = 0
	end
	local questtarget  = format(x300960_var_KillMonsterTable[num].target, KilledNum , x300960_var_KillMonsterTable[num].varCount)

		--任务信息
		TalkAppendString(varMap,"#Y"..x300960_var_QuestName)
		TalkAppendString(varMap,format("%s".."\n", x300960_var_QuestInfo))

		--任务目标
		TalkAppendString( varMap,"#Y任务目标：\n"..questtarget.."\n")

		--提示信息
		if x300960_var_QuestHelp ~= "" then

			TalkAppendString(varMap,"#Y任务提示：")
			TalkAppendString(varMap,format("%s".."\n", x300960_var_QuestHelp))
		end

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x300960_YunBiaoExp(varMap, varPlayer)
		if ExpBonus > 0 then
				TalkAppendString(varMap,"#Y奖励内容：")
				TalkAppendString(varMap,"#W经验值："..ExpBonus)
				TalkAppendString(varMap,"#W战车荣誉:"..x300960_var_varHonour.."点")
		end
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300960_var_FileId, varQuest)
end

function x300960_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

  local varLevel = GetLevel( varMap, varPlayer)
	local num = 1	
	local varExp = 	x300960_YunBiaoExp(varMap, varPlayer)	
  local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300960_VarQuest(varMap, varPlayer))
	local KilledNum = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)    
	local bHaveMission = IsHaveQuestNM(varMap, varPlayer,x300960_VarQuest(varMap, varPlayer) )
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	local SubmitNPCGUID = 0
	if nCountryIdx == 0 then
		SubmitNPCGUID = x300960_var_SubmitNPCGUID[2]
	elseif nCountryIdx == 1 then
		SubmitNPCGUID = x300960_var_SubmitNPCGUID[3]	
	elseif nCountryIdx == 2 then	
		SubmitNPCGUID = x300960_var_SubmitNPCGUID[1]	
	elseif nCountryIdx == 3 then
		SubmitNPCGUID = x300960_var_SubmitNPCGUID[4]	
	end		
	local questtarget  = format(x300960_var_KillMonsterTable[num].target, KilledNum, x300960_var_KillMonsterTable[num].varCount)
	local questtarget1 = format(questtarget.."#Y\n奖励内容：\n#W经验值："..varExp.."点".."\n#W战车荣誉："..x300960_var_varHonour.."点")
	local SubmitNPC = format("@npc_%s", SubmitNPCGUID)
	if bHaveMission > 0 then
		StartTalkTask(varMap)
		AddQuestLogCustomText( varMap,
								"",								-- 标题
								x300960_var_QuestName,			-- 任务名字
								questtarget,					--任务目标
								SubmitNPC,
								questtarget1,			--任务攻略
								x300960_var_QuestInfo,			--任务描述
								x300960_var_QuestHelp								--任务小提示
								)
					
				
		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, x300960_VarQuest(varMap, varPlayer));
	end

end



function x300960_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

	local num = 1
	local varX,z = GetWorldPos(varMap,varPlayer)
	local Nearnum =  GetNearPlayerCount(varMap, varPlayer,varX,z,30) 	
	

	if 	GetEmpireCountry() == GetCurCountry(varMap, varPlayer)  or GetEmpireCountry() == -1 then
		return
	end

	
	for varI = 0, Nearnum-1 do
		local humanObjId = GetNearPlayerMember(varMap, varPlayer,varI)
		local varQuestIdx = GetQuestIndexByID( varMap, humanObjId, x300960_VarQuest(varMap, varPlayer))
		local KilledNum = GetQuestParam( varMap, humanObjId, varQuestIdx, 1)	
		if IsHaveQuestNM( varMap, humanObjId, x300960_VarQuest(varMap, varPlayer) ) > 0 then
			if varObjData == x300960_var_KillMonsterTable[num].monsterId and KilledNum < x300960_var_KillMonsterTable[num].varCount then
				SetQuestByIndex( varMap, humanObjId, varQuestIdx, 1, KilledNum + 1)	
			else
				return
			end
			KilledNum = GetQuestParam( varMap, humanObjId, varQuestIdx, 1)
			if KilledNum >= x300960_var_KillMonsterTable[num].varCount then
				SetQuestByIndex( varMap, humanObjId, varQuestIdx, 0, 1)
				SetQuestByIndex( varMap, humanObjId, varQuestIdx, 7, 1)
		        Msg2Player( varMap, humanObjId, format( "已消灭#G%s#cffcf00(%d/%d)", x300960_var_KillMonsterTable[num].varName, KilledNum, x300960_var_KillMonsterTable[num].varCount), 8, 3)
		        Msg2Player( varMap, humanObjId, x300960_var_strQuestFinishTip, 8, 3)
				x300960_ProcQuestLogRefresh( varMap, humanObjId, x300960_VarQuest(varMap, varPlayer))
			end
		end
    end		
end



function x300960_ProcQuestSubmit(varMap, varPlayer, varTalknpc, SelectId,varQuest)


	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300960_VarQuest(varMap, varPlayer))

	local nlevel = GetLevel( varMap, varPlayer)
	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, varQuest);
	
	if nlevel < 60 then
		Msg2Player(varMap,varPlayer,"等级过低，无法提交此任务！",8,3)
		return
	end


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
		if x300960_CheckPlayerBagFull1( varMap ,varPlayer,selectId ) == 1 then
			return
		end	
		
		if DelQuest(varMap, varPlayer, varQuest) ~= 1 then
			return
		end						
		x300960_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
						
	else

		StartTalkTask( varMap )
			TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);

		return
	end		
end


function x300960_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
 GamePlayScriptLog(varMap, varPlayer, 2569)
    AddExp(varMap, varPlayer, x300960_YunBiaoExp(varMap, varPlayer))
    AddPlayerChariotHonour(varMap, varPlayer, x300960_var_varHonour) 
    x300960_SetMD( varMap, varPlayer, MD_SHABAKE_JUNQIANPODI_DATE, GetDayOfYear())

    
    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务：%s",x300960_var_QuestName));
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..x300960_YunBiaoExp(varMap, varPlayer).."点#cffcf00的奖励")
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R战车荣誉"..x300960_var_varHonour.."点#cffcf00的奖励")
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer) 
    
    Msg2Player(varMap,varPlayer,format("你完成了任务：%s",x300960_var_QuestName),8,2)
    Msg2Player(varMap,varPlayer,format("获得经验奖励#R%s#cffcf00点",x300960_YunBiaoExp(varMap, varPlayer)),8,2)
    Msg2Player(varMap,varPlayer,format("获得战车荣誉奖励#R%s#cffcf00点",x300960_var_varHonour),8,2)

end

function x300960_ProcQuestAbandon( varMap, varPlayer,varQuest )
	

	local varBusID  =  GetBusId(varMap, varPlayer)	
	DelQuestNM( varMap, varPlayer, x300960_VarQuest(varMap, varPlayer))
	if varBusID ~= -1 then
		DeleteBus(varMap, varBusID,1)
	end
	local Readme = format("你放弃了任务：%s",x300960_var_QuestName)
	StartTalkTask(varMap)
	TalkAppendString(varMap, Readme);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,Readme,8,2)

end

function x300960_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	local SubmitNPCGUID = 0
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	if nCountryIdx == 0 then
		SubmitNPCGUID = x300960_var_SubmitNPCGUID[2]
	elseif nCountryIdx == 1 then
		SubmitNPCGUID = x300960_var_SubmitNPCGUID[3]
	elseif nCountryIdx == 2 then
		SubmitNPCGUID = x300960_var_SubmitNPCGUID[1]
	elseif nCountryIdx == 3 then
		SubmitNPCGUID = x300960_var_SubmitNPCGUID[4]
	end	
	if IsHaveQuestNM( varMap, varPlayer, varQuest) <= 0 then	-- 如果没有这个任务
		return
	end

	if varTalkNpcGUID == SubmitNPCGUID then
		local state = GetQuestStateNM(varMap,varPlayer,varTalknpc,x300960_VarQuest(varMap, varPlayer))	
		TalkAppendButton(varMap, x300960_VarQuest(varMap, varPlayer), x300960_var_QuestName,state)
	end

	

end

function x300960_YunBiaoExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = 0
	if nLevel < 40 then
		return
	end
	for i, j in x300960_var_GetPlayerExp do
		if nLevel >= j.level then
			nExp = nLevel * j.value
		else
			return nExp
		end
	end
	return nExp
end

function x300960_CheckPlayerBagFull1( varMap ,varPlayer,selectId )
	if x300960_ItemRandom(varMap ,varPlayer) == 5 then
	    StartItemTask( varMap)
	    ItemAppend( varMap, x300960_var_ReliveItem, 1)
	    if GetBagSpace(varMap, varPlayer) < 1 then
	        Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 3)
	        Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 2)
	        return 1
	    end
	    DeliverItemListSendToPlayer( varMap, varPlayer)
		
		local EncouragingMessage = format("恭喜%s在【沙城】以一敌百任务中幸运获得黄金藏宝图！",GetName( varMap, varPlayer))
		LuaAllScenceM2Wrold(varMap, EncouragingMessage, CHAT_PLANE_SCROLL, 1)
		LuaAllScenceM2Wrold(varMap, EncouragingMessage, CHAT_LEFTDOWN, 1)
		LuaAllScenceM2Wrold(varMap, EncouragingMessage, CHAT_MAIN_RIGHTDOWN, 1)	      	    
	end
    
end


function x300960_ItemRandom(varMap ,varPlayer)
	local varX =random(1, 100)
	return varX
end

function x300960_GetPlayerStanding(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	local getstanding = GetCountryParamByBit(nCountryIdx, CD_KAISER_BATTLE_INFO, 0, 2)
	return getstanding
end


function x300960_VarQuest(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return x300960_var_QuestId[2]
	elseif nCountryIdx == 1 then
		return x300960_var_QuestId[3]
	elseif nCountryIdx == 2 then	
		return x300960_var_QuestId[1]
	elseif nCountryIdx == 3 then
		return x300960_var_QuestId[4]
	end	
end


function x300960_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x300960_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
