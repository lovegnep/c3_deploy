--DECLARE_QUEST_INFO_START--

x300988_var_FileId 	  = 300988
x300988_var_QuestName = "【个人】契丹赋税"
x300988_var_QuestId = 9098  --需要配置任务id,这个任务id仅仅是借用已经存在的
x300988_var_Zone_Pos_X    = {230,245}  --目的地的X范围 ， city_loulanwangcheng_area.ini配置
x300988_var_Zone_Pos_Z    = {130,156} --目的地的z范围 ， city_loulanwangcheng_area.ini配置
--DECLARE_QUEST_INFO_STOP--

x300988_var_Carinfo ={
			{CarType = 45,BaseAI = 3,AIScript = 3, CarName = "达芬奇飞行器", TimerTick=1000}

		}
x300988_var_ScenePatrol	=	{
								{varMap=44, patrolId=0, PosX=478, PosZ=390, CarType = 45} --参见city_loulanwangcheng_patrolpoint.ini配置
							}


x300988_var_AddBuffId = 1210

function x300988_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local IsOwner = IsTheBusOwner(varMap, varPlayer, varTalknpc )

	if IsOwner == 1 then
		AddBusMember(varMap, varPlayer,varTalknpc)
	end
end


--玩家接受任务的时候，创造一个bus,并把玩家放在bus里面
function x300988_ProcAccept(varMap, varPlayer, varTalknpc)
end




function x300988_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	
	if IsHideName(varMap, varPlayer) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"抱歉，蒙面状态不能上车。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 1
	end
	
	return 1

end


function x300988_ProcCreateBus(varMap, varPlayer)   

	local varI=1;
	
	local PosX, PosZ = GetWorldPos(varMap, varPlayer);  --获取创建bus的起始坐标
	local nFaceDir = 0
	
	local ret = CreateBus(varMap, x300988_var_Carinfo[varI].CarType, PosX, PosZ, x300988_var_Carinfo[varI].BaseAI, x300988_var_Carinfo[varI].AIScript, 300988, -1, x300988_var_AddBuffId, -1,-1,nFaceDir)
end


function x300988_GetRandomTime()
	return 1000
end

function x300988_ProcCreateBusOK(varMap,varPlayer,busId,varTalknpc,varQuest)

	local varI=1;
	
	local countryID = 0
		
	SetBusTitle(varMap , busId, x300988_var_Carinfo[varI].CarName);
	SetBusCountryID(varMap , busId, countryID);
	SetBusCurCamp(varMap , busId, countryID);
	SetDelayTimeAfterCreate( varMap, busId, 1000, varI+3 );  --设置m_DelayAfterCreateTimer定时器
	
	SetBusTimerTick(varMap , busId, x300988_GetRandomTime()); --设置m_LogicTimer定时器
	
	SetBusTimerOpen(varMap, busId, 1);
	
	SendSpecificImpactToUnit(varMap, busId, busId, busId, 7060, 0)  --设置技能？？?
	
	AddBusMember(varMap, varPlayer,busId)
end


function x300988_ProcIntoBusEvent(varMap, varPlayer, varTalknpc)

	AddBusMember(varMap, varTalknpc,varPlayer);
	SendSpecificImpactToUnit(varMap, varMap, varMap, varMap, 7060, 0)

end


function x300988_ProcLeaveBusEvent(varMap, varPlayer,BusId)

	 DelBusMember(varMap, varPlayer,BusId)
	 CancelSpecificImpact(varMap,varPlayer, 7060)
	 x300988_DeleteBus(varMap, BusId)
	 DelQuestNM( varMap, varPlayer, x300988_var_QuestId)
end


function x300988_ProcTime(varMap,BusId)

	

	--在此处判断是否到达目的地
	--如果达到目的地，则删除镖车,设置任务为完成状态

	local bIsBusMoving = IsBusMoving(varMap, BusId)
	if bIsBusMoving <= 0 then
		return 0
	end


	
	--判断varTalknpc是否到达了目的地
	local varTalknpc = GetBusMemberObjId(varMap, BusId, 0)
	if varTalknpc <= 0 then
		return 0
	end
	if x300988_CheckArrivedZone(varMap,varTalknpc) == 1 then 
		local varQuestIdx = GetQuestIndexByID( varMap, varTalknpc, x300988_var_QuestId )
		SetQuestByIndex( varMap, varTalknpc, varQuestIdx, 0, 1 )
		SetQuestByIndex( varMap, varTalknpc, varQuestIdx, 7, 1 )

		--x300988_AwardPlayer(varMap,varTalknpc)   --给予玩家奖励
		--x300988_SetDayCount(varMap,varTalknpc)   --第一环任务完成，任务计次
		x300988_DeleteBus( varMap, BusId )
		return 0
	end
	
	local MemberNum = GetBusMemberCount(varMap,BusId)

	if MemberNum <= 0 then
		x300988_DeleteBus( varMap, BusId )
		return 0;
	end
	
	StopBusTimer(varMap,BusId)
	SetBusTimerTick(varMap , BusId, x300988_GetRandomTime())	
		

	
end


function x300988_DeleteBus(varMap, busId)

		local varObj = GetBusMemberObjId(varMap, busId, 0)
		if varObj ~= -1 then
			DelBusMember(varMap, varObj, busId)
			SetWanFaExpMult(  varMap, varObj,  0 )
			CancelSpecificImpact(varMap,varObj, 7060)
		end
		
	DeleteBus(varMap, busId,1)
	
end


--SetDelayTimeAfterCreate会回调
function x300988_ProcDelayTime(varMap, varTalknpc, paraDelayTime)
	SetBusPatrolId(varMap , varTalknpc, x300988_var_ScenePatrol[1].patrolId)
end


function x310080_GetRandomTime()
	return 30000
end


--检测玩家是否到达了目的地
function x300988_CheckArrivedZone(varMap,varTalknpc)
	local varPosX , varPosZ = GetWorldPos(varMap,varTalknpc)
	if (varPosX >= 	x300988_var_Zone_Pos_X[1] and varPosX <= 	x300988_var_Zone_Pos_X[2]) and
	   (varPosZ >= 	x300988_var_Zone_Pos_Z[1] and varPosZ <= 	x300988_var_Zone_Pos_Z[2]) then
	   return 1
	end
	return 0		
end


--给予玩家奖励
--任务状态修改
-- function x300988_AwardPlayer(varMap,varTalknpc)
	-- 三环任务全部做完之后才给予奖励
	-- DelQuestNM( varMap, varTalknpc, x300988_var_QuestId)
	-- StartTalkTask(varMap)
	-- TalkAppendString(varMap,"已经完成第一环任务成功完成")
	-- StopTalkTask(varMap)
	-- DeliverTalkTips(varMap,varTalknpc)

-- end




--使用MD记录玩家的每一环的完成状态,需要申请MD
function x310080_RecordData(varMap, varPlayer,varIndex)
	SetPlayerGameData(varMap,varPlayer,MD_BUS_PATROL_RECORD[1],MD_BUS_PATROL_RECORD[2],MD_BUS_PATROL_RECORD[3],varIndex + 1)
end

function x310080_GetRecordData(varMap, varPlayer,varIndex)
	local result = GetPlayerGameData(varMap, varPlayer, MD_BUS_PATROL_RECORD[1], MD_BUS_PATROL_RECORD[2],MD_BUS_PATROL_RECORD[3] )
	return result - 1
end




function x300988_GetBusFaceDir(varMap)
	return 90
end	

function x300988_GetStartPos(varMap, varIndex)

	local varCount = 1
	for varI, item in x300988_var_ScenePatrol do
		if item.varMap == varMap then
			if varCount < varIndex then
				varCount = varCount + 1
			else
				return item.PosX, item.PosZ;
			end
		end
	end
	return 0, 0;

end



function x300988_CheckAndDisplayError(varMap, varPlayer, varTalknpc)
	return 1
end



function x300988_GetDayCount(varMap, varPlayer)
	
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE1_DATE[1], MD_HOUHUAYUAN_CIRCLE1_DATE[2], MD_HOUHUAYUAN_CIRCLE1_DATE[3])
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[1], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[2], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[3])
	return varDaycount
end


--任务完成的时候计次，任务失败或者放弃不计次
function x300988_SetDayCount(varMap, varPlayer)
	
    local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE1_DATE[1], MD_HOUHUAYUAN_CIRCLE1_DATE[2], MD_HOUHUAYUAN_CIRCLE1_DATE[3])
	if varLastday ~= varToday then
			
		SetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE1_DATE[1], MD_HOUHUAYUAN_CIRCLE1_DATE[2], MD_HOUHUAYUAN_CIRCLE1_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[1], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[2], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[3], 1)		
	else
				
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[1], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[2], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[1], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[2], MD_HOUHUAYUAN_CIRCLE1_DAYCOUNT[3], varDaycount+1)		
	end
end

function x300988_ProcIntoBusAfter(varMap, varPlayer,varBusID)

    if IsObjValid (varMap,varBusID) ~= 1 then
        return
    end

	-- local varQuest = GetBusQuestID(varMap,varBusID)

	
	
	

	-- if AddQuestNM( varMap, varPlayer,x300988_var_QuestId) == 1 then
		
		
		-- GamePlayScriptLog(varMap,varPlayer,GameId)

		-- local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300988_var_QuestId);
		-- SetQuestByIndex(varMap, varPlayer, varQuestIdx, 7, 0);	
	-- end

	local CarName = GetName( varMap, varPlayer ).."的飞行器"
	SetBusTitle(varMap , varBusID, CarName)
	local camp = GetCurCamp(varMap, varPlayer)
	SetBusCurCamp(varMap, varBusID,camp)

end
