
x320017_var_FileId 						= 320017

x320017_var_QuestName 					= "创建镖车"

x320017_var_GodIndex 					= 1210
x320017_var_QuestId						= 6653
x320017_var_QuestId1					= 6654

x320017_var_Carinfo 					= 
{
						{ CarType = 7,BaseAI = 3,AIScript = 3,Script = 320017 },
						{ CarType = 8,BaseAI = 3,AIScript = 3,Script = 320017 },
						{ CarType = 9,BaseAI = 3,AIScript = 3,Script = 320017 },
						{ CarType = 38,BaseAI = 3,AIScript = 3,Script = 320017 },
						{ CarType = 39,BaseAI = 3,AIScript = 3,Script = 320017 },
						{ CarType = 40,BaseAI = 3,AIScript = 3,Script = 320017 },
}
x320017_var_GetPlayerExp				= 
{
{level = 40, value = 80},
{level = 65, value = 120},
{level = 85, value = 216},
}

					
function x320017_ProcCreateBus( varMap, varPlayer,varQuest ,varBusID)
local varX,z = GetWorldPos(varMap,varPlayer)
--    	local PosX = 0
--    	local PosZ = 0
--	if GetCurCamp(varMap, varPlayer) == 5 then
--    	 PosX = 171
--    	 PosZ = 30
--    elseif GetCurCamp(varMap, varPlayer) == 6 then
--    	 PosX = 40
--    	 PosZ = 278    
--    end
	if GetCurCamp(varMap, varPlayer) == 5 then
		varQuest = x320017_var_QuestId
	elseif GetCurCamp(varMap, varPlayer) == 6 then
		varQuest = x320017_var_QuestId1
	end
	CreateBus(varMap, 47, varX, z, 3, 3, 320017, varPlayer, x320017_var_GodIndex,varQuest,-1)
end


function x320017_ProcCreateBusOK(varMap, varPlayer, busId,varTalknpc,varQuest)	

	SetBusTimerTick(varMap , busId, 1000)
	SetBusWaitTime(varMap , busId, 300)
	SetBusTimerOpen(varMap, busId, 0)
	SetBusQuestID(varMap,busId,varQuest)

	local CarName = GetName( varMap, varPlayer ).."的镖车"
	SetBusTitle(varMap , busId, CarName)
	local camp = GetCurCamp(varMap, varPlayer)
	SetBusCurCamp(varMap, busId,camp)

end

function x320017_ProcIntoBusEvent(varMap, varPlayer,varTalknpc)
	local InBus = IsBusMember(varMap, varPlayer)
	if InBus == 1 then
		StartTalkTask(varMap)
		  	TalkAppendString(varMap,"你已经有镖车了");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "你已经有镖车了"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return
	end

	local BusSize = GetBusSize(varMap,varTalknpc)
	local MemberNum = GetBusMemberCount(varMap,varTalknpc)

	if BusSize<=MemberNum  then
		StartTalkTask(varMap)
		  	TalkAppendString(varMap,"这辆镖车已经有人运了");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "这辆镖车已经有人运了"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return
	end

	local IsOwner = IsTheBusOwner(varMap, varPlayer, varTalknpc )
	if IsOwner == 1 then
		
		AddBusMember(varMap, varPlayer,varTalknpc)
	end
end


function x320017_ProcIntoBusAfter(varMap, varPlayer,varBusID)

end

function x320017_ProcLeaveBusEvent(varMap, varPlayer,BusId)
		StartTalkTask(varMap)
		  TalkAppendString(varMap,"你正在运镖，无法离开");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "你正在运镖，无法离开"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
end

function x320017_ProcTime(varMap,BusId)

end

function x320017_ProcLifeTimeOut(varMap,BusId)
    local varPlayer = GetBusMemberObjId(varMap,BusId,0)
    if(IsPlayerStateNormal(varMap, varPlayer) ~= 0) then
		x320017_Abandon( varMap, varPlayer  )
	end
	DeleteBus(varMap, BusId,1)
end

function x320017_ProcWaitTimeOut(varMap,BusId)

	local varPlayer = GetBusMemberObjId(varMap,BusId,0)
	if(IsPlayerStateNormal(varMap, varPlayer) ~= 0) then
		x320017_Abandon( varMap, varPlayer  )
		local varText = "由于您离开护送目标时间过久或护送目标已被击杀，您的护送目标消失了，任务失败！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varText,8,2)
	end
	DeleteBus(varMap, BusId,1)
end


function x320017_ProcBusStopWhenOwnerFarAway(varMap, ownerId)
	local varText = "很抱歉，由于您离开#G镖车#W#o过远，镖车迷失方向停止前进！"
	StartTalkTask(varMap)
	TalkAppendString(varMap, varText);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap, ownerId)
	Msg2Player(varMap,ownerId,varText,8,2)
end


function x320017_ProcDie(varMap,BusId,idKiller)

    if IsObjValid (varMap,BusId) ~= 1 then
        return
    end

	if idKiller == -1 then
		
		local OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			x320017_Abandon( varMap, OwnerID  )
			local varReadme = "#R您的镖车被摧毁，任务失败！"
			StartTalkTask(varMap);TalkAppendString(varMap, "镖车被摧毁！");StopTalkTask(varMap);Msg2Player(varMap,OwnerID,varReadme,8,2)
		end
		return
	end

	if IsObjValid(varMap,idKiller)  == 0 then
		
		local OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			x320017_Abandon( varMap, OwnerID  )
			local varReadme = "您的镖车被摧毁"
			StartTalkTask(varMap);TalkAppendString(varMap, "镖车被摧毁！");StopTalkTask(varMap);DeliverTalkTips(varMap,OwnerID);Msg2Player(varMap,OwnerID,varReadme,8,2)
		end
		return
	end

	local ObjType = GetObjType(varMap,idKiller)
	if ObjType == 2 then
		local OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			x320017_Abandon( varMap, OwnerID  )
			local varReadme = "您的镖车被怪物摧毁！"
			StartTalkTask(varMap);TalkAppendString(varMap, "镖车被摧毁！");StopTalkTask(varMap);DeliverTalkTips(varMap,OwnerID);Msg2Player(varMap,OwnerID,varReadme,8,2)
		end
		return
	end
	if ObjType == 3 then		
		idKiller = GetOwnerID(varMap, idKiller)
	end
	
	local killerName = GetName(varMap,idKiller)
	local teamid = GetTeamId(varMap, idKiller)
	local teamnum = GetNearTeamCount(varMap, idKiller)
	local varReadme = "您的镖车被"..killerName.."摧毁"
	local killerReadme = "您摧毁了敌方的镖车，您所在阵营获得#R5点#o积分奖励！"
	local killerReadme1 = format("您摧毁了敌方的镖车，并获得了#R%d点#o经验。", x320017_YunBiaoExp(varMap, idKiller))	
	local BusCamp = GetBusCurCamp(varMap,BusId)
	local KillerCamp = GetCurCamp(varMap,idKiller)
			local OwnerID = GetBusMemberObjId(varMap,BusId,0)
			
	
	if BusCamp ~= KillerCamp and OwnerID ~= -1 then
				x320017_Abandon( varMap, OwnerID  )
		StartTalkTask(varMap);TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkTips(varMap,OwnerID)		
		if teamid == -1 then				
	        AddExp(varMap, idKiller, x320017_YunBiaoExp(varMap, idKiller))
		  	StartTalkTask(varMap);TalkAppendString(varMap, killerReadme1);StopTalkTask(varMap);DeliverTalkTips(varMap,idKiller);Msg2Player(varMap,idKiller,killerReadme1,8,2)		
		    local redcamp1, bluecamp1 = LuaCallNoclosure(320016, "GetTwoCampResource", varMap, idKiller)    
			WriteLog(1, format("x320017_ProcDie: Playerid=%s, GetExp=%d, GetRedCampResource=%d, GetBlueCampResource=%d",idKiller, x320017_YunBiaoExp(varMap, idKiller), redcamp1, bluecamp1))

		else
        	for varI = 0, teamnum - 1 do
        		local memberId = GetNearTeamMember(varMap, idKiller, varI)
        			local killerReadme2 = format("您摧毁了敌方的镖车，并获得了#R%d点#o经验。", x320017_YunBiaoExp(varMap, memberId))
        		if GetCurCamp(varMap, idKiller) == 5 then	
        			if GetHp(varMap, memberId) > 0 and GetCurCamp(varMap, memberId) == 5 then
	       				AddExp(varMap, memberId, x320017_YunBiaoExp(varMap, memberId))
		  					StartTalkTask(varMap);TalkAppendString(varMap, killerReadme2);StopTalkTask(varMap);DeliverTalkTips(varMap,memberId);Msg2Player(varMap,memberId,killerReadme2,8,2)		       				
								WriteLog(1, format("x320017_ProcDie: killerName=%s, KillerCamp=%d, memberId=%d,membercamp=%d, GetExp=%d, ",killerName, KillerCamp, memberId,GetCurCamp(varMap, memberId), x320017_YunBiaoExp(varMap, memberId)))
        			end
        		elseif GetCurCamp(varMap, idKiller) == 6 then
        			if	 GetHp(varMap, memberId) > 0 and GetCurCamp(varMap, memberId) == 6 then
	       					AddExp(varMap, memberId, x320017_YunBiaoExp(varMap, memberId))
		  						StartTalkTask(varMap);TalkAppendString(varMap, killerReadme2);StopTalkTask(varMap);DeliverTalkTips(varMap,memberId);Msg2Player(varMap,memberId,killerReadme2,8,2)		       				        			
									WriteLog(1, format("x320017_ProcDie: killerName=%s, KillerCamp=%d, memberId=%d,membercamp=%d, GetExp=%d, ",killerName, KillerCamp, memberId,GetCurCamp(varMap, memberId), x320017_YunBiaoExp(varMap, memberId)))
        			end
        		end
        	end
        end
--				if GetCurCamp(varMap, idKiller) == 5 then
--					LuaCallNoclosure(320016, "SetRedCampResource", varMap, idKiller)
--				elseif GetCurCamp(varMap, idKiller) == 6 then
--					LuaCallNoclosure(320016, "SetBlueCampResource", varMap, idKiller)				
--				end	
		local redcamp1, bluecamp1 = LuaCallNoclosure(320016, "GetTwoCampResource", varMap, idKiller) 
		WriteLog(1, format("x320017_ProcDie: SetRedCampResource=%d, SetBlueCampResource=%d", redcamp1, bluecamp1) )		
			return
		end

		end
		

function x320017_Abandon( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, x320017_var_QuestId) ~= 0 then	
		DelQuestNM( varMap, varPlayer, x320017_var_QuestId)
	end
	if IsHaveQuestNM( varMap, varPlayer, x320017_var_QuestId1) ~= 0 then	
		DelQuestNM( varMap, varPlayer, x320017_var_QuestId1)
	end
end
		
function x320017_YunBiaoExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = 0
	if nLevel < 40 then
		return
		end
	for i, j in x320017_var_GetPlayerExp do
		if nLevel >= j.level then
			nExp = nLevel * j.value
	else		
			return nExp
		end
	end
	return nExp
end
