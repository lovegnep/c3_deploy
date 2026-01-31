--功能：战车的默认脚本

x302611_var_ScriptId = 302611
x302611_var_MissionName = "创建镖车"

x302611_var_Carinfo = {
						{ 
							{ CarType = 56, BaseAI = 3,AIScript = 3 },
							{ CarType = 57, BaseAI = 3,AIScript = 3 },
							{ CarType = 58, BaseAI = 3,AIScript = 3 },
							{ CarType = 59, BaseAI = 3,AIScript = 3 },
							{ CarType = 60, BaseAI = 3,AIScript = 3 },
							{ CarType = 61, BaseAI = 3,AIScript = 3 },
						},
						{ 
							{ CarType = 7 , BaseAI = 3,AIScript = 3 },
							{ CarType = 8 , BaseAI = 3,AIScript = 3 },
							{ CarType = 9 , BaseAI = 3,AIScript = 3 },
							{ CarType = 38, BaseAI = 3,AIScript = 3 },
							{ CarType = 39, BaseAI = 3,AIScript = 3 },
							{ CarType = 40, BaseAI = 3,AIScript = 3 },
						},
						{ 
							{ CarType = 62, BaseAI = 3,AIScript = 3 },
							{ CarType = 63, BaseAI = 3,AIScript = 3 },
							{ CarType = 64, BaseAI = 3,AIScript = 3 },
							{ CarType = 65, BaseAI = 3,AIScript = 3 },
							{ CarType = 66, BaseAI = 3,AIScript = 3 },
							{ CarType = 67, BaseAI = 3,AIScript = 3 }, 
						},
					}
					
x302611_var_Level = {
							{min =  1, max = 39},
							{min = 40, max = 49},
							{min = 50, max = 59},
							{min = 60, max = 69},
							{min = 70, max = 79},
							{min = 80, max = 149},
					}

x302611_var_MissionId = {
						10305,
						10306,
						10307,
						10308,
						10309,
						10310,
				  }
				  
--任务日志标题显示
x302611_var_Mid = {
								"军粮", "兵器", "秘药",
						}
					  
x302611_var_Color={"#j","","#S"}					  
--掉落物品
x302611_var_GetDropItem = {
							{
								{
									item = 11960012, num = 10
								},
								{
									item = 12270601, num = 5
								},
								{
									item = 12270602, num = 0
								},
							},
							
							{
								{
									item = 11960012, num = 10
								},
								{
									item = 12270601, num = 10
								},
								{
									item = 12270602, num = 0
								},
							},
							
							{
								{
									item = 11960012, num = 10
								},
								{
									item = 12270601, num = 6
								},
								{
									item = 12270602, num = 0
								},
							},
							
							{
								{
									item = 11960012, num = 10
								},
								{
									item = 12270601, num = 10
								},
								{
									item = 12270602, num = 0
								},
							},
							
							{
								{
									item = 11960012, num = 10
								},
								{
									item = 12270601, num = 12
								},
								{
									item = 12270602, num = 0
								},
							},
							
							{
								{
									item = 11960012, num = 10
								},
								{
									item = 12270601, num = 15
								},
								{
									item = 12270602, num = 0
								},
							},
							
						}
--获得特殊奖励
x302611_var_GetSpecialItem = 12270600	

--无敌impact在表中的索引,玩家进入BUS后获得一个无敌impact,
x302611_var_GodIndex = 1210
									  
--记录玩家选择的任务选项
x302611_var_GetPlayerQuestNum = {}     

--**********************************
--任务入口函数
--**********************************

function x302611_ProcEventEntry(varMap, varPlayer, targetId)	--点击该任务后执行此脚本
end

--**********************************
--列举事件
--**********************************
function x302611_ProcEnumEvent(varMap, varPlayer, targetId)
end

function x302611_ProcCreateBusBus( varMap, varPlayer, MissionId, missionIndex, missionNum )
	
	x302611_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)] = {}
	x302611_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionIndex = missionIndex
	x302611_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionNum = missionNum
	
	local PosX,PosZ = GetWorldPos(varMap, varPlayer) 
	local pos = random(1,4)
  --local PosX = PosX + pos
  --local PosZ = PosZ + pos
	local ObjID = CreateBus( varMap, x302611_var_Carinfo[missionNum][x302611_SelectBusByTopLevel(varMap)].CarType, PosX, PosZ, x302611_var_Carinfo[missionNum][x302611_SelectBusByTopLevel(varMap)].BaseAI, x302611_var_Carinfo[missionNum][x302611_SelectBusByTopLevel(varMap)].AIScript, x302611_var_ScriptId, varPlayer, x302611_var_GodIndex, MissionId, -1 )
	
end

function x302611_SelectBusByTopLevel( varMap )

	local minlevel = GetTopListInfo_MinLevel( -1 )
	
	if ( minlevel >= 1 ) then
		for i = 1, getn(x302611_var_Level) do
			if ( minlevel >= x302611_var_Level[i].min and minlevel <= x302611_var_Level[i].max ) then
				return i
			end
		end
	end
	
	return 1
	
end

function x302611_ProcCreateBusOK(varMap, varPlayer, busId, targetId, MissionId)	

	local missionIndex = x302611_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionIndex
	local missionNum = x302611_var_GetPlayerQuestNum[GetGUID(varMap, varPlayer)].missionNum
  local missioncount =	LuaCallNoclosure( 302610, "GetDayCount", varMap, varPlayer )
	SetBusTimerTick(varMap , busId, 1000)
	SetBusWaitTime(varMap , busId, 300)
	SetBusTimerOpen(varMap, busId, 0)
	SetBusQuestID(varMap, busId, MissionId)

	
		
--			if missioncount==0 then
--	
--			 CarName ="#W"..GetName( varMap, varPlayer ).."护送的"..x302611_var_Mid[missionNum].."镖车"
--			 Name ="官府马车"
--		  end
--	
--		   if missioncount==1 then
--			 CarName ="#o"..GetName( varMap, varPlayer ).."护送的"..x302611_var_Mid[missionNum].."镖车"
--			  Name ="#o官府马车"
--		  end
--		   if missioncount==2 then
--			 CarName ="#S"..GetName( varMap, varPlayer ).."护送的"..x302611_var_Mid[missionNum].."镖车"
--			 Name ="#S官府马车"
--			missioncount=0
--		  end

	local CarName = x302611_var_Color[missionNum]..GetName( varMap, varPlayer ).."护送的"..x302611_var_Mid[missionNum].."镖车"
	--local Name =x302611_var_Color[missionNum].."官府马车"

	SetBusTitle(varMap , busId, CarName)
 -- SetName(varMap , busId, Name)

	local camp = GetCurCamp(varMap, varPlayer)
	SetBusCurCamp(varMap, busId, camp)

end


function x302611_DeleteBus(varMap, varPlayer)

	DeleteBus(varMap, varPlayer, 1)
	
end


--玩家请求进入BUS
function x302611_ProcIntoBusEvent(varMap, varPlayer, targetId)

	local IsOwner = IsTheBusOwner(varMap, varPlayer, targetId )
	if IsOwner == 1 then
		--进入BUS
		AddBusMember(varMap, varPlayer,targetId)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"这不是您的镖车")
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		local Readme = "这不是您的镖车"
		Msg2Player(varMap,varPlayer,Readme,8,2)
	end
	
end

function x302611_ProcIntoBusAfter( varMap, varPlayer, BusID )
end

--玩家离开BUS
--varPlayer：玩家ID
function x302611_ProcLeaveBusEvent(varMap, varPlayer,BusId)
		StartTalkTask(varMap)
		 TalkAppendString(varMap,"你正在护送/押运，无法离开");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		local Readme = "你正在护送/押运，无法离开"
		Msg2Player(varMap,varPlayer,Readme,8,2)
end

function x302611_ProcDie(varMap, BusId, idKiller)

	if IsObjValid ( varMap, BusId ) ~= 1 then
    return
  end

	local MissionId = GetBusQuestID(varMap, BusId)
	local OwnerID = GetBusMemberObjId(varMap,BusId,0)
	
	if IsObjValid ( varMap, OwnerID ) ~= 1 then
    return
  end
	
	local misIndex = GetQuestIndexByID( varMap, OwnerID, MissionId )
	local missionIndex = GetQuestParam(varMap, OwnerID, misIndex, 2)
	local missionNum = GetQuestParam(varMap, OwnerID, misIndex, 3)

	if idKiller == -1 then
		--自死亡，目前只用于将玩家投入监狱前删除镖车
		OwnerID = GetBusMemberObjId(varMap, BusId, 0)
		if OwnerID ~= -1 then
			x302611_Abandon( varMap, OwnerID, MissionId )
			StartTalkTask(varMap)
			TalkAppendString(varMap, "您护送/押运镖车被摧毁")
			StopTalkTask(varMap)
			local Readme = "您护送/押运的镖车被摧毁"
			Msg2Player(varMap,OwnerID,Readme,8,2)
		end
		return
	end

	if IsObjValid(varMap, idKiller) == 0 then
		--无效OBJ
		OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			x302611_Abandon( varMap, OwnerID, MissionId )
			StartTalkTask(varMap)
			TalkAppendString(varMap, "您护送/押运镖车被摧毁")
			StopTalkTask(varMap)
			local Readme = "您护送/押运的镖车被摧毁"
			Msg2Player(varMap,OwnerID,Readme,8,2)
		end
		return
	end

	local ObjType = GetObjType(varMap,idKiller)	

	if ObjType == 3 then		-- 被PET杀死
		ObjType = 1
		idKiller = GetOwnerID(varMap,idKiller)
		if IsPlayerStateNormal(varMap,idKiller) == 0 then    --主人的状态不正常
			OwnerID = GetBusMemberObjId(varMap,BusId,0)
			if OwnerID ~= -1 then
				x302611_Abandon( varMap, OwnerID, MissionId )
				StartTalkTask(varMap)
				TalkAppendString(varMap, "您护送/押运镖车被摧毁")
				StopTalkTask(varMap)
				local Readme = "您护送/押运的镖车被摧毁"
				Msg2Player(varMap,OwnerID,Readme,8,2)
				x302611_BusDropItem(varMap, OwnerID, BusId)
			end
			return
		end
	end

	if ObjType == 1 then     --被玩家杀死

		local OwnerCountry = GetBusCountryID(varMap,BusId)
		local KillerCountry = GetCurCountry(varMap,idKiller)
		
		if OwnerCountry == KillerCountry then	
					
			--PK惩罚
			local IsPunish = 0
			OwnerId = GetBusMemberObjId(varMap,BusId,0)
			if OwnerId ~= -1 then
				IsPunish = LuaCallNoclosure( SCENE_SCRIPT_ID, "CashboxComputePKPunish", varMap, OwnerId, idKiller )
				if IsKing( varMap, idKiller ) ~= 1 and IsPunish == 1 then
					--非国王并且PK惩罚值大于0
					LuaCallNoclosure( SCENE_SCRIPT_ID, "KillerEnterPrison", varMap, idKiller )
					IsPunish = 1
				else
					IsPunish = 0
				end			
			end
			x302611_BusDropItem(varMap, OwnerID, BusId)
			if IsPunish==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "您击杀了本总堂的同伴护送的镖车，您的PK值增加了")
				StopTalkTask(varMap)
				local Readme = "您击杀了本总堂的同伴护送的镖车，您的PK值增加了"
				Msg2Player(varMap,idKiller,Readme,8,2)	
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap, "您击杀了本总堂的同伴护送的镖车")
				StopTalkTask(varMap)
				local Readme = "您击杀了本总堂的同伴护送的镖车"
				Msg2Player(varMap,idKiller,Readme,8,2)			
			end

		else
		
			x302611_BusDropItem(varMap, OwnerID, BusId)
			StartTalkTask(varMap)
			TalkAppendString(varMap, "您击杀了敌阵营护送的镖车")
			StopTalkTask(varMap)
			local Readme = "您击杀了敌阵营护送的镖车"
			Msg2Player(varMap,idKiller,Readme,8,2)
			
		end

		local Country = ""
		if KillerCountry == 0 then
			Country = "楼兰"
		elseif KillerCountry == 1 then
			Country = "天山"
		elseif KillerCountry == 2 then
			Country = "昆仑"
		elseif KillerCountry == 3 then
			Country = "敦煌"
		else
			return
		end

		OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			x302611_Abandon( varMap, OwnerID, MissionId )
			local GuildTitle = ""
			if GetGuildID(varMap,idKiller) ~= -1 then
				GuildTitle = GetGuildTitle(varMap,idKiller)
			end
			local killerName = GetName(varMap,idKiller)
			local Readme = "您护送的镖车被"..Country..GuildTitle.."的玩家"..killerName.."摧毁，护送/押运"..x302611_var_Mid[missionNum].."镖车失败！"
			if IsHideName(varMap,idKiller) > 0 then
				Readme = "您护送的镖车被"..HIDE_NAME.."摧毁，护送/押运"..x302611_var_Mid[missionNum].."镖车失败！"
			end
			StartTalkTask(varMap)
			TalkAppendString(varMap, Readme)
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,OwnerID)
			Msg2Player(varMap,OwnerID,Readme,8,2)
		end
	else		--被怪杀死
		OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			x302611_Abandon( varMap, OwnerID, MissionId )
			local Readme = "您护送的镖车被怪物摧毁，护送/押运"..x302611_var_Mid[missionNum].."镖车失败！"
			StartTalkTask(varMap)
			TalkAppendString(varMap, Readme)
			StopTalkTask(varMap)
			Msg2Player(varMap,OwnerID,Readme,8,2)
		end
	end

end

function x302611_ProcTime(varMap,BusId)
end

function x302611_ProcLifeTimeOut(varMap, BusId)
	
	if IsObjValid ( varMap, BusId ) ~= 1 then
    return
  end

  local varPlayer = GetBusMemberObjId(varMap,BusId,0)
  local MissionId = GetBusQuestID(varMap, BusId)
  if ( IsPlayerStateNormal(varMap, varPlayer) == 1 ) then 	
		x302611_Abandon( varMap, varPlayer, MissionId )
	end
	DeleteBus(varMap, BusId, 1)
	
end

function x302611_ProcWaitTimeOut(varMap,BusId)
	
	if IsObjValid ( varMap, BusId ) ~= 1 then
    return
  end

	local varPlayer = GetBusMemberObjId(varMap,BusId,0)
	local MissionId = GetBusQuestID(varMap, BusId)
	if ( IsPlayerStateNormal(varMap, varPlayer) == 1 ) then
		x302611_Abandon( varMap, varPlayer, MissionId )
		local Readme = "由于您离开护送/押运目标时间过久或护送/押运目标已被击杀，您护送/押运的镖车消失了，任务失败！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, Readme)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,Readme,8,2)
	end
	DeleteBus(varMap, BusId,1)
	
end

--********************************************************************
--放弃
--********************************************************************
function x302611_Abandon( varMap, varPlayer, MissionId )

	if IsHaveQuestNM( varMap, varPlayer, MissionId) ~= 0 then	-- 如果有这个任务
		DelQuestNM(varMap, varPlayer, MissionId)
		x302611_SetDayCount(varMap, varPlayer)
		return
	end

end

function x302611_CleaupQuest( varMap, varPlayer )

	for i,mission in x302611_var_MissionId do
		if IsHaveQuestNM( varMap, varPlayer, mission) ~= 0 then	-- 如果有这个任务
			DelQuestNM( varMap, varPlayer, mission)
			local Readme = "由于您离开护送/押运目标时间过久或护送/押运目标已被击杀，您护送/押运的镖车消失了，任务失败！"
			StartTalkTask(varMap)
			TalkAppendString(varMap, Readme);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,Readme,8,2)
			x302611_SetDayCount(varMap, varPlayer)
			return
		end
	end

end

function x302611_BusDropItem(varMap, OwnerID, BusId)

	local MissionId = GetBusQuestID(varMap, BusId)
	local misIndex = GetQuestIndexByID( varMap, OwnerID, MissionId )

	if GetQuestParam(varMap, OwnerID, misIndex, 2) == nil or GetQuestParam(varMap, OwnerID, misIndex, 3) == nil then
		return
	end
	
	local missionIndex = GetQuestParam(varMap, OwnerID, misIndex, 2)
	local missionNum = GetQuestParam(varMap, OwnerID, misIndex, 3)
	
	if x302611_var_GetDropItem[missionIndex][missionNum].num > 0 then
		StartItemTask(varMap)
		ItemAppend( varMap, x302611_var_GetDropItem[missionIndex][missionNum].item, x302611_var_GetDropItem[missionIndex][missionNum].num )
		DropItemListToScene(varMap, BusId, 1)
	end
		
	local varRand = 0
	if missionNum == 3 then
		varRand = random(1, 2)
	else
		varRand = random(1, 100)
	end
	if ( varRand == 1 ) then
		StartItemTask(varMap)
			ItemAppend( varMap, x302611_var_GetSpecialItem, 1 )
			DropItemListToScene(varMap, BusId, 0)
	end
	
end

function x302611_ProcBusStopWhenOwnerFarAway(varMap, varPlayer)

	local misIndex = 0
	for i,mission in x302611_var_MissionId do
		if IsHaveQuestNM( varMap, varPlayer, mission ) ~= 0 then	-- 如果有这个任务
			misIndex = GetQuestIndexByID( varMap, varPlayer, mission )
			break
		end
	end
	
	if ( misIndex == 0 ) then
		return
	end
	
	local missionIndex = GetQuestParam(varMap, varPlayer, misIndex, 2)
	local missionNum = GetQuestParam(varMap, varPlayer, misIndex, 3)
	
	local Readme = "很抱歉，由于您离开"..format("#G%s", format(x302611_var_Mid[missionNum]).."镖车").."#W#o过远，"..format(x302611_var_Mid[missionNum].."镖车").."迷失方向而停止前进！"
	StartTalkTask(varMap)
	TalkAppendString(varMap, Readme)
	StopTalkTask(varMap)
	DeliverTalkTips(varMap, varPlayer)
	Msg2Player(varMap,varPlayer,Readme,8,2)
	
end

---------------------------------------------------------------------------------------------------
--更新当天接任务次数
---------------------------------------------------------------------------------------------------
function x302611_SetDayCount(varMap, varPlayer)

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
