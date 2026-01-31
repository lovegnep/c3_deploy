

x300241_var_FileId = 300241
x300241_var_TransPosloulan  ="bianjingrenwu2andao0"
x300241_var_TransPoslaiyin  ="bianjingrenwu2andao1"
x300241_var_TransPoskunlun  ="bianjingrenwu2andao2"
x300241_var_TransPosdunhuang="bianjingrenwu2andao3"
x300241_var_Notice = "您的等级还不足#R20级#Y，无法前往边塞暗道！"


function x300241_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )

	local selfType = GetObjType(varMap, varPlayer)
	
	if selfType == 1 then 
		
		if IsHaveSpecificImpact( varMap, varPlayer, 7606) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7612) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7618) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7624) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7609) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7615) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7621) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7627) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7607) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7613) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7619) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7625) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7610) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7616) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7622) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7628) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7605) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7611) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7617) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7623) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7608) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7614) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7620) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7626) == 1  then
			Msg2Player(varMap,varPlayer,"很抱歉，未完成铁人三项任务时无法通往其他场景！",8,2)
			return
		end
		
		
		local nLevel = GetLevel(varMap, varPlayer)
			if nLevel < 20 then 
					Msg2Player(varMap,varPlayer,"#Y"..x300241_var_Notice.."#W",4,3)
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
				x300241_TransToPosition(varMap, varObj)
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
				x300241_TransToPosition(varMap, varObj)
			end
			
			DeleteBus(varMap, busId,0)
			return
		end
		
		local isBusMember = IsBusMember(varMap, varPlayer)



	end
	local guo = GetCurCountry(varMap,varPlayer)	
	x300241_TransToPosition(varMap, varPlayer)
end

function x300241_TransToPosition(varMap, varPlayer)

	local guo = GetCurCountry(varMap,varPlayer)

	if varMap == 51 then
		
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x300241_var_TransPosloulan)
		
		elseif varMap == 151 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x300241_var_TransPoslaiyin)
		
		elseif varMap == 251 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x300241_var_TransPoskunlun)
		
		elseif varMap == 351 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x300241_var_TransPosdunhuang)
	
	end
end


function x300241_ProcMapTimerTick( varMap, monsterobjid )

end


function x300241_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x300241_ProcEventEntry( varMap, monsterobjid )

end


