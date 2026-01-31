--DECLARE_QUEST_INFO_START--
x300961_var_FileId 						= 300961
x300961_var_HasKaiserScript		=	310122 --有皇帝的脚本
x300961_var_QuestName					= "【沙城】以一敌百"
x300961_var_QuestInfo					= "\t我军兵临城下，沙城皇帝必然调军勤王，你若在沙城城内遭遇勤王敌军,可奋勇击杀，以此振我军心！ \n\t(完成任务有一定几率获得#R黄金藏宝图#W)"
x300961_var_QuestCompleted				= "\t沙城皇帝若是知道这个消息，想必惶惶不安吧。哈哈！"
x300961_var_QuestHelp					= "  #W击杀#R50#W名#R沙城城内#W皇帝阵营成员"
x300961_var_NPCName						= "@npc_401204"
x300961_var_SubmitNPCGUID				= 401204
x300961_var_LevelLess	= 	60
x300961_var_QuestRuse					= "  #W杀死沙城城内50个#R皇帝方玩家"
x300961_var_strQuestFinishTip			= "\t任务已经完成，快点回去汇报吧！"

x300961_var_QuestId						= {9221, 9222, 9223, 9224}
x300961_var_SubmitNPCGUID				= {401260, 401261, 401262, 401263}   --楼兰，昆仑，天山，敦煌
x300961_var_ReliveItem					= 12035016
x300961_var_BonusItem					= {}
x300961_var_BonusChoiceItem				= {}

x300961_var_KillPlayerNumber			= 50
x300961_var_varHonour         = 1500   --战车荣誉
x300961_var_KillPlayerNumberSave		= {}
x300961_var_GetPlayerExp				=
{
{level = 60, value = 40000},
{level = 70, value = 40000},
{level = 80, value = 40000},
{level = 90, value = 40000},
{level = 100, value = 40000},
{level = 110, value = 40000},
}
--DECLARE_QUEST_INFO_STOP--


function x300961_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

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

	if x300961_GetPlayerStanding(varMap, varPlayer) == 0 or x300961_GetPlayerStanding(varMap, varPlayer) == 2 then --辅攻0，主攻2
		if IsHaveQuestNM( varMap, varPlayer, x300961_VarQuest(varMap, varPlayer) ) <= 0 then
			local state = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x300961_VarQuest(varMap, varPlayer), x300961_var_QuestName, state)
		end
	end
end


function x300961_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )


	if IsHaveQuestNM( varMap, varPlayer, x300961_VarQuest(varMap, varPlayer) ) > 0 then
		local bDone = x300961_CheckSubmit(varMap, varPlayer, varTalknpc, varIndex)
		if(bDone > 0) then

				x300961_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest) --完成任务显示

		else

				x300961_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest ) --未完成任务显示

		end
	else

		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		local SubmitNPCGUID = 0
		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		local nCountryIdx = GetCurCountry(varMap, varPlayer)
		if nCountryIdx == 0 then
			SubmitNPCGUID = x300961_var_SubmitNPCGUID[2]
		elseif nCountryIdx == 1 then
			SubmitNPCGUID = x300961_var_SubmitNPCGUID[3]
		elseif nCountryIdx == 2 then
			SubmitNPCGUID = x300961_var_SubmitNPCGUID[1]
		elseif nCountryIdx == 3 then
			SubmitNPCGUID = x300961_var_SubmitNPCGUID[4]
		end
		if SubmitNPCGUID == varTalkNpcGUID  then
			x300961_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )		--任务信息显示
		end
	end

end



function x300961_CheckSubmit(varMap, varPlayer, varTalknpc, varIndex)
	local SubmitNPCGUID = 0
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)

	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	if nCountryIdx == 0 then
		SubmitNPCGUID = x300961_var_SubmitNPCGUID[2]
	elseif nCountryIdx == 1 then
		SubmitNPCGUID = x300961_var_SubmitNPCGUID[3]
	elseif nCountryIdx == 2 then
		SubmitNPCGUID = x300961_var_SubmitNPCGUID[1]
	elseif nCountryIdx == 3 then
		SubmitNPCGUID = x300961_var_SubmitNPCGUID[4]
	end
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300961_VarQuest(varMap, varPlayer))
		
--	if x300961_var_KillPlayerNumberSave[GetGUID(varMap, varPlayer)] == nil then
--		x300961_var_KillPlayerNumberSave[GetGUID(varMap, varPlayer)] = 0
--	end		
	local KilledNum =  x300961_GetMD( varMap, varPlayer, MD_SHABAKE_YIYIDIBAI_COUNT)

	if SubmitNPCGUID == varTalkNpcGUID  then
				if KilledNum < x300961_var_KillPlayerNumber then
						return 0
				else
						return 1
				end
	end
end

function x300961_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )


	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	if weekIdx ~= 6 then
		return
	end

	if minOfDay < 1200 or minOfDay > 1260 then
		return
	end

	if (LuaCallNoclosure(x300961_var_HasKaiserScript, "IsBattleStarted", varMap) ~= 1) then
	    Msg2Player(varMap, varPlayer, "请在皇帝战期间领取本任务", 8, 3)

		return
	end

	if 	GetEmpireCountry() == GetCurCountry(varMap, varPlayer)  or GetEmpireCountry() == -1 then
		return
	end

	if GetLevel(varMap, varPlayer) < 60 then
		Msg2Player(varMap, varPlayer, "等级不足", 8, 3)
		return
	end

	if x300961_GetMD( varMap, varPlayer, MD_SHABAKE_YIYIDIBAI_DATE) == GetDayOfYear() then
		Msg2Player(varMap, varPlayer, format("你在本次战斗中已经完成过#R%s#0#cffcf00任务",x300961_var_QuestName), 8, 3)
		return
	end

	if IsQuestFullNM( varMap, varPlayer )==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end


	if AddQuestNM( varMap, varPlayer, x300961_VarQuest(varMap, varPlayer)) == 1 then

		--接任务写日志
		StartTalkTask(varMap)
		TalkAppendString(varMap, format("你接受了任务：%s",x300961_var_QuestName))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = format("你接受了任务：%s",x300961_var_QuestName)
		Msg2Player(varMap,varPlayer,Readme,8,2)
		local misIndex = GetQuestIndexByID(varMap, varPlayer, x300961_VarQuest(varMap, varPlayer));
		SetQuestByIndex( varMap, varPlayer, misIndex, 0, 0 )
		GamePlayScriptLog(varMap, varPlayer, 2571)
	end

end

function x300961_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )

	StartTalkTask(varMap)

		--任务完成信息
		TalkAppendString(varMap,"#Y"..x300961_var_QuestName)
		TalkAppendString(varMap,x300961_var_QuestCompleted)

		local level = GetLevel(varMap, varPlayer)

		local ExpBonus = x300961_YunBiaoExp(varMap, varPlayer)
		if ExpBonus > 0 then
				TalkAppendString(varMap,"#Y奖励内容：")
				TalkAppendString(varMap,"#W经验值："..ExpBonus)
				TalkAppendString(varMap,"#W战车荣誉:"..x300961_var_varHonour.."点")
		end

	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300961_var_FileId, x300961_VarQuest(varMap, varPlayer))

end


function x300961_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )


	StartTalkTask(varMap)

		--任务继续信息
		TalkAppendString(varMap,"#Y"..x300961_var_QuestName)
		TalkAppendString(varMap,format("%s", x300961_var_QuestInfo))
		TalkAppendString(varMap," ")

		--任务目标
		TalkAppendString( varMap,"#Y完成情况：")
		TalkAppendString(varMap, "未完成");

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x300961_YunBiaoExp(varMap, varPlayer)
		if ExpBonus> 0 then
				TalkAppendString(varMap,"#Y奖励内容：")
				TalkAppendString(varMap,"#W经验值："..ExpBonus)
				TalkAppendString(varMap,"#W战车荣誉:"..x300961_var_varHonour.."点")
		end

	StopTalkTask(varMap)
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300961_var_FileId, varQuest,0);



end

function x300961_DispatchMissionInfo( varMap, varPlayer, varTalknpc,varQuest )

	StartTalkTask(varMap)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300961_VarQuest(varMap, varPlayer))
--	if x300961_var_KillPlayerNumberSave[GetGUID(varMap, varPlayer)] == nil then
--		x300961_var_KillPlayerNumberSave[GetGUID(varMap, varPlayer)] = 0
--	end
		--local questtarget  =  format("  击杀沙城内城中的#R%d#W名皇帝阵营玩家(%d/%d)", x300961_var_KillPlayerNumber, x300961_var_KillPlayerNumberSave[GetGUID(varMap, varPlayer)], x300961_var_KillPlayerNumber)

		--任务信息
		TalkAppendString(varMap,"#Y"..x300961_var_QuestName)
		TalkAppendString(varMap,format("%s".."\n", x300961_var_QuestInfo))

		--任务目标
		TalkAppendString( varMap,"#Y任务目标：\n"..x300961_var_QuestRuse.."\n")

		--提示信息
		if x300961_var_QuestHelp ~= "" then

			TalkAppendString(varMap,"#Y任务提示：")
			TalkAppendString(varMap,format("%s".."\n", x300961_var_QuestHelp))
		end

		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local ExpBonus = x300961_YunBiaoExp(varMap, varPlayer)
		if ExpBonus > 0 then
				TalkAppendString(varMap,"#Y奖励内容：")
				TalkAppendString(varMap,"#W经验值："..ExpBonus)
				TalkAppendString(varMap,"#W战车荣誉:"..x300961_var_varHonour.."点")
		end
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300961_var_FileId, varQuest)
end

function x300961_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

  local varLevel = GetLevel( varMap, varPlayer)
	local varExp = 	x300961_YunBiaoExp(varMap, varPlayer)
  local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300961_VarQuest(varMap, varPlayer))
 	local questtarget = ""
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	local SubmitNPCGUID = 0
	if nCountryIdx == 0 then
		SubmitNPCGUID = x300961_var_SubmitNPCGUID[2]
	elseif nCountryIdx == 1 then
		SubmitNPCGUID = x300961_var_SubmitNPCGUID[3]
	elseif nCountryIdx == 2 then
		SubmitNPCGUID = x300961_var_SubmitNPCGUID[1]
	elseif nCountryIdx == 3 then
		SubmitNPCGUID = x300961_var_SubmitNPCGUID[4]
	end
	local bHaveMission = IsHaveQuestNM(varMap, varPlayer,x300961_VarQuest(varMap, varPlayer) )
	local SubmitNPC = format("@npc_%s", SubmitNPCGUID)
--	if x300961_var_KillPlayerNumberSave[GetGUID(varMap, varPlayer)] == nil then
--		x300961_var_KillPlayerNumberSave[GetGUID(varMap, varPlayer)] = 0
--	end
	local Num = x300961_GetMD( varMap, varPlayer, MD_SHABAKE_YIYIDIBAI_COUNT)
	if Num < x300961_var_KillPlayerNumber then
    	questtarget  = format("  击杀#R%d#W名#G沙城城内#W皇帝方玩家(%d/%d)", x300961_var_KillPlayerNumber, Num, x300961_var_KillPlayerNumber)
	else
		questtarget	= format("  击杀#R%d#W名#G沙城城内#W皇帝方玩家(%d/%d)", x300961_var_KillPlayerNumber, Num, x300961_var_KillPlayerNumber)
	end
	local questtarget1 = format(questtarget.."#Y\n奖励内容：\n#W经验值："..varExp.."点".."\n#W战车荣誉："..x300961_var_varHonour.."点")
	if bHaveMission > 0 then
		StartTalkTask(varMap)
		AddQuestLogCustomText( varMap,
								"",								-- 标题
								x300961_var_QuestName,			-- 任务名字
								questtarget,					--任务目标
								SubmitNPC,
								questtarget1,			--任务攻略
								x300961_var_QuestInfo,			--任务描述
								x300961_var_QuestHelp								--任务小提示
								)

		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, x300961_VarQuest(varMap, varPlayer));
	end

end





function x300961_ProcPlayerDie(varMap, varPlayer, varKiller)
	local varX,z = GetWorldPos(varMap,varPlayer)
	local varQuestIdx = GetQuestIndexByID( varMap, varKiller, x300961_VarQuest(varMap, varKiller))
	local nKillerType = GetObjType(varMap, varKiller)
	local teamid = GetTeamId(varMap, varKiller)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	local teamnum = GetNearTeamCount(varMap, varKiller)
	--当杀人者为怪物则返回

	if nKillerType == 2 then
		return
	end

	if nKillerType == 3 then
		varKiller = GetOwnerID(varMap, varKiller)
	end

	if varMap ~= 472 then
		return
	end

	--如果皇帝战结束,则不算
	if (LuaCallNoclosure(x300961_var_HasKaiserScript, "IsBattleStarted", varMap) ~= 1) then
		return
	end

	if  GetCurCountry(varMap, varPlayer) ~= GetEmpireCountry()  or GetEmpireCountry() == -1 then
		return
	end

	if varX < 182 or varX > 338 then
		return
	end

	if z < 25 or z > 225 then
		return
	end

	local Num = x300961_GetMD( varMap, varKiller, MD_SHABAKE_YIYIDIBAI_COUNT)	
		if teamid == -1 then
			if IsHaveQuestNM( varMap, varKiller, x300961_VarQuest(varMap, varKiller) ) > 0 then
--			if x300961_var_KillPlayerNumberSave[GetGUID(varMap, varKiller)] == nil then
--				x300961_var_KillPlayerNumberSave[GetGUID(varMap, varKiller)] = 0
----			end
--			x300961_var_KillPlayerNumberSave[GetGUID(varMap, varKiller)] = x300961_var_KillPlayerNumberSave[GetGUID(varMap, varKiller)] + 1
				if Num < x300961_var_KillPlayerNumber and Num <=50 then
					x300961_SetMD( varMap, varKiller, MD_SHABAKE_YIYIDIBAI_COUNT, Num + 1)
				end
				
				if Num + 1 >= x300961_var_KillPlayerNumber then
					  SetQuestByIndex( varMap, varKiller, varQuestIdx, 7, 1)
--					SetQuestByIndex( varMap, varKiller, varQuestIdx, 0, Num)
					x300961_ProcQuestLogRefresh( varMap, varKiller, varQuest)
		  	      Msg2Player( varMap, varKiller, x300961_var_strQuestFinishTip, 8, 3)
		  	else
					Msg2Player(varMap, varKiller, format( "已消灭#G皇帝国家玩家#cffcf00(%d/%d)",Num+1, x300961_var_KillPlayerNumber), 8, 3)
					x300961_ProcQuestLogRefresh( varMap, varKiller, varQuest)
				end
			end
		else
			if IsHaveQuestNM( varMap, varKiller, x300961_VarQuest(varMap, varKiller) ) > 0 then 
        for varI = 0, teamnum - 1 do
            	local memberId = GetNearTeamMember(varMap, varKiller, varI)
--				if x300961_var_KillPlayerNumberSave[GetGUID(varMap, memberId)] == nil then
--					x300961_var_KillPlayerNumberSave[GetGUID(varMap, memberId)] = 0
--				end
--				x300961_var_KillPlayerNumberSave[GetGUID(varMap, memberId)] = x300961_var_KillPlayerNumberSave[GetGUID(varMap, memberId)] + 1
					if Num <=50 then
						x300961_SetMD( varMap, memberId, MD_SHABAKE_YIYIDIBAI_COUNT, Num + 1)
					end
					
					if Num + 1 >= x300961_var_KillPlayerNumber then
  						SetQuestByIndex( varMap, memberId, varQuestIdx, 7, 1)
--						SetQuestByIndex( varMap, memberId, varQuestIdx, 0, Num)
						x300961_ProcQuestLogRefresh( varMap, memberId, varQuest)
			  	  Msg2Player( varMap, memberId, x300961_var_strQuestFinishTip, 8, 3)
			  	else
						Msg2Player(varMap, memberId, format( "已消灭#G皇帝国家玩家#cffcf00(%d/%d)",Num+1, x300961_var_KillPlayerNumber), 8, 3)
						x300961_ProcQuestLogRefresh( varMap, memberId, varQuest)
					end
				end
			end
		end
end



function x300961_ProcQuestSubmit(varMap, varPlayer, varTalknpc, SelectId,varQuest)


	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300961_VarQuest(varMap, varPlayer))

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
		if x300961_CheckPlayerBagFull1( varMap ,varPlayer,selectId ) == 1 then
			return
		end


		if DelQuest(varMap, varPlayer, varQuest) ~= 1 then
			return
		end

		x300961_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )

	else

		StartTalkTask( varMap )
			TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer);

		return
	end
end


function x300961_GetBonusWhenOverQuest( varMap, varPlayer,varTalknpc, varButtonClick,varQuest )
GamePlayScriptLog(varMap, varPlayer, 2572)

    AddExp(varMap, varPlayer, x300961_YunBiaoExp(varMap, varPlayer))
    AddPlayerChariotHonour(varMap, varPlayer, x300961_var_varHonour) 
    x300961_SetMD( varMap, varPlayer, MD_SHABAKE_YIYIDIBAI_DATE, GetDayOfYear()) 
    x300961_SetMD( varMap, varPlayer, MD_SHABAKE_YIYIDIBAI_COUNT, 0)
--		x300961_var_KillPlayerNumberSave		= {}

    StartTalkTask(varMap)
    TalkAppendString(varMap,format("你完成了任务：%s",x300961_var_QuestName));
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    
    StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R经验"..x300961_YunBiaoExp(varMap, varPlayer).."点#cffcf00的奖励")
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer)
    
     StartTalkTask(varMap)
    TalkAppendString(varMap,"获得#R战车荣誉"..x300961_var_varHonour.."点#cffcf00的奖励")
    StopTalkTask(varMap)
    DeliverTalkTips(varMap,varPlayer) 
    
    Msg2Player(varMap,varPlayer,format("你完成了任务：%s",x300961_var_QuestName),8,2)
    Msg2Player(varMap,varPlayer,format("获得经验奖励#R%s#cffcf00点",x300961_YunBiaoExp(varMap, varPlayer)),8,2)
    Msg2Player(varMap,varPlayer,format("获得战车荣誉奖励#R%s#cffcf00点",x300961_var_varHonour),8,2)

end

function x300961_ProcQuestAbandon( varMap, varPlayer,varQuest )



	DelQuestNM( varMap, varPlayer, x300961_VarQuest(varMap, varPlayer))
	x300961_SetMD( varMap, varPlayer, MD_SHABAKE_YIYIDIBAI_COUNT, 0)
--	x300961_var_KillPlayerNumberSave = {}
	local Readme = format("你放弃了任务：%s",x300961_var_QuestName)
	StartTalkTask(varMap)
	TalkAppendString(varMap, Readme);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,Readme,8,2)

end

function x300961_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	local SubmitNPCGUID = 0
	local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	if nCountryIdx == 0 then
		SubmitNPCGUID = x300961_var_SubmitNPCGUID[2]
	elseif nCountryIdx == 1 then
		SubmitNPCGUID = x300961_var_SubmitNPCGUID[3]
	elseif nCountryIdx == 2 then
		SubmitNPCGUID = x300961_var_SubmitNPCGUID[1]
	elseif nCountryIdx == 3 then
		SubmitNPCGUID = x300961_var_SubmitNPCGUID[4]
	end
	if IsHaveQuestNM( varMap, varPlayer, varQuest) <= 0 then	-- 如果没有这个任务
		return
	end

	if varTalkNpcGUID == SubmitNPCGUID then
		local state = GetQuestStateNM(varMap,varPlayer,varTalknpc,x300961_VarQuest(varMap, varPlayer))
		TalkAppendButton(varMap, x300961_VarQuest(varMap, varPlayer), x300961_var_QuestName,state)
	end


end

function x300961_YunBiaoExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = 0
	if nLevel < 40 then
		return 0
	end
	for i, j in x300961_var_GetPlayerExp do
		if nLevel >= j.level then
			nExp = nLevel * j.value
		else
			return nExp
		end
	end
	return nExp
end

function x300961_VarQuest(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)

	if nCountryIdx == 0 then
		return x300961_var_QuestId[2]
	elseif nCountryIdx == 1 then
		return x300961_var_QuestId[3]
	elseif nCountryIdx == 2 then
		return x300961_var_QuestId[1]
	elseif nCountryIdx == 3 then
		return x300961_var_QuestId[4]
	end
end


function x300961_CheckPlayerBagFull1( varMap ,varPlayer,selectId )
	if x300961_ItemRandom(varMap ,varPlayer) == 5 then
	    StartItemTask( varMap)
	    ItemAppendBind( varMap, x300961_var_ReliveItem, 1)
	    if GetBagSpace(varMap, varPlayer) < 1 then
	        Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 3)
	        Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 2)
	        return 1
	    end
	    DeliverItemListSendToPlayer( varMap, varPlayer)

		local name = GetName( varMap, varPlayer)
		local EncouragingMessage = format("恭喜%s在【沙城】以一敌百任务中幸运获得黄金藏宝图！",name)
		LuaAllScenceM2Wrold(varMap, EncouragingMessage, CHAT_PLANE_SCROLL, 1)
		LuaAllScenceM2Wrold(varMap, EncouragingMessage, CHAT_LEFTDOWN, 1)
		LuaAllScenceM2Wrold(varMap, EncouragingMessage, CHAT_MAIN_RIGHTDOWN, 1)
	end

end


function x300961_ItemRandom(varMap ,varPlayer)
	local varX =random(1, 100)
	return varX
end



function x300961_GetPlayerStanding(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	local getstanding = GetCountryParamByBit(nCountryIdx, CD_KAISER_BATTLE_INFO, 0, 2)
	return getstanding
end

function x300961_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x300961_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
