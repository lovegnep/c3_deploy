x300944_var_FileId 						= 300944

x300944_var_QuestName 					= "创建战车"

x300944_var_GodIndex 					= 1210
x300944_var_QuestId						= {9201, 9202, 9203, 9204}



function x300944_ProcCreateBus( varMap, varPlayer,varQuest ,varBusID)
	local varX,z = GetWorldPos(varMap,varPlayer)
	CreateBus(varMap, 50, varX, z, 3, 3, 300944, varPlayer, x300944_var_GodIndex,varQuest,-1)
end

function x300944_ProcCreateBusOK(varMap, varPlayer, busId,varTalknpc,varQuest)	

	SetBusTimerTick(varMap , busId, 1000)
	SetBusWaitTime(varMap , busId, 300)
	SetBusTimerOpen(varMap, busId, 0)
	SetBusQuestID(varMap,busId,varQuest)

	local CarName = GetName( varMap, varPlayer ).."的战车"
	SetBusTitle(varMap , busId, CarName)
	local camp = GetCurCamp(varMap, varPlayer)
	SetBusCurCamp(varMap, busId,camp)

end

function x300944_ProcIntoBusEvent(varMap, varPlayer,varTalknpc)
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

function x300944_ProcIntoBusAfter(varMap, varPlayer,varBusID)

end

function x300944_ProcLeaveBusEvent(varMap, varPlayer,BusId)
		StartTalkTask(varMap)
		  TalkAppendString(varMap,"你正在运镖，无法离开");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "你正在运镖，无法离开"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
end

function x300944_ProcTime(varMap,BusId)

end

function x300944_ProcLifeTimeOut(varMap,BusId)
    local varPlayer = GetBusMemberObjId(varMap,BusId,0)
    if(IsPlayerStateNormal(varMap, varPlayer) ~= 0) then
		x300944_Abandon( varMap, varPlayer  )
	end
	DeleteBus(varMap, BusId,1)
end

function x300944_ProcWaitTimeOut(varMap,BusId)

	local varPlayer = GetBusMemberObjId(varMap,BusId,0)
	if(IsPlayerStateNormal(varMap, varPlayer) ~= 0) then
		x300944_Abandon( varMap, varPlayer  )
		local varText = "由于您离开护送目标时间过久或护送目标已被击杀，您的护送目标消失了，任务失败！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varText,8,2)
	end
	DeleteBus(varMap, BusId,1)
end


function x300944_ProcBusStopWhenOwnerFarAway(varMap, ownerId)
	local varText = "很抱歉，由于您离开#G战车#W#o过远，战车迷失方向停止前进！"
	StartTalkTask(varMap)
	TalkAppendString(varMap, varText);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap, ownerId)
	Msg2Player(varMap,ownerId,varText,8,2)
end

function x300944_ProcDie(varMap,BusId,idKiller)

    if IsObjValid (varMap,BusId) ~= 1 then
        return
    end

	if idKiller == -1 then
		
		local OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			x300944_Abandon( varMap, OwnerID  )
			local varReadme = "#R您的战车被摧毁，任务失败！"
			StartTalkTask(varMap);TalkAppendString(varMap, "战车被摧毁！");StopTalkTask(varMap);Msg2Player(varMap,OwnerID,varReadme,8,2)
		end
		return
	end

	if IsObjValid(varMap,idKiller)  == 0 then
		
		local OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			x300944_Abandon( varMap, OwnerID  )
			local varReadme = "您的战车被摧毁"
			StartTalkTask(varMap);TalkAppendString(varMap, "战车被摧毁！");StopTalkTask(varMap);DeliverTalkTips(varMap,OwnerID);Msg2Player(varMap,OwnerID,varReadme,8,2)
		end
		return
	end

	local ObjType = GetObjType(varMap,idKiller)
	if ObjType == 2 then
		local OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			x300944_Abandon( varMap, OwnerID  )
			local varReadme = "您的战车被怪物摧毁！"
			StartTalkTask(varMap);TalkAppendString(varMap, "战车被摧毁！");StopTalkTask(varMap);DeliverTalkTips(varMap,OwnerID);Msg2Player(varMap,OwnerID,varReadme,8,2)
		end
		return
	end
	if ObjType == 3 then		
		idKiller = GetOwnerID(varMap, idKiller)
	end
	
	local killerName = GetName(varMap,idKiller)
	local teamid = GetTeamId(varMap, idKiller)
	local teamnum = GetNearTeamCount(varMap, idKiller)
	local varReadme = "您的战车被"..killerName.."摧毁，任务失败,请重新领取"
		if IsHideName(varMap,idKiller) > 0 then
				varReadme = "您的战车被"..HIDE_NAME.."摧毁，任务失败,请重新领取" 
		end
	local killerReadme = "您摧毁了敌方的战车"
	local killerReadme1 = "您摧毁了敌方的战车"
	local BusCamp = GetBusCurCamp(varMap,BusId)
	local KillerCamp = GetCurCamp(varMap,idKiller)
	local OwnerID = GetBusMemberObjId(varMap,BusId,0)
			
	
	if BusCamp ~= KillerCamp and OwnerID ~= -1 then
		x300944_Abandon( varMap, OwnerID  )
		StartTalkTask(varMap);TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkTips(varMap,OwnerID)		
		if teamid == -1 then				
		  	StartTalkTask(varMap);TalkAppendString(varMap, killerReadme1);StopTalkTask(varMap);DeliverTalkTips(varMap,idKiller);Msg2Player(varMap,idKiller,killerReadme1,8,2)		
		else
        	for varI = 0, teamnum - 1 do
        		local memberId = GetNearTeamMember(varMap, idKiller, varI)
        			local killerReadme2 = "您摧毁了敌方的战车。"
        			if GetHp(varMap, memberId) > 0 then
		  					StartTalkTask(varMap);TalkAppendString(varMap, killerReadme2);StopTalkTask(varMap);DeliverTalkTips(varMap,memberId);Msg2Player(varMap,memberId,killerReadme2,8,2)		       				
        			end
        	end
    end
			return
	end

end


function x300944_VarQuest(varMap, varPlayer)
	local nCountryIdx = GetCurCountry(varMap, varPlayer)
	
	if nCountryIdx == 0 then
		return x300944_var_QuestId[1]
	elseif nCountryIdx == 1 then
		return x300944_var_QuestId[2]
	elseif nCountryIdx == 2 then	
		return x300944_var_QuestId[3]
	elseif nCountryIdx == 3 then
		return x300944_var_QuestId[4]
	end	
end


function x300944_Abandon( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, x300944_VarQuest(varMap, varPlayer)) > 0 then	
		DelQuestNM( varMap, varPlayer, x300944_VarQuest(varMap, varPlayer))
	end

end
