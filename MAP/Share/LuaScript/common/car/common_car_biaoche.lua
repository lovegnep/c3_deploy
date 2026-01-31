


x911117_var_FileId = 911117
x911117_var_QuestName = "创建镖车"


x911117_var_GodIndex = 1210
x911117_var_Carinfo = {CarType = 3,BaseAI = 3,AIScript = 3,Script = 911117 }








function x911117_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	
	
	local PosX,PosZ = GetWorldPos(varMap, varPlayer)

	local varObj = CreateBus(varMap, x911117_var_Carinfo.CarType, PosX, PosZ, x911117_var_Carinfo.BaseAI, x911117_var_Carinfo.AIScript, x911117_var_Carinfo.Script, varPlayer, x911117_var_GodIndex,-1,varTalknpc)
	
end






function x911117_ProcCreateBusOK(varMap,varPlayer,busId,varTalknpc,varQuest)
	
	local CarName = GetName( varMap, varPlayer ).." 的镖车"
	SetBusTitle(varMap , busId, CarName)
	SetBusTimerTick(varMap ,busId, 1000)
	SetBusWaitTime(varMap , busId, 5)
	SetBusLifeTime(varMap , busId, 120)
	SetBusTimerOpen(varMap, busId, 0)
	
	StartTalkTask(varMap)
	TalkAppendString(varMap,"你创建了一辆镖车，它将自动跟随你移动。如果你离开它超过15米持续5秒钟，该镖车将会自动消失。2分钟后，该镖车也将会自动消失。")
	StopTalkTask( )	
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	
	StartTalkTask(varMap)
	TalkAppendString(varMap,"你创建了一辆镖车");
	StopTalkTask()
	DeliverTalkTips(varMap,varPlayer)
end



function x911117_DeleteBus(varMap, varObj)
		
	DeleteBus(varMap, varObj,1)

end







function x911117_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x911117_var_FileId, x911117_var_QuestName);
end




function x911117_DeleteBus(varMap, varObj)
		
	DeleteBus(varMap, varObj,1)

end




function x911117_ProcIntoBusEvent(varMap, varPlayer,varTalknpc)

	local InBus = IsBusMember(varMap, varPlayer)
	if InBus == 1 then
		StartTalkTask(varMap)
		  	TalkAppendString(varMap,"你已经有镖车了");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		return 
	end
			
	local BusSize = GetBusSize(varMap,varTalknpc) 
	local MemberNum = GetBusMemberCount(varMap,varTalknpc)
	
	if BusSize<=MemberNum  then
		StartTalkTask(varMap)
		  	TalkAppendString(varMap,"这辆镖车已经有人运了");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local IsOwner = IsTheBusOwner(varMap, varPlayer, varTalknpc )	
	if IsOwner == 1 then
		
		AddBusMember(varMap, varPlayer,varTalknpc)
	end
end



function x911117_ProcLeaveBusEvent(varMap, varPlayer,BusId)
		StartTalkTask(varMap)
		  TalkAppendString(varMap,"你正在运镖，无法离开");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
end


function x911117_ProcTime(varMap,BusId)

end

function x911117_ProcLifeTimeOut(varMap,BusId)
	DeleteBus(varMap, BusId,1)
end

function x911117_ProcWaitTimeOut(varMap,BusId)
	DeleteBus(varMap, BusId,1)
end

function x911117_ProcBusStopWhenOwnerFarAway(varMap, ownerId)
end

function x911117_ProcDie(varMap,BusId,idKiller)
end
