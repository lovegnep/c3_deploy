


x911111_var_FileId = 911111
x911111_var_QuestName = "创建共乘BUS"


x911111_var_GodIndex = 1210
x911111_var_Carinfo = {CarType = 2,BaseAI = 3,AIScript = 3,Script = 911111 }








function x911111_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	
	
	local PosX,PosZ = GetWorldPos(varMap, varPlayer)
	
	local varObj = CreateBus(varMap, x911111_var_Carinfo.CarType, PosX, PosZ, x911111_var_Carinfo.BaseAI, x911111_var_Carinfo.AIScript, x911111_var_Carinfo.Script, varPlayer, x911111_var_GodIndex,-1,varTalknpc)
end
	





function x911111_ProcCreateBusOK(varMap,varPlayer,busId,varTalknpc,varQuest)
	
	local CarName = GetName( varMap, varPlayer ).." 的共乘BUS"
	SetBusTitle(varMap , busId, CarName)
	SetBusTimerTick(varMap , busId, 1000)
	SetBusWaitTime(varMap , busId, 20)
	SetBusLifeTime(varMap , busId, 300)
	SetBusTimerOpen(varMap, busId, 0)
	SetBusLeaderFiatMode(varMap, busId,1)
	
	StartTalkTask(varMap)
	TalkAppendString(varMap,"你创建了一辆共乘bus，目前可坐2人。5分钟后，将bus将自动消失。如果空车持续20秒，该bus也将自动消失。")
	StopTalkTask()	
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
	StartTalkTask(varMap)
	TalkAppendString(varMap,"你创建了一辆共乘BUS");
	StopTalkTask()
	DeliverTalkTips(varMap,varPlayer)
end







function x911111_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x911111_var_FileId, x911111_var_QuestName);
end




function x911111_DeleteBus(varMap, varObj)
		
	DeleteBus(varMap, varObj,1)

end




function x911111_ProcIntoBusEvent(varMap, varPlayer,varTalknpc)
			
	local InBus = IsBusMember(varMap, varPlayer)
	if InBus == 1 then
		StartTalkTask(varMap)
		  	TalkAppendString(varMap,"你已经在BUS里了");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		return 
	end
			
	local BusSize = GetBusSize(varMap,varTalknpc) 
	local MemberNum = GetBusMemberCount(varMap,varTalknpc)
	
	if BusSize<=MemberNum  then
		StartTalkTask(varMap)
		  	TalkAppendString(varMap,"战车已经人满为患了");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local IsOwner = IsTheBusOwner(varMap, varPlayer, varTalknpc )	
	if IsOwner == 1 then
		
		AddBusMember(varMap, varPlayer,varTalknpc)
	else
		local BusSize = GetBusMemberCount( varMap, varTalknpc)	
		local BusMemberObjId
		local j = 0
		for varI=1,BusSize do
			 BusMemberObjId = GetBusMemberObjId( varMap,varTalknpc,varI-1)
			 if IsTheBusOwner(varMap, BusMemberObjId, varTalknpc ) == 1 then
			 	j = 1

			 end
		end
		if j == 0 then
			StartTalkTask(varMap)
			  	TalkAppendString(varMap,"共乘BUS的主人还没进去呢，你就想进去？");
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
			return
		else
			
			AddBusMember(varMap, varPlayer,varTalknpc)
		end 
	end
end



function x911111_ProcLeaveBusEvent(varMap, varPlayer,BusId)
	 DelBusMember(varMap, varPlayer,BusId)
	
	
	
	
end



function x911111_ProcTime(varMap,BusId)

end

function x911111_ProcLifeTimeOut(varMap,BusId)
	DeleteBus(varMap, BusId,1)
end

function x911111_ProcWaitTimeOut(varMap,BusId)
	DeleteBus(varMap, BusId,1)
end

function x911111_ProcBusStopWhenOwnerFarAway(varMap, ownerId)
end

function x911111_ProcDie(varMap,BusId,idKiller)
end
