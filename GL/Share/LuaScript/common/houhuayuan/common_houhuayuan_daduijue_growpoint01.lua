
x320029_var_FileId 						= 320029
x320029_var_GatherPointTypeId = 142 		
x320029_var_MinLimitLevel = 20   	

x320029_var_QuestName=""
x320029_var_QuestId = 9050
x320029_var_GameOpenId				= 1087
x320029_var_ItemId = -1
x320029_var_BanZhuanBuff				= 30560
x320029_var_PlayerBuff = {}


function x320029_HaveAccepted(varMap, varPlayer)
end




function 	x320029_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x320029_var_GatherPointTypeId, varMap, 0, x320029_var_ItemId)
	SetGrowPointObjID(varMap,x320029_var_GatherPointTypeId,varX, varY,varBoxId)
end




function	 x320029_ProcGpOpen(varMap,varPlayer,varTalknpc)
	if x320029_var_GameOpenId > 0 and GetGameOpenById( x320029_var_GameOpenId ) <= 0 then
      return 1
  end
	local minOfDay = GetMinOfDay()
	local weekIdx = GetWeek()
	local GetWeekcount = mod (GetWeekIndex() , 2)
	local nlevel = GetLevel( varMap, varPlayer)
	
	if GetWeekcount == 1 then
		Msg2Player(varMap,varPlayer,"不是大对决活动期间，无法采集",8,3)
		Msg2Player(varMap,varPlayer,"不是大对决活动期间，无法采集",8,2)	
		return 1
	end
	
	if varMap ~= 44 then
		Msg2Player(varMap,varPlayer,"不是正确场景，无法采集",8,3)
		Msg2Player(varMap,varPlayer,"不是正确场景，无法采集",8,2)	
		return 1
	end	
	
	if minOfDay < 869 or minOfDay > 900 then
		Msg2Player(varMap,varPlayer,"不是大对决活动期间，无法采集",8,3)
		Msg2Player(varMap,varPlayer,"不是大对决活动期间，无法采集",8,2)
		return 1
	end

	if weekIdx ~= 6 then
		Msg2Player(varMap,varPlayer,"不是大对决活动期间，无法采集",8,3)
		Msg2Player(varMap,varPlayer,"不是大对决活动期间，无法采集",8,2)
		return 1
	end	
	
	if nlevel < 40 then
		Msg2Player(varMap,varPlayer,"你等级过低，无法采集",8,3)
		Msg2Player(varMap,varPlayer,"你等级过低，无法采集",8,2)	
		return 1
	end
	if GetCurCamp(varMap, varPlayer) == 5 then
		Msg2Player(varMap,varPlayer,"我方玉海窑状态良好，你可以去对方玉海窑采集寒玉",8,3)
		Msg2Player(varMap,varPlayer,"我方玉海窑状态良好，你可以去对方玉海窑采集寒玉",8,2)	
		return 1
	end
	if IsHaveSpecificImpact(varMap, varPlayer, x320029_var_BanZhuanBuff) == 1 and GetCurCamp(varMap, varPlayer) == 6 then
		Msg2Player(varMap, varPlayer, "你只能携带一块天池寒玉。", 8, 3)
		Msg2Player(varMap, varPlayer, "你只能携带一块天池寒玉。", 8, 2)
		return 1
	end		
   
end




function	 x320029_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return   x320029_ProcGuildRecycle( varMap, varPlayer, varTalknpc, x320029_var_GatherPointTypeId, x320029_var_ItemId )
	
end





function	x320029_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	if x320029_var_GameOpenId > 0 and GetGameOpenById( x320029_var_GameOpenId ) <= 0 then
      return 1
  end
	if GetCurCamp(varMap, varPlayer) == 6 then
		x320029_var_PlayerBuff[GetGUID(varMap, varPlayer)] = x320029_var_BanZhuanBuff
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x320029_var_PlayerBuff[GetGUID(varMap, varPlayer)], 0)
		Msg2Player(varMap, varPlayer, "突袭完成，将天池寒玉交给本方的前锋统领你将获得不菲的奖励。", 8, 2)		
		Msg2Player(varMap, varPlayer, "突袭完成，将天池寒玉交给本方的前锋统领你将获得不菲的奖励。", 8, 3)
	else
		return 1
	end
end




function	x320029_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

end





function x320029_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return 0
end

function x320029_ShowTipsToAll(varMap, varStr)

	local varHumanCount = GetScenePlayerCount( varMap)
    if varHumanCount > 0 then
        for varI = 0, varHumanCount do
            local varObj = GetScenePlayerObjId( varMap,varI)
            if varObj >= 0 then
                Msg2Player(varMap, varObj, varStr, 0, 2)
            end
        end
    end
end


function x320029_ProcGuildRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
end

function x320029_GetPlayerBuff(varMap, varPlayer)
	return x320029_var_PlayerBuff[GetGUID(varMap, varPlayer)]
end
