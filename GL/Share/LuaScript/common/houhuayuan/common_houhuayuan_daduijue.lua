x320016_var_FileId 						= 320016
x320016_var_CampFlag					= { 5, 6 }	
x320016_var_PlayerProportion			=
{
{level = 40,  Proportion = 1},
{level = 50,  Proportion = 1},
{level = 60,  Proportion = 2},
{level = 70,  Proportion = 3},
{level = 80,  Proportion = 5},
{level = 90,  Proportion = 8},
{level = 100, Proportion = 8},
{level = 110, Proportion = 8},
{level = 120, Proportion = 8},
{level = 130, Proportion = 8},
{level = 140, Proportion = 8},
{level = 150, Proportion = 8},
{level = 160, Proportion = 8}
}

x320016_var_CampPosRed					= 
{
{ idx = 1, varX = 160, z=73 },
{ idx = 2, varX = 348, z=50 },
}
x320016_var_CampPosBlue					= 
{
{ idx = 8, varX = 176, z=362 },
{ idx = 9, varX = 269, z=387 },
}

x320016_var_WeekCount					= 1     --0，代表双周；1，代表单周
x320016_var_GodIndex 					= 1210
x320016_var_CampProportion				= {0, 0} --双方初始权重
x320016_var_TwoCampResource				= {0, 0}  --双方阵营初始资源积分

x320016_var_BanZhuanBuff				= 30560
x320016_var_JiahuBuff 				= 7629
x320016_var_GameOpenId				= 1085
x320016_var_GetJieZhuanExp				=
{
{level = 40, value = 640},
{level = 65, value = 960},
{level = 85, value = 1728},
}
x320016_var_IsHaveBus					= 0
x320016_var_CreateBusPos				=
{
{varX = 55, z = 96},
{varX = 55, z = 104},
{varX = 55, z = 111},
{varX = 55, z = 118},
{varX = 56, z = 125},
}


function x320016_EnterScene( varMap, varPlayer)
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local GetWeekcount = mod (GetWeekIndex() , 2)
	local nlevel = GetLevel( varMap, varPlayer)
	local WeekDay = x320016_GetMD(varMap, varPlayer, MD_YUNBIAOBANZHUAN_WEEK)
	--Msg2Player(varMap, varPlayer, "x320016_var_CampProportion="..x320016_var_CampProportion[1],8, 1)
	--Msg2Player(varMap, varPlayer, "x320016_var_CampProportion1="..x320016_var_CampProportion[2],8, 1)		
	if GetWeekcount == x320016_var_WeekCount then
		return
	end
	
	if varMap ~= 44 then

		return
	end	
	
	if minOfDay < 869 or minOfDay > 900 then
		return
	end

	if weekIdx ~= 6 then
		return
	end	
	
	if nlevel < 40 then
		return
	end
	
	if WeekDay ~= GetWeekIndex() then
		x320016_SetMD(varMap, varPlayer, MD_YUNBIAOBANZHUAN_PLAYERCAMP, 0)
		x320016_SetMD(varMap, varPlayer, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL, 0)
	end	
	
	if GetCurCamp(varMap, varPlayer) == 5 or GetCurCamp(varMap, varPlayer) == 6 then
		return
	end
	
	local PlayerCamp = x320016_GetMD(varMap, varPlayer, MD_YUNBIAOBANZHUAN_PLAYERCAMP)
	if PlayerCamp == 5 then							--根据MD记录改变玩家阵营
		SetCurCamp(varMap, varPlayer, x320016_var_CampFlag[1])    
		SetMPVP6v6BattleDisable(varMap, varPlayer, 0, 1)  
	elseif PlayerCamp == 6 then
		SetCurCamp(varMap, varPlayer, x320016_var_CampFlag[2])	
		SetMPVP6v6BattleDisable(varMap, varPlayer, 0, 0)	
	else
	
	    x320016_SetPlayerGroup( varMap, varPlayer )
	
	end

end


function x320016_GetPlayerProportion(varMap, varPlayer)
	local level = GetLevel(varMap, varPlayer)
	for i, item in x320016_var_PlayerProportion do
		if level <= item.level then 
			return item.Proportion
		end
	end
end


function x320016_GetCampRedDrop(varMap, varPlayer, npos)
	local npos = random(1,2)
	local x1 = x320016_var_CampPosRed[npos].varX
	local z1 = x320016_var_CampPosRed[npos].z
	return x1,z1	
end


function x320016_GetCampBlueDrop(varMap, varPlayer, npos)
	local npos = random(1,2)
	local x1 = x320016_var_CampPosBlue[npos].varX
	local z1 = x320016_var_CampPosBlue[npos].z
	return x1,z1	
end


function x320016_ProcPlayerDie(varMap, varPlayer, varKiller)
	local nKillerType = GetObjType(varMap, varKiller)
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local GetWeekcount = mod (GetWeekIndex() , 2)
	local nlevel = GetLevel( varMap, varPlayer)	
	--当杀人者为怪物则返回
	if nKillerType == 2 then
		return
	end
	
	if nKillerType == 3 then
		varKiller = GetOwnerID(varMap, varKiller)
	end	

	if GetWeekcount == x320016_var_WeekCount then
		return
	end
		
	if varMap ~= 44 then
		return
	end
	
	if minOfDay < 869 or minOfDay > 900 then
		return
	end

	if weekIdx ~= 6 then
		return
	end

	if IsHaveSpecificImpact(varMap, varPlayer, x320016_var_BanZhuanBuff) == 1 then
		DispelSpecificImpact(varMap, varPlayer, x320016_var_BanZhuanBuff, 1)
	   local KillerCamp = GetCurCamp(varMap,varKiller)
	   local PlayerCamp = GetCurCamp(varMap,varPlayer)
	   local teamid = GetTeamId(varMap, varKiller)
		 local teamnum = GetNearTeamCount(varMap, varKiller)
	 if KillerCamp ~= PlayerCamp then
		if teamid == -1 then
			AddExp(varMap, varKiller, x320016_GetPlayerJieZhuanExp(varMap, varKiller))
			Msg2Player(varMap,varKiller,format("顺利保护我方寒玉获得#R%d点#o经验奖励！", x320016_GetPlayerJieZhuanExp(varMap, varKiller)),8,2)
			Msg2Player(varMap,varKiller,format("顺利保护我方寒玉获得#R%d点#o经验奖励！", x320016_GetPlayerJieZhuanExp(varMap, varKiller)),8,3)
		    local PlayerValue = x320016_GetMD( varMap, varKiller, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL)
		    if PlayerValue <= 32767 then
		    	x320016_SetMD( varMap, varKiller, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL, PlayerValue + 1)
					Msg2Player(varMap, varKiller, format("顺利保护我方寒玉获得，获得#R1点#o个人积分奖励，你目前积分#R%d点#o",PlayerValue+1), 8, 2)
		    	Msg2Player(varMap, varKiller, format("顺利保护我方寒玉获得，获得#R1点#o个人积分奖励，你目前积分#R%d点#o",PlayerValue+1), 8, 3)		    	
		    end							
		    WriteLog(1, format("x320016_ProcPlayerDie: killerName=%s, AddExp=%d, PlayerValue=%d", GetName(varMap,varKiller), x320016_GetPlayerJieZhuanExp(varMap, varKiller), PlayerValue))						
		else
        	for varI = 0, teamnum - 1 do
        		if GetCurCamp(varMap, varKiller) == 6 then
        			local memberId = GetNearTeamMember(varMap, varKiller, varI)
        			local PlayerValue = x320016_GetMD( varMap, memberId, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL)
        			if GetHp(varMap, memberId) > 0 and GetCurCamp(varMap, memberId) == 6 then        				
        				AddExp(varMap, memberId, x320016_GetPlayerJieZhuanExp(varMap, memberId))
							  Msg2Player(varMap, memberId,format("顺利保护我方寒玉获得#R%d点#o经验奖励！", x320016_GetPlayerJieZhuanExp(varMap, memberId)),8,2)
					    	Msg2Player(varMap, memberId,format("顺利保护我方寒玉获得#R%d点#o经验奖励！", x320016_GetPlayerJieZhuanExp(varMap, memberId)),8,3)  
					    	if PlayerValue <= 32767 then
					      	x320016_SetMD( varMap, memberId, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL, PlayerValue + 1)
									Msg2Player(varMap, memberId, format("顺利保护我方寒玉获得，获得#R1点#o个人积分奖励，你目前积分#R%d点#o",PlayerValue+1), 8, 2)
		    					Msg2Player(varMap, memberId, format("顺利保护我方寒玉获得，获得#R1点#o个人积分奖励，你目前积分#R%d点#o",PlayerValue+1), 8, 3)						
								end
									WriteLog(1, format("x320016_ProcPlayerDie: killerName=%s, memberName=%s, killerCamp=%d, GetCurCamp=%d, AddExp=%d, PlayerValue=%d", GetName(varMap,varKiller),GetName(varMap,memberId), GetCurCamp(varMap, varKiller),GetCurCamp(varMap, memberId), x320016_GetPlayerJieZhuanExp(varMap, memberId), PlayerValue))						
							end
				  	elseif GetCurCamp(varMap, varKiller) == 5 then	
        			local memberId = GetNearTeamMember(varMap, varKiller, varI)
        			local PlayerValue = x320016_GetMD( varMap, memberId, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL)
        			if GetHp(varMap, memberId) > 0 and GetCurCamp(varMap, memberId) == 5 then        				
        				AddExp(varMap, memberId, x320016_GetPlayerJieZhuanExp(varMap, memberId))
								Msg2Player(varMap, memberId,format("顺利保护我方寒玉获得#R%d点#o经验奖励！", x320016_GetPlayerJieZhuanExp(varMap, memberId)),8,2)
								Msg2Player(varMap, memberId,format("顺利保护我方寒玉获得#R%d点#o经验奖励！", x320016_GetPlayerJieZhuanExp(varMap, memberId)),8,3)
								if PlayerValue <= 32767 then						 
									x320016_SetMD( varMap, memberId, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL, PlayerValue + 1)
									Msg2Player(varMap, memberId, format("顺利保护我方寒玉获得，获得#R1点#o个人积分奖励，你目前积分#R%d点#o",PlayerValue+1), 8, 2)
		    					Msg2Player(varMap, memberId, format("顺利保护我方寒玉获得，获得#R1点#o个人积分奖励，你目前积分#R%d点#o",PlayerValue+1), 8, 3)
									WriteLog(1, format("x320016_ProcPlayerDie: killerName=%s, memberName=%s, killerCamp=%d, GetCurCamp=%d, AddExp=%d, PlayerValue=%d", GetName(varMap,varKiller),GetName(varMap,memberId), GetCurCamp(varMap, varKiller),GetCurCamp(varMap, memberId), x320016_GetPlayerJieZhuanExp(varMap, memberId), PlayerValue))						
								end
			  			end	
			  		end
					end
		end
	 end
	end
	
end


function x320016_ProcPlayerRelive(varMap, varPlayer, value)

end


function x320016_LeaveScence( varMap, varPlayer)

	if varMap ~= 44 then
		SetMPVP6v6BattleDisable(varMap, varPlayer, 1, 0)
		local PlayerCountry = GetCurCountry(varMap, varPlayer)
		if PlayerCountry == 0 then
			SetCurCamp(varMap, varPlayer, 0)
		elseif PlayerCountry == 1 then
			SetCurCamp(varMap, varPlayer, 1)
		elseif PlayerCountry == 2 then
			SetCurCamp(varMap, varPlayer, 2)
		elseif PlayerCountry == 3 then
			SetCurCamp(varMap, varPlayer, 3)
		else
			return
		end
	end

end

function x320016_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5 )
	if x320016_var_GameOpenId > 0 and GetGameOpenById( x320016_var_GameOpenId ) <= 0 then
      return
  end

	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local GetWeekcount = mod (GetWeekIndex() , 2)
	
	if GetWeekcount == x320016_var_WeekCount then
		return
	end
	
	if varMap ~= 44 then
		return
	end
	
	if minOfDay < 869 or minOfDay > 900 then
		return
	end

	if weekIdx ~= 6 then
		return
	end	

	--活动开始后双方资源积分清空	
	x320016_var_TwoCampResource = {0, 0}
	
	--活动开始后清除上一场未清除的阵营记录	
	x320016_SetPlayerCampToMD(varMap)	
	local varMsg1 = format("大对决开始了，请达到40级的勇士们前往后花园参加，后花园可通过威海港传送到达。")
	LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
  LuaAllScenceM2Wrold(varMap,	varMsg1, CHAT_LEFTDOWN, 1)
  LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
	
	SetSystemTimerTick( varMap, x320016_var_FileId, "ProcTimerTick", varAct, 0)
end

function x320016_ProcTimerTick(varMap, varAct, varTime)
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local GetWeekcount = mod (GetWeekIndex() , 2)


	
	
	--剩余时间系统公告刷新/双方资源积分定时刷新

    if 	varMap ~= 44 then
    	return
    end
    
	--双方初始资源积分设定/玩家阵营改变
	if minOfDay == 870 then
		x320016_var_TwoCampResource[1] = 500
		x320016_var_TwoCampResource[2] = 500
		x320016_GetScencePlayerState(varMap)
		x320016_AddToPlayerQuest(varMap)
	end
	    
    if minOfDay >= 870 and minOfDay < 900 then
    	local leavetime = 900 - GetMinOfDay()
    	local varMsg1 = format("后花园大对决剩余时间为：%d分钟", leavetime)
    	--LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
    	LuaThisScenceM2Wrold (varMap, varMsg1, CHAT_LEFTDOWN, 1)
    	LuaThisScenceM2Wrold(varMap, format("大元怯薛军资源为：%d点", x320016_var_TwoCampResource[1]), CHAT_LEFTDOWN, 1)
    	LuaThisScenceM2Wrold(varMap, format("幻化冥王军资源为：%d点", x320016_var_TwoCampResource[2]), CHAT_LEFTDOWN, 1)
    	
    	if x320016_var_TwoCampResource[2] > x320016_var_TwoCampResource[1] then
    		LuaThisScenceM2Wrold(varMap, format("目前领先的一方为：#G幻化冥王军"), CHAT_LEFTDOWN, 1)
    	elseif x320016_var_TwoCampResource[2] < x320016_var_TwoCampResource[1] then
    		LuaThisScenceM2Wrold(varMap, format("目前领先的一方为：#G大元怯薛军"), CHAT_LEFTDOWN, 1)
     	elseif x320016_var_TwoCampResource[2] == x320016_var_TwoCampResource[1] then
    		LuaThisScenceM2Wrold(varMap, format("目前两军势均力敌!"), CHAT_LEFTDOWN, 1)
    	end
    	if minOfDay == 880 or minOfDay == 890 then
    		for i, item in x320016_var_CreateBusPos do 
				CreateBus(varMap, 48, item.varX, item.z, 3, 3, 320019, -1, x320016_var_GodIndex,-1,-1)
    	end
   	

    		LuaThisScenceM2Wrold(varMap, format("携带大量寒玉的天运寒玉车降临在地图西部！"), CHAT_PLANE_SCROLL, 1)
    		LuaThisScenceM2Wrold(varMap, format("携带大量寒玉的天运寒玉车降临在地图西部！"), CHAT_LEFTDOWN, 1)
    		LuaThisScenceM2Wrold(varMap, format("携带大量寒玉的天运寒玉车降临在地图西部！"), CHAT_MAIN_RIGHTDOWN, 1)
    end
    	SetSystemTimerTick( varMap, x320016_var_FileId, "ProcTimerTick", varAct, 300 * 1000)
    end


			
	

	
	--结算双方胜负，给予经验奖励
	if minOfDay == 900 then
		LuaCallNoclosure(320019, "DelSystemCarId", varMap)
			local redresource = x320016_var_TwoCampResource[1]
			local blueresource = x320016_var_TwoCampResource[2]
		if redresource > blueresource then
		LuaThisScenceM2Wrold(varMap, format("大元怯薛军取得了最后的胜利，所有参加大对决活动的玩家请到后花园活动使者郝纨（356，222）处领取经验奖励，所有获得参加大对决活动的玩家可以用个人积分兑换不菲的经验，大元怯薛军阵营的玩家将获得更多的经验奖励。"), CHAT_LEFTDOWN, 1)
--			x320016_SquareRedCampSuccessExp(varMap)
		elseif redresource < blueresource then
		LuaThisScenceM2Wrold(varMap, format("幻化冥王军取得了最后的胜利，所有参加大对决活动的玩家请到后花园活动使者郝纨（356，222）处领取经验奖励，所有获得参加大对决活动的玩家可以用个人积分兑换不菲的经验，幻化冥王军阵营的玩家将获得更多的经验奖励。"), CHAT_LEFTDOWN, 1)
--			x320016_SquareBlueCampSuccessExp(varMap)
		else
		LuaThisScenceM2Wrold(varMap, format("此次胜负未分，所有参加大对决活动的玩家请到后花园活动使者郝纨（356，222）处领取经验奖励，所有获得参加大对决活动的玩家可以用个人积分兑换不菲的经验。"), CHAT_LEFTDOWN, 1)

--			x320016_SquareTwoCampDrawExp(varMap)
		end	
	end
	
	
	

	
	--活动结束后玩家阵营恢复/销毁所有镖车
	if minOfDay >= 900 then
		x320016_GetAllPlayerCurCountry(varMap)
		x320016_DeleteAllBuff(varMap)	
	end	

end


function x320016_GetTwoCampResource(varMap, varPlayer)

	return x320016_var_TwoCampResource[1], x320016_var_TwoCampResource[2]
end

function x320016_SetRedCampResource(varMap, varPlayer)
	x320016_var_TwoCampResource[1] = x320016_var_TwoCampResource[1] + 5
end

function x320016_SetRedCampResource1(varMap, varPlayer)
	x320016_var_TwoCampResource[1] = x320016_var_TwoCampResource[1] + 100
end

function x320016_SetBlueCampResource(varMap, varPlayer)
	x320016_var_TwoCampResource[2] = x320016_var_TwoCampResource[2] + 5
end

function x320016_SetBlueCampResource1(varMap, varPlayer)
	x320016_var_TwoCampResource[2] = x320016_var_TwoCampResource[2] + 100
end

function x320016_AddRedCampResource(varMap, varPlayer)
	x320016_var_TwoCampResource[1] = x320016_var_TwoCampResource[1] + 5
	if x320016_var_TwoCampResource[2] - 5 < 0 then
		x320016_var_TwoCampResource[2] = 0
	else
		x320016_var_TwoCampResource[2] = x320016_var_TwoCampResource[2] - 5
	end
end

function x320016_AddBlueCampResource(varMap, varPlayer)
	x320016_var_TwoCampResource[2] = x320016_var_TwoCampResource[2] + 5
	if x320016_var_TwoCampResource[1] - 5 < 0 then
		x320016_var_TwoCampResource[1] = 0 
	else	
	x320016_var_TwoCampResource[1] = x320016_var_TwoCampResource[1] - 5
	end
end



function x320016_GetScencePlayerState(varMap)
	local humanCount = GetScenePlayerCount(varMap)	
	for	i = 0, humanCount - 1 do
		local humanId = GetScenePlayerObjId(varMap, i)
		local nProportion = x320016_GetPlayerProportion(varMap, humanId)
		if IsHaveSpecificImpact(varMap, humanId, x320016_var_JiahuBuff) == 1 then    
			DispelSpecificImpact(varMap, humanId, x320016_var_JiahuBuff, 1)
			Msg2Player(varMap,humanId,"大对决活动开始，战车加护状态消失",8,3)
			Msg2Player(varMap,humanId,"大对决活动开始，战车加护状态消失",8,2)
		end
		if GetCurCamp(varMap, humanId) == 5 or GetCurCamp(varMap, humanId) == 6 then
			return
		end
		 
		 x320016_SetPlayerGroup( varMap, humanId )
	end
end			

function x320016_DeleteAllBuff(varMap)
	local humanCount = GetScenePlayerCount(varMap)	
	for	i = 0, humanCount - 1 do
		local humanId = GetScenePlayerObjId(varMap, i)
		DispelSpecificImpact(varMap, humanId, x320016_var_BanZhuanBuff, 1)
	end
end


function x320016_AddToPlayerQuest(varMap)
	local humanCount = GetScenePlayerCount(varMap)	
	for	i = 0, humanCount - 1 do
		local humanId = GetScenePlayerObjId(varMap, i)
		if IsQuestFullNM( varMap, humanId )==1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"可接任务数量已满")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,humanId)
			return 
		end	
		if GetCurCamp(varMap, humanId) == 5 then 
				if IsHaveQuestNM(varMap, humanId, 6656) then
					DelQuest(varMap, humanId, 6656)
				end
			--DeliverTalkInfoNM(varMap, humanId, -1, 320031, 6655)
			AddQuest( varMap, humanId, 6655, 320031, 0, 0, 0)
			--SetQuestByIndex(varMap,humanId,GetQuestIndexByID(varMap,humanId,6655),0,1)
			--SetQuestByIndex(varMap,humanId,GetQuestIndexByID(varMap,humanId,6655),7,1)   
		elseif GetCurCamp(varMap, humanId) == 6 then   
				if IsHaveQuestNM(varMap, humanId, 6655) then
					DelQuest(varMap, humanId, 6655)
				end
			--DeliverTalkInfoNM(varMap, humanId, -1, 320032, 6656)
			AddQuest( varMap, humanId, 6656, 320032, 0, 0, 0)
			--SetQuestByIndex(varMap,humanId,GetQuestIndexByID(varMap,humanId,6656),0,1)
			--SetQuestByIndex(varMap,humanId,GetQuestIndexByID(varMap,humanId,6656),7,1) 		
		end	
	end
end


function x320016_SetPlayerCampToMD(varMap)
	local humanCount = GetScenePlayerCount(varMap)	
	for	i = 0, humanCount - 1 do
		local humanId = GetScenePlayerObjId(varMap, i)
		local WeekDay = x320016_GetMD(varMap, humanId, MD_YUNBIAOBANZHUAN_WEEK)		
		if WeekDay ~= GetWeekIndex() then
			x320016_SetMD(varMap, humanId, MD_YUNBIAOBANZHUAN_PLAYERCAMP, 0)
			x320016_SetMD(varMap, humanId, MD_YUNBIAOBANZHUAN_SETPLAYERINTEGRAL, 0)
		end	
	end		
end


function x320016_GetAllPlayerCurCountry(varMap)
	local humanCount = GetScenePlayerCount(varMap)
	for	i = 0, humanCount - 1 do
		local humanId = GetScenePlayerObjId(varMap, i)
		local PlayerCountry = GetCurCountry(varMap, humanId)
		SetMPVP6v6BattleDisable(varMap, humanId, 1, 0)
		if PlayerCountry == 0 then
			SetCurCamp(varMap, humanId, 0)
		elseif PlayerCountry == 1 then
			SetCurCamp(varMap, humanId, 1)
		elseif PlayerCountry == 2 then
			SetCurCamp(varMap, humanId, 2)
		elseif PlayerCountry == 3 then
			SetCurCamp(varMap, humanId, 3)
		end
	end			
end


function x320016_GetPlayerJieZhuanExp(varMap, varPlayer)
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = 0
	if nLevel < 40 then
		return
	end
	for i, j in x320016_var_GetJieZhuanExp do
		if nLevel >= j.level then
			nExp = nLevel * j.value
		else
			return nExp
		end
	end
	return nExp
end

function x320016_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x320016_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end


--判断玩家是否是弱国联盟成员
function x320016_IsInLeague( varMap, varPlayer )
    
    local nCountry = GetCurCountry( varMap, varPlayer )
    for i = 0,3 do
        if i ~= nCountry then
            if IsLeague( nCountry, i ) == 1 then
                return 1
            end
        end
    end

    return 0

end


--是否有弱国联盟
function x320016_IsHaveLeague()
    
    for i = 0, 3 do
        for j = 0, 3 do
            if i ~= j then
                
                if IsLeague( i, j ) == 1 then
                    return 1
                end
            
            end
        end
    end
    
    
    return 0


end


--设置玩家阵营
function x320016_SetPlayerGroup( varMap, varPlayer )

        local fenPeiIndex = -1
	    local nProportion = x320016_GetPlayerProportion(varMap, varPlayer)	
	     
	    if x320016_IsHaveLeague() == 1 then --有弱国联盟
	    
	          if  x320016_IsInLeague( varMap, varPlayer ) == 1 then 
	                
	                fenPeiIndex = 1
	          
	          else
	                fenPeiIndex = 2
	                
	          end
	    
	    else --无联盟，按照分数分
	          
	         
		      if x320016_var_CampProportion[1] >= x320016_var_CampProportion[2] then
		            fenPeiIndex = 2
		      else
		            fenPeiIndex = 1
		      end
	      
	    end
	    

        x320016_var_CampProportion[fenPeiIndex] = x320016_var_CampProportion[fenPeiIndex] + nProportion
        SetCurCamp(varMap, varPlayer, x320016_var_CampFlag[fenPeiIndex])
        x320016_SetMD(varMap, varPlayer, MD_YUNBIAOBANZHUAN_PLAYERCAMP, x320016_var_CampFlag[fenPeiIndex])
        x320016_SetMD(varMap, varPlayer, MD_YUNBIAOBANZHUAN_WEEK, GetWeekIndex())
        
        if fenPeiIndex == 2 then
        	SetMPVP6v6BattleDisable(varMap, varPlayer, 0, 0)  --阵营玩家颜色
        	Msg2Player(varMap, varPlayer, "进入大对决玩法，你被系统随机划分至幻化冥王军阵营", 8, 2)
        	Msg2Player(varMap, varPlayer, "进入大对决玩法，你被系统随机划分至幻化冥王军阵营", 8, 3)
        else
            SetMPVP6v6BattleDisable(varMap, varPlayer, 0, 1)  --阵营玩家颜色			
            Msg2Player(varMap, varPlayer, "进入大对决玩法，你被系统随机划分至大元怯薛军阵营", 8, 2)
            Msg2Player(varMap, varPlayer, "进入大对决玩法，你被系统随机划分至大元怯薛军阵营", 8, 3)
        end    	
        


end
