


x300870_var_FileId = 300870
x300870_var_QuestName = "创建镖车"


x300870_var_GodIndex = 1210
x300870_var_Carinfo = {CarType = 4,BaseAI = 3,AIScript = 3,Script = 300870 }

x300870_var_CostMoney = 10000






function x300870_ProcEventEntry(varMap, varPlayer, varTalknpc)	

end






function x300870_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
end


function x300870_ProcCreateBus( varMap, varPlayer,varQuest )

  local PosX,PosZ = GetWorldPos(varMap, varPlayer)
	local varObj = CreateBus(varMap, x300870_var_Carinfo.CarType, PosX, PosZ, x300870_var_Carinfo.BaseAI, x300870_var_Carinfo.AIScript, x300870_var_Carinfo.Script, varPlayer, x300870_var_GodIndex,varQuest,-1)
end


function x300870_ProcCreateBusOK(varMap, varPlayer, busId,varTalknpc,varQuest)	
	SetBusTimerTick(varMap , busId, 1000)
	SetBusWaitTime(varMap , busId, 300)
	SetBusTimerOpen(varMap, busId, 0)
	SetBusQuestID(varMap,busId,varQuest)

	
	SetBusCurCamp(varMap, busId,20)
end


function x300870_DeleteBus(varMap, varObj)

	DeleteBus(varMap, varObj,1)

end





function x300870_ProcIntoBusEvent(varMap, varPlayer,varTalknpc)
	local InBus = IsBusMember(varMap, varPlayer)
	if InBus == 1 then
		StartTalkTask(varMap)
		  	TalkAppendString(varMap,"你已经在护送神兽中");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	local BusSize = GetBusSize(varMap,varTalknpc)
	local MemberNum = GetBusMemberCount(varMap,varTalknpc)

	if BusSize<=MemberNum  then
		StartTalkTask(varMap)
		  	TalkAppendString(varMap,"这神兽已经有人护送了");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	local IsOwner = IsTheBusOwner(varMap, varPlayer, varTalknpc )
	if IsOwner == 1 then
		
		AddBusMember(varMap, varPlayer,varTalknpc)
	end
end


function x300870_ProcIntoBusAfter(varMap, varPlayer,varBusID)
	AcceptGuildConvoy( varMap, varPlayer,varBusID )
	local CarName = GetName( varMap, varPlayer ).."的神兽"
	SetBusTitle(varMap , varBusID, CarName)
	local GuildId = GetGuildID(varMap, varPlayer)
	local Guildname = GetGuildName(GuildId)
	local varMsg = format(""..Guildname.."帮主顺利领取神兽！")
	LuaThisScenceM2Guild(varMap,varMsg,GuildId,5,1)
	local camp = GetCurCamp(varMap, varPlayer)
	SetBusCurCamp(varMap, varBusID,camp)

end




function x300870_ProcLeaveBusEvent(varMap, varPlayer,BusId)
		StartTalkTask(varMap)
		  TalkAppendString(varMap,"你正在护送神兽，无法离开");
		StopTalkTask()
		DeliverTalkTips(varMap,varPlayer)
end


function x300870_ProcTime(varMap,BusId)

end

function x300870_ProcLifeTimeOut(varMap,BusId)

	AbandonGuildConvoyQuest(varMap, BusId,7)
	local GuildID = GetBusGuildID(varMap,BusId)
	local varCurDayTime = GetDayTime()						
	SetGuildQuestData(varMap,GuildID, GD_GUILD_INDEX_YUNBIAO_ACCEPT_TIME, varCurDayTime)
	DeleteBus(varMap, BusId,1)
end

function x300870_ProcBusStopWhenOwnerFarAway(varMap, ownerId)
end

function x300870_ProcWaitTimeOut(varMap,BusId)
	
	AbandonGuildConvoyQuest(varMap, BusId,6)	
	local GuildID = GetBusGuildID(varMap,BusId)
	local varCurDayTime = GetDayTime()						
	SetGuildQuestData(varMap,GuildID, GD_GUILD_INDEX_YUNBIAO_ACCEPT_TIME, varCurDayTime)
	DeleteBus(varMap, BusId,1)
	
end

function x300870_ProcDie(varMap,BusId,idKiller)

	AbandonGuildConvoyQuest(varMap, BusId,5)
	local GuildID = GetBusGuildID(varMap,BusId)
	local varCurDayTime = GetDayTime()						
	SetGuildQuestData(varMap,GuildID, GD_GUILD_INDEX_YUNBIAO_ACCEPT_TIME, varCurDayTime)

	if idKiller == -1 then
		
		local OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			local varReadme = "您护送的神兽被杀死"
			StartTalkTask(varMap);TalkAppendString(varMap, "神兽被被杀死！");DeliverTalkTips(varMap,OwnerID);StopTalkTask(varMap);Msg2Player(varMap,OwnerID,varReadme,8,2)
		end
		return
	end

	if IsObjValid(varMap,idKiller)  == 0 then
		
		local OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			local varReadme = "您护送的神兽被杀死"
			StartTalkTask(varMap);TalkAppendString(varMap, "神兽被杀死!");StopTalkTask(varMap);DeliverTalkTips(varMap,OwnerID);Msg2Player(varMap,OwnerID,varReadme,8,2)
		end
		return
	end

	local ObjType = GetObjType(varMap,idKiller)

	if ObjType == 3 then		
		ObjType = 1
		idKiller = GetOwnerID(varMap, idKiller)
		if IsPlayerStateNormal(varMap,idKiller)  == 0 then
			
			local OwnerID = GetBusMemberObjId(varMap,BusId,0)
			if OwnerID ~= -1 then
				local varReadme = "您护送的神兽被杀死"
				StartTalkTask(varMap);TalkAppendString(varMap, "神兽被杀死!");StopTalkTask(varMap);DeliverTalkTips(varMap,OwnerID);Msg2Player(varMap,OwnerID,varReadme,8,2)
			end
			return
		end
	end

	if ObjType == 1 then     
		local OwnerCountry = GetBusCountryID(varMap,BusId)
		local KillerCountry = GetCurCountry(varMap,idKiller)
		if OwnerCountry == KillerCountry then

			
			local IsPunish = 0
			local OwnerId = GetBusMemberObjId(varMap,BusId,0)
			if OwnerId ~= -1 then
				local IsPunish = LuaCallNoclosure( SCENE_SCRIPT_ID, "CashboxComputePKPunish", varMap, OwnerId, idKiller )
				if IsKing( varMap, idKiller ) ~= 1 and IsPunish == 1 then
					
					LuaCallNoclosure( SCENE_SCRIPT_ID, "KillerEnterPrison", varMap, idKiller )
					IsPunish = 1
				else
					IsPunish = 0
				end
			end
			
			if IsPunish==1 then
				StartTalkTask(varMap);TalkAppendString(varMap, "您击杀了本国的神兽，您的PK值增加了");StopTalkTask(varMap);DeliverTalkTips(varMap,idKiller)
				Msg2Player(varMap,idKiller,"您击杀了本国的神兽，您的PK值增加了",8,2)				
			else
				StartTalkTask(varMap);TalkAppendString(varMap, "您击杀了本国的神兽");StopTalkTask(varMap);DeliverTalkTips(varMap,idKiller)
				Msg2Player(varMap,idKiller,"您击杀了本国的神兽",8,2)			
			end			

		else
	        AddMoney(varMap,idKiller,0,x300870_var_CostMoney)
		  	StartTalkTask(varMap);TalkAppendString(varMap, "您击杀了敌国的神兽，并获得了奖励！");StopTalkTask(varMap);DeliverTalkTips(varMap,idKiller)
			Msg2Player(varMap,idKiller,format("您击杀了敌国的神兽，并获得了现银#{_MONEY%d}。", x300870_var_CostMoney),8,2)	
		end 
	
		local varCountry = "楼兰王国"
		if KillerCountry == 0 then
			varCountry = "楼兰王国"
		elseif KillerCountry == 1 then
			varCountry = "天山王国"
		elseif KillerCountry == 2 then
			varCountry = "昆仑王国"
		elseif KillerCountry == 3 then
			varCountry = "敦煌王国"
		else
			return
		end

		local OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then		
			
			local GuildTitle = ""
			if GetGuildID(varMap,idKiller) ~= -1 then
				GuildTitle = GetGuildTitle(varMap,idKiller)
			end
			local GuildTitle1 = GetGuildTitle(varMap,OwnerID)
			local killerName = GetName(varMap,idKiller)
			local varReadme = "神兽被"..varCountry..GuildTitle.."的玩家"..killerName.."摧毁，全体护送成员任务失败！"
			varMsg1 = "昆仑王国"..GuildTitle1.."的神兽被"..varCountry..GuildTitle.."的"..killerName.."击杀"
			if IsHideName(varMap,idKiller) > 0 then
				varMsg1 = "昆仑王国"..GuildTitle1.."的神兽被"..HIDE_NAME.."击杀"
			end
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
			if IsHideName(varMap,idKiller) > 0 then
				varReadme = "神兽被"..HIDE_NAME.."摧毁，全体护送成员任务失败！"
			end
			
			StartTalkTask(varMap);TalkAppendString(varMap, "神兽被摧毁！");StopTalkTask(varMap);DeliverTalkTips(varMap,OwnerID);Msg2Player(varMap,OwnerID,varReadme,6,1)
		end
	else			
		local OwnerID = GetBusMemberObjId(varMap,BusId,0)
		if OwnerID ~= -1 then
			local varReadme = "神兽被怪物杀死，全体护送成员任务失败！"
			StartTalkTask(varMap);TalkAppendString(varMap, "神兽被杀死！");StopTalkTask(varMap);DeliverTalkTips(varMap,OwnerID);Msg2Player(varMap,OwnerID,varReadme,6,1)		
		end

	end
	
end

