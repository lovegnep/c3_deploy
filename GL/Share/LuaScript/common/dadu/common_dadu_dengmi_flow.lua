x310160_var_FileId 		= 310160


x310160_var_DengmiInfo	= {
							{varTalknpc=-1,GUID = 141506,nDengmi=-1},
							{varTalknpc=-1,GUID = 141507,nDengmi=-1},
							{varTalknpc=-1,GUID = 141508,nDengmi=-1},
							{varTalknpc=-1,GUID = 141509,nDengmi=-1},
							{varTalknpc=-1,GUID = 141510,nDengmi=-1},
						  }

x310160_var_DengmiTimer	= { nStart = -1,varIndex = -1 }
x310160_var_DengmiArray 	= {}


x310160_var_TimerInterval	= 59*1000 		
x310160_var_MaxCount		= 10			

x310160_var_GameId		= 1007			
x310160_var_LimitLevel	= 40			
x310160_var_LimitSceneId	= 0				

x310160_var_StartDay		= -1			

x310160_var_GameID_Right	= 961
x310160_var_GameID_Error	= 962





x310160_var_ExpBonus		= 500	
x310160_var_ExpBonus1		= 650 
x310160_var_ShengWang		= 0			
x310160_var_MoneyBonus	= 15	


x310160_var_ItemGL		= 20			
x310160_var_ItemList		= { 			
							{12030107,1}			
						  }


x310160_var_QuestGL		= 50			
x310160_var_QuestId		= 1482			
x310160_var_QuestBonus	= 13015012		




function x310160_CheckValid( varMap,varPlayer)

	local varLevel = GetLevel(varMap,varPlayer)
	if varLevel<x310160_var_LimitLevel then
		return -1
	end
	
	if varMap ~= x310160_var_LimitSceneId then
		return -2
	end
	
	return 1

end




function x310160_IsStartTimeValid()

	local h,m = x310160_GetValidTimeHourMin()
	
	local cur  = h*60  + m
	local from = 19*60 + 00
	local to   = 20*60 + 00
	
	if cur < from or cur > to then
		
		
		local strMsg = format("DML:<Info>x310160_IsStartTimeValid starttime invalid started  h=%d,m=%d", h, m )
    	WriteLog( 1, strMsg )
		return 0
	end
	
	return 1

end




function x310160_SetStartDay( nDay )

	if x310160_var_StartDay ~= -1 then
		return
	end
	
	x310160_var_StartDay = nDay

end




function x310160_ClearStartDay()
	x310160_var_StartDay = -1
end




function x310160_IsNextDay()
	
	local curDay = GetDayOfYear()
	
	if x310160_var_StartDay ~= curDay then
		return 1
	end
	
	return 0
	
end




function x310160_IsPlayerGaming( varMap,varPlayer )
	
	local nNpcID = GetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_NPC_FLAG)
	if nNpcID <= 0 then
		return -1
	end
	
	
	if GetDist( varMap, varPlayer, nNpcID,3 ) > 3 then
		
		
		QuestDengmi_SendDengmiInfo( varMap, varPlayer, -1, -1 )
		
		SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_NPC_FLAG,0)
		SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_CUR_DENGMI,0)
		
		return -1
	end 
	
	return 1
end




function x310160_IsPlayerGamingFull( varMap,varPlayer )

	local nDate   = GetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_DATE[1], MD_QUEST_DENGMI_DATE[2], MD_QUEST_DENGMI_DATE[3] )
	local varCount  = GetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_COUNT[1],MD_QUEST_DENGMI_COUNT[2],MD_QUEST_DENGMI_COUNT[3])

	local nCurDay = GetDayOfYear()
	if nCurDay == nDate then
		if varCount >= x310160_var_MaxCount then
			return 1
		end
	end

	return 0
end




function x310160_FindNpc(varMap,varTalknpc)
	
	for n,item in x310160_var_DengmiInfo do
		if varTalknpc == item.varTalknpc then
			return n
		end
	end
	
	return -1
							
end




function x310160_CheckAndResetPlayerGameInfo( varMap,varPlayer )

	local nDay = GetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_DATE[1],MD_QUEST_DENGMI_DATE[2],MD_QUEST_DENGMI_DATE[3])	
	local nCurDay = GetDayOfYear()
	if nCurDay ~= nDay then
		
		SetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_DATE[1],MD_QUEST_DENGMI_DATE[2],MD_QUEST_DENGMI_DATE[3],nCurDay)
		SetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_COUNT[1],MD_QUEST_DENGMI_COUNT[2],MD_QUEST_DENGMI_COUNT[3],0)	
		
		SetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_NPC[1][1],MD_QUEST_DENGMI_NPC[1][2],MD_QUEST_DENGMI_NPC[1][3],-1)
		SetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_NPC[2][1],MD_QUEST_DENGMI_NPC[2][2],MD_QUEST_DENGMI_NPC[2][3],-1)
		SetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_NPC[3][1],MD_QUEST_DENGMI_NPC[3][2],MD_QUEST_DENGMI_NPC[3][3],-1)
		SetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_NPC[4][1],MD_QUEST_DENGMI_NPC[4][2],MD_QUEST_DENGMI_NPC[4][3],-1)
		SetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_NPC[5][1],MD_QUEST_DENGMI_NPC[5][2],MD_QUEST_DENGMI_NPC[5][3],-1)
	end
end




function x310160_GiveBonus( varMap,varPlayer )

	
	if GetGameOpenById(x310160_var_GameId) ~= 1 then
		return
	end
	
	
	if x310160_CheckValid( varMap,varPlayer ) ~= 1 then
		return
	end
	
	local varLevel = GetLevel(varMap,varPlayer)
	local varName = GetName(varMap,varPlayer)
	if varName == nil then
		varName = "ErrorName"
	end
	
	
	if x310160_var_ExpBonus > 0 then
		local varLevel = GetLevel(varMap,varPlayer)
	if varLevel <70 then
		local bonusExp = varLevel*x310160_var_ExpBonus
		AddExp(varMap,varPlayer,bonusExp)
		
		local varMsg = format("#Y获得#R经验%d点#Y的奖励",bonusExp)
		
		LuaScenceM2Player(varMap, varPlayer, varMsg, varName , 2,1)
        LuaScenceM2Player(varMap, varPlayer, varMsg, varName , 3,1)
	else
		local bonusExp = varLevel*x310160_var_ExpBonus1
		AddExp(varMap,varPlayer,bonusExp)
				
		local varMsg = format("#Y获得#R经验%d点#Y的奖励",bonusExp)
		
		LuaScenceM2Player(varMap, varPlayer, varMsg, varName , 2,1)
    LuaScenceM2Player(varMap, varPlayer, varMsg, varName , 3,1)
  end
	end
	
	
	if x310160_var_ShengWang > 0 then
		local bonusShengWang = GetShengWang( varMap,varPlayer) + x310160_var_ShengWang
		SetShengWang( varMap,varPlayer,bonusShengWang)
		
		local varMsg = format("您获得了%d点声望值的奖励",x310160_var_ShengWang)
		
		LuaScenceM2Player(varMap, varPlayer, varMsg, varName , 2,1)
        LuaScenceM2Player(varMap, varPlayer, varMsg, varName , 3,1)
	end
	
	
	if x310160_var_MoneyBonus > 0 then
		local bonusMoney = varLevel*x310160_var_MoneyBonus
		local buff 	=	9011
		local buff1 =	9013
		local buff2 =	9012
		if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1  or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
			AddMoney(varMap,varPlayer,0,bonusMoney,x310160_var_FileId)
		else
			AddMoney(varMap,varPlayer,1,bonusMoney,x310160_var_FileId)
		end
	end
	
	
	local varItemCount = getn(x310160_var_ItemList)
	if varItemCount > 0 and x310160_var_ItemGL > 0  then

		
		local bGet = random(1,100)
		if bGet <= x310160_var_ItemGL then
			
			
			local bGetItem = random(1,varItemCount)
			
			local itemInfo = x310160_var_ItemList[bGetItem]
			
			StartItemTask(varMap)
			if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
            ItemAppend( varMap, itemInfo[1],itemInfo[2] )
            else
            ItemAppendBind( varMap, itemInfo[1],itemInfo[2] )
            end
            local varRet = StopItemTask(varMap,varPlayer)
            if varRet > 0 then
            	
                DeliverItemListSendToPlayer(varMap,varPlayer)
                
                
			
		       
		       
		    else
		    	LuaScenceM2Player(varMap, varPlayer, "#cffcf00物品栏已满，无法得到奖励物品！", varName , 2,1)
		        LuaScenceM2Player(varMap, varPlayer, "#cffcf00物品栏已满，无法得到奖励物品！", varName , 3,1)
            end
		end
	end
	
    StartItemTask( varMap)
    ItemAppend( varMap, 11990117, 1)
    if StopItemTask( varMap, varPlayer) <= 0 then
        Msg2Player( varMap, varPlayer, "你的背包已满，无法获得#{_ITEM11990117}奖励。", 8, 2)
    else
        DeliverItemListSendToPlayer( varMap, varPlayer)
    end
	
	if IsHaveQuestNM( varMap, varPlayer, x310160_var_QuestId) == 1 then
		
		
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x310160_var_QuestId)
		if varQuestIdx < 0 then
			return
		end
		
		
		if GetQuestParam( varMap,varPlayer,varQuestIdx,7) == 1 then
			return
		end
		
		
		local bGet = random(1,100)
		if bGet <= x310160_var_QuestGL then
			
			StartItemTask(varMap)
            ItemAppend( varMap, x310160_var_QuestBonus,1 )
            local varRet = StopItemTask(varMap,varPlayer)
            if varRet > 0 then
                DeliverItemListSendToPlayer(varMap,varPlayer)
                
                
		    else
		    	LuaScenceM2Player(varMap, varPlayer, "#cffcf00物品栏已满，无法得到任务物品！", varName , 2,1)
		        LuaScenceM2Player(varMap, varPlayer, "#cffcf00物品栏已满，无法得到任务物品！", varName , 3,1)
            end
		end
	end
end




function x310160_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5 )

	
	if GetGameOpenById(x310160_var_GameId) ~= 1 then
		return		
	end
	
	
	if x310160_var_DengmiTimer.nStart >= 0 then
		
		local strMsg = format("DML:<Info>x310160_ProcTimerDoingStart already started varMap = %d, varAct=%d", varMap,varAct )
    	WriteLog( 1, strMsg )		
		return
	end
	
	
	if x310160_IsStartTimeValid() == 0 then
		
		
		local strMsg = format("DML:<Info>x310160_ProcTimerDoingStart starttime invalid varMap = %d, varAct=%d", varMap,varAct )
    	WriteLog( 1, strMsg )		
		return
	end

	
	local varCount = QuestDengmi_GetQuestionCount()
	if varCount > 0 then

		
		for varI,item in x310160_var_DengmiInfo do
			item.nDengmi = -1
			item.varTalknpc = FindMonsterByGUID(varMap,item.GUID)
			
			
			local strMsg = format("DML:<Info>x310160_ProcTimerDoingStart Initialise npc varTalknpc = %d,GUID=%d", item.varTalknpc, item.GUID )
		    WriteLog( 1, strMsg )		
			
		end
		
		x310160_var_DengmiTimer.nStart = -1
		x310160_var_DengmiTimer.varIndex = 0
		
		
		x310160_SetStartDay( GetDayOfYear() )
		
		SetSystemTimerTick( varMap, x310160_var_FileId, "ProcMapTimerTick", varAct, 1000 ) 
	end
	
	
	local strMsg = format("DML:<Info>x310160_ProcTimerDoingStart varMap = %d, varCount=%d, varAct=%d", varMap, varCount,varAct )
    WriteLog( 1, strMsg )
	
end




function x310160_ClearDengmi(varMap)

	
	x310160_var_DengmiInfo	= {
								{varTalknpc=-1,GUID = 141506,nDengmi=-1},
								{varTalknpc=-1,GUID = 141507,nDengmi=-1},
								{varTalknpc=-1,GUID = 141508,nDengmi=-1},
								{varTalknpc=-1,GUID = 141509,nDengmi=-1},
								{varTalknpc=-1,GUID = 141510,nDengmi=-1},
						  	  }
	
	x310160_var_DengmiTimer	= { nStart = -1,varIndex = -1 }
	x310160_var_DengmiArray 	= {}
	
	x310160_ClearStartDay()

	local varHumanCount = GetScenePlayerCount( varMap )
	for varI=0,varHumanCount do

		local varObj = GetScenePlayerObjId(varMap,varI)
		if IsPlayerStateNormal(varMap,varObj) == 1 and x310160_IsPlayerGaming(varMap,varObj) == 1 then
		
			
			QuestDengmi_SendDengmiInfo( varMap, varObj, -1, -1 )
			
			SetPlayerRuntimeData(varMap,varObj,RD_QUEST_DENGMI_NPC_FLAG,0)
			SetPlayerRuntimeData(varMap,varObj,RD_QUEST_DENGMI_CUR_DENGMI,0)
			
			
			StartTalkTask(varMap)
				TalkAppendString(varMap,"今天的天坛灯谜会结束了！")				
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varObj,varObj)
			
		end
	end
	
end




function x310160_ProcMapTimerTick( varMap, varAct, varTime )


	
	
	
	if GetGameOpenById(x310160_var_GameId) ~= 1 then
		
		
		x310160_ClearDengmi(varMap)		
		
		
		local strMsg = format("DML:<Info>x310160_ProcMapTimerTick GM close varMap = %d", varMap )
    	WriteLog( 1, strMsg )			

		return		
	end
	
	
	
	
	if x310160_IsNextDay() == 1 then
		
		
		x310160_ClearDengmi(varMap)
		
		
		local strMsg = format("DML:<Info>x310160_ProcMapTimerTick nextday close varMap = %d", varMap )
    	WriteLog( 1, strMsg )
    	
    	return 
	end
	
	
	
	
	local varCount = QuestDengmi_GetQuestionCount()
	if x310160_var_DengmiTimer.varIndex >= 370 then
		
		
		x310160_ClearDengmi(varMap)
		
		
		local strMsg = format("DML:<Info>x310160_ProcMapTimerTick party close varMap = %d", varMap )
    	WriteLog( 1, strMsg )			
				
		return
	end

	
	
	
	x310160_var_DengmiTimer.nStart = x310160_GetValidTime()
	x310160_var_DengmiTimer.varIndex = x310160_var_DengmiTimer.varIndex + 1
	
	for varI,item in x310160_var_DengmiInfo do
		
		item.nDengmi = random(0,varCount-1)
		local varId,varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer = QuestDengmi_GetQuestionInfo(item.nDengmi)
		
		x310160_var_DengmiArray[varI] = {}		
		x310160_var_DengmiArray[varI].varId = varId + 100000		
		x310160_var_DengmiArray[varI].varDesc = varDesc
		x310160_var_DengmiArray[varI].varAnswer1 = varAnswer1
		x310160_var_DengmiArray[varI].varAnswer2 = varAnswer2
		x310160_var_DengmiArray[varI].varAnswer3 = varAnswer3
		x310160_var_DengmiArray[varI].varAnswer4 = varAnswer4
		x310160_var_DengmiArray[varI].varAnswer = varAnswer + 11000
		
		
		local strMsg = format("DML:<Info>x310160_ProcMapTimerTick new dengmi varMap=%d,varI=%d,dengmi=%d,<%s>,<%s>,<%s>,<%s>,<%s>,%d", 
							  varMap,varI,varId,varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer )
    	WriteLog( 1, strMsg )
	end
	
	
	
	
	local varHumanCount = GetScenePlayerCount( varMap )
	for varI=0,varHumanCount do

		local varObj = GetScenePlayerObjId(varMap,varI)
		if IsPlayerStateNormal(varMap,varObj) == 1 and x310160_IsPlayerGaming(varMap,varObj) == 1 then

			
			local nDate   = GetPlayerGameData(varMap,varObj,MD_QUEST_DENGMI_DATE[1],MD_QUEST_DENGMI_DATE[2],MD_QUEST_DENGMI_DATE[3])
			local varCount  = GetPlayerGameData(varMap,varObj,MD_QUEST_DENGMI_COUNT[1],MD_QUEST_DENGMI_COUNT[2],MD_QUEST_DENGMI_COUNT[3])
			local nNpcID  = GetPlayerRuntimeData(varMap,varObj,RD_QUEST_DENGMI_NPC_FLAG)
			local nCurDay = GetDayOfYear()
			
			
			if x310160_IsPlayerGamingFull(varMap,varObj) == 1 then
					
				
				QuestDengmi_SendDengmiInfo( varMap, varObj, -1, -1 )
				
				SetPlayerRuntimeData(varMap,varObj,RD_QUEST_DENGMI_NPC_FLAG,0)
				SetPlayerRuntimeData(varMap,varObj,RD_QUEST_DENGMI_CUR_DENGMI,0)
				
				
				StartTalkTask(varMap)
					TalkAppendString(varMap,"\t今天你已经猜完10次灯谜了，明天这个时候再来吧。")				
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varObj,nNpcID)
				
			else
				
				for n,item in x310160_var_DengmiInfo do
					
					if nNpcID == item.varTalknpc then
							
						
						local dm = x310160_var_DengmiArray[n]
						
						
						local nTime = x310160_var_TimerInterval/1000 - (x310160_GetValidTime() - x310160_var_DengmiTimer.nStart)
						if nTime > 0 then
							QuestDengmi_SendDengmiInfo( varMap, varObj, x310160_var_DengmiTimer.varIndex, nTime )
						end
						
						
						SetPlayerRuntimeData(varMap,varObj,RD_QUEST_DENGMI_NPC_FLAG,nNpcID)
						SetPlayerRuntimeData(varMap,varObj,RD_QUEST_DENGMI_CUR_DENGMI,dm.varId)
						
						
						StartTalkTask(varMap)
							
							TalkAppendString(varMap,dm.varDesc)
							x310160_AddDengmiAnswerOption( varMap, 
										   				   dm.varAnswer1, 
										   				   dm.varAnswer2, 
										   				   dm.varAnswer3, 
										   				   dm.varAnswer4 )
														
						StopTalkTask(varMap)
						DeliverTalkMenu(varMap,varObj,nNpcID)
						
						break
					end
				end
			end
		end
	end
	
	
	
	
	SetSystemTimerTick( varMap, x310160_var_FileId, "ProcMapTimerTick", varAct, x310160_var_TimerInterval )
end





function x310160_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
	QuestDengmi_SendDengmiInfo( varMap, varPlayer, -1, -1 )
				
	SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_NPC_FLAG,0)
	SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_CUR_DENGMI,0)
	
	if GetGameOpenById(x310160_var_GameId) ~= 1 then
		return
	end
	
    TalkAppendButton(varMap,x310160_var_FileId,"我要猜灯谜",3,x310160_var_FileId);
        
end




function x310160_AddDengmiAnswerOption( varMap,varAnswer1,varAnswer2,varAnswer3,varAnswer4)

	
	local arr_answer = { {varAnswer1,11001,0},{varAnswer2,11002,0},{varAnswer3,11003,0},{varAnswer4,11004,0} }
	for varI=1,4 do
		
		local varCount = getn(arr_answer)
		local n = random(1,varCount)
		while arr_answer[n][3] == 1 do
			n = random(1,varCount)
		end
		
		arr_answer[n][3] = 1
		
		TalkAppendButton(varMap,x310160_var_FileId,arr_answer[n][1],3,arr_answer[n][2] )
	end
	
end




function x310160_ProcEventEntry( varMap ,varPlayer, varTalknpc,idScript,idExt )

	
	
	
	if GetGameOpenById(x310160_var_GameId) ~= 1 then
		
		
		QuestDengmi_SendDengmiInfo( varMap, varPlayer, -1, -1 )
					
		SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_NPC_FLAG,0)
		SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_CUR_DENGMI,0)
		
		
		StartTalkTask(varMap)
			TalkAppendString(varMap,"灯谜会已经关闭！")				
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return
	end
	
	
	
	
	if x310160_CheckValid( varMap,varPlayer ) ~= 1 then
		return
	end
	
	
	
	
	if x310160_var_DengmiTimer.nStart < 0 then
		
		
		QuestDengmi_SendDengmiInfo( varMap, varPlayer, -1, -1 )
					
		SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_NPC_FLAG,0)
		SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_CUR_DENGMI,0)
		
		
		StartTalkTask(varMap)
			TalkAppendString(varMap,"\t灯谜会还没开始呢，别心急。\n\t#G（每天晚上的19：30--2400縊良穦秨")				
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return
	end
	
	
	
	
	if x310160_IsNextDay() == 1 then
		
		
		QuestDengmi_SendDengmiInfo( varMap, varPlayer, -1, -1 )
					
		SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_NPC_FLAG,0)
		SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_CUR_DENGMI,0)
		
		
		StartTalkTask(varMap)
			TalkAppendString(varMap,"\t灯谜会还没开始呢，别心急。\n\t#G（每天晚上的19：30--2400縊良穦秨")				
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return
	end
	

	if idExt == x310160_var_FileId then
		
		
		
		
		
		
		local nFind = x310160_FindNpc(varMap,varTalknpc)
		if nFind > 0 then
			
			
			if x310160_IsPlayerGamingFull( varMap,varPlayer ) == 1 then
					
				
				QuestDengmi_SendDengmiInfo( varMap, varPlayer, -1, -1 )
							
				SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_NPC_FLAG,0)
				SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_CUR_DENGMI,0)
				
				
				StartTalkTask(varMap)
					TalkAppendString(varMap,"\t今天你已经猜完10次灯谜了，明天再来吧。")				
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				return
			end
				
			
			local nPreIndex = GetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_NPC[nFind][1],MD_QUEST_DENGMI_NPC[nFind][2],MD_QUEST_DENGMI_NPC[nFind][3])
			if nPreIndex == x310160_var_DengmiTimer.varIndex then
				
				
				SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_NPC_FLAG,varTalknpc)
				SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_CUR_DENGMI,x310160_var_DengmiTimer.varIndex)
				
				
				local nTime = x310160_var_TimerInterval/1000 - (x310160_GetValidTime() - x310160_var_DengmiTimer.nStart)
				if nTime > 0 then
					QuestDengmi_SendDengmiInfo( varMap, varPlayer, x310160_var_DengmiTimer.varIndex, nTime )
				end
				
				
				
				StartTalkTask(varMap)
					TalkAppendString(varMap,"你可以先去我的姐妹那里猜灯谜，或者在我这里等待下一个灯谜！")				
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				
				
				local varName = GetName(varMap,varPlayer)
				if varName == nil then
					varName = "Error"
				end
				local strMsg = format("DML:<Info>x310160_ProcEventEntry 000 varMap=%d,varName=%s,npcIndex=%d,preIndex=%d,varIndex=%d", 
							  		   varMap, varName, nFind, nPreIndex, x310160_var_DengmiTimer.varIndex)
    			WriteLog( 1, strMsg )
				return
			end			
			
			
			
			x310160_CheckAndResetPlayerGameInfo( varMap,varPlayer )
			

			
			local dm = x310160_var_DengmiArray[nFind]
			
			
			SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_NPC_FLAG,varTalknpc)
			SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_CUR_DENGMI,dm.varId)

			
			
			local nTime = x310160_var_TimerInterval / 1000 - ( x310160_GetValidTime() - x310160_var_DengmiTimer.nStart )
			if nTime > 0 then
				QuestDengmi_SendDengmiInfo( varMap, varPlayer, x310160_var_DengmiTimer.varIndex, nTime )
			end
			
			
			
			StartTalkTask(varMap)
				
				TalkAppendString(varMap,dm.varDesc)
				x310160_AddDengmiAnswerOption( varMap, 
											   dm.varAnswer1, 
											   dm.varAnswer2, 
											   dm.varAnswer3, 
											   dm.varAnswer4 )
											
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			
		end
		
	elseif idExt >= 11001 and idExt <= 11004 then
		
		
		
		
		
		
		local nPreDate  = GetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_DATE[1],MD_QUEST_DENGMI_DATE[2],MD_QUEST_DENGMI_DATE[3])
		local nPreCount = GetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_COUNT[1],MD_QUEST_DENGMI_COUNT[2],MD_QUEST_DENGMI_COUNT[3])
		
		local nDate = GetDayOfYear()
		if nDate == nPreDate then
			
			
			if nPreCount >= x310160_var_MaxCount then
				
				
				QuestDengmi_SendDengmiInfo( varMap, varPlayer, -1, -1 )
							
				SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_NPC_FLAG,0)
				SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_CUR_DENGMI,0)
				
				
				StartTalkTask(varMap)
					TalkAppendString(varMap,"\t今天你已经猜完10次灯谜了，明天再来吧。")				
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				return
			end
			
			
			local nFind = 0
			for varI,item in x310160_var_DengmiInfo do
				if item.varTalknpc == varTalknpc then
					nFind = varI
					break
				end
			end
			
			if nFind <= 0 or nFind >= 6 then
				return
			end
			
			
			local dm = x310160_var_DengmiArray[nFind]
			
			
			local preNpcId= GetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_NPC_FLAG)
			if varTalknpc ~= preNpcId then
				
				
				QuestDengmi_SendDengmiInfo( varMap, varPlayer, -1, -1 )
							
				SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_NPC_FLAG,0)
				SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_CUR_DENGMI,0)
				
				
				StartTalkTask(varMap)
					TalkAppendString(varMap,"\t灯谜会已经结束啦，明天再来吧。")				
				StopTalkTask(varMap)
				DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				return
			end
			
			
			local nPreIndex = GetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_NPC[nFind][1],MD_QUEST_DENGMI_NPC[nFind][2],MD_QUEST_DENGMI_NPC[nFind][3])
			if nPreIndex == x310160_var_DengmiTimer.varIndex then
				return
			end
			
			
			
			local nTime = x310160_var_TimerInterval / 1000 - ( x310160_GetValidTime() - x310160_var_DengmiTimer.nStart )
			if nTime > 0 then
				QuestDengmi_SendDengmiInfo( varMap, varPlayer, x310160_var_DengmiTimer.varIndex, nTime )
			end
			
			
			
			local nId = GetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_CUR_DENGMI)
			if nId ~= dm.varId then
				
				local nSelfPreCount = GetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_COUNT[1],MD_QUEST_DENGMI_COUNT[2],MD_QUEST_DENGMI_COUNT[3]) + 1
				SetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_COUNT[1],MD_QUEST_DENGMI_COUNT[2],MD_QUEST_DENGMI_COUNT[3],nSelfPreCount)
				SetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_NPC[nFind][1],MD_QUEST_DENGMI_NPC[nFind][2],MD_QUEST_DENGMI_NPC[nFind][3],x310160_var_DengmiTimer.varIndex)
				
				
				if x310160_IsPlayerGamingFull(varMap,varPlayer) == 1 then
					
					
					QuestDengmi_SendDengmiInfo( varMap, varPlayer, -1, -1 )
					
					SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_NPC_FLAG,0)
					SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_CUR_DENGMI,0)
					
					local varName = GetName(varMap,varPlayer)
					LuaScenceM2Player( varMap,varPlayer,"\t很遗憾，你猜错了哦。",varName,3,1)
					LuaScenceM2Player( varMap,varPlayer,"\t很遗憾，你猜错了哦。",varName,2,1)
					
					
					StartTalkTask(varMap)
						TalkAppendString(varMap,"\t很遗憾，你猜错了哦。" )
						TalkAppendString(varMap,"\t今天你已经猜完10次灯谜了，明天这个时候再来吧。")
					StopTalkTask(varMap)
					DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				else
					
					local varName = GetName(varMap,varPlayer)
					LuaScenceM2Player( varMap,varPlayer,format("\t很遗憾，你猜错了哦，今天你还可以猜%d次。",x310160_var_MaxCount - nSelfPreCount ),varName,3,1)
					LuaScenceM2Player( varMap,varPlayer,format("\t很遗憾，你猜错了哦，今天你还可以猜%d次。",x310160_var_MaxCount - nSelfPreCount ),varName,2,1)
					
					StartTalkTask(varMap)
					TalkAppendString(varMap,format("\t很遗憾，你猜错了哦，今天你还可以猜%d次。\n\t你可以继续在我这里等待灯谜更新，或者去我的其他姐妹那里继续猜灯谜。",x310160_var_MaxCount - nSelfPreCount ) )				
					StopTalkTask(varMap)
					DeliverTalkMenu(varMap,varPlayer,varTalknpc)
					
				end
				
				
				GamePlayScriptLog( varMap, varPlayer, x310160_var_GameID_Error)
				
				
				local varName = GetName(varMap,varPlayer)
				if varName == nil then
					varName = "Error"
				end
				local strMsg = format("DML:<Info>x310160_ProcEventEntry 001 varName=%s,npcIndex=%d,varIndex=%d",varName,nFind,x310160_var_DengmiTimer.varIndex)
				WriteLog( 1, strMsg )
				return
			end
			
			
			
			if dm.varAnswer == idExt then
				
				
				
				
				local nSelfPreCount = GetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_COUNT[1],MD_QUEST_DENGMI_COUNT[2],MD_QUEST_DENGMI_COUNT[3]) + 1
				SetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_COUNT[1],MD_QUEST_DENGMI_COUNT[2],MD_QUEST_DENGMI_COUNT[3],nSelfPreCount)
				SetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_NPC[nFind][1],MD_QUEST_DENGMI_NPC[nFind][2],MD_QUEST_DENGMI_NPC[nFind][3],x310160_var_DengmiTimer.varIndex)
				
				
				if x310160_IsPlayerGamingFull(varMap,varPlayer) == 1 then
					
					
					QuestDengmi_SendDengmiInfo( varMap, varPlayer, -1, -1 )
					
					SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_NPC_FLAG,0)
					SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_CUR_DENGMI,0)
					
					
					local varName = GetName(varMap,varPlayer)
					LuaScenceM2Player( varMap,varPlayer,"\t恭喜你猜对了灯谜。",varName,3,1)
					LuaScenceM2Player( varMap,varPlayer,"\t恭喜你猜对了灯谜。",varName,2,1)
					
					
					StartTalkTask(varMap)
						TalkAppendString(varMap,"\t恭喜你猜对了灯谜。" )
						TalkAppendString(varMap,"\t今天你已经猜完10次灯谜了，明天这个时候再来吧。")	
					StopTalkTask(varMap)
					DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				else
				
					
					local varName = GetName(varMap,varPlayer)
					LuaScenceM2Player( varMap,varPlayer,format("\t恭喜你猜对了灯谜，你今天还可以猜%d次。",x310160_var_MaxCount - nSelfPreCount ),varName,3,1)
					LuaScenceM2Player( varMap,varPlayer,format("\t恭喜你猜对了灯谜，你今天还可以猜%d次。",x310160_var_MaxCount - nSelfPreCount ),varName,2,1)
					
					StartTalkTask(varMap)
					TalkAppendString(varMap,format("\t恭喜你猜对了灯谜，你今天还可以猜%d次。\n\t你可以继续在我这里等待灯谜更新，或者去我的其他姐妹那里继续猜灯谜。",x310160_var_MaxCount - nSelfPreCount ) )				
					StopTalkTask(varMap)
					DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				
				end
				
				
				x310160_GiveBonus( varMap,varPlayer )
				LuaCallNoclosure( 256224, "Finishdengmi", varMap, varPlayer)	
				
				
				GamePlayScriptLog( varMap, varPlayer, x310160_var_GameID_Right)
				 
				 
				local varName = GetName(varMap,varPlayer)
				if varName == nil then
					varName = "Error"
				end
				local strMsg = format("DML:<Info>x310160_ProcEventEntry 002 varName=%s,npcIndex=%d,varIndex=%d",varName,nFind,x310160_var_DengmiTimer.varIndex)
				WriteLog( 1, strMsg )
				
				return
				
			else
				
				
				
				local nSelfPreCount = GetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_COUNT[1],MD_QUEST_DENGMI_COUNT[2],MD_QUEST_DENGMI_COUNT[3]) + 1
				SetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_COUNT[1],MD_QUEST_DENGMI_COUNT[2],MD_QUEST_DENGMI_COUNT[3],nSelfPreCount)
				SetPlayerGameData(varMap,varPlayer,MD_QUEST_DENGMI_NPC[nFind][1],MD_QUEST_DENGMI_NPC[nFind][2],MD_QUEST_DENGMI_NPC[nFind][3],x310160_var_DengmiTimer.varIndex)
				
				
				if x310160_IsPlayerGamingFull(varMap,varPlayer) == 1 then
					
					
					QuestDengmi_SendDengmiInfo( varMap, varPlayer, -1, -1 )
					
					SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_NPC_FLAG,0)
					SetPlayerRuntimeData(varMap,varPlayer,RD_QUEST_DENGMI_CUR_DENGMI,0)
					
					
					local varName = GetName(varMap,varPlayer)
					LuaScenceM2Player( varMap,varPlayer,"\t很遗憾，你猜错了哦。",varName,3,1)
					LuaScenceM2Player( varMap,varPlayer,"\t很遗憾，你猜错了哦。",varName,2,1)
					
					
					StartTalkTask(varMap)
						TalkAppendString(varMap,"\t很遗憾，你猜错了哦。")	
						TalkAppendString(varMap,"\t今天你已经猜完10次灯谜了，明天这个时候再来吧。")				
					StopTalkTask(varMap)
					DeliverTalkMenu(varMap,varPlayer,varTalknpc)
				else
				
					
					local varName = GetName(varMap,varPlayer)
					LuaScenceM2Player( varMap,varPlayer,format("\t很遗憾，你猜错了哦，今天你还可以猜%d次。",x310160_var_MaxCount - nSelfPreCount ),varName,3,1)
					LuaScenceM2Player( varMap,varPlayer,format("\t很遗憾，你猜错了哦，今天你还可以猜%d次。",x310160_var_MaxCount - nSelfPreCount ),varName,2,1)
					
					StartTalkTask(varMap)
					TalkAppendString(varMap,format("\t很遗憾，你猜错了哦，今天你还可以猜%d次。\n\t你可以继续在我这里等待灯谜更新，或者去我的其他姐妹那里继续猜灯谜。",x310160_var_MaxCount - nSelfPreCount ) )				
					StopTalkTask(varMap)
					DeliverTalkMenu(varMap,varPlayer,varTalknpc)
					
				end
				
				
				GamePlayScriptLog( varMap, varPlayer, x310160_var_GameID_Error)
				
				
				local varName = GetName(varMap,varPlayer)
				if varName == nil then
					varName = "Error"
				end
				local strMsg = format("DML:<Info>x310160_ProcEventEntry 003 varName=%s,npcIndex=%d,varIndex=%d",varName,nFind,x310160_var_DengmiTimer.varIndex)
				WriteLog( 1, strMsg )
				return
				
			end			
			
		else
			
			
			return
			
		end
		
	end
		    
end


function x310160_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 0
end




function x310160_ProcAccept( varMap, varPlayer )
end




function x310160_ProcQuestAbandon( varMap, varPlayer, varQuest )
end




function x310160_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x310160_CheckSubmit( varMap, varPlayer )
end




function x310160_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x310160_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x310160_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310160_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end





function x310160_GetValidTime()

	local n1 = GetCurrentTime()
	local n2 = GetCurrentTime()
	
	local nResult = n2 - n1 
	while nResult > 5 or nResult < 0 do
		n1 = GetCurrentTime()
		n2 = GetCurrentTime()
		
		nResult = n2 - n1 
		
		
		local strMsg = format("DML:<Error>x310160_GetValidTime n1=%d,n2=%d",n1,n2)
		WriteLog( 1, strMsg )	
		
	end
	
	return n2
end




function x310160_GetValidTimeHourMin()

	local h,m,s = GetHourMinSec()	
	return h,m

end
