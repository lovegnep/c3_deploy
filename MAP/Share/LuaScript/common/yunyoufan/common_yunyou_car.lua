

x310071_var_FileId = 310071

x310071_var_GodIndex = 1210

x310071_var_MainScriptId = 310070

x310071_var_QuestList = {8080,8081,8082,8083,8084,8085,8086,8087,8088,8089,8090}







function x310071_ProcEventEntry(varMap, varPlayer, varTalknpc)	

end






function x310071_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
end


function x310071_ProcCreateBus( varMap, varPlayer,varQuest,varBusID )

  local PosX,PosZ = GetWorldPos(varMap, varPlayer)

	local varObj = CreateBus(varMap, varBusID, PosX, PosZ, 3, 3, 310071, varPlayer, x310071_var_GodIndex,varQuest,varTalknpc)
end

function x310071_ProcCreateBusOK(varMap, varPlayer,busId,varTalknpc,varQuest)	

	SetBusTimerTick(varMap , busId, 1000)
	SetBusWaitTime(varMap , busId, 300)
	SetBusTimerOpen(varMap, busId, 0)
	SetBusCurCamp(varMap, busId,20)
	SetBusQuestID(varMap,busId,varQuest)
	
	
	local varIndex = -1
		
	if varQuest == 8080 then
		LuaCallNoclosure( 310070, "ProcCreateBusOK", varMap, varPlayer ,busId,varTalknpc,varQuest)	
	elseif varQuest >= 8081 and  varQuest <= 8085 then
		varIndex = varQuest - 8081 + 1
		LuaCallNoclosure( 310072, "ProcCreateBusOK", varMap, varPlayer ,busId,varTalknpc,varQuest,varIndex)
	elseif varQuest >= 8086 and  varQuest <= 8090 then
		varIndex = varQuest - 8086 + 1
		LuaCallNoclosure( 310073, "ProcCreateBusOK", varMap, varPlayer ,busId,varTalknpc,varQuest,varIndex)
	end
end


function x310071_DeleteBus(varMap, varObj)

	DeleteBus(varMap, varObj,1)

end





function x310071_ProcIntoBusEvent(varMap, varPlayer,varTalknpc)
	local IsOwner = IsTheBusOwner(varMap, varPlayer, varTalknpc )
	if IsOwner == 1 then
		
		AddBusMember(varMap, varPlayer,varTalknpc)
	end
end

function x310071_ProcIntoBusAfter(varMap, varPlayer,varBusID)

end



function x310071_ProcLeaveBusEvent(varMap, varPlayer,BusId)
		
end


function x310071_ProcDie(varMap,BusId,idKiller)

    if(IsObjValid (varMap,BusId) ~= 1)then
        return
    end

	if idKiller == -1 then
		
		local OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			local varReadme = "#R您的护送目标被杀死，护送任务失败！"
			StartTalkTask(varMap);
			TalkAppendString(varMap, varReadme);
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,OwnerID)
			Msg2Player(varMap,OwnerID,varReadme,8,2)
			
			for varI, item in x310071_var_QuestList do
				if IsHaveQuestNM( varMap, OwnerID, item ) > 0 then
					DelQuestNM( varMap, OwnerID, item)
					break;
				end
			end
		end
		return
	end

	if GetObjType(varMap,idKiller) == 1 then     
	
		local BusMisId = GetBusQuestID( varMap,BusId )


		local OwnerCountry = GetBusCountryID(varMap,BusId)
		local KillerCountry = GetCurCountry(varMap,idKiller)
		
		local OwnerID = GetBusMemberObjId(varMap,BusId,0)

		if OwnerID ~= -1 then
			if(IsPlayerStateNormal(varMap, OwnerID) ~= 0) then
				local varReadme = "您的护送目标杀死，任务失败！"
				StartTalkTask(varMap);
				TalkAppendString(varMap, "您的护送目标杀死，任务失败！");
				StopTalkTask(varMap);
				DeliverTalkTips(varMap,OwnerID);
				Msg2Player(varMap,OwnerID,varReadme,8,2)

				for varI, item in x310071_var_QuestList do
					if IsHaveQuestNM( varMap, OwnerID, item ) > 0 then
						DelQuestNM( varMap, OwnerID, item)
						break;
					end
				end
			end
		end
	else		
		local OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			if(IsPlayerStateNormal(varMap, OwnerID) ~= 0) then
				local varReadme = "您的护送目标杀死，任务失败！"
				StartTalkTask(varMap);
				TalkAppendString(varMap, "您的护送目标杀死，任务失败！");
				StopTalkTask(varMap);
				DeliverTalkTips(varMap,OwnerID);
				Msg2Player(varMap,OwnerID,varReadme,8,2)

				for varI, item in x310071_var_QuestList do
					if IsHaveQuestNM( varMap, OwnerID, item ) > 0 then
						DelQuestNM( varMap, OwnerID, item)
						break;
					end
				end
			end
		end
	end

end


function x310071_ProcTime(varMap,BusId)

end

function x310071_ProcLifeTimeOut(varMap,BusId)
    local varPlayer = GetBusMemberObjId(varMap,BusId,0)
    
	DeleteBus(varMap, BusId,1)

	if(IsPlayerStateNormal(varMap, varPlayer) ~= 0) then
		local varText = "您的护送目标消失了，任务失败！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varText,8,2)
		

		for varI, item in x310071_var_QuestList do
			if IsHaveQuestNM( varMap, varPlayer, item ) > 0 then
				DelQuestNM( varMap, varPlayer, item)
				break;
			end
		end
	end

end

function x310071_ProcWaitTimeOut(varMap,BusId)
	local varPlayer = GetBusMemberObjId(varMap,BusId,0)
	if(IsPlayerStateNormal(varMap, varPlayer) ~= 0) then
		local varText = "由于您离开护送目标时间过久，您的护送目标消失了，任务失败！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varText,8,2)
		

		for varI, item in x310071_var_QuestList do
			if IsHaveQuestNM( varMap, varPlayer, item ) > 0 then
				DelQuestNM( varMap, varPlayer, item)
				break;
			end
		end
	end
	DeleteBus(varMap, BusId,1)
end

function x310071_ProcBusStopWhenOwnerFarAway(varMap, ownerId)
	local varText = "很抱歉，您的护送目标离您过远，护送目标停止移动！"
	StartTalkTask(varMap)
	TalkAppendString(varMap, varText);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap, ownerId)
	Msg2Player(varMap,ownerId,varText,8,2)
end

function x310071_ProcLogInOrDie(varMap, varPlayer)
	
	for varI, item in x310071_var_QuestList do
		if IsHaveQuestNM( varMap, varPlayer, item ) > 0 then
			local varText = "您的护送目标消失了，任务失败！"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,varText,8,2)
			DelQuestNM( varMap, varPlayer, item)
			break;
		end
	end
	
end
