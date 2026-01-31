


x300911_var_FileId = 300911
x300911_var_QuestName = "创建镖车"
x300911_var_Mis_Count   = 3

x300911_var_GodIndex = 1210

x300911_var_Carinfo = {
						{ CarType = 42,BaseAI = 3,AIScript = 3,Script = 300911 },
						{ CarType = 43,BaseAI = 3,AIScript = 3,Script = 300911 },
						{ CarType = 44,BaseAI = 3,AIScript = 3,Script = 300911 }
					}

x300911_var_QuestId = 7032
x300911_var_GameId = 71







function x300911_ProcEventEntry(varMap, varPlayer, varTalknpc)	

end






function x300911_ProcEnumEvent(varMap, varPlayer, varTalknpc)
	
end


function x300911_ProcCreateBus( varMap, varPlayer,varQuest ,varBusID)
  
    local PosX = 207
	local PosZ = 192
	local varObj = CreateBus(varMap, x300911_var_Carinfo[varBusID].CarType, PosX, PosZ, x300911_var_Carinfo[varBusID].BaseAI, x300911_var_Carinfo[varBusID].AIScript, x300911_var_Carinfo[varBusID].Script, varPlayer, x300911_var_GodIndex,varQuest,-1)
end


function x300911_ProcCreateBusOK(varMap, varPlayer, busId,varTalknpc,varQuest)		
	SetBusTimerTick(varMap , busId, 1000)
	SetBusWaitTime(varMap , busId, 300)
	SetBusTimerOpen(varMap, busId, 0)
	SetBusQuestID(varMap,busId,varQuest)

	local CarName = GetName( varMap, varPlayer ).."的战车"
	SetBusTitle(varMap , busId, CarName)
	local camp = GetCurCamp(varMap, varPlayer)
	SetBusCurCamp(varMap, busId,camp)
end


function x300911_DeleteBus(varMap, varObj)

	DeleteBus(varMap, varObj,1)

end





function x300911_ProcIntoBusEvent(varMap, varPlayer,varTalknpc)
	local InBus = IsBusMember(varMap, varPlayer)
	if InBus == 1 then
		StartTalkTask(varMap)
		  	TalkAppendString(varMap,"你已经有战车了");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "你已经有战车了"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return
	end

	local BusSize = GetBusSize(varMap,varTalknpc)
	local MemberNum = GetBusMemberCount(varMap,varTalknpc)

	if BusSize<=MemberNum  then
		StartTalkTask(varMap)
		  	TalkAppendString(varMap,"这辆战车已经有人运了");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "这辆战车已经有人运了"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return
	end

	local IsOwner = IsTheBusOwner(varMap, varPlayer, varTalknpc )
	if IsOwner == 1 then
		
		AddBusMember(varMap, varPlayer,varTalknpc)
	end
end

function x300911_ProcIntoBusAfter(varMap, varPlayer,varBusID)

    if IsObjValid (varMap,varBusID) ~= 1 then
        return
    end

	local varQuest = GetBusQuestID(varMap,varBusID)
	
	local varCostMoney = x300911_CalcCostMoney(varMap, varPlayer)
	
	
	if CostMoney( varMap , varPlayer ,0,varCostMoney,301) ~= 1 then
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "很抱歉，您包裹中的现银不足，无法接取任务！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return
		
		
		
		
		
		
		
		
		
		
		
		
	else
		
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您接受了任务：【个人】战车护送")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = format("接受战车护送完成，扣除#R现银#{_MONEY%d}。", varCostMoney)
		
		
		
		
		
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		
		GamePlayScriptLog(varMap,varPlayer,1423)
	end
	
	
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, varQuest )
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

	if AddQuestNM( varMap, varPlayer,varQuest) == 1 then
		
		
		GamePlayScriptLog(varMap,varPlayer,1421)

		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest);
		SetQuestByIndex(varMap, varPlayer, varQuestIdx, 7, 0);	
	end

	local CarName = GetName( varMap, varPlayer ).."的战车"
	SetBusTitle(varMap , varBusID, CarName)
	local camp = GetCurCamp(varMap, varPlayer)
	SetBusCurCamp(varMap, varBusID,camp)

end




function x300911_ProcLeaveBusEvent(varMap, varPlayer,BusId)
		StartTalkTask(varMap)
		  TalkAppendString(varMap,"你正在护送战车，无法离开");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "你正在护送战车，无法离开"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
end


function x300911_ProcDie(varMap,BusId,idKiller)

    if IsObjValid (varMap,BusId) ~= 1 then
        return
    end

	if idKiller == -1 then
		
		local OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			x300911_Abandon( varMap, OwnerID  )
			local varReadme = "您的战车被摧毁"
			StartTalkTask(varMap);TalkAppendString(varMap, "战车被摧毁！");StopTalkTask(varMap);Msg2Player(varMap,OwnerID,varReadme,8,2)
		end
		return
	end

	if IsObjValid(varMap,idKiller)  == 0 then
		
		local OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			x300911_Abandon( varMap, OwnerID  )
			local varReadme = "您的战车被摧毁"
			StartTalkTask(varMap);TalkAppendString(varMap, "战车被摧毁！");StopTalkTask(varMap);DeliverTalkTips(varMap,OwnerID);Msg2Player(varMap,OwnerID,varReadme,8,2)
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
				x300911_Abandon( varMap, OwnerID  )
				local varReadme = "您的战车被摧毁"
				StartTalkTask(varMap);TalkAppendString(varMap, "战车被摧毁！");StopTalkTask(varMap);DeliverTalkTips(varMap,OwnerID);Msg2Player(varMap,OwnerID,varReadme,8,2)
			end
			return
		end
	end

	if ObjType == 1 then     
		
		local BusMisId = GetBusQuestID( varMap,BusId )

		local varCostMoney = x300911_CalcAddMoney(varMap, BusId)
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
				StartTalkTask(varMap);TalkAppendString(varMap, "您击杀了本国的战车，您的PK值增加了");StopTalkTask(varMap);DeliverTalkTips(varMap,idKiller)
				Msg2Player(varMap,idKiller,format("您击杀了本国的战车，您的PK值增加了"),8,2)				
			else
				StartTalkTask(varMap);TalkAppendString(varMap, "您击杀了本国的战车");StopTalkTask(varMap);DeliverTalkTips(varMap,idKiller)
				Msg2Player(varMap,idKiller,format("您击杀了本国的战车"),8,2)			
			end

		else
	        AddMoney(varMap,idKiller,0,varCostMoney)

		  	StartTalkTask(varMap);TalkAppendString(varMap, "您击杀了敌国的战车！");StopTalkTask(varMap);DeliverTalkTips(varMap,idKiller)
			Msg2Player(varMap,idKiller,format("您击杀了敌国的战车。"),8,2)	
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

			x300911_Abandon( varMap, OwnerID  )

			local GuildTitle = ""
			if GetGuildID(varMap,idKiller) ~= -1 then
				GuildTitle = GetGuildTitle(varMap,idKiller)
			end
			local killerName = GetName(varMap,idKiller)
			local varReadme = "您的战车被"..varCountry..GuildTitle.."的玩家"..killerName.."摧毁，战车护送任务失败！"
			if IsHideName(varMap,idKiller) > 0 then
				varReadme = "您的战车被"..HIDE_NAME.."摧毁，战车护送任务失败！"
			end
			StartTalkTask(varMap);TalkAppendString(varMap, "战车被摧毁！");StopTalkTask(varMap);DeliverTalkTips(varMap,OwnerID);Msg2Player(varMap,OwnerID,varReadme,8,2)

		end
	else		
		local OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			x300911_Abandon( varMap, OwnerID  )
			local varReadme = "您的战车被怪物摧毁，战车护送任务失败！"
			StartTalkTask(varMap);TalkAppendString(varMap, "战车被摧毁！");StopTalkTask(varMap);Msg2Player(varMap,OwnerID,varReadme,8,2)
		end
	end

end


function x300911_ProcTime(varMap,BusId)

end

function x300911_ProcLifeTimeOut(varMap,BusId)
    local varPlayer = GetBusMemberObjId(varMap,BusId,0)
    if(IsPlayerStateNormal(varMap, varPlayer) ~= 0) then
		x300911_Abandon( varMap, varPlayer  )
	end
	DeleteBus(varMap, BusId,1)
end

function x300911_ProcWaitTimeOut(varMap,BusId)
	local varPlayer = GetBusMemberObjId(varMap,BusId,0)
	if(IsPlayerStateNormal(varMap, varPlayer) ~= 0) then
		x300911_Abandon( varMap, varPlayer  )
		local varText = "由于您离开护送目标时间过久或护送目标已被击杀，您的护送目标消失了，任务失败！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "由于您离开护送目标时间过久或护送目标已被击杀，您的护送目标消失了，任务失败！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
	end
	DeleteBus(varMap, BusId,1)
end

function x300911_ProcBusStopWhenOwnerFarAway(varMap, ownerId)
end







function x300911_Abandon( varMap, varPlayer )

	if IsHaveQuestNM( varMap, varPlayer, x300911_var_QuestId) ~= 0 then	
		DelQuestNM( varMap, varPlayer, x300911_var_QuestId)
		x300911_SetDayCount(varMap, varPlayer)
		return
	end

end

function x300911_CleaupQuest( varMap, varPlayer )

	if IsHaveQuestNM( varMap, varPlayer, x300911_var_QuestId) ~= 0 then	
		DelQuestNM( varMap, varPlayer, x300911_var_QuestId)
		local varReadme = "由于您离开护送目标时间过久或护送目标已被击杀，您的护送目标消失了，任务失败！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		x300911_SetDayCount(varMap, varPlayer)
		return
	end

end

function x300911_ProcBusStopWhenOwnerFarAway(varMap, ownerId)
	local varText = "很抱歉，由于您离开#G战车#W#o过远，战车无人引导停止前进！"
	StartTalkTask(varMap)
	TalkAppendString(varMap, varText);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap, ownerId)
	Msg2Player(varMap,ownerId,varText,8,2)
end




function x300911_GetDayCount(varMap, varPlayer)

	if x300911_var_Mis_Count > 0 then

		local varToday = GetDayOfYear()

		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_ZHANCHEYAYUN_DATE[1], MD_ZHANCHEYAYUN_DATE[2], MD_ZHANCHEYAYUN_DATE[3])

		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_ZHANCHEYAYUN_COUNT[1], MD_ZHANCHEYAYUN_COUNT[2], MD_ZHANCHEYAYUN_COUNT[3])
		return varDaycount

	end

	return 0
end




function x300911_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_ZHANCHEYAYUN_DATE[1], MD_ZHANCHEYAYUN_DATE[2], MD_ZHANCHEYAYUN_DATE[3])

	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_ZHANCHEYAYUN_DATE[1], MD_ZHANCHEYAYUN_DATE[2], MD_ZHANCHEYAYUN_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_ZHANCHEYAYUN_COUNT[1], MD_ZHANCHEYAYUN_COUNT[2], MD_ZHANCHEYAYUN_COUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_ZHANCHEYAYUN_COUNT[1], MD_ZHANCHEYAYUN_COUNT[2], MD_ZHANCHEYAYUN_COUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_ZHANCHEYAYUN_COUNT[1], MD_ZHANCHEYAYUN_COUNT[2], MD_ZHANCHEYAYUN_COUNT[3], varDaycount+1)
	end
end


function x300911_CalcCostMoney(varMap, varPlayer)
	local varCount = x300911_GetDayCount(varMap, varPlayer)
	if varCount == 0 then
		return 75000
	elseif varCount == 1 then
		return 150000
	elseif varCount == 2 then
		return 225000
	end
	return 0
end


function x300911_CalcAddMoney(varMap, BusId)
	local nBusIndex = GetBusIndex(varMap,BusId)
	if nBusIndex == x300911_var_Carinfo[1].CarType then
			return 52500
	elseif nBusIndex == x300911_var_Carinfo[2].CarType then
			return 105000
	elseif nBusIndex == x300911_var_Carinfo[3].CarType then
			return 157500
	end
	return 0
end
