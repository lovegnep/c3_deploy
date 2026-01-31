


x300760_var_FileId = 300760
x300760_var_QuestName = "创建飞行器"


x300760_var_GodIndex = 1210
x300760_var_Carinfo = {
						{ CarType = 3,BaseAI = 3,AIScript = 3,Script = 300760 },
						{ CarType = 5,BaseAI = 3,AIScript = 3,Script = 300760 },
						{ CarType = 6,BaseAI = 3,AIScript = 3,Script = 300760 },
						{ CarType = 35,BaseAI = 3,AIScript = 3,Script = 300760 },
						{ CarType = 36,BaseAI = 3,AIScript = 3,Script = 300760 },
						{ CarType = 37,BaseAI = 3,AIScript = 3,Script = 300760 },
					}

x300760_var_QuestId = {
						{ varId = 7556,varCostMoney =5000 ,AcceptId = 281 },
						{ varId = 7557,varCostMoney = 10000, AcceptId = 291 },
						{ varId = 7558, varCostMoney = 15000, AcceptId = 301 },
						{ varId = 7546, varCostMoney = 30000, AcceptId = 761 },
						{ varId = 7547, varCostMoney = 40000, AcceptId = 771 },
						{ varId = 7548, varCostMoney = 50000, AcceptId = 781 },
					  }

x300760_var_MainScriptId = 300757







function x300760_ProcEventEntry(varMap, varPlayer, varTalknpc)	

end






function x300760_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
end


function x300760_ProcCreateBus( varMap,varPlayer,varQuest,varBusID )

  local PosX,PosZ = GetWorldPos(varMap, varPlayer)

	local varObj = CreateBus(varMap, x300760_var_Carinfo[varBusID].CarType, PosX, PosZ, x300760_var_Carinfo[varBusID].BaseAI, x300760_var_Carinfo[varBusID].AIScript, x300760_var_Carinfo[varBusID].Script, varPlayer, x300760_var_GodIndex,varQuest,-1)
end






function x300760_ProcCreateBusOK(varMap,varPlayer,busId,varTalknpc,varQuest)	

	SetBusTimerTick(varMap , busId, 1000)
	SetBusWaitTime(varMap , busId, 300)
	SetBusTimerOpen(varMap, busId, 0)
	SetBusQuestID(varMap,busId,varQuest)

	local CarName = GetName( varMap, varPlayer ).."的飞行器"
	SetBusTitle(varMap , busId, CarName)
	local camp = GetCurCamp(varMap, varPlayer)
	SetBusCurCamp(varMap, busId,camp)

end


function x300760_DeleteBus(varMap, varObj)

	DeleteBus(varMap, varObj,1)

end





function x300760_ProcIntoBusEvent(varMap, varPlayer,varTalknpc)
	local InBus = IsBusMember(varMap, varPlayer)
	if InBus == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"你已经有飞行器了！");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "你已经有飞行器了！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return
	end

	local BusSize = GetBusSize(varMap,varTalknpc)
	local MemberNum = GetBusMemberCount(varMap,varTalknpc)

	if BusSize<=MemberNum  then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"这辆飞行器已经有人运了");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "这辆飞行器已经有人运了"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return
	end

	local IsOwner = IsTheBusOwner(varMap, varPlayer, varTalknpc )
	if IsOwner == 1 then
		
		AddBusMember(varMap, varPlayer,varTalknpc)
	end
end

function x300760_ProcIntoBusAfter(varMap, varPlayer,varBusID)

    if IsObjValid (varMap,varBusID) ~= 1 then
        return
    end

	local varQuest = GetBusQuestID(varMap,varBusID)

	for varI,itm in x300760_var_QuestId do

		if varQuest == itm.varId then
			local bRet = LuaCallNoclosure( x300760_var_MainScriptId, "CostMoney", varMap, varPlayer, varQuest)
			if bRet == 1 then

				if AddQuest(varMap, varPlayer, varQuest,x300760_var_MainScriptId,0,0,0,1) == 1 then
					
					GamePlayScriptLog(varMap,varPlayer,itm.AcceptId)

					
					local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest);
					SetQuestByIndex(varMap, varPlayer, varQuestIdx, 7, 0);
					LuaCallNoclosure( x300760_var_MainScriptId, "QuestLogRefresh", varMap, varPlayer, varQuest)	
					local CarName = GetName( varMap, varPlayer ).."的飞行器"
					SetBusTitle(varMap , varBusID, CarName)

					local camp = GetCurCamp(varMap, varPlayer)
					SetBusCurCamp(varMap, varBusID,camp)
				end
			end

			break

		end
	end

end



function x300760_ProcLeaveBusEvent(varMap, varPlayer,BusId)
		StartTalkTask(varMap)
		  TalkAppendString(varMap,"你正在护送中，无法离开");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "你正在护送中，无法离开"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
end


function x300760_ProcDie(varMap,BusId,idKiller)

    if IsObjValid (varMap,BusId) ~= 1 then
        return
    end

	if idKiller == -1 then
		
		local OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			x300760_Abandon( varMap, OwnerID  )
			local varReadme = "#R您的飞行器被摧毁，押运任务失败！"
			StartTalkTask(varMap);TalkAppendString(varMap, "飞行器被摧毁！");StopTalkTask(varMap);Msg2Player(varMap,OwnerID,varReadme,8,2)
		end
		return
	end

	if IsObjValid(varMap,idKiller)  == 0 then
		
		local OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			x300760_Abandon( varMap, OwnerID  )
			local varReadme = "您的飞行器被摧毁"
			StartTalkTask(varMap);TalkAppendString(varMap, "飞行器被摧毁！");StopTalkTask(varMap);DeliverTalkTips(varMap,OwnerID);Msg2Player(varMap,OwnerID,varReadme,8,2)
		end
		return
	end

	local ObjType = GetObjType(varMap,idKiller)

	if ObjType == 3 then		
		ObjType = 1
		idKiller = GetOwnerID(varMap, idKiller)
		if IsPlayerStateNormal(varMap,idKiller)  == 0 then
			local OwnerID = GetBusMemberObjId(varMap,BusId,0)
			if OwnerID ~= -1 then
			
				x300760_Abandon( varMap, OwnerID  )
				local varReadme = "您的马车被摧毁"
				StartTalkTask(varMap);TalkAppendString(varMap, "马车被摧毁！");StopTalkTask(varMap);DeliverTalkTips(varMap,OwnerID);Msg2Player(varMap,OwnerID,varReadme,8,2)
			end
			return
		end
	end

	if ObjType == 1 then		
	
		local BusMisId = GetBusQuestID( varMap,BusId )

		local varCostMoney = 10000
		for varI,itm in x300760_var_QuestId do
			
			if BusMisId == itm.varId then		
				varCostMoney = itm.varCostMoney
				break
			end
		end
		local iCostMoney2 =varCostMoney/2
		local OwnerCountry = GetBusCountryID(varMap,BusId)
		local KillerCountry = GetCurCountry(varMap,idKiller)
		if OwnerCountry == KillerCountry then

			
			local IsPunish = 0
			local OwnerId = GetBusMemberObjId(varMap,BusId,0)
			if OwnerId ~= -1 then
				IsPunish = LuaCallNoclosure( SCENE_SCRIPT_ID, "CashboxComputePKPunish", varMap, OwnerId, idKiller )
				if IsKing( varMap, idKiller ) ~= 1 and IsPunish == 1 then
					
					LuaCallNoclosure( SCENE_SCRIPT_ID, "KillerEnterPrison", varMap, idKiller )
					IsPunish = 1
				else
					IsPunish = 0
				end
			end
			
			if IsPunish==1 then
				StartTalkTask(varMap);TalkAppendString(varMap, "您摧毁了本国的飞行器，您的PK值增加了");StopTalkTask(varMap);DeliverTalkTips(varMap,idKiller)
				Msg2Player(varMap,idKiller,"您摧毁了本国的飞行器，您的PK值增加了",8,2)				
			else
				StartTalkTask(varMap);TalkAppendString(varMap, "您摧毁了本国的飞行器");StopTalkTask(varMap);DeliverTalkTips(varMap,idKiller)
				Msg2Player(varMap,idKiller,"您摧毁了本国的飞行器，您的PK值增加了", 8,2)			
			end			

		else
	        AddMoney(varMap,idKiller,0,iCostMoney2)
		  	StartTalkTask(varMap);TalkAppendString(varMap, "您摧毁了敌国的飞行器，并获得了奖励！");StopTalkTask(varMap);DeliverTalkTips(varMap,idKiller)
			Msg2Player(varMap,idKiller,format("您摧毁了敌国的飞行器，并获得了现银#{_MONEY%d}。", iCostMoney2),8,2)

		end

		local varCountry = "楼兰王国"
		if KillerCountry == 0 then
			varCountry = "楼兰王国"
		elseif KillerCountry == 1 then
			varCountry = "天山王国"
		elseif KillerCountry == 2 then
			varCountry = "昆仑王国"
		elseif KillerCountry == 3 then
			varCountry = "敦煌王国"
		else
			return
		end


		local OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			
			x300760_Abandon( varMap, OwnerID  )

			local GuildTitle = ""
			if GetGuildID(varMap,idKiller) ~= -1 then
				GuildTitle = GetGuildTitle(varMap,idKiller)
			end
			local killerName = GetName(varMap,idKiller)
			local varReadme = "您的飞行器被"..varCountry..GuildTitle.."的玩家"..killerName.."摧毁，黑金押运任务失败！"
			if IsHideName(varMap,idKiller) > 0 then
				varReadme = "您的飞行器被"..HIDE_NAME.."摧毁，黑金押运任务失败！"
			end
		
			StartTalkTask(varMap);TalkAppendString(varMap, "飞行器被摧毁！");StopTalkTask(varMap);DeliverTalkTips(varMap,OwnerID);Msg2Player(varMap,OwnerID,varReadme,8,2)
		end
	else		
		local OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			x300760_Abandon( varMap, OwnerID  )
			local varReadme = "您的飞行器被怪物摧毁！"
			StartTalkTask(varMap);TalkAppendString(varMap, "飞行器被摧毁！");StopTalkTask(varMap);DeliverTalkTips(varMap,OwnerID);Msg2Player(varMap,OwnerID,varReadme,8,2)
		end
	end

end


function x300760_ProcTime(varMap,BusId)

end

function x300760_ProcLifeTimeOut(varMap,BusId)
    local varPlayer = GetBusMemberObjId(varMap,BusId,0)
    if(IsPlayerStateNormal(varMap, varPlayer) ~= 0) then
		x300760_Abandon( varMap, varPlayer  )
	end
	DeleteBus(varMap, BusId,1)
end

function x300760_ProcWaitTimeOut(varMap,BusId)

	local varPlayer = GetBusMemberObjId(varMap,BusId,0)
	if(IsPlayerStateNormal(varMap, varPlayer) ~= 0) then
		x300760_Abandon( varMap, varPlayer  )
		local varText = "由于您离开护送目标时间过久或护送目标已被击杀，您的护送目标消失了，任务失败！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varText,8,2)
	end
	DeleteBus(varMap, BusId,1)
end

function x300760_ProcBusStopWhenOwnerFarAway(varMap, ownerId)
	local varText = "很抱歉，由于您离开#g运金飞行器#w#o过远，飞行器迷失方向停止前进！"
	StartTalkTask(varMap)
	TalkAppendString(varMap, varText);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap, ownerId)
	Msg2Player(varMap,ownerId,varText,8,2)
end







function x300760_Abandon( varMap, varPlayer )

	for varI,itm in x300760_var_QuestId do
		
		if IsHaveQuestNM( varMap, varPlayer, itm.varId) ~= 0 then	
			
			DelQuestNM( varMap, varPlayer, itm.varId)
			x300760_SetDayCount(varMap, varPlayer)
			return
		end
	end

end




function x300760_CleaupQuest( varMap, varPlayer )

	for varI,itm in x300760_var_QuestId do
		
		if IsHaveQuestNM( varMap, varPlayer, itm.varId) ~= 0 then	
			
			DelQuestNM( varMap, varPlayer, itm.varId)
			local varReadme = "由于您离开护送目标时间过久或护送目标已被击杀，您的护送目标消失了，任务失败！"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varReadme);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,varReadme,8,2)
			x300760_SetDayCount(varMap, varPlayer)
			return
		end
	end

end




function x300760_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_PAO_QIAN_DATE[1], MD_PAO_QIAN_DATE[2], MD_PAO_QIAN_DATE[3])

	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_PAO_QIAN_DATE[1], MD_PAO_QIAN_DATE[2], MD_PAO_QIAN_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_PAO_QIAN_COUNT[1], MD_PAO_QIAN_COUNT[2], MD_PAO_QIAN_COUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_PAO_QIAN_COUNT[1], MD_PAO_QIAN_COUNT[2], MD_PAO_QIAN_COUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_PAO_QIAN_COUNT[1], MD_PAO_QIAN_COUNT[2], MD_PAO_QIAN_COUNT[3], varDaycount+1)
	end
end
