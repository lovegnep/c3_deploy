

x301428_var_GatherPointTypeId = 705 		

x301428_var_QuestArray = {7537,7538,7539,7551,7552}
x301428_var_BuffList={7709,7710,7711,0}
x301428_var_PosX = 85  
x301428_var_PosZ = 353  
function x301428_HaveAccepted(varMap, varPlayer)

	for varI, item in x301428_var_QuestArray do
		if IsHaveQuestNM( varMap, varPlayer, item ) > 0 then
			return 1
		end
	end
	return -1
end

function x301428_RandBuff(varMap, varPlayer)
	local kindIndex = random(1, 100);
	if kindIndex >= 1 and kindIndex <= 40 then
		return x301428_var_BuffList[1]
	elseif kindIndex > 40 and kindIndex <= 80 then
		return x301428_var_BuffList[4]
	elseif kindIndex > 80 and kindIndex <= 90 then
		return x301428_var_BuffList[2]
	elseif kindIndex > 90 and kindIndex <= 100 then
		return x301428_var_BuffList[3]
	end
end



function 	x301428_ProcGpCreate(varMap,varGpType,varX,varY, varViewGroup)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301428_var_GatherPointTypeId, varMap, 0, -1, -1, varViewGroup)
	SetGrowPointObjID(varMap,x301428_var_GatherPointTypeId,varX, varY,varBoxId)
end




function	 x301428_ProcGpOpen(varMap,varPlayer,varTalknpc)
		
    return x301428_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, x301428_var_GatherPointTypeId, -1)	
end




function	 x301428_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return   x301428_ProcGuildRecycle( varMap, varPlayer, varTalknpc, x301428_var_GatherPointTypeId, -1 )
end





function	x301428_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301428_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end





function x301428_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	
	if x301428_HaveAccepted(varMap, varPlayer) < 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您没有任务【体】铁人三项，请您关注系统公告。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return -31
	end
	    
	return 0
end


function x301428_ProcGuildRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	
	local buff = x301428_RandBuff(varMap, varPlayer)
	if buff == 0 then
		local varX,z = GetWorldPos(varMap,varPlayer)
		local Num =  GetNearPlayerCount(varMap, varPlayer,varX,z,5)  
		for varI = 0, Num-1 do
			local humanObjId = GetNearPlayerMember(varMap, varPlayer,varI);
			if humanObjId ~= -1 then
				if IsPlayerStateNormal(varMap, humanObjId) > 0 then
					if x301428_HaveAccepted(varMap, humanObjId) > 0 then
						SetPos(varMap, humanObjId, x301428_var_PosX, x301428_var_PosZ)
					end
				end
			end
		end
		return 1
	end
	
	if buff == 7709 then
		local varX,z = GetWorldPos(varMap,varPlayer)
		local Num =  GetNearPlayerCount(varMap, varPlayer,varX,z,5)  
		for varI = 0, Num-1 do
			local humanObjId = GetNearPlayerMember(varMap, varPlayer,varI);

			if humanObjId ~= -1 then
				if IsPlayerStateNormal(varMap, humanObjId) > 0 then
					if x301428_HaveAccepted(varMap, humanObjId) > 0 then
						if IsHaveSpecificImpact( varMap, humanObjId, 7710 ) > 0 then
							CancelSpecificImpact(varMap, humanObjId,7710)
						end
						SendSpecificImpactToUnit(varMap, humanObjId, humanObjId, humanObjId, buff, 0)
						StartTalkTask(varMap);
						TalkAppendString(varMap, "增加移动速度15秒");
						StopTalkTask();
						DeliverTalkTips(varMap, humanObjId);
					end
				end
			end
		end
		return 1
	end

	if buff == 7710 then
		local varX,z = GetWorldPos(varMap,varPlayer)
		local Num =  GetNearPlayerCount(varMap, varPlayer,varX,z,5)  
		for varI = 0, Num-1 do
			local humanObjId = GetNearPlayerMember(varMap, varPlayer,varI);

			if humanObjId ~= -1 then
				if humanObjId ~= varPlayer then
					if IsPlayerStateNormal(varMap, humanObjId) > 0 then
						if x301428_HaveAccepted(varMap, humanObjId) > 0 then
							if IsHaveSpecificImpact( varMap, humanObjId, 7709 ) > 0 then
								CancelSpecificImpact(varMap, humanObjId,7709)
							end
							SendSpecificImpactToUnit(varMap, humanObjId, humanObjId, humanObjId, buff, 0)
							StartTalkTask(varMap);
							TalkAppendString(varMap, "减少移动速度5秒");
							StopTalkTask();
							DeliverTalkTips(varMap, humanObjId);
						end
					end
				else
					StartTalkTask(varMap);
					TalkAppendString(varMap, "你抵御了减速厄运");
					StopTalkTask();
					DeliverTalkTips(varMap, humanObjId);
				end
			end
		end
		return 1
	end
	
	if buff == 7711 then
		local varX,z = GetWorldPos(varMap,varPlayer)
		local Num =  GetNearPlayerCount(varMap, varPlayer,varX,z,5)  
		for varI = 0, Num-1 do
			local humanObjId = GetNearPlayerMember(varMap, varPlayer,varI);

			if humanObjId ~= -1 then
				if humanObjId ~= varPlayer then
					if IsPlayerStateNormal(varMap, humanObjId) > 0 then
						if x301428_HaveAccepted(varMap, humanObjId) > 0 then
							if IsHaveSpecificImpact( varMap, humanObjId, buff ) > 0 then
								CancelSpecificImpact(varMap, humanObjId,buff)
							end
							SendSpecificImpactToUnit(varMap, humanObjId, humanObjId, humanObjId, buff, 1000)
							StartTalkTask(varMap);
							TalkAppendString(varMap, "眩晕2秒");
							StopTalkTask();
							DeliverTalkTips(varMap, humanObjId);
						end
					end
				else
					StartTalkTask(varMap);
					TalkAppendString(varMap, "你抵御了眩晕厄运");
					StopTalkTask();
					DeliverTalkTips(varMap, humanObjId);
				end
			end
		end
		return 1
	end
	return 0
end
