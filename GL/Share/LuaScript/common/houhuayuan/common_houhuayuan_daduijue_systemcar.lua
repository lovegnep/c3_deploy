x320019_var_FileId 						= 320019
x320019_var_CarName						= ""
x320019_var_AddToPlayerExp				=
{
{level = 40, value = 10800},
{level = 65, value = 16200},
{level = 85, value = 29160},
}
x320019_var_SystemCarIndex				= 1
x320019_var_SystemCarObjId				= {}


function x320019_ProcCreateBusOK(varMap, varPlayer, busId,varTalknpc,varQuest)	

	SetBusTimerTick(varMap , busId, 1000)
	SetBusWaitTime(varMap , busId, 300)
	SetBusTimerOpen(varMap, busId, 0)
	SetBusCurCamp(varMap, busId, 21)
	local CarName = "天运寒玉车"
	SetBusTitle(varMap , busId, CarName)
	SetBusPatrolId(varMap , busId, 1)
	x320019_var_SystemCarObjId[x320019_var_SystemCarIndex] = busId
	x320019_var_SystemCarIndex = x320019_var_SystemCarIndex + 1
	WriteLog(1, format("%d",x320019_var_SystemCarObjId[1]) )
	end


function x320019_ProcDie(varMap,BusId,idKiller)
    if IsObjValid (varMap,BusId) ~= 1 then
        return
    end


	if idKiller == -1 then		
		local varReadme = "天运寒玉车被摧毁！"
		LuaThisScenceM2Wrold(varMap, varReadme, CHAT_MAIN_RIGHTDOWN, 1)
		return
	end

	
	if IsObjValid(varMap,idKiller)  == 0 then		
		local varReadme = "天运寒玉车被摧毁！"
		LuaThisScenceM2Wrold(varMap, varReadme, CHAT_MAIN_RIGHTDOWN, 1)
		return
	end
	
	local ObjType = GetObjType(varMap,idKiller)
	if ObjType == 3 then		
		idKiller = GetOwnerID(varMap, idKiller)
	end
	
	local killerName = GetName(varMap,idKiller)
	local teamid = GetTeamId(varMap, idKiller)
	local teamnum = GetNearTeamCount(varMap, idKiller)
	local camp = ""
	local KillerCamp = GetCurCamp(varMap,idKiller)
		if KillerCamp == 5 then camp = "大元怯薛军" 
		elseif KillerCamp == 6 then camp = "幻化冥王军"
		else return
		end
	local varReadme = format("天运寒玉车被%s摧毁,%s增加资源积分100点", killerName,camp)
	local BusCamp = GetBusCurCamp(varMap,BusId)
	
	local KillerCamp = GetCurCamp(varMap,idKiller)
	LuaThisScenceM2Wrold(varMap, varReadme, CHAT_MAIN_RIGHTDOWN, 1)
	if BusCamp ~= KillerCamp then
		if teamid == -1 then
			AddExp(varMap, idKiller, x320019_YunBiaoExp(varMap, idKiller))
			Msg2Player(varMap,idKiller,format("您摧毁了天运寒玉车，获得#R%d点#o经验。", x320019_YunBiaoExp(varMap, idKiller)),8,2)
			Msg2Player(varMap,idKiller,format("您摧毁了天运寒玉车，获得#R%d点#o经验。", x320019_YunBiaoExp(varMap, idKiller)),8,3)
		    local PlayerValue = x320019_GetMD( varMap, idKiller, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL)
		    if PlayerValue <= 32767 then
		    	x320019_SetMD( varMap, idKiller, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL, PlayerValue + 10)
					Msg2Player(varMap, idKiller, format("您摧毁了天运寒玉车，获得#R10点#o的个人积分，你目前积分#R%d点#o",PlayerValue+10), 8, 2)
		    	Msg2Player(varMap, idKiller, format("您摧毁了天运寒玉车，获得#R10点#o的个人积分，你目前积分#R%d点#o",PlayerValue+10), 8, 3)		    	
		    end							
		    WriteLog(1, format("x320019_ProcDie: killerName=%s, AddExp=%d, PlayerValue=%d", GetName(varMap,idKiller), x320019_YunBiaoExp(varMap, idKiller), PlayerValue))						
		else
        	for varI = 0, teamnum - 1 do
        		if GetCurCamp(varMap, idKiller) == 6 then
        			local memberId = GetNearTeamMember(varMap, idKiller, varI)
        			local PlayerValue = x320019_GetMD( varMap, memberId, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL)
        			if GetHp(varMap, memberId) > 0 and GetCurCamp(varMap, memberId) == 6 then        				
        				AddExp(varMap, memberId, x320019_YunBiaoExp(varMap, memberId))
								Msg2Player(varMap, memberId,format("您的队伍摧毁了天运寒玉车，并获得了#R%d点#o经验。", x320019_YunBiaoExp(varMap, memberId)),8,2)
								Msg2Player(varMap, memberId,format("您的队伍摧毁了天运寒玉车，并获得了#R%d点#o经验。", x320019_YunBiaoExp(varMap, memberId)),8,3)  
								if PlayerValue <= 32767 then
										x320019_SetMD( varMap, memberId, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL, PlayerValue + 10)
										Msg2Player(varMap, memberId, format("您的队伍摧毁了天运寒玉车，获得#R10点#o的个人积分，你目前积分#R%d点#o点",PlayerValue+10), 8, 2)
		    						Msg2Player(varMap, memberId, format("您的队伍摧毁了天运寒玉车，获得#R10点#o的个人积分，你目前积分#R%d点#o点",PlayerValue+10), 8, 3)						
								end
									WriteLog(1, format("x320019_ProcDie: killerName=%s, memberName=%s, killerCamp=%d, GetCurCamp=%d, AddExp=%d, PlayerValue=%d", GetName(varMap,idKiller),GetName(varMap,memberId), GetCurCamp(varMap, idKiller),GetCurCamp(varMap, memberId), x320019_YunBiaoExp(varMap, memberId), PlayerValue))						
							end
						elseif GetCurCamp(varMap, idKiller) == 5 then	
        			local memberId = GetNearTeamMember(varMap, idKiller, varI)
        			local PlayerValue = x320019_GetMD( varMap, memberId, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL)
        			if GetHp(varMap, memberId) > 0 and GetCurCamp(varMap, memberId) == 5 then        				
        				AddExp(varMap, memberId, x320019_YunBiaoExp(varMap, memberId))
								Msg2Player(varMap, memberId,format("您的队伍摧毁了天运寒玉车，获得#R%d点#o经验。", x320019_YunBiaoExp(varMap, memberId)),8,2)
								Msg2Player(varMap, memberId,format("您的队伍摧毁了天运寒玉车，获得#R%d点#o经验。", x320019_YunBiaoExp(varMap, memberId)),8,3)
									if PlayerValue <= 32767 then						 
										x320019_SetMD( varMap, memberId, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL, PlayerValue + 10)
										Msg2Player(varMap, memberId, format("您的队伍摧毁了天运寒玉车，获得#R10点#o的个人积分，你目前积分#R%d#o点",PlayerValue+10), 8, 2)
		    						Msg2Player(varMap, memberId, format("您的队伍摧毁了天运寒玉车，获得#R10点#o的个人积分，你目前积分#R%d#o点",PlayerValue+10), 8, 3)
										WriteLog(1, format("x320019_ProcDie: killerName=%s, memberName=%s, killerCamp=%d, GetCurCamp=%d, AddExp=%d, PlayerValue=%d", GetName(varMap,idKiller),GetName(varMap,memberId), GetCurCamp(varMap, idKiller),GetCurCamp(varMap, memberId), x320019_YunBiaoExp(varMap, memberId), PlayerValue))						
									end
						end					           			
        	end					
			end
    end				
		if GetCurCamp(varMap, idKiller) == 5 then
			LuaCallNoclosure(320016, "SetRedCampResource1", varMap, idKiller)
		elseif GetCurCamp(varMap, idKiller) == 6 then
			LuaCallNoclosure(320016, "SetBlueCampResource1", varMap, idKiller)				
		end	
		local redcamp1, bluecamp1 = LuaCallNoclosure(320016, "GetTwoCampResource", varMap, idKiller)
		WriteLog(1, format("x320019_ProcDie: SetRedCampResource=%d, SetBlueCampResource=%d", redcamp1, bluecamp1))	
		return
	end


--	if ObjType == 1 then
--		local BusCamp = GetBusCurCamp(varMap,BusId)
--		local KillerCamp = GetCurCamp(varMap,idKiller)
--		if BusCamp ~= KillerCamp then
--			if teamid == -1 then			
--				LuaAllScenceM2Wrold(varMap, varReadme, CHAT_MAIN_RIGHTDOWN, 1)			
--				StartTalkTask(varMap);TalkAppendString(varMap, "您摧毁了敌国的镖车，您所在阵营获得#R5点积分奖励！");StopTalkTask(varMap);DeliverTalkTips(varMap,idKiller)
--				Msg2Player(varMap,idKiller,format("您摧毁了敌国的镖车，并获得了%d点经验。", x320019_var_AddToPlayerExp),8,2)
--			else
--            	for varI = 0, teamnum - 1 do
--            		local memberId = GetNearTeamMember(varMap, idKiller, varI)
--            		if GetHp(varMap, memberId) > 0 and GetCurCamp(varMap, memberId) == 6 then
--            			AddExp(varMap, memberId, x320019_var_AddToPlayerExp)
--            		end					
--				end
--				LuaAllScenceM2Wrold(varMap, "sadadad"..varReadme, CHAT_MAIN_RIGHTDOWN, 1)
--            end				
--			if GetCurCamp(varMap, idKiller) == 5 then
--				LuaCallNoclosure(320016, "AddRedCampResource", varMap, idKiller)
--			elseif GetCurCamp(varMap, idKiller) == 6 then
--				LuaCallNoclosure(320016, "AddBlueCampResource", varMap, idKiller)				
--			end	
--			return
--		end
--	end		
end

function x320019_ProcTime(varMap,BusId)

end

function x320019_ProcLifeTimeOut(varMap,BusId)
    local varPlayer = GetBusMemberObjId(varMap,BusId,0)
    if(IsPlayerStateNormal(varMap, varPlayer) ~= 0) then
		x320019_Abandon( varMap, varPlayer  )
	end
	DeleteBus(varMap, BusId,1)
end

function x320019_ProcWaitTimeOut(varMap,BusId)

	local varPlayer = GetBusMemberObjId(varMap,BusId,0)
	if(IsPlayerStateNormal(varMap, varPlayer) ~= 0) then
		x320019_Abandon( varMap, varPlayer  )
		local varText = "由于您离开护送目标时间过久或护送目标已被击杀，您的护送目标消失了，任务失败！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varText,8,2)
	end
	DeleteBus(varMap, BusId,1)
end


function x320019_ProcBusStopWhenOwnerFarAway(varMap, ownerId)
	local varText = "很抱歉，由于您离开镖车过远，镖车迷失方向停止前进！"
	StartTalkTask(varMap)
	TalkAppendString(varMap, varText);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap, ownerId)
	Msg2Player(varMap,ownerId,varText,8,2)
end


function x320019_ProcDelayTime(varMap, varTalknpc, paraDelayTime)
		
end


function x320019_YunBiaoExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = 0
	if nLevel < 40 then
		return
	end
	for i, j in x320019_var_AddToPlayerExp do
		if nLevel >= j.level then
			nExp = nLevel * j.value
		else
			return nExp
		end
	end
	return nExp
end




function x320019_DelSystemCarId(varMap)
	x320019_var_SystemCarObjId = {} 
	
end

function x320019_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	if x320019_var_SystemCarObjId == nil then
		return
	end
	if varMap ~= 44 then
		return
	end	
	for i, item in x320019_var_SystemCarObjId do 	
		if item == varPlayer then
			DeleteBus(varMap, varPlayer,1)
			WriteLog(1, format("x320019_ProcAreaEntered: busid=%d", varPlayer))
		end
	end

end

function x320019_ProcMapTimerTick( varMap, monsterobjid )

end


function x320019_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x320019_ProcEventEntry( varMap, monsterobjid )

end

function x320019_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x320019_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
