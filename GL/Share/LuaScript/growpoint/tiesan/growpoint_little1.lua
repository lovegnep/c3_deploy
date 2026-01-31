

x301421_var_GatherPointTypeId = 700 		

x301421_var_QuestArray = {7537,7538,7539,7551,7552}
x301421_var_BuffList={7709,7710,7711,0}
x301421_var_PosX = 430
x301421_var_PosZ = 439
function x301421_HaveAccepted(varMap, varPlayer)

	for varI, item in x301421_var_QuestArray do
		if IsHaveQuestNM( varMap, varPlayer, item ) > 0 then
			return 1
		end
	end
	return -1
end

function x301421_RandBuff(varMap, varPlayer)
	local kindIndex = random(1, 100);
	if kindIndex >= 1 and kindIndex <= 40 then
		return x301421_var_BuffList[1]
	elseif kindIndex > 40 and kindIndex <= 80 then
		return x301421_var_BuffList[4]
	elseif kindIndex > 80 and kindIndex <= 90 then
		return x301421_var_BuffList[2]
	elseif kindIndex > 90 and kindIndex <= 100 then
		return x301421_var_BuffList[3]
	end
end



function 	x301421_ProcGpCreate(varMap,varGpType,varX,varY, varViewGroup)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301421_var_GatherPointTypeId, varMap, 0, -1, -1, varViewGroup)
	SetGrowPointObjID(varMap,x301421_var_GatherPointTypeId,varX, varY,varBoxId)
end




function	 x301421_ProcGpOpen(varMap,varPlayer,varTalknpc)
		
    return x301421_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, x301421_var_GatherPointTypeId, -1)	
end




function	 x301421_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return   x301421_ProcGuildRecycle( varMap, varPlayer, varTalknpc, x301421_var_GatherPointTypeId, -1 )
end





function	x301421_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301421_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end





function x301421_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	
	if x301421_HaveAccepted(varMap, varPlayer) < 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您没有任务【体】铁人三项，请您关注系统公告。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return -31
	end
	    
	return 0
end


function x301421_ProcGuildRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	
	local buff = x301421_RandBuff(varMap, varPlayer)
	if buff == 0 then
		SetPos(varMap, varPlayer, x301421_var_PosX, x301421_var_PosZ)
		return 1
	end
	
	if buff == 7709 then
		if IsHaveSpecificImpact( varMap, varPlayer, 7710 ) > 0 then
			CancelSpecificImpact(varMap, varPlayer,7710)
		end
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, buff, 0)
		StartTalkTask(varMap);
		TalkAppendString(varMap, "增加移动速度15秒");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return 1
	end

	if buff == 7710 then
		if IsHaveSpecificImpact( varMap, varPlayer, 7709 ) > 0 then
			CancelSpecificImpact(varMap, varPlayer,7709)
		end
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, buff, 0)
		StartTalkTask(varMap);
		TalkAppendString(varMap, "减少移动速度5秒");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return 1
	end
	
	if buff == 7711 then
		if IsHaveSpecificImpact( varMap, varPlayer, buff ) > 0 then
			CancelSpecificImpact(varMap, varPlayer,buff)
		end
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, buff, 1000)
		StartTalkTask(varMap);
		TalkAppendString(varMap, "眩晕2秒");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return 1
	end
	
	return 0
end
