


x310401_var_FileId 				= 310401


x310401_var_NoMoneyErrText		= 
"您的金钱不足，无法领取"
x310401_var_GetExpLevelErrText	= 
"您的等级不足#R%d级#o，无法领取该档次的离线经验"
x310401_var_OfflineLevelErrText	= 
"您的等级不足#R%d级#o，无法离线代练"
x310401_var_TimeMaxErrText		= 
"您的累积时间已到达上限，请领取离线经验后再开启离线代练"
x310401_var_TimeZeroErrText		= 
"您的离线代练累积时间为0，没有可领取的离线经验"
x310401_var_ShowDemoText			= 
"\t只有不低于#G40#W级的玩家才可以使用离线代练。\n\t开始离线代练后您的离线代练时间将累积计算到您下次上线为止，之后您可花费一定的金钱领取对应的离线经验，离线代练时间最多可累积7天。\n"
x310401_var_CurTrainTimeText		= 
"\t您当前的离线代练累积时间为#G%d天%d小时%d分#W。\n"
x310401_var_OfflineAcceptText		= 
"\t选择确认后将立即以代练状态离线，并开始累积离线代练时间，是否立即开始离线代练？"
x310401_var_GetExpText			= 
"\t请选择您要领取的离线经验档次，不同的档次需要花费不同数量的金钱。\n"..
"\t#G低档#W：普通经验效率，需要花费#G银币#W，#G%d#W级可使用\n"..
"\t#G中档#W：双倍经验效率，需要花费#G金币#W，#G%d#W级可使用\n"..
"\t#G高档#W：三倍经验效率，需要花费#G金币#W，#G%d#W级可使用"
x310401_var_GetExpAcceptText	= 
"#Y离线代练#W\n\t您当前的离线代练累积时间为#G%d天%d小时%d分#W。\n\t您选择的领取离线经验档次为#G%s#W\n\t将可以获得经验值#G%d点#W\n\t需要花费#G%s#{_MONEY%d}#W\n\t是否立即领取？"
x310401_var_GetExpTipText			= 
"获得了%d经验"


x310401_var_MaxTrainTime   		= 10080


x310401_var_SwitchLogout 			= 1
x310401_var_SwitchGetExp 			= 2
x310401_var_SwitchLow 			= 3
x310401_var_SwitchMiddle 			= 4
x310401_var_SwitchHigh 			= 5


x310401_var_LowCostType	 		= 0
x310401_var_MiddleCostType		= 1
x310401_var_HighCostType	 		= 1


x310401_var_LowRoleLevel	 		= 40
x310401_var_MiddleRoleLevel 		= 60
x310401_var_HighRoleLevel 		= 70






x310401_var_curGetExpTbl = {}
x310401_var_curNeedMoneyTbl = {}

x310401_var_curAcceptTypeTbl = {}

x310401_var_curCostTypeTbl = {}

function x310401_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x310401_var_FileId, "离线代练", 3, x310401_var_SwitchLogout)
 	TalkAppendButton(varMap, x310401_var_FileId, "领取离线代练经验", 3, x310401_var_SwitchGetExp)
end

function x310401_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)

	
	local selfTrainTime = GetPlayerGameData(varMap, varPlayer, MD_OFFLINE_TRAIN_MIN[1], MD_OFFLINE_TRAIN_MIN[2], MD_OFFLINE_TRAIN_MIN[3])

	if selfTrainTime < 0 or selfTrainTime > x310401_var_MaxTrainTime then
		WriteLog(2, format("OfflineTrain ProcEventEntry: GetPlayerGameData Exception TimeValue(%d)", selfTrainTime))
		return
	end

	if idExt == x310401_var_SwitchLogout then
		
		if selfTrainTime >= x310401_var_MaxTrainTime then
			StartTalkTask(varMap)
			TalkAppendString(varMap, x310401_var_TimeMaxErrText)
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
			return
		end
   		
		
		x310401_var_curAcceptTypeTbl[GetName(varMap, varPlayer)] = 2

   		
       	StartTalkTask(varMap)
       	TalkAppendString(varMap, "#Y离线代练#W\n")
 		TalkAppendString(varMap, format(x310401_var_ShowDemoText .. x310401_var_CurTrainTimeText .. x310401_var_OfflineAcceptText, selfTrainTime / 60 / 24, 
 			mod(selfTrainTime / 60, 24), mod(selfTrainTime, 60)))
   	 	StopTalkTask()
   		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310401_var_FileId, -1)  
   		 		
	elseif idExt == x310401_var_SwitchGetExp then
	
		StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y领取离线代练经验#W\n")
		TalkAppendString(varMap, format(x310401_var_CurTrainTimeText .. x310401_var_GetExpText, selfTrainTime / 60 / 24, 
			mod(selfTrainTime / 60, 24), mod(selfTrainTime, 60), x310401_var_LowRoleLevel, x310401_var_MiddleRoleLevel, x310401_var_HighRoleLevel))
        TalkAppendButton(varMap, x310401_var_FileId, "低档（40级以上）", 3, x310401_var_SwitchLow)
        TalkAppendButton(varMap, x310401_var_FileId, "中档（60级以上）", 3, x310401_var_SwitchMiddle)
        TalkAppendButton(varMap, x310401_var_FileId, "高档（70级以上）", 3, x310401_var_SwitchHigh)
        StopTalkTask()
        DeliverTalkMenu(varMap, varPlayer, varTalknpc) 
         
   elseif idExt == x310401_var_SwitchLow or idExt == x310401_var_SwitchMiddle or idExt == x310401_var_SwitchHigh then	
		
		if selfTrainTime == 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, x310401_var_TimeZeroErrText)
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
			return
		end

   		local selLevel = ""
   		local roleLevel = GetLevel(varMap, varPlayer)
   		local errRoleLevel = 0
   		
   		
   		if idExt == x310401_var_SwitchLow then
   			if roleLevel < x310401_var_LowRoleLevel then
   				errRoleLevel = x310401_var_LowRoleLevel
   			end
   			selLevel = "低档"
   		elseif idExt == x310401_var_SwitchMiddle then
   			if roleLevel < x310401_var_MiddleRoleLevel then
   				errRoleLevel = x310401_var_MiddleRoleLevel
   			end
   			selLevel = "中档"
   		elseif idExt == x310401_var_SwitchHigh then
   			if roleLevel < x310401_var_HighRoleLevel then
   				errRoleLevel = x310401_var_HighRoleLevel
   			end
   			selLevel = "高档"
		end

		if errRoleLevel ~= 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, format(x310401_var_GetExpLevelErrText, errRoleLevel))
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
			return
		end
	
   		
   		local numPower = 0
   		if idExt == x310401_var_SwitchLow then
   			x310401_var_curCostTypeTbl[GetName(varMap, varPlayer)] = x310401_var_LowCostType
   			x310401_var_curNeedMoneyTbl[GetName(varMap, varPlayer)] = 939 * selfTrainTime
   			
   			if roleLevel >= x310401_var_HighRoleLevel then
   				numPower = 135
   			else
   				numPower = 75
   			end
   		elseif idExt == x310401_var_SwitchMiddle then
   			x310401_var_curCostTypeTbl[GetName(varMap, varPlayer)] = x310401_var_MiddleCostType
   			x310401_var_curNeedMoneyTbl[GetName(varMap, varPlayer)] = 27 * selfTrainTime
   			
   			if roleLevel >= x310401_var_HighRoleLevel then
   				numPower = 270
   			else
   				numPower = 150
   			end
   		elseif idExt == x310401_var_SwitchHigh then
   			x310401_var_curCostTypeTbl[GetName(varMap, varPlayer)] = x310401_var_HighCostType
   			x310401_var_curNeedMoneyTbl[GetName(varMap, varPlayer)] = 51 * selfTrainTime
   			
   			if roleLevel >= x310401_var_HighRoleLevel then
   				numPower = 405
   			else
   				numPower = 225
   			end
		end
   		
   		local peerVipValue = GetPeerVipBenefit(varMap, varPlayer, 2)
   		
   		x310401_var_curGetExpTbl[GetName(varMap, varPlayer)] = floor(roleLevel * numPower * selfTrainTime * (1 + peerVipValue/100))
		
		
		
		x310401_var_curAcceptTypeTbl[GetName(varMap, varPlayer)] = 1
		
		
   		local curCostString = ""
		if x310401_var_curCostTypeTbl[GetName(varMap, varPlayer)] == 1 then
			curCostString = "金币"
		else
			curCostString = "银币"
		end

   		
       	StartTalkTask(varMap)
    	TalkAppendString(varMap, format(x310401_var_GetExpAcceptText, selfTrainTime / 60 / 24, mod(selfTrainTime / 60, 24), mod(selfTrainTime, 60), 
    		selLevel, x310401_var_curGetExpTbl[GetName(varMap, varPlayer)], curCostString, x310401_var_curNeedMoneyTbl[GetName(varMap, varPlayer)]))
   	 	StopTalkTask()
   		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310401_var_FileId, -1)
    end
end

function x310401_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	
	if 	x310401_var_curAcceptTypeTbl[GetName(varMap, varPlayer)] == 1 then
	
		if x310401_var_curCostTypeTbl[GetName(varMap, varPlayer)] ~= 0 and x310401_var_curCostTypeTbl[GetName(varMap, varPlayer)] ~= 1 then
			return
		end

		
		local freeMoney = GetMoney(varMap, varPlayer, x310401_var_curCostTypeTbl[GetName(varMap, varPlayer)] * 2)
		local bindMoney = GetMoney(varMap, varPlayer, x310401_var_curCostTypeTbl[GetName(varMap, varPlayer)] * 2 + 1)
	
		
		if freeMoney + bindMoney < x310401_var_curNeedMoneyTbl[GetName(varMap, varPlayer)] then
			StartTalkTask(varMap)
			TalkAppendString(varMap, x310401_var_NoMoneyErrText)
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
			return
		end
		
		local payType = 0 
		if x310401_var_curCostTypeTbl[GetName(varMap, varPlayer)] == 0 then
			payType = GetSillerMode(varMap, varPlayer)
		else
			payType = GetGoldMode(varMap, varPlayer)
		end
		
	    if payType == 1 then
	    	
	    	if freeMoney < x310401_var_curNeedMoneyTbl[GetName(varMap, varPlayer)] then
	    		CostMoney(varMap, varPlayer, x310401_var_curCostTypeTbl[GetName(varMap, varPlayer)] * 2, freeMoney, 309)
	    		CostMoney(varMap, varPlayer, x310401_var_curCostTypeTbl[GetName(varMap, varPlayer)] * 2 + 1, x310401_var_curNeedMoneyTbl[GetName(varMap, varPlayer)] - freeMoney, 309)
	    	else
	    		CostMoney(varMap, varPlayer, x310401_var_curCostTypeTbl[GetName(varMap, varPlayer)] * 2, x310401_var_curNeedMoneyTbl[GetName(varMap, varPlayer)], 309)
	    	end
	    else
	    	
	    	if bindMoney < x310401_var_curNeedMoneyTbl[GetName(varMap, varPlayer)] then
	    		CostMoney(varMap, varPlayer, x310401_var_curCostTypeTbl[GetName(varMap, varPlayer)] * 2 + 1, bindMoney, 309)
	    		CostMoney(varMap, varPlayer, x310401_var_curCostTypeTbl[GetName(varMap, varPlayer)] * 2, x310401_var_curNeedMoneyTbl[GetName(varMap, varPlayer)] - bindMoney, 309)
	    	else
	    		CostMoney(varMap, varPlayer, x310401_var_curCostTypeTbl[GetName(varMap, varPlayer)] * 2 + 1, x310401_var_curNeedMoneyTbl[GetName(varMap, varPlayer)], 309)
	    	end
	    end
		
		
	    AddExp(varMap, varPlayer, x310401_var_curGetExpTbl[GetName(varMap, varPlayer)])
	    SetPlayerGameData(varMap, varPlayer, MD_OFFLINE_TRAIN_MIN[1], MD_OFFLINE_TRAIN_MIN[2], MD_OFFLINE_TRAIN_MIN[3], 0)
	    
	    
	    Msg2Player(varMap, varPlayer, format(x310401_var_GetExpTipText, x310401_var_curGetExpTbl[GetName(varMap, varPlayer)]), 8 ,2)
	    
	    WriteLog(1, format("OfflineTrain ProcAcceptCheck GetExp OK: Name(%s) GUID(%d) NeedMoney(%d) GetExp(%d)", 
	    	GetName(varMap, varPlayer), GetGUID(varMap, varPlayer), x310401_var_curNeedMoneyTbl[GetName(varMap, varPlayer)], x310401_var_curGetExpTbl[GetName(varMap, varPlayer)]))		    	
	
	elseif 	x310401_var_curAcceptTypeTbl[GetName(varMap, varPlayer)] == 2 then
		
		
		if GetLevel(varMap, varPlayer) < x310401_var_LowRoleLevel then
			StartTalkTask(varMap)
			TalkAppendString(varMap, format(x310401_var_OfflineLevelErrText, x310401_var_LowRoleLevel))
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
			return
		end

		
    	SetPlayerGameData(varMap, varPlayer, MD_OFFLINE_TRAIN_FLAG[1], MD_OFFLINE_TRAIN_FLAG[2], MD_OFFLINE_TRAIN_FLAG[3], 1)
   	 	KickPlayer(varMap, varPlayer, 1)

    	
	    WriteLog(1, format("OfflineTrain ProcEventEntry Offline OK: Name(%s) GUID(%d)", GetName(varMap, varPlayer), GetGUID(varMap, varPlayer)))
	end
end

function x310401_ProcMapPlayerNewConnectEnter(varMap, varPlayer)
	
	local lastLogoutTime = GetLastLogoutTime(varMap, varPlayer)

	
	

	if lastLogoutTime <= 0 then
		return
	end
	
	
	local selfTrainTime = GetPlayerGameData(varMap, varPlayer, MD_OFFLINE_TRAIN_MIN[1], MD_OFFLINE_TRAIN_MIN[2], MD_OFFLINE_TRAIN_MIN[3])
	local selfTrainFlag = GetPlayerGameData(varMap, varPlayer, MD_OFFLINE_TRAIN_FLAG[1], MD_OFFLINE_TRAIN_FLAG[2], MD_OFFLINE_TRAIN_FLAG[3])

	if selfTrainTime < 0 or selfTrainTime > x310401_var_MaxTrainTime or (selfTrainFlag ~= 0 and selfTrainFlag ~= 1) then
		WriteLog(2, format("OfflineTrain ProcMapPlayerNewConnectEnter: GetPlayerGameData Exception TimeValue(%d) FlagValue(%d)", selfTrainTime, selfTrainFlag))
		return
	end

	
	if selfTrainFlag == 1 then
		
		local thisTrainTime = GetCurrentTime() - lastLogoutTime
		
		
		if thisTrainTime > 0 then
   			selfTrainTime = selfTrainTime + thisTrainTime / 60
			
		    if selfTrainTime > x310401_var_MaxTrainTime then
		    	selfTrainTime = x310401_var_MaxTrainTime
		    end
		
			
		    SetPlayerGameData(varMap, varPlayer, MD_OFFLINE_TRAIN_MIN[1], MD_OFFLINE_TRAIN_MIN[2], MD_OFFLINE_TRAIN_MIN[3], selfTrainTime)
    	else
			WriteLog(2, format("OfflineTrain ProcMapPlayerNewConnectEnter: get this traintime error for modify system time"))    		
    	end
    	
    	
	    SetPlayerGameData(varMap, varPlayer, MD_OFFLINE_TRAIN_FLAG[1], MD_OFFLINE_TRAIN_FLAG[2], MD_OFFLINE_TRAIN_FLAG[3], 0)
	end
end
