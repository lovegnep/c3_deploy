
x300354_var_FileId = 300354

function x300354_SetQuestData(varMap, varPlayer)
		SetPlayerGameData(varMap, varPlayer, MD_SPOUSE_MISSION_DATE[1][1], MD_SPOUSE_MISSION_DATE[1][2], MD_SPOUSE_MISSION_DATE[1][3], GetDayOfYear())
end

function x300354_ProcTime(varMap,BusId)

end


function x300354_Abandon( varMap, varPlayer )
	local varText = "由于您离开#G淘气的小孩#W#o时间过久，孩童走失了，任务失败！"
	StartTalkTask(varMap)
	TalkAppendString(varMap, varText);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,varText,8,2)
	DelQuestNM( varMap, varPlayer, SPOUSE_TASK[2] )
	
	x300354_SetQuestData(varMap, varPlayer)
	
	
	local spouseGuid = GetSpouseGUID( varMap, varPlayer )
	local spouseName = GetFriendName( varMap, varPlayer, tonumber(spouseGuid) )
	SendScriptPost( varMap, spouseName, MAIL_DELETE_MISSION, SPOUSE_TASK[2], 0, 0, varPlayer )
end

function x300354_ProcLifeTimeOut(varMap,BusId)
	x300354_ProcWaitTimeOut(varMap,BusId)
end

function x300354_ProcWaitTimeOut(varMap,BusId)
	local varPlayer = GetBusMemberObjId(varMap,BusId,0)
	if(IsPlayerStateNormal(varMap, varPlayer) ~= 0) then

		local varText = "由于您离开#G淘气的小孩#W#o时间过久，孩童走失了，任务失败！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varText,8,2)
		DelQuestNM( varMap, varPlayer, SPOUSE_TASK[2] )	
		
		x300354_SetQuestData(varMap, varPlayer)
		
		
		local spouseGuid = GetSpouseGUID( varMap, varPlayer )
		local spouseName = GetFriendName( varMap, varPlayer, tonumber(spouseGuid) )
		SendScriptPost( varMap, spouseName, MAIL_DELETE_MISSION, SPOUSE_TASK[2], 0, 0, varPlayer )
	
	end
	DeleteBus(varMap, BusId,1)
end

function x300354_ProcBusStopWhenOwnerFarAway(varMap, ownerId)
	local varText = "很抱歉，由于您离开#G淘气的小孩#o过远，迷路的他留在原地哇哇大哭！"
	StartTalkTask(varMap)
	TalkAppendString(varMap, varText);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap, ownerId)
	Msg2Player(varMap,ownerId,varText,8,2)
end

function x300354_ProcIntoBusEvent(varMap, varPlayer, varTalknpc)
	local IsOwner = IsTheBusOwner(varMap, varPlayer, varTalknpc )
	if IsOwner == 1 then
		
		AddBusMember(varMap, varPlayer,varTalknpc)
	end
end

function x300354_ProcIntoBusAfter(varMap, varPlayer,varBusID)

    if(IsObjValid (varMap,varBusID) ~= 1)then
        return
    end

	local varQuest = GetBusQuestID(varMap,varBusID)

	local CarName = GetName( varMap, varPlayer ).."护送的孩童"
	SetBusTitle(varMap , varBusID, CarName)

	local camp = GetCurCamp(varMap, varPlayer)
	SetBusCurCamp(varMap, varBusID,camp)
	
end

function x300354_ProcLeaveBusEvent(varMap, varPlayer,BusId)
end

function x300354_ProcDie(varMap,BusId,idKiller)
end

function x300354_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varIndex )
end

function x300354_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
end

function x300354_ProcCreateBusOK(varMap,varPlayer,busId,varTalknpc,varQuest)	
	
	SetBusTimerTick(varMap , busId, 1000)
	SetBusWaitTime(varMap , busId, 300)
	SetBusLifeTime(varMap , busId, 30000)
	SetBusTimerOpen(varMap, busId, 0)
	
	SetBusQuestID(varMap,busId,SPOUSE_TASK[2])
end
