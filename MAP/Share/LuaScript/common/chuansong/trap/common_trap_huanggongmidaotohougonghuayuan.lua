

x490403_var_FileId = 490403
x490403_var_TransPosloulan  ="huanggongmidaotohougonghuayuan"
x490403_var_TransPoslaiyin  ="huanggongmidaotohougonghuayuan"
x490403_var_TransPoskunlun  ="huanggongmidaotohougonghuayuan"
x490403_var_TransPosdunhuang="huanggongmidaotohougonghuayuan"
x490403_var_Notice = "对不起，您的等级不足70级，无法前往后宫花园"


function x490403_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	
	local selfType = GetObjType(varMap, varPlayer)
	
	if selfType == 1 then 
		
		if IsHaveSpecificImpact( varMap, varPlayer, 7606) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7612) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7618) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7624) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7609) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7615) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7621) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7627) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7607) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7613) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7619) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7625) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7610) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7616) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7622) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7628) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7605) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7611) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7617) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7623) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7608) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7614) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7620) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7626) == 1  then
			Msg2Player(varMap,varPlayer,"很抱歉，未完成铁人三项任务时无法通往其他场景！",8,2)
			return
		end
		
		if IsHaveSpecificImpact( varMap, varPlayer, 7538) == 1 then
			Msg2Player(varMap,varPlayer,"很抱歉，变身状态无法通往其他场景！",8,2)
			return
		end		
		
		local  WorldID = GetWorldID(varMap,varPlayer)	
		local  toplevel = GetToplistCount(WorldID,0)
		local  guid,varLevelMax = GetToplistInfo(WorldID,0,toplevel-1)

	--	if varLevelMax < 70 then
	--		Msg2Player(varMap,varPlayer,"很抱歉，服务器等级排行榜最后一名达到70级才可开启后花园传送",8,2)
	--		return
	--	end
		
		local minOfDay = GetMinOfDay()
		local weekIdx = GetWeek()
		
	if weekIdx == 6 and minOfDay >= 890 and minOfDay <= 900 then
				Msg2Player(varMap,varPlayer,"决战后花园期间，无法传送至后花园",8 ,2)
				return
		end	
		
		if weekIdx == 6 and minOfDay >= 870 and minOfDay <= 890 then
			local Level = GetLevel(varMap,varPlayer)
			if Level < 40 then
				Msg2Player(varMap,varPlayer,"决战后花园期间，等级未达到40级无法传送至后花园",8 ,2)
				return
			end
		else
			local Level = GetLevel(varMap,varPlayer)
			if Level < 70 then
				Msg2Player(varMap,varPlayer,"很抱歉，等级未达到70级无法传送至后花园",8 ,2)
				return
			end		
		end
	
	if selfType == 9 then	
		
		local busType = GetBusType(varMap, varPlayer)
		if busType == 1 then 
			local memberCount = GetBusMemberCount(varMap, varPlayer)
			ReadyBusChangeScene(varMap, varMap + 1, varPlayer)
			for	varI = 0, memberCount - 1 do
				local varObj = GetBusMemberObjId(varMap, varPlayer, varI)
				x490403_TransToPosition(varMap, varObj)
			end
			
			DeleteBus(varMap, varPlayer,0)
			return
		end
	elseif selfType == 1 then	
		if IsPlayerMutexState(varMap, varPlayer,PLAYER_STATE_PROTECTTIME) == 1 then
			return 
		end

		local busId = GetBusId(varMap, varPlayer)
		if busId ~= -1 then
			local busType = GetObjType(varMap, busId)
			if busType == 3 then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "很抱歉，护送目标感到危险，拒绝进入该场景！");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return	
			end

			local IsInDist = 0
			local busType = GetBusType(varMap, busId)
			if busType == 0 then		
				
				IsInDist = IsValidMyselfBus(varMap,varPlayer)
			elseif busType == 2 then	
				IsInDist = IsValidGuildBus(varMap,varPlayer)		
			elseif busType == 3 then	
				StartTalkTask(varMap)
				TalkAppendString(varMap, "你正在护送，不能这么做！");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return			
			end
			
			if IsInDist == 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "你的护送目标离你太远了，不能这么做！");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return
			end
				
			local memberCount = GetBusMemberCount(varMap, busId)
			ReadyBusChangeScene(varMap, varMap + 1, busId)
			for	varI = 0, memberCount - 1 do
				local varObj = GetBusMemberObjId(varMap, busId, varI)
				x490403_TransToPosition(varMap, varObj)
			end
			
			DeleteBus(varMap, busId,0)
			return
		end
		
		local isBusMember = IsBusMember(varMap, varPlayer)

	end
		end
	if IsHaveSpecificImpact( varMap, varPlayer, 7629) == 1 then
		CancelSpecificImpact( varMap, varPlayer, 7629)	
	end
	local guo = GetCurCountry(varMap,varPlayer)	
	x490403_TransToPosition(varMap, varPlayer)
end

function x490403_TransToPosition(varMap, varPlayer)

	local guo = GetCurCountry(varMap,varPlayer)
	
	if guo == 0 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x490403_var_TransPosloulan)
		
		elseif guo == 1 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x490403_var_TransPoslaiyin)
		
		elseif guo == 2 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x490403_var_TransPoskunlun)
		
		elseif guo == 3 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x490403_var_TransPosdunhuang)
	
	end
end


function x490403_ProcMapTimerTick( varMap, monsterobjid )

end


function x490403_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x490403_ProcEventEntry( varMap, monsterobjid )

end

