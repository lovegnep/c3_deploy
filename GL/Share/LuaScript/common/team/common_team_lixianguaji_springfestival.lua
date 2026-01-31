


x310404_var_FileId 				= 310404


x310404_var_NoMoneyErrText		= 
"您的金钱不足，无法领取"
x310404_var_GetExpLevelErrText	= 
"您的等级不足#R%d级#o，无法领取该档次的春节离线经验"
x310404_var_OfflineLevelErrText	= 
"很抱歉，您的等级不足#R%d级#o"
x310404_var_TimeMaxErrText		= 
"您的累积时间已到达上限，请领取春节离线经验后再开启春节离线代练"
x310404_var_TimeZeroErrText		= 
"您的春节离线代练累积时间为0，没有可领取的春节离线经验"
x310404_var_ShowDemoText			= 
"\t只有不低于#G60#W级的玩家才可以使用春节离线代练，春节离线代练所获得的经验会远高于普通离线代练。\n\t开始春节离线代练后您的春节离线代练时间将累积计算到您下次上线为止，之后您可#R免费#W领取对应的春节离线经验，春节离线代练时间最多可累积#R21天#W。\n"
x310404_var_CurTrainTimeText		= 
"\t您当前的春节离线代练累积时间为#G%d天%d小时%d分#W。\n"
x310404_var_OfflineAcceptText		= 
"\t选择确认后将立即以代练状态春节离线，并开始累积春节离线代练时间，是否立即开始春节离线代练？"
x310404_var_GetExpText			= 
"\t感谢您再次回到成吉思汗3 恶狼传说游戏世界中,请您点击下面领取按钮，获得春节期间的离线代练经验。祝您游戏愉快。"
x310404_var_GetExpAcceptText	= 
"#Y春节离线代练#W\n\t您当前的春节离线代练累积时间为#G%d天%d小时%d分#W。%s"
x310404_var_GetExpTipText			= 
"获得了%d经验"


x310404_var_MaxTrainTime   		= 30240


x310404_var_SwitchLogout 			= 1
x310404_var_SwitchGetExp 			= 2
x310404_var_SwitchLow 			= 3
x310404_var_SwitchMiddle 			= 4
x310404_var_SwitchHigh 			= 5


x310404_var_LowCostType	 		= 0
x310404_var_MiddleCostType		= 1
x310404_var_HighCostType	 		= 1


x310404_var_LowRoleLevel	 		= 60
x310404_var_MiddleRoleLevel 		= 60
x310404_var_HighRoleLevel 		= 80






x310404_var_curGetExpTbl = {}
x310404_var_curNeedMoneyTbl = {}

x310404_var_curAcceptTypeTbl = {}

x310404_var_curCostTypeTbl = {}

x310404_var_DayCountTimeLimit = 
{
	[16] = 60,
	[17] = 80,
	[18] = 0,
	[19] = 60,
	[20] = 70,
	[21] = 120,
	[22] = 120,
	[23] = 120,
	[24] = 120,
	[25] = 120,
	[26] = 100,
	[27] = 100,
	[28] = 80,
	[29] = 80,
	[30] = 60,
	[31] = 100,
	[32] = 85,
	[33] = 70,
	[34] = 50,
	[35] = 40,
	[36] = 30,	
}

function x310404_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	--TalkAppendButton(varMap, x310404_var_FileId, "春节离线代练", 3, x310404_var_SwitchLogout)
 	TalkAppendButton(varMap, x310404_var_FileId, "领取春节离线代练经验", 3, x310404_var_SwitchGetExp)
end

function x310404_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)

	
	local selfTrainTime = GetPlayerGameData(varMap, varPlayer, MD_OFFLINE_TRAIN_SPRINGFESTIVAL_MIN[1], MD_OFFLINE_TRAIN_SPRINGFESTIVAL_MIN[2], MD_OFFLINE_TRAIN_SPRINGFESTIVAL_MIN[3])

	if selfTrainTime < 0 or selfTrainTime > x310404_var_MaxTrainTime then
		WriteLog(2, format("OfflineTrain ProcEventEntry: GetPlayerGameData Exception TimeValue(%d)", selfTrainTime))
		return
	end
	local level =GetLevel(varMap, varPlayer)
	local tempnum
	if level >= 90 then
		tempnum = 2400
	elseif level >= 80 then
		tempnum = 2000
	elseif level >= 70 then
		tempnum = 1000
	else
		tempnum = 550
	end
 		local xishu = level * tempnum
	if idExt == x310404_var_SwitchLogout then
		
		if selfTrainTime >= x310404_var_MaxTrainTime then
			StartTalkTask(varMap)
			TalkAppendString(varMap, x310404_var_TimeMaxErrText)
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
			return
		end
   		
		
		x310404_var_curAcceptTypeTbl[GetName(varMap, varPlayer)] = 2

   		
       	StartTalkTask(varMap)
       	TalkAppendString(varMap, "#Y春节离线代练#W\n")
       	if level >=60 then
 			TalkAppendString(varMap, format(x310404_var_ShowDemoText .. x310404_var_CurTrainTimeText .. x310404_var_OfflineAcceptText, selfTrainTime / 60 / 24, 
 			mod(selfTrainTime / 60, 24), mod(selfTrainTime, 60),xishu))
 		else
 		 	TalkAppendString(varMap, format(x310404_var_ShowDemoText .. x310404_var_OfflineAcceptText, selfTrainTime / 60 / 24, 
 			mod(selfTrainTime / 60, 24), mod(selfTrainTime, 60),xishu))
 		end
   	 	StopTalkTask()
   		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310404_var_FileId, -1)  
   		 		
	elseif idExt == x310404_var_SwitchGetExp then
		local roleLevel = GetLevel(varMap, varPlayer)
		StartTalkTask(varMap)
		TalkAppendString(varMap, "#Y领取春节离线代练经验#W\n")
		if level >=60 then
		TalkAppendString(varMap, format(x310404_var_CurTrainTimeText .. x310404_var_GetExpText, selfTrainTime / 60 / 24, 
			mod(selfTrainTime / 60, 24), mod(selfTrainTime, 60), xishu))
		else
		TalkAppendString(varMap, "\t只有不低于#G60#W级的玩家才可以使用春节离线代练。\n" )
		end
			if roleLevel < 60  then
       -- TalkAppendButton(varMap, x310404_var_FileId, "领取春节离线代练经验", 3, x310404_var_SwitchLow)
      elseif roleLevel < 70 then
        TalkAppendButton(varMap, x310404_var_FileId, "领取春节离线代练经验", 3, x310404_var_SwitchMiddle)
      else  
        TalkAppendButton(varMap, x310404_var_FileId, "领取春节离线代练经验", 3, x310404_var_SwitchHigh)
      end  
        StopTalkTask()
        DeliverTalkMenu(varMap, varPlayer, varTalknpc) 
         
   elseif idExt == x310404_var_SwitchLow or idExt == x310404_var_SwitchMiddle or idExt == x310404_var_SwitchHigh then	
		
		if selfTrainTime == 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, x310404_var_TimeZeroErrText)
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
			return
		end

   		local selLevel = ""
   		local roleLevel = GetLevel(varMap, varPlayer)
   		local errRoleLevel = 0
   		
   		
   		if idExt == x310404_var_SwitchLow then
   			if roleLevel < x310404_var_LowRoleLevel then
   				errRoleLevel = x310404_var_LowRoleLevel
   			end
   			selLevel = "低档"
   		elseif idExt == x310404_var_SwitchMiddle then
   			if roleLevel < x310404_var_MiddleRoleLevel then
   				errRoleLevel = x310404_var_MiddleRoleLevel
   			end
   			selLevel = "中档"
   		elseif idExt == x310404_var_SwitchHigh then
   			if roleLevel < x310404_var_HighRoleLevel then
   				errRoleLevel = x310404_var_HighRoleLevel
   			end
   			selLevel = "高档"
		end

--		if errRoleLevel ~= 0 then
--			StartTalkTask(varMap)
--			TalkAppendString(varMap, format(x310404_var_GetExpLevelErrText, errRoleLevel))
--			StopTalkTask()
--			DeliverTalkTips(varMap, varPlayer)
--			return
--		end
	
   		
   		local numPower = 0
   		if idExt == x310404_var_SwitchLow then
   			x310404_var_curCostTypeTbl[GetName(varMap, varPlayer)] = x310404_var_LowCostType
   			x310404_var_curNeedMoneyTbl[GetName(varMap, varPlayer)] = 313 * selfTrainTime

   		elseif idExt == x310404_var_SwitchMiddle then
   			x310404_var_curCostTypeTbl[GetName(varMap, varPlayer)] = x310404_var_MiddleCostType
   			x310404_var_curNeedMoneyTbl[GetName(varMap, varPlayer)] = 9 * selfTrainTime
   			
   		elseif idExt == x310404_var_SwitchHigh then
   			x310404_var_curCostTypeTbl[GetName(varMap, varPlayer)] = x310404_var_HighCostType
   			x310404_var_curNeedMoneyTbl[GetName(varMap, varPlayer)] = 17 * selfTrainTime
   			

		end
		if roleLevel >=90 then
			numPower = 2400
   		elseif roleLevel >= 80 then
   			numPower = 2000
   		elseif roleLevel >= 70 then
   			numPower = 1000
   		else
   			numPower = 550
   		end
   		x310404_var_curGetExpTbl[GetName(varMap, varPlayer)] = roleLevel * numPower * selfTrainTime
		
		
		
		x310404_var_curAcceptTypeTbl[GetName(varMap, varPlayer)] = 1
		
		
   		local curCostString = ""
		if x310404_var_curCostTypeTbl[GetName(varMap, varPlayer)] == 1 then
			curCostString = "金币"
		else
			curCostString = "银币"
		end

   		
       	StartTalkTask(varMap)
      local tmpMsg = "\n\t将可以获得经验值#G" .. x310404_var_curGetExpTbl[GetName(varMap, varPlayer)] .. "点#W\n\t是否立即领取？"
    	TalkAppendString(varMap, format(x310404_var_GetExpAcceptText, selfTrainTime / 60 / 24, mod(selfTrainTime / 60, 24), mod(selfTrainTime, 60), tmpMsg))
   	 	StopTalkTask()
   		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310404_var_FileId, -1)
    end
end

function x310404_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	
	if 	x310404_var_curAcceptTypeTbl[GetName(varMap, varPlayer)] == 1 then
	
		if x310404_var_curCostTypeTbl[GetName(varMap, varPlayer)] ~= 0 and x310404_var_curCostTypeTbl[GetName(varMap, varPlayer)] ~= 1 then
			return
		end

		
		local freeMoney = GetMoney(varMap, varPlayer, x310404_var_curCostTypeTbl[GetName(varMap, varPlayer)] * 2)
		local bindMoney = GetMoney(varMap, varPlayer, x310404_var_curCostTypeTbl[GetName(varMap, varPlayer)] * 2 + 1)
	
		
--		if freeMoney + bindMoney < x310404_var_curNeedMoneyTbl[GetName(varMap, varPlayer)] then
--			StartTalkTask(varMap)
--			TalkAppendString(varMap, x310404_var_NoMoneyErrText)
--			StopTalkTask()
--			DeliverTalkTips(varMap, varPlayer)
--			return
--		end
		
		local payType = 0 
		if x310404_var_curCostTypeTbl[GetName(varMap, varPlayer)] == 0 then
			payType = GetSillerMode(varMap, varPlayer)
		else
			payType = GetGoldMode(varMap, varPlayer)
		end
		
--	    if payType == 1 then
--	    	
--	    	if freeMoney < x310404_var_curNeedMoneyTbl[GetName(varMap, varPlayer)] then
--	    		CostMoney(varMap, varPlayer, x310404_var_curCostTypeTbl[GetName(varMap, varPlayer)] * 2, freeMoney, 309)
--	    		CostMoney(varMap, varPlayer, x310404_var_curCostTypeTbl[GetName(varMap, varPlayer)] * 2 + 1, x310404_var_curNeedMoneyTbl[GetName(varMap, varPlayer)] - freeMoney, 309)
--	    	else
--	    		CostMoney(varMap, varPlayer, x310404_var_curCostTypeTbl[GetName(varMap, varPlayer)] * 2, x310404_var_curNeedMoneyTbl[GetName(varMap, varPlayer)], 309)
--	    	end
--	    else
--	    	
--	    	if bindMoney < x310404_var_curNeedMoneyTbl[GetName(varMap, varPlayer)] then
--	    		CostMoney(varMap, varPlayer, x310404_var_curCostTypeTbl[GetName(varMap, varPlayer)] * 2 + 1, bindMoney, 309)
--	    		CostMoney(varMap, varPlayer, x310404_var_curCostTypeTbl[GetName(varMap, varPlayer)] * 2, x310404_var_curNeedMoneyTbl[GetName(varMap, varPlayer)] - bindMoney, 309)
--	    	else
--	    		CostMoney(varMap, varPlayer, x310404_var_curCostTypeTbl[GetName(varMap, varPlayer)] * 2 + 1, x310404_var_curNeedMoneyTbl[GetName(varMap, varPlayer)], 309)
--	    	end
--	    end
		
		
	    AddExp(varMap, varPlayer, x310404_var_curGetExpTbl[GetName(varMap, varPlayer)])
	    SetPlayerGameData(varMap, varPlayer, MD_OFFLINE_TRAIN_SPRINGFESTIVAL_MIN[1], MD_OFFLINE_TRAIN_SPRINGFESTIVAL_MIN[2], MD_OFFLINE_TRAIN_SPRINGFESTIVAL_MIN[3], 0)
	    
	    
	    Msg2Player(varMap, varPlayer, "您获得了".. x310404_var_curGetExpTbl[GetName(varMap, varPlayer)].."点经验。", 8 ,2)
	    
	    WriteLog(1, format("OfflineTrain ProcAcceptCheck GetExp OK: Name(%s) GUID(%d) NeedMoney(%d) GetExp(%d)", 
	    	GetName(varMap, varPlayer), GetGUID(varMap, varPlayer), x310404_var_curNeedMoneyTbl[GetName(varMap, varPlayer)], x310404_var_curGetExpTbl[GetName(varMap, varPlayer)]))		    	
	
	elseif 	x310404_var_curAcceptTypeTbl[GetName(varMap, varPlayer)] == 2 then
		
		
		if GetLevel(varMap, varPlayer) < x310404_var_LowRoleLevel then
			StartTalkTask(varMap)
			TalkAppendString(varMap, format(x310404_var_OfflineLevelErrText, x310404_var_LowRoleLevel))
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
			return
		end
		
		local x, z = GetWorldPos(varMap, varPlayer)
		
		local position = {
			[0]=    {127,38},
			[50]=  {127,178},
			[150]={127,178},
			[250]={127,78},
			[350]={127,78},
		}
		
		local mark = 0
		for k , v in position do
			if k==varMap then
				mark = 1
				break
			end
		end

		x=position[varMap][1]+random(-10,10)
		z=position[varMap][2]+random(-10,10)
		
		local bReachLimit = 1
		local nTimeLimit = x310404_var_DayCountTimeLimit[GetDayOfYear()]
		if (nTimeLimit ~= nil) then
			WriteLog(1, format("------------------------ = %d ==== %d", nTimeLimit, GetCountryParam(varMap, 1, CD_COUNTRY_DIZHONGHAI_POINT)))
			if (nTimeLimit > GetCountryParam(varMap, 1, CD_COUNTRY_DIZHONGHAI_POINT)) then --没超过当天上限
				bReachLimit = 0
			end
		end
		
		if ((mark == 1) and (bReachLimit == 0)) then
				OperateSubstituteResult(varMap, varPlayer, 0, GetGUID(varMap, varPlayer), GetZhiye(varMap, varPlayer), x, z, 
					GetName(varMap, varPlayer), GetCurCamp(varMap, varPlayer), GetSex(varMap, varPlayer))
		end
    	SetPlayerGameData(varMap, varPlayer, MD_OFFLINE_TRAIN_SPRINGFESTIVAL_FLAG[1], MD_OFFLINE_TRAIN_SPRINGFESTIVAL_FLAG[2], MD_OFFLINE_TRAIN_SPRINGFESTIVAL_FLAG[3], 1)
   	 	KickPlayer(varMap, varPlayer, 1)

    	
	    WriteLog(1, format("OfflineTrain ProcEventEntry Offline OK: Name(%s) GUID(%d)", GetName(varMap, varPlayer), GetGUID(varMap, varPlayer)))
	end
end

function x310404_ProcMapPlayerNewConnectEnter(varMap, varPlayer)
	
	local lastLogoutTime = GetLastLogoutTime(varMap, varPlayer)

	
	

	if lastLogoutTime <= 0 then
		return
	end
	
	
	local selfTrainTime = GetPlayerGameData(varMap, varPlayer, MD_OFFLINE_TRAIN_SPRINGFESTIVAL_MIN[1], MD_OFFLINE_TRAIN_SPRINGFESTIVAL_MIN[2], MD_OFFLINE_TRAIN_SPRINGFESTIVAL_MIN[3])
	local selfTrainFlag = GetPlayerGameData(varMap, varPlayer, MD_OFFLINE_TRAIN_SPRINGFESTIVAL_FLAG[1], MD_OFFLINE_TRAIN_SPRINGFESTIVAL_FLAG[2], MD_OFFLINE_TRAIN_SPRINGFESTIVAL_FLAG[3])

	if selfTrainTime < 0 or selfTrainTime > x310404_var_MaxTrainTime or (selfTrainFlag ~= 0 and selfTrainFlag ~= 1) then
		WriteLog(2, format("OfflineTrain ProcMapPlayerNewConnectEnter: GetPlayerGameData Exception TimeValue(%d) FlagValue(%d)", selfTrainTime, selfTrainFlag))
		return
	end

	
	if selfTrainFlag == 1 then
		local time =GetCurrentTime()
		if time > 1328544000 then
			time =1328544000
		end	
		local thisTrainTime =  time- lastLogoutTime
		
		
		if thisTrainTime > 0 then
   			selfTrainTime = selfTrainTime + thisTrainTime / 60
			
		    if selfTrainTime > x310404_var_MaxTrainTime then
		    	selfTrainTime = x310404_var_MaxTrainTime
		    end
		
			
		    SetPlayerGameData(varMap, varPlayer, MD_OFFLINE_TRAIN_SPRINGFESTIVAL_MIN[1], MD_OFFLINE_TRAIN_SPRINGFESTIVAL_MIN[2], MD_OFFLINE_TRAIN_SPRINGFESTIVAL_MIN[3], selfTrainTime)
    	else
			WriteLog(2, format("OfflineTrain ProcMapPlayerNewConnectEnter: get this traintime error for modify system time"))    		
    	end
    	
    	
	    SetPlayerGameData(varMap, varPlayer, MD_OFFLINE_TRAIN_SPRINGFESTIVAL_FLAG[1], MD_OFFLINE_TRAIN_SPRINGFESTIVAL_FLAG[2], MD_OFFLINE_TRAIN_SPRINGFESTIVAL_FLAG[3], 0)
	end
end
