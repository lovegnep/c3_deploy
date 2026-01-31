
x300719_var_BirdId = 580
x300719_var_Scorpion1 = 581
x300719_var_Scorpion2 = 582	
x300719_var_Scorpion3 = 583

x300719_var_FileId = 300719

x300719_var_TickTime = 1000*60*120
x300719_var_BroadCastTickTime = 1000*60*105
x300719_var_Msg = "令火鸟要重新回到这个世界了"


function x300719_ProcDie(varMap, varPlayer, varKiller)
	
	if varMap == 50 then
		SetSystemTimerTick( varMap, x300719_var_FileId, "ProcBroadCast", 71, x300719_var_BroadCastTickTime  ) 
	elseif varMap == 150 then
		SetSystemTimerTick( varMap, x300719_var_FileId, "ProcBroadCast", 72, x300719_var_BroadCastTickTime  ) 
	elseif varMap == 250 then
		SetSystemTimerTick( varMap, x300719_var_FileId, "ProcBroadCast", 73, x300719_var_BroadCastTickTime  ) 
	elseif varMap == 350 then
		SetSystemTimerTick( varMap, x300719_var_FileId, "ProcBroadCast", 74, x300719_var_BroadCastTickTime  ) 
	end
	
	if GetObjType(varMap, varKiller) == 3 then
		varKiller = GetMasterObjId(varMap, varKiller)
		if varKiller == nil then
			return
		end
	end

	GmKillObj( varMap, varKiller, x300719_var_Scorpion1 ) 
	GmKillObj( varMap, varKiller, x300719_var_Scorpion2 ) 
	GmKillObj( varMap, varKiller, x300719_var_Scorpion3 ) 
	
	local varNum = random(1,5)
	
	if varNum <= 4 then
	
	 	StartItemTask(varMap)
		
		ItemAppend( varMap, 11990001 , 1 )
		
		local varRet = StopItemTask(varMap,varKiller)
		
		if varRet > 0 then
		
			DeliverItemListSendToPlayer(varMap,varKiller)
			
			local Name = GetName(varMap,varKiller)
			
			local varReadme = "#G"..Name.."#o幸运的获得了帮会令牌！"
			
			LuaScenceM2Near(varMap,varKiller,varReadme,CHAT_RIGHTDOWN,1)
			
		else
		
			Msg2Player(varMap,varKiller,"物品栏已满，无法获得帮会令！",8,2)
			
		end
		
	else
	
		return
		
	end
	
end

function x300719_ProcBroadCast(varMap, varAct, varTime)
	
	if varMap == 50 then
		LuaAllScenceM2Country (varMap,  x300719_var_Msg, 0, CHAT_PLANE_SCROLL, 6)
		SetSystemTimerTick( varMap, x300719_var_FileId, "ProcRespawn", 71, x300719_var_TickTime-x300719_var_BroadCastTickTime  ) 
	elseif varMap == 150 then
		LuaAllScenceM2Country (varMap,  x300719_var_Msg, 1, CHAT_PLANE_SCROLL, 6)
		SetSystemTimerTick( varMap, x300719_var_FileId, "ProcRespawn", 72, x300719_var_TickTime-x300719_var_BroadCastTickTime  ) 
	elseif varMap == 250 then
		LuaAllScenceM2Country (varMap,  x300719_var_Msg, 2, CHAT_PLANE_SCROLL, 6)
		SetSystemTimerTick( varMap, x300719_var_FileId, "ProcRespawn", 73, x300719_var_TickTime-x300719_var_BroadCastTickTime  ) 
	elseif varMap == 350 then
		LuaAllScenceM2Country (varMap,  x300719_var_Msg, 3, CHAT_PLANE_SCROLL, 6)
		SetSystemTimerTick( varMap, x300719_var_FileId, "ProcRespawn", 74, x300719_var_TickTime-x300719_var_BroadCastTickTime  ) 
	end

end

function x300719_ProcRespawn(varMap, varAct, varTime)
	RespawnMonster( varMap,  x300719_var_BirdId)
	RespawnMonster( varMap,  x300719_var_Scorpion1)
	RespawnMonster( varMap,  x300719_var_Scorpion2)
	RespawnMonster( varMap,  x300719_var_Scorpion3)
end


