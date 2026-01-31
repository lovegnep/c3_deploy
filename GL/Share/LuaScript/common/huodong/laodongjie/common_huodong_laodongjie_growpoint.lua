
x310824_var_FileId = 310824
x310824_var_GrowpointId = 145 		
x310824_var_MinLevel = 40   	
x310824_var_ItemIndex =  12035210   
x310824_var_ItemId = -1  -----战车道具
x310824_var_Gpnum = 0
x310824_var_IsEnableId    = 1089


function x310824_HaveAccepted(varMap, varPlayer)
	return 1
end





function x310824_ProcGpCreate(varMap,growPointType,varX,varY)
	if GetGameOpenById( x310824_var_IsEnableId) <= 0 then
        return
  end
	
	local varBoxId = ItemBoxEnterScene(varX, varY, x310824_var_GrowpointId, varMap, 0, x310824_var_ItemIndex)
	varX = format(varX)
	varY = format(varY)
	WriteLog(1,format("x310824_ProcGpCreate---varBoxId:%d---varX:%d----varY:%d",varBoxId,varX,varY))
	SetGrowPointObjID(varMap,x310824_var_GrowpointId,varX, varY,varBoxId)
	x310824_var_Gpnum = x310824_var_Gpnum + 1
	WriteLog(1,format("x310824_var_Gpnum---"..x310824_var_Gpnum))
	if x310824_var_Gpnum >= 100 then
		x310824_var_Gpnum = 0 
		SetGrowPointIntervalContainer(varMap, x310824_var_GrowpointId, -1)
		SetSystemTimerTick( varMap, x310824_var_FileId, "ProForceRecyleGp", 23, 10*60*1000)
	end
	
end




function x310824_ProcGpOpen(varMap,varPlayer,varTalknpc)
		
    return x310824_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, x310824_var_GrowpointId, x310824_var_ItemIndex)	
end




function x310824_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return x310824_ProcGuildRecycle( varMap, varPlayer, varTalknpc, x310824_var_GrowpointId, x310824_var_ItemIndex )
end





function x310824_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function x310824_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end





function x310824_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )

	if GetGameOpenById( x310824_var_IsEnableId) <= 0 then
		Msg2Player(varMap,varPlayer,"活动已关闭！",8,3)
		Msg2Player(varMap,varPlayer,"活动已关闭！",8,2)
    return
  end
	
	if x310824_HaveAccepted(varMap, varPlayer) < 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您没有任务【个人】天降宝箱，请您关注系统公告。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return -31
	end
	    
	if GetLevel(varMap, varPlayer) < x310824_var_MinLevel then  		
		return -31
	end

	return 0
end


function x310824_ProcGuildRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )

if GetBagSpace(varMap,varPlayer) <= 0 then
	StartTalkTask(varMap)
	TalkAppendString(varMap,"背包已满，请整理背包！")
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	return 0
end

x310824_GiveBonus(varMap, varPlayer)
	return 1

end

function x310824_GiveBonus(varMap, varPlayer)
local level = GetLevel(varMap,varPlayer)
local i = 1
	while i == 1 do 
	local varRate = random (1,100)
		i = 2 
		if varRate <= 20 then
			local bonusExp = level * 1000
			AddExp(varMap,varPlayer,bonusExp)
			local varMsg = format("获得经验值#R%d#o点",bonusExp)
			Msg2Player(varMap,varPlayer,varMsg,8,2)
			Msg2Player(varMap,varPlayer,varMsg,8,3)
		elseif varRate <= 40 then 
			if level >= 80 then
				local inh = level * 1 
				local refixInh = AddInherenceExp(varMap, varPlayer, inh)
				local varMsg = format("获得天赋值#R%d#o点。",refixInh)
				Msg2Player(varMap, varPlayer, varMsg, 8, 2)
				Msg2Player(varMap, varPlayer, varMsg, 8, 3) 
			else 
				i = 1
			end
		elseif varRate <= 50 then 
			local guildId = GetGuildID(varMap,varPlayer)
			if guildId > 0 then
				local guildvalue = GetLevel(varMap, varPlayer) * 3
				AddGuildUserPoint(varMap, varPlayer, guildvalue)
				local varMsg = format( "获得帮贡值#R%d#o点", guildvalue)
				Msg2Player( varMap, varPlayer, varMsg, 8, 2)
				Msg2Player( varMap, varPlayer, varMsg, 8, 3)
			else 
				i = 1
			end
		elseif varRate <= 60 then
			local honor = level * 0.5        
			AddHonor(varMap, varPlayer, honor)                   
			local varMsg = format( "获得荣誉值#R%d#o点", honor)  
			Msg2Player( varMap, varPlayer, varMsg, 8, 2)         
			Msg2Player( varMap, varPlayer, varMsg, 8, 3)   
		elseif varRate <= 80 then
			local money = level * 400
			AddMoney( varMap, varPlayer,1, money )
			local varMsg = format( "获得银卡#R#{_MONEY%d}#o", money)
			Msg2Player( varMap, varPlayer, varMsg, 8, 2)
			Msg2Player( varMap, varPlayer, varMsg, 8, 3)		
		elseif varRate <= 100 then    
			if x310824_var_ItemId > 0 then
				StartItemTask( varMap)
				ItemAppendBind( varMap, x310824_var_ItemId, 1)
				if StopItemTask( varMap, varPlayer) <= 0 then
				    Msg2Player( varMap, varPlayer, "你的背包已满，无法获得道具奖励。", 8, 2)
				else
				    DeliverItemListSendToPlayer( varMap, varPlayer)
				end    
			else
				i = 1
			end
		end
	end
	return 1
end
function x310824_ProForceRecyleGp(varMap, varPlayer)  
	WriteLog(1,format("x310824_ProForceRecyleGp,varMap---"..varMap)) 
	RecycleGrowPointByType(varMap, 145, -1)
end
