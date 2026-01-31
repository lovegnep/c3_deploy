--DECLARE_QUEST_INFO_START--

x302612_var_ScriptId 	 				 =	302612
x302612_var_LevelLess					= 	30

x302612_var_MissionId = {  
											10311,
											10312,
											10313,
											10314,
											10315,
											10316,
										} 
x302612_var_LevelTable ={
										{ LevelLess = 30, LevelMax = 40 },
										{ LevelLess = 40, LevelMax = 50 },
										{ LevelLess = 50, LevelMax = 60 },
										{ LevelLess = 60, LevelMax = 70 },
										{ LevelLess = 70, LevelMax = 80 },
										{ LevelLess = 80, LevelMax = 150 },
									  }
x302612_var_MissionName = "【个人】"
x302612_var_MissionNameMore = {

													{"护送军粮(200两)", "护送兵器(1两)", "护送秘药"},
													{"护送军粮(200两)", "护送兵器(2两)", "护送秘药"},
													{"护送军粮(200两)", "护送兵器(3两)", "护送秘药"},
													{"护送军粮(200两)", "护送兵器(5两)", "护送秘药"},
													{"护送军粮(200两)", "护送兵器(6两)", "护送秘药"},
													{"护送军粮(200两)", "护送兵器(7两500文)", "护送秘药"},

													}
x302612_var_MissionInfo = "您可以通过王城押运官并花费#G#{_MONEY%d}银卡#W领取一辆#G%s#W，当您将%s安全护送到指定地点，系统将会给与您#G海量经验#W。"
x302612_var_MissionTarget={
												"将%s交给@npc_126129", 
												"将%s交给@npc_510113", 
												"将%s交给@npc_128514", 
												"将%s交给@npc_128514", 
												"将%s交给@npc_128514", 
												"将%s交给@npc_128514", 

											}
x302612_var_SubmitNPCGUID = {
													"@npc_126129",
													"@npc_510113", 
													"@npc_128514", 
													"@npc_128514",
													"@npc_128514",
													"@npc_128514",
													}

x302612_var_NPC = {
								126129,
								510113,
								128514,
								128514,
								128514,
								128514,
								}
								   
--x302612_var_NeedPhysicalForce	= 9							   
x302612_var_MissionHelp = "\t#G护送途中如果您离开%s过远，%s会意识到危险而停止前进。\n\t#G如果%s受到袭击并死亡，您的任务将失败，同时部分押金将会掉落。\n\t#G当您离开%s一段时间或掉线，%s将消失，此时任务失败。\n\t如果您身上同时拥有#G银卡和现银，则优先扣除银卡。\n\t在#R国运令#G期间完成任务您将获得#R双倍#G的奖励。"
x302612_var_MissionCompleted		= "\t您已经将官府交给您的马车安全护送到此了？请收下官府给您的奖励！"
x302612_var_MissionUncompleted  ="\t如果不清除这些阿兰人，送往中国的贡品就不会按时完成。"

--任务日志标题显示
x302612_var_Mid = {
								 "军粮镖车", "兵器镖车", "秘药镖车",
							  }
						
--不同金钱任务扣除
x302612_var_QuestMoney = {	  
							  {200000, 1000, 0},	
							  {200000, 2000, 0},
							  {200000, 3000, 0},
							  {200000, 5000, 0},
							  {200000, 6000, 0},
							  {200000, 7500, 0},
					   }
					   
--经验奖励基础值
x302612_var_QuestExpBase = {		
								{2, 1, 2},
								{2, 1, 2},
								{2, 1, 2},
								{2, 1, 2},
								{2, 1, 2},
								{2, 1, 2},
						 }
						 
--扣除任务道具
x302612_var_QuestItem = 12270600	
x302612_var_QuestItemInfo = "缺少官府密令"

--记录玩家选择的任务选项
x302612_var_GetPlayerQuestNum = {} 	
-- bus
x302612_var_Mis_Count   =	3                    		--每天可做的次数
x302612_var_BusScriptId = 302611
x302612_var_GameOpenId = 3012
--15:28 2013/7/24 新加参数
x302612_var_nExpRate = 1			-- 经验比率
x302612_var_nMoneyRate = 0.18			-- 现银比率
x302612_var_nGoldsRate = 0.18			-- 金卡比率
				                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
--DECLARE_QUEST_INFO_STOP--

function x302612_ProcEnumEvent( varMap, varPlayer, targetId, MissionId )
--	if x302612_var_GameOpenId > 0 and GetGameOpenById( x302612_var_GameOpenId ) <= 0 then
--      return
--  end
	local MissionIndex = 0
	local level = GetLevel(varMap,varPlayer)
	
	for i,lvl in x302612_var_LevelTable do
		if level >= lvl.LevelLess and level < lvl.LevelMax then
			MissionIndex = i
			break
		end
	end
	local bHaveMission = x302612_IsHaveMission(varMap, varPlayer)
	if bHaveMission <= 0 and MissionIndex > 0 then
		TalkAppendButton(varMap, x302612_var_MissionId[1], "【个人】官府押运", 8, 4)
	end

end

--点击（按钮）点击该任务后执行此脚本
function x302612_ProcEventEntry( varMap, varPlayer, targetId, MissionId, MissionNum )
--	if x302612_var_GameOpenId > 0 and GetGameOpenById( x302612_var_GameOpenId ) <= 0 then
--      return
--  end	
	local missionIndex = 0
	local level = GetLevel(varMap,varPlayer)
	
	if ( MissionNum == 4 ) then
	
		missionIndex = 0
		
		for i,lvl in x302612_var_LevelTable do
			if level >= lvl.LevelLess and level < lvl.LevelMax then
				missionIndex = i
				break
			end
		end
	
		local bHaveMission = x302612_IsHaveMission(varMap, varPlayer)
		if bHaveMission <= 0 and missionIndex > 0 then
		
			local MissionState = GetQuestStateNM( varMap, varPlayer, targetId, x302612_var_MissionId[missionIndex] )
			
			StartTalkTask( varMap )
				TalkAppendString( varMap, "#Y【个人】官府押运")
				TalkAppendString( varMap, "\t我正在招收人手，护送总堂的物资。如果你对自己的实力有信心，不妨一试。")
				TalkAppendString( varMap, "\t在护送途中时刻要小心周围的情况，这会消耗人的精力。为了物资的安全，限定#G每人每天#W只能护送#R3次#W。")
				TalkAppendString( varMap, "\t#G选择任意种类的护送都会#R消耗一次#G护送次数#W。")
				TalkAppendString( varMap, "\t选择花费越多的镖车，运镖完成时得到的回报就越大#W。")
			
				
				TalkAppendButton(varMap, x302612_var_MissionId[missionIndex], x302612_var_MissionName..x302612_var_MissionNameMore[missionIndex][2], MissionState, 2);
				if level >= 50 then
					TalkAppendButton(varMap, x302612_var_MissionId[missionIndex], x302612_var_MissionName..x302612_var_MissionNameMore[missionIndex][1], MissionState, 1);
				end
				TalkAppendButton(varMap, x302612_var_MissionId[missionIndex], x302612_var_MissionName..x302612_var_MissionNameMore[missionIndex][3], MissionState, 3);
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap, varPlayer, targetId)
		end
	else
		
		missionIndex = 0
		missionNum = 0
		
		for i,mission in x302612_var_MissionId do
			if MissionId == mission then
				missionIndex = i
				missionNum = MissionNum
				break
			end
		end
		
		if ( missionIndex == 0 or missionNum == 0 ) then
			return
		end
		
		x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)] = {}
		x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionIndex = missionIndex
		x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionNum = missionNum
		
		local bHaveMission	= IsHaveQuestNM(varMap, varPlayer, MissionId)
		if(bHaveMission > 0) then
			local bDone = x302612_CheckSubmit( varMap, varPlayer, targetId, missionIndex )
			if(bDone > 0) then
				if missionIndex ~= -1 then
					x302612_DispatchCompletedInfo( varMap, varPlayer, targetId, missionIndex, missionNum ) --完成任务显示
				end
			end
		else
			x302612_DispatchMissionInfo( varMap, varPlayer, targetId, missionIndex, missionNum )	--任务信息显示
		end
	end
	
end

--显示任务信息
function x302612_DispatchMissionInfo( varMap, varPlayer, NPCId, missionIndex, missionNum )

	StartTalkTask( varMap )
		--任务信息
		TalkAppendString(varMap, "#Y"..x302612_var_MissionName..x302612_var_MissionNameMore[missionIndex][missionNum])
		--local message = format( x302612_var_MissionInfo.."\n \n\t#G领取任务需要消耗#R"..x302612_var_NeedPhysicalForce.."点#G体力值", x302612_var_QuestMoney[missionIndex][missionNum], x302612_var_Mid[missionNum], x302612_var_Mid[missionNum] )
		if ( missionNum < 3 ) then
			--TalkAppendString(varMap, format("\t%s", message ))
		else
			TalkAppendString(varMap, "\t持有#G官府密令（#R护送兵器镖车#G会有几率获得，#R劫取兵器镖车#G会有几率获得，#R劫取秘药镖车#G会有#R很高几率#G获得）#W的人，才有资格护送此辆秘药镖车。展示官府密令，" )
		end
		--任务目标
		TalkAppendString( varMap, "#Y任务目标：")
		TalkAppendString( varMap, format( "\t%s", format( x302612_var_MissionTarget[missionIndex], x302612_var_Mid[missionNum] ) ) )
		TalkAppendString( varMap, " ")
		--提示信息
		if x302612_var_MissionHelp ~= "" then
			TalkAppendString(varMap, "#Y任务提示：")
			TalkAppendString(varMap, format( x302612_var_MissionHelp, x302612_var_Mid[missionNum], x302612_var_Mid[missionNum], x302612_var_Mid[missionNum], x302612_var_Mid[missionNum], x302612_var_Mid[missionNum] ) )
		end
		
		--奖励信息
		--1、经验
		local level = GetLevel( varMap, varPlayer )
		local experience = x302612_GetQuestExp(varMap, varPlayer, x302612_var_MissionId[missionIndex])
		AddQuestExpBonus( varMap, experience )
		if (IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1) then
			local Money = x302612_GetQuestMoney(varMap, varPlayer, x302612_var_MissionId[missionIndex])
			AddQuestMoneyBonus2( varMap, Money)
		elseif (IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 ) then
			local Golsds = x302612_GetQuestGolds(varMap, varPlayer, x302612_var_MissionId[missionIndex])
			AddQuestMoneyBonus3( varMap, Golsds)			
		end

	StopTalkTask(varMap)

	DeliverTalkInfoNM(varMap, varPlayer, NPCId, x302612_var_ScriptId,  x302612_var_MissionId[missionIndex]);
end

---------------------------------------------------------------------------------------------------
--向客户端发送任务完成信息
---------------------------------------------------------------------------------------------------
function x302612_DispatchCompletedInfo( varMap, varPlayer, targetId, missionIndex, missionNum )
	
	StartTalkTask(varMap)

		--任务完成信息
		TalkAppendString(varMap, "#Y"..x302612_var_MissionName..x302612_var_MissionNameMore[missionIndex][missionNum])
		TalkAppendString(varMap, format( x302612_var_MissionCompleted, x302612_var_Mid[missionNum] ))
		TalkAppendString(varMap, " ")
	
		--1、经验
		local level = GetLevel(varMap, varPlayer)
		local experience = x302612_GetQuestExp(varMap, varPlayer, x302612_var_MissionId[missionIndex])
		AddQuestExpBonus(varMap,experience)
		if (IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1) then
			local Money = x302612_GetQuestMoney(varMap, varPlayer, x302612_var_MissionId[missionIndex])
			AddQuestMoneyBonus2( varMap, Money)
		elseif (IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 ) then
			local Golsds = x302612_GetQuestGolds(varMap, varPlayer, x302612_var_MissionId[missionIndex])
			AddQuestMoneyBonus3( varMap, Golsds)			
		end
			
	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, targetId, x302612_var_ScriptId , x302612_var_MissionId[missionIndex])

end

--**********************************
--接受
--**********************************
function x302612_ProcQuestAccept( varMap, varPlayer, targetId, MissionId )
--	if x302612_var_GameOpenId > 0 and GetGameOpenById( x302612_var_GameOpenId ) <= 0 then
--      return
--  end
	local missionIndex  = 0
	local missionNum = 0
	
	if x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionIndex  ~= nil and x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionNum ~= nil then
		missionIndex = x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionIndex
		missionNum = x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionNum
	end
--	local IshavePhysicalForce = GetPhysicalForce(varMap, varPlayer)
--	if IshavePhysicalForce < x302612_var_NeedPhysicalForce then
--			Msg2Player( varMap, varPlayer, "您的体力值不足，无法领取任务", 0, 2 )
--			Msg2Player( varMap, varPlayer, "您的体力值不足，无法领取任务", 0, 3 )
--			return 0
--	end
	if IsQuestFullNM(varMap, varPlayer)==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = "可接任务数量已满"
		Msg2Player(varMap,varPlayer,Readme,8,2)
		return 0
	end
	
	if IsHideName(varMap, varPlayer) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"很抱歉，匿名状态不能接此任务")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = "很抱歉，匿名状态不能接此任务"
		Msg2Player(varMap,varPlayer,Readme,8,2)
		return 0
	end
	
	if IsTeamFollow(varMap, varPlayer) == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "组队跟随状态下不可以接护送任务")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = "组队跟随状态下不可以接护送任务"
		Msg2Player(varMap,varPlayer,Readme,8,2)
		return 0
	end
	
	if IsBusMember(varMap,varPlayer) == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您已处于护送/押运状态，无法领取新的护送/押运任务")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = "您已处于护送/押运状态，无法领取新的护送/押运任务" 
		Msg2Player(varMap,varPlayer,Readme,8,2)
		return 0
	end

	if x302612_GetDayCount(varMap, varPlayer) >= x302612_var_Mis_Count then
	  StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您今天的任务次数已满，请明天再来做吧")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = "很抱歉，您今天的任务次数已满，请明天再来做吧" 
		Msg2Player(varMap,varPlayer,Readme,8,2)
		return 0
	end
	
	if ( missionIndex == 0 or missionNum == 0 ) then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"你不能接取此任务")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = "你不能接取此任务"
		Msg2Player(varMap,varPlayer,Readme,8,2)
		return 0
	end
	
	if missionNum == 1 and missionIndex <= 2 then	--添加50级才可见的200L的镖车
		StartTalkTask(varMap)
		TalkAppendString(varMap,"你不能接取此任务")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = "你不能接取此任务"
		Msg2Player(varMap,varPlayer,Readme,8,2)
		return 0
	end
		
	local iCostMoney = 0
	iCostMoney = x302612_var_QuestMoney[missionIndex][missionNum]
	
	local LevelLess = x302612_var_LevelTable[missionIndex].LevelLess
	local LevelMax = x302612_var_LevelTable[missionIndex].LevelMax
	
	local level = GetLevel(varMap,varPlayer);
	if ( level < LevelLess or level >= LevelMax ) then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您的等级不能再领取此任务")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = "您的等级不能再领取此任务" 
		Msg2Player(varMap,varPlayer,Readme,8,2)
		return 0
	end

	if IsEnoughMoney(varMap, varPlayer, iCostMoney) ~=1 then
		local sillerMode
		if GetSillerMode(varMap,varPlayer) == 1 then
			sillerMode = "现银"
		else
			sillerMode = "银卡"
		end
		local Readme = "很抱歉，您身上的"..sillerMode.."不够支付押金，无法接取此任务" 
		StartTalkTask(varMap)
		TalkAppendString(varMap, Readme)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,Readme,8,2)
		return 0
	end
	
	if missionNum >= 3 then
		local GetItemNum = GetItemCount(varMap, varPlayer, x302612_var_QuestItem)
		if GetItemNum < 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, x302612_var_QuestItemInfo);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			local Readme = x302612_var_QuestItemInfo
			Msg2Player(varMap,varPlayer,Readme,8,2)
			return 0
		end		
	end
		
	local bHaveMission = IsHaveQuestNM(varMap, varPlayer, MissionId)
	if(bHaveMission > 0) then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您已经接取了此任务")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = "您已经接取了此任务" 
		Msg2Player(varMap,varPlayer,Readme,8,2)
		return 0
	end

	for i,mission in x302612_var_MissionId do
		if MissionId == mission then
			
			iCostMoney = x302612_var_QuestMoney[missionIndex][missionNum]
			if SpendMoney( varMap, varPlayer, iCostMoney, 301 ) ~= 1 then
				return 0
			end
			
			if missionNum >= 3 then
			
				GetItemNum = GetItemCount(varMap, varPlayer, x302612_var_QuestItem)
				if( DelItem(varMap, varPlayer, x302612_var_QuestItem, 1) ) ~= 1 then 
					return 0
				end
				
				local Country = GetCurCountry(varMap, varPlayer)
				local CountryName = ""
				if Country == 0 then
					CountryName = "楼兰"
				elseif Country == 1 then
					CountryName = "天山"
				elseif Country == 2 then
					CountryName = "昆仑"
				elseif Country == 3 then
					CountryName = "敦煌"
				else
					return 0
				end
				
				local varGuildID = GetGuildID( varMap, varPlayer )
				local varGuildName = GetGuildName( varGuildID )
				local varName = GetName( varMap, varPlayer )
				local varMsg = format(CountryName.."的"..varName.."正护送秘药前往边境。")
				LuaAllScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
				LuaAllScenceM2Wrold(varMap, varMsg, CHAT_LEFTDOWN, 1)
				LuaAllScenceM2Wrold(varMap, varMsg, CHAT_MAIN_RIGHTDOWN, 1)	
			end
			
			
			if missionNum == 1 then
			
		
				
				local Country = GetCurCountry(varMap, varPlayer)
				local CountryName = ""
				if Country == 0 then
					CountryName = "楼兰"
				elseif Country == 1 then
					CountryName = "天山"
				elseif Country == 2 then
					CountryName = "昆仑"
				elseif Country == 3 then
					CountryName = "敦煌"
				else
					return 0
				end
				
				local varGuildID = GetGuildID( varMap, varPlayer )
				local varGuildName = GetGuildName( varGuildID )
				local varName = GetName( varMap, varPlayer )
				local varMsg = format(CountryName.."的"..varName.."正护送军粮前往边境。")
				LuaAllScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
				LuaAllScenceM2Wrold(varMap, varMsg, CHAT_LEFTDOWN, 1)
				LuaAllScenceM2Wrold(varMap, varMsg, CHAT_MAIN_RIGHTDOWN, 1)	
			end
			
			--检查前置任务
			local FrontMissiontId1, FrontMissiontId2, FrontMissiontId3 = GetFrontQuestIdNM( varMap, varPlayer, MissionId )
			if FrontMissiontId1 ~= -1 then
				if IsQuestHaveDoneNM( varMap, varPlayer, FrontMissiontId1 ) == 0 then
					return 0
				end
			end
			if FrontMissiontId2 ~= -1 then
				if IsQuestHaveDoneNM( varMap, varPlayer, FrontMissiontId2 ) == 0 then
					return 0
				end
			end
			if FrontMissiontId3 ~= -1 then
				if IsQuestHaveDoneNM( varMap, varPlayer, FrontMissiontId3 ) == 0 then
					return 0
				end
			end
			
			if AddQuestNM( varMap, varPlayer, MissionId ) == 1 then
				--SetPhysicalForce(varMap, varPlayer,IshavePhysicalForce-x302612_var_NeedPhysicalForce,x302612_var_ScriptId)				
				Msg2Player(varMap, varPlayer, "您接受了任务"..x302612_var_MissionName..x302612_var_MissionNameMore[missionIndex][missionNum].."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您接受了任务"..x302612_var_MissionName..x302612_var_MissionNameMore[missionIndex][missionNum].."！", 0, 3)
		 	  GamePlayScriptLog( varMap, varPlayer, 12022)			
				
				local misIndex = GetQuestIndexByID(varMap, varPlayer, MissionId)
				SetQuestByIndex(varMap, varPlayer, misIndex, 7, 0)
				SetQuestByIndex(varMap, varPlayer, misIndex, 2, missionIndex)
				SetQuestByIndex(varMap, varPlayer, misIndex, 3, missionNum)
				
				LuaCallNoclosure( x302612_var_BusScriptId, "ProcCreateBusBus", varMap, varPlayer, MissionId, missionIndex, missionNum )
			end
			break
		end
	end

end

function x302612_ProcAccept( varMap, varPlayer )
end

function x302612_ProcQuestAttach( varMap, varPlayer, npcId, npcGuid, misIndex, MissionId )
		
		local misIndex = GetQuestIndexByID( varMap, varPlayer, MissionId )
		local missionIndex = GetQuestParam(varMap, varPlayer, misIndex, 2)
		local missionNum = GetQuestParam(varMap, varPlayer, misIndex, 3)
		SetQuestByIndex(varMap, varPlayer, misIndex, 7, 1)
		SetQuestByIndex(varMap, varPlayer, misIndex, 0, 1)	
		local bHaveMission = IsHaveQuestNM( varMap, varPlayer, MissionId )
		if bHaveMission > 0 then
			if npcGuid == x302612_var_NPC[missionIndex] then
				local MissionState = GetQuestStateNM( varMap, varPlayer, npcId, MissionId )
				TalkAppendButton(varMap, x302612_var_MissionId[missionIndex], x302612_var_MissionName..x302612_var_MissionNameMore[missionIndex][missionNum], MissionState, missionNum)
			end
		end

end

--完成任务
--返回1代表成功，0代表交任务失败
function x302612_ProcQuestSubmit( varMap, varPlayer, targetId, selectId, MissionId )
--	if x302612_var_GameOpenId > 0 and GetGameOpenById( x302612_var_GameOpenId ) <= 0 then
--      return
--  end
	local misIndex = GetQuestIndexByID( varMap, varPlayer, MissionId )
	local missionIndex = GetQuestParam(varMap, varPlayer, misIndex, 2)
	local missionNum = GetQuestParam(varMap, varPlayer, misIndex, 3)

	if IsQuestHaveDoneNM( varMap, varPlayer, MissionId ) > 0 then --任务已经完成
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, MissionId) <= 0 then	-- 如果没这个任务直接退出
		return 0
	end

	--镖车是否在有效距离
	local valid = IsValidMyselfBus(varMap, varPlayer, MissionId)

	if valid == 0 then
    StartTalkTask(varMap)
		TalkAppendString(varMap, format("您护送的%s离您太远了，无法提交任务！", x302612_var_Mid[missionNum]))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local Readme = format("您护送的%s离您太远了，无法提交任务！", x302612_var_Mid[missionNum])
		Msg2Player(varMap,varPlayer,Readme,8,2)
		return 0
	end
	
	--判断背包
	if ( missionNum < 3 ) then
		if GetBagSpace(varMap, varPlayer) < 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "至少需要一个背包空间, 才能完成此任务")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap, varPlayer, "至少需要一个背包空间, 才能完成此任务",8,3)
			return 0
		end
	end
   
	local ret = DelQuest( varMap, varPlayer, MissionId )
	if ret == 1 then -- 如果成功完成
		LuaCallNoclosure( 256289, "FinishYayun", varMap, varPlayer)
		x302612_SetDayCount(varMap, varPlayer)
		LuaCallNoclosure(802005,"AddActivityQuest",varMap, varPlayer, 0,0)	
		LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,6)	
		
		local Readme = "您完成了任务："..x302612_var_MissionName..x302612_var_MissionNameMore[missionIndex][missionNum]
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您完成了任务："..x302612_var_MissionName..x302612_var_MissionNameMore[missionIndex][missionNum])
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local ret = CountryIsFortuneTime(varMap,varPlayer,0)
		if ret == 1  then   -- 国运令期间期间
			local level = GetLevel(varMap,varPlayer)
			local varexp = x302612_GetQuestExp(varMap, varPlayer, MissionId)
			local exp = varexp * 2 
			if (exp > 0) then				
			AddExp(varMap, varPlayer, exp)	
				Readme = Readme.."#r获得#R经验"..varexp.."点#o的奖励#r国运令期间额外获得#R经验"..varexp.."点#o的奖励"
			StartTalkTask(varMap)
				TalkAppendString(varMap, "获得#R经验"..varexp.."点#o的奖励")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			StartTalkTask(varMap)
				TalkAppendString(varMap, "国运令期间额外获得#R经验"..varexp.."点#o的奖励")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end	
			if (IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1) then
				local varMoney = x302612_GetQuestMoney(varMap, varPlayer, MissionId)
				local varMoney1 =floor(varMoney / 1000)
				local Money = varMoney * 2
				if(Money > 0) then
					AddMoney( varMap, varPlayer, 0, Money)
					Readme = Readme.."#r获得#R现银"..varMoney1.."两#o的奖励#r国运令期间额外获得#R现银"..varMoney1.."两#o的奖励"	
					StartTalkTask(varMap)
					TalkAppendString(varMap, "获得#R现银"..varMoney1.."两#o的奖励")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			StartTalkTask(varMap)
					TalkAppendString(varMap, "国运令期间额外获得#R现银"..varMoney1.."两#o的奖励")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
				end
			elseif (IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 ) then
				local varGolsds = x302612_GetQuestGolds(varMap, varPlayer, MissionId)
				local varGolsds1 =floor(varGolsds / 1000)
				local Golsds = varGolsds * 2
				if (Golsds > 0) then
					AddMoney( varMap, varPlayer, 3, Golsds)
					Readme = Readme.."#r获得#R金卡"..varGolsds1.."两#o的奖励#r国运令期间额外获得#R金卡"..varGolsds1.."两#o的奖励"			
					StartTalkTask(varMap)
					TalkAppendString(varMap, "获得#R金卡"..varGolsds1.."两#o的奖励")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					StartTalkTask(varMap)
					TalkAppendString(varMap, "国运令期间额外获得#R金卡"..varGolsds1.."两#o的奖励")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)		
				end
			end			
			Msg2Player(varMap,varPlayer,Readme,8,2)
		else
			local level = GetLevel(varMap,varPlayer)
			local varexp = x302612_GetQuestExp(varMap, varPlayer, MissionId)
			if (varexp > 0) then				
				AddExp(varMap, varPlayer, varexp)
				Readme = Readme.."#r获得#R经验"..varexp.."点#o的奖励"
			StartTalkTask(varMap)
				TalkAppendString(varMap, "获得#R经验"..varexp.."点#o的奖励")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			end	
			if (IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1) then
				local varMoney = x302612_GetQuestMoney(varMap, varPlayer, MissionId)
				local varMoney1 =floor(varMoney / 1000)
				if(varMoney > 0) then
					AddMoney( varMap, varPlayer, 0, varMoney)
					Readme = Readme.."#r获得#R现银"..varMoney1.."两#o的奖励"	
			StartTalkTask(varMap)
					TalkAppendString(varMap, "获得#R现银"..varMoney1.."两#o的奖励")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
				end
			elseif (IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 ) then
				local varGolsds = x302612_GetQuestGolds(varMap, varPlayer, MissionId)
				local varGolsds1 =floor(varGolsds / 1000)
				if (varGolsds > 0) then
					AddMoney( varMap, varPlayer, 3, varGolsds)
					Readme = Readme.."#r获得#R金卡"..varGolsds1.."两#o的奖励"			
					StartTalkTask(varMap)
					TalkAppendString(varMap, "获得#R金卡"..varGolsds1.."两#o的奖励")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)	
				end
			end			
			Msg2Player(varMap,varPlayer,Readme,8,2)
		end
		--奖励秘药
		--完成任务给纪念兑换券
		local ran = random(1,8)
		if ran < 3 then
			local year, month, day = GetYearMonthDay()
			local day = GetDayOfYear()
			if year == 2012 and day > 190 and day < 212 then

				StartItemTask(varMap)
				ItemAppendBind( varMap, 12110220, 1)	--世传水晶
				local ret = StopItemTask(varMap,varPlayer)
				if ret > 0 then 
					  varMsg ="恭喜您获得1个欢乐周年兑换券"
						Msg2Player( varMap,varPlayer,varMsg,8,2) ;			
						Msg2Player( varMap,varPlayer,varMsg,8,3) ;

			   		DeliverItemListSendToPlayer( varMap, varPlayer)
				end
			end 
		end
		if ( missionNum < 3 ) then
			local varRand = random(1, 100)
			if ( varRand <= 1 ) then				
				StartItemTask(varMap)
					ItemAppendBind( varMap, x302612_var_QuestItem, 1 )
				local varRet = StopItemTask( varMap, varPlayer )
				if varRet > 0 then
					DeliverItemListSendToPlayer(varMap, varPlayer)
					local message = format("您获得了物品：#R#{_ITEM%d}", x302612_var_QuestItem )
					Msg2Player(varMap, varPlayer, message, 0, 2)
					Msg2Player(varMap, varPlayer, message, 0, 3)
				end
			end
		end     
		--20%添加百宝囊
		local level = GetLevel(varMap,varPlayer);
			if level >=60 then 
				local randbai = random( 1, 5)
				if randbai == 1 then
					local bai = 12030143
					local bai80 = 12030144
					StartItemTask( varMap)
					if level >=80 then
						bai = bai80
					end	
				ItemAppendBind( varMap, bai, 1)	
				if StopItemTask( varMap, varPlayer) > 0 then
					DeliverItemListSendToPlayer( varMap, varPlayer)
					Msg2Player( varMap, varPlayer,format( "完成官府押运任务，幸运的获得了1个@item_%d", bai), 8, 3)
				end
			end
    	end		
	
		--添加国家实力榜积分
		AddCountryStrength(varMap, varPlayer, 1)	
		
		StartTalkTask(varMap);
		TalkAppendString(varMap, "恭喜，您为国家实力榜贡献了#R1个#O积分。");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"恭喜，您为国家实力榜贡献了#R1个#O积分。",8,2)		
		
		local varIndex = 1
		for varI,itm in x302612_var_MissionId do
			if varQuest == itm then
				GamePlayScriptLog(varMap,varPlayer,itm)
				varIndex = varI
				break;			
			end
		end

		--弱国保护
		local maxlevel = GetTopListInfo_MaxLevel(GetWorldID(varMap, varPlayer))
		local nCountryIdx = GetCurCountry(varMap, varPlayer);
		local selfscore = GetCountryParam(varMap, nCountryIdx, CD_LASTWEEK_STRONG_WEAK_JIFEN)
		local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
		local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
		local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
		local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
		local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore

		if maxlevel >= 70 then
			if selfscore <= allscore * 0.2 and selfscore > 0 and allscore > 0 then
				local Onlyvalue = 0
					for varI = 0, 3 do
						if GetCountryParam(varMap, varI, CD_LASTWEEK_STRONG_WEAK_JIFEN) <= selfscore then
							Onlyvalue = Onlyvalue + 1
						end
					end
					if Onlyvalue == 1 then
							local randruo = random( 1, 5)
							if randruo ==1 then
								StartItemTask(varMap)
								ItemAppendBind( varMap, 12035211, 1 )				
								ItemAppendBind( varMap, 11990051, 1 )								
								local varRet = StopItemTask(varMap,varPlayer)
								if varRet > 0 then
										DeliverItemListSendToPlayer(varMap,varPlayer)
										Msg2Player( varMap, varPlayer,format( "完成官府押运任务，幸运的获得了1个@item_%d", 12035211), 8, 3)
										Msg2Player( varMap, varPlayer,format( "完成官府押运任务，获得了1个@item_%d", 11990051), 8, 3)
										GamePlayScriptLog(varMap,varPlayer,59)
								else
										Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 3)								
								end
							else
								StartItemTask(varMap)			
								ItemAppendBind( varMap, 11990051, 1 )								
								local varRet = StopItemTask(varMap,varPlayer)
								if varRet > 0 then
										DeliverItemListSendToPlayer(varMap,varPlayer)
										Msg2Player( varMap, varPlayer,format( "完成官府押运任务，获得了1个@item_%d", 11990051), 8, 3)
								else
										Msg2Player( varMap, varPlayer, "背包已满，无法获得额外奖励物品", 8, 3)								
								end	
							end
					end
			end
		end
		
		local BusID  =  GetBusId(varMap, varPlayer)
		if BusID ~= -1 and IsObjValid (varMap,BusID) == 1 then
			--如果BUS还活着
			if GetBusQuestID(varMap, BusID) == MissionId then
				DeleteBus(varMap, BusID,1)
			end
		end
		
		x302612_GuoYun(varMap, varPlayer, MissionId)
	end

	return 0
	
end


--********************************************************************
--放弃
--********************************************************************
function x302612_ProcQuestAbandon( varMap, varPlayer, MissionId )

	for i,mission in x302612_var_MissionId do
	
		local bHaveMission = IsHaveQuestNM(varMap, varPlayer, mission )
		
		if bHaveMission > 0 then
		
			if IsBusMember(varMap, varPlayer) == 1 then
				local BusID = GetBusId(varMap, varPlayer)
				if BusID ~= -1 and IsObjValid (varMap,BusID) == 1 then
				
					if GetBusQuestID(varMap, BusID) == mission then
						DeleteBus(varMap, BusID,1)
					end
					
				else

					StartTalkTask(varMap)
					TalkAppendString(varMap, "现在还不能放弃任务")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					local Readme = "现在还不能放弃任务"
					Msg2Player(varMap,varPlayer,Readme,8,2)
					return
					
				end				
			end

			local misIndex = GetQuestIndexByID(varMap, varPlayer, mission)
			local missionIndex = GetQuestParam(varMap, varPlayer, misIndex, 2)
			local missionNum = GetQuestParam(varMap, varPlayer, misIndex, 3)
			DelQuest(varMap, varPlayer, mission)

			local Readme = "您放弃了任务："..x302612_var_MissionName..x302612_var_MissionNameMore[missionIndex][missionNum]
			StartTalkTask(varMap)
			TalkAppendString(varMap, Readme)
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,Readme,8,2)

			x302612_SetDayCount(varMap, varPlayer)

			break
		end
	end
  	
end

---------------------------------------------------------------------------------------------------
--任务日志刷新
---------------------------------------------------------------------------------------------------
function x302612_QuestLogRefresh( varMap, varPlayer, MissionId )

	if x302612_IsHaveMission( varMap, varPlayer ) == 0 then --如果没有任务，不刷新LOG
		return
	end	
		
	local misIndex = GetQuestIndexByID( varMap, varPlayer, MissionId )
	local missionIndex = GetQuestParam(varMap, varPlayer, misIndex, 2)
	local missionNum = GetQuestParam(varMap, varPlayer, misIndex, 3)
	
	StartTalkTask(varMap)	

		local level = GetLevel(varMap, varPlayer)
		
		local varMsg = ""
		local message = format( x302612_var_MissionInfo, x302612_var_QuestMoney[missionIndex][missionNum], x302612_var_Mid[missionNum], x302612_var_Mid[missionNum] )
		if ( missionNum < 3 ) then
			varMsg = format("\t%s", message )
		else
			varMsg = "\t持有#G官府密令#W的人，才有资格护送此辆秘药镖车。展示官府密令，"..message
		end
		
		AddQuestLogCustomText( 
									varMap,
									"",																																																			-- 标题
									x302612_var_MissionName..x302612_var_MissionNameMore[missionIndex][missionNum],    											-- 任务名字
									format( "  "..x302612_var_MissionTarget[missionIndex], x302612_var_Mid[missionNum] ),							      --任务目标
									x302612_var_SubmitNPCGUID[missionIndex],																													      --任务NPC
									format( x302612_var_MissionTarget[missionIndex], x302612_var_Mid[missionNum] ),     				            --任务攻略
									varMsg,																																																	--任务描述
									format( x302612_var_MissionHelp, x302612_var_Mid[missionNum], x302612_var_Mid[missionNum], x302612_var_Mid[missionNum], x302612_var_Mid[missionNum], x302612_var_Mid[missionNum] )		--任务小提示
									)
									
		local experience = x302612_GetQuestExp(varMap, varPlayer, MissionId)
		AddQuestExpBonus(varMap,experience)
		if (IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1) then
			local Money = x302612_GetQuestMoney(varMap, varPlayer, MissionId)
			AddQuestMoneyBonus2( varMap, Money)
		elseif (IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 ) then
			local Golsds = x302612_GetQuestGolds(varMap, varPlayer, MissionId)
			AddQuestMoneyBonus3( varMap, Golsds)			
		end
		
	StopTalkTask(varMap)
	DeliverTalkRefreshQuest(varMap, varPlayer, MissionId)

end

function x302612_ProcQuestLogRefresh( varMap, varPlayer, MissionId)
	x302612_QuestLogRefresh( varMap, varPlayer, MissionId )
end

function x302612_IsHaveMission( varMap, varPlayer )

	local bHaveMission = 0
	for i,mission in x302612_var_MissionId do
		bHaveMission = IsHaveQuestNM( varMap, varPlayer, mission );
		if bHaveMission > 0 then
			break
		end
	end
	
	return bHaveMission
	
end

---------------------------------------------------------------------------------------------------
--检查任务是否可提交
---------------------------------------------------------------------------------------------------
function x302612_CheckSubmit( varMap, varPlayer, targetId, missionIndex )

	local npcGuid = GetMonsterGUID(varMap,targetId)

	if x302612_var_NPC[missionIndex] ~= npcGuid then
		return 0
	end

	return 1

end

---------------------------------------------------------------------------------------------------
--取得此任务经验奖励
---------------------------------------------------------------------------------------------------
function x302612_GetQuestExp(varMap, varPlayer, MissionId)
	local missionIndex = 0
	local missionNum = 0
	local nExp = 0
	
	local misIndex = GetQuestIndexByID( varMap, varPlayer, MissionId )
	
	if x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)] ~= nil then
		if x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionIndex ~= nil and x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionNum ~= nil then
			missionIndex = x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionIndex
			missionNum = x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionNum
		end
	elseif  GetQuestParam(varMap, varPlayer, misIndex, 2) ~= nil and GetQuestParam(varMap, varPlayer, misIndex, 3) ~= nil then
		missionIndex = GetQuestParam(varMap, varPlayer, misIndex, 2)
		missionNum = GetQuestParam(varMap, varPlayer, misIndex, 3)
	end

	if ( missionIndex ~= 0 and missionNum ~= 0 ) then
		local nLevel = GetLevel(varMap, varPlayer)
			if nLevel>= 70  then
				nExp = floor(x302612_var_QuestExpBase[missionIndex][missionNum] * ceil(nLevel*9000))
			else 
				nExp = floor(x302612_var_QuestExpBase[missionIndex][missionNum] * ceil(nLevel*100*2.5*20))
			end
	end
	nExp = nExp * x302612_var_nExpRate;
	return nExp
end
---------------------------------------------------------------------------------------------------
--取得此任务现银奖励
---------------------------------------------------------------------------------------------------
function x302612_GetQuestMoney(varMap, varPlayer, MissionId)
	local missionIndex = 0
	local missionNum = 0
	local nMoney = 0
	local misIndex = GetQuestIndexByID( varMap, varPlayer, MissionId )
	if x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)] ~= nil then
		if x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionIndex ~= nil and x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionNum ~= nil then
			missionIndex = x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionIndex
			missionNum = x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionNum
		end
	elseif  GetQuestParam(varMap, varPlayer, misIndex, 2) ~= nil and GetQuestParam(varMap, varPlayer, misIndex, 3) ~= nil then
		missionIndex = GetQuestParam(varMap, varPlayer, misIndex, 2)
		missionNum = GetQuestParam(varMap, varPlayer, misIndex, 3)
	end
	if ( missionIndex ~= 0 and missionNum ~= 0 ) then
		local nLevel = GetLevel(varMap, varPlayer)
			if nLevel>= 70  then
				nMoney = floor(x302612_var_QuestExpBase[missionIndex][missionNum] * ceil(nLevel*9000))
			else 
				nMoney = floor(x302612_var_QuestExpBase[missionIndex][missionNum] * ceil(nLevel*100*2.5*20))
			end
	end
	nMoney = nMoney * x302612_var_nMoneyRate;
	return nMoney
end
---------------------------------------------------------------------------------------------------
--取得此任务金卡奖励
---------------------------------------------------------------------------------------------------
function x302612_GetQuestGolds(varMap, varPlayer, MissionId)
	local missionIndex = 0
	local missionNum = 0
	local nGolds = 0
	local misIndex = GetQuestIndexByID( varMap, varPlayer, MissionId )
	if x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)] ~= nil then
		if x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionIndex ~= nil and x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionNum ~= nil then
			missionIndex = x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionIndex
			missionNum = x302612_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionNum
		end
	elseif  GetQuestParam(varMap, varPlayer, misIndex, 2) ~= nil and GetQuestParam(varMap, varPlayer, misIndex, 3) ~= nil then
		missionIndex = GetQuestParam(varMap, varPlayer, misIndex, 2)
		missionNum = GetQuestParam(varMap, varPlayer, misIndex, 3)
	end
	if ( missionIndex ~= 0 and missionNum ~= 0 ) then
		local nLevel = GetLevel(varMap, varPlayer)
			if nLevel>= 70  then
				nGolds = floor(x302612_var_QuestExpBase[missionIndex][missionNum] * ceil(nLevel*9000))
			else 
				nGolds = floor(x302612_var_QuestExpBase[missionIndex][missionNum] * ceil(nLevel*100*2.5*20))
			end
	end
	nGolds = nGolds * x302612_var_nGoldsRate;
	return nGolds
end

---------------------------------------------------------------------------------------------------
--取得此任务当天当前已完成次数
---------------------------------------------------------------------------------------------------
function x302612_GetDayCount(varMap, varPlayer)

	if x302612_var_Mis_Count > 0 then

		local today = GetDayOfYear()

		local lastday = GetPlayerGameData(varMap, varPlayer, MD_MYSELF_CONVOY_DATE[1], MD_MYSELF_CONVOY_DATE[2], MD_MYSELF_CONVOY_DATE[3])

		if lastday ~= today then
			return 0
		end

		local daycount =  GetPlayerGameData(varMap, varPlayer, MD_MYSELF_CONVOY_COUNT[1], MD_MYSELF_CONVOY_COUNT[2], MD_MYSELF_CONVOY_COUNT[3])
		return daycount

	end

	return 0
end

---------------------------------------------------------------------------------------------------
--更新当天接任务次数
---------------------------------------------------------------------------------------------------
function x302612_SetDayCount(varMap, varPlayer)
	local today = GetDayOfYear()

	local lastday = GetPlayerGameData(varMap, varPlayer, MD_MYSELF_CONVOY_DATE[1], MD_MYSELF_CONVOY_DATE[2], MD_MYSELF_CONVOY_DATE[3])

	if lastday ~= today then
		SetPlayerGameData(varMap, varPlayer, MD_MYSELF_CONVOY_DATE[1], MD_MYSELF_CONVOY_DATE[2], MD_MYSELF_CONVOY_DATE[3], today)
		SetPlayerGameData(varMap, varPlayer, MD_MYSELF_CONVOY_COUNT[1], MD_MYSELF_CONVOY_COUNT[2], MD_MYSELF_CONVOY_COUNT[3], 1)
	else
		local daycount = GetPlayerGameData(varMap, varPlayer, MD_MYSELF_CONVOY_COUNT[1], MD_MYSELF_CONVOY_COUNT[2], MD_MYSELF_CONVOY_COUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_MYSELF_CONVOY_COUNT[1], MD_MYSELF_CONVOY_COUNT[2], MD_MYSELF_CONVOY_COUNT[3], daycount+1)
	end
end

function x302612_GuoYun(varMap, varPlayer, MissionId)
	if CountryIsFortuneTime(varMap, varPlayer, 0) > 0 then
		local country = GetCurCountry(varMap, varPlayer)
		SetCountryQuestData(varMap, country, CD_INDEX_GUOYUN_COUNT, 1, 1 )
	end
end
