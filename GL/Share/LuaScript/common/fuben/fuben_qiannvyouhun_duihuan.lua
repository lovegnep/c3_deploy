



x700120_var_FileId 					= 700120

x700120_var_LevelMin					= 60
x700120_var_LevelMax					= 160
x700120_var_DayCountUntil				= 1

x700120_var_ItemId					= {11000632, 11000632, 11000632, 11000633, 11000633}
x700120_var_NeedItemCount					= 1	
x700120_var_ExchangeItemCount				= 8	
x700120_var_BonusItemId				= {11000630, 11000630, 11000630, 11000630, 11000630}

x700120_CSP_SHANREN_NPC_ID			= 103
--x700120_G_STEP						= 6
x700120_var_XiaoqianPosList		= 	{
										{varX = 54,z = 14},
										{varX = 24,z = 36},
										{varX = 68,z = 64},
										{varX = 84,z = 107},
										{varX = 25,z = 110},
										
									}
x700120_var_md_date					= MD_EQUIP_MINGZHUANG_SHENGJI_DAY1
	
																																																
x700120_var_md_daycount				= {MD_EQUIP_MINGZHUANG_SHENGJI_DAYCOUNT1,
																	MD_EQUIP_MINGZHUANG_SHENGJI_DAYCOUNT2,
																	MD_EQUIP_MINGZHUANG_SHENGJI_DAYCOUNT3,
																	MD_EQUIP_MINGZHUANG_SHENGJI_DAYCOUNT4,
																	MD_EQUIP_MINGZHUANG_SHENGJI_DAYCOUNT5}
									
x700120_var_QuestName				= "第%s关兑换[幽冥之华]"
x700120_var_EnterInfo					= "\t%s个#G#{_ITEM%d}#W兑换%s个#G#{_ITEM%d}#W，\n\t#R每轮仅能兑换一次，请慎重选择兑换物品！"






function x700120_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	local varIndex = x700120_GetShanrenIndex(varMap)
	--local varDaycount = GetPlayerGameData(varMap, varPlayer, x700120_var_md_daycount[varIndex][1], x700120_var_md_daycount[varIndex][2], x700120_var_md_daycount[varIndex][3])

	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x700120_var_LevelMin then
       return
    end

    if varLevel > x700120_var_LevelMax then
		 return
    end

	
	--if  nCurrentGameStep > 0 and nCurrentGameStep > x700120_GetDayCount(varMap, varPlayer) then
		TalkAppendButton(varMap, x700120_var_FileId, format(x700120_var_QuestName, x700120_GetBarrierNum(varMap, varPlayer)),0,10);
	--end
	
end

--function x700120_IsExchanged(varMap, varPlayer)
--
--	if( x700120_var_DayCountUntil > 0 ) then
--		
--		if x700120_GetDayCount(varMap, varPlayer) >= x700120_var_DayCountUntil then
--
--			return 1;
--		end
--	end
--	return 0
--	
--end

function x700120_ExchangeItemTime(varMap, varPlayer)
	
	local num = x700120_GetShanrenIndex(varMap)

	return x700120_var_ItemId[num], x700120_var_BonusItemId[num]

end


function x700120_DispatchEnterInfo( varMap, varPlayer, varTalknpc )
	local item1, item2 = x700120_ExchangeItemTime(varMap, varPlayer)
	StartTalkTask(varMap)

		local str = format(x700120_var_QuestName, x700120_GetBarrierNum(varMap, varPlayer))
		TalkAppendString(varMap,"#Y"..str)
		TalkAppendString(varMap, format(x700120_var_EnterInfo, x700120_var_NeedItemCount, item1, x700120_var_ExchangeItemCount, item2))
        AddQuestItemBonus(varMap, item2,x700120_var_ExchangeItemCount)
		

		


	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700120_var_FileId, -1);
end


function x700120_GetBarrierNum(varMap, varPlayer)
	local varIndex = x700120_GetShanrenIndex(varMap)
	local barrier = ""
	if varIndex == 1 then
		barrier = "一"
		return barrier
	elseif varIndex == 2 then
		barrier = "二"
		return barrier
	elseif varIndex == 3 then
		barrier = "三"
		return barrier
	elseif varIndex == 4 then
		barrier = "四"
		return barrier
	elseif varIndex == 5 then
		barrier = "五"
		return barrier		
	end				
end


function x700120_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end

function x700120_GetShanrenIndex(varMap)
	local shanrenId = GetFubenData_Param(varMap, x700120_CSP_SHANREN_NPC_ID)
	if shanrenId < 0 then
		return 0
	end
	local varX,z = GetWorldPos(varMap, shanrenId)
	local nlen = getn(x700120_var_XiaoqianPosList)
	
	for varI = 1,nlen do
		if x700120_var_XiaoqianPosList[varI].varX == varX and x700120_var_XiaoqianPosList[varI].z == z then
			return varI
		end
	end
	return 0
end


function x700120_ProcAccept( varMap, varPlayer )

	x700120_ProcRequestSubmit(varMap, varPlayer);
end









function x700120_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	if nFlag== nil then
		return
	end

	x700120_DispatchEnterInfo( varMap, varPlayer, varTalknpc )
	
end


function x700120_ProcRequestSubmit(varMap, varPlayer)

	local iRet = x700120_CheckRequest(varMap, varPlayer)

	if iRet>0 then
		x700120_ProcApproveRequest(varMap, varPlayer)
	end
end

function x700120_CheckRequest(varMap, varPlayer)

	local item1, item2 = x700120_ExchangeItemTime(varMap, varPlayer)
	if( x700120_var_DayCountUntil > 0 ) then
		
		if  x700120_GetPlayerExchangeState(varMap, varPlayer) == 1 then

			local varStr = format("本轮仅能兑换%d次",x700120_var_DayCountUntil)

			StartTalkTask(varMap);
				TalkAppendString(varMap, varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return 0;
		end
	end


	










	local ItemCnt = GetItemCount( varMap, varPlayer, item1 )

	if ItemCnt<x700120_var_NeedItemCount then
		local varStr = format("所需任务道具不足%d个",x700120_var_NeedItemCount)

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();

		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	return 1;
	
end

function x700120_ProcApproveRequest(varMap, varPlayer)
	local item1, item2 = x700120_ExchangeItemTime(varMap, varPlayer)
	if x700120_GetBonus(varMap, varPlayer)>0 then
		if DelItem(varMap, varPlayer,item1,x700120_var_NeedItemCount) ~= 1 then return 0 end

	
		
		x700120_SetDayCount(varMap, varPlayer);
	end
		
	
	
end


function x700120_GetBonus(varMap, varPlayer)
	local item1, item2 = x700120_ExchangeItemTime(varMap, varPlayer)
	StartItemTask(varMap)
	ItemAppendBind( varMap, item2, x700120_var_ExchangeItemCount )
	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"兑换完成！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 1;
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"物品栏已满，无法得到物品！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0;
	end
end





function x700120_GetDayCount(varMap, varPlayer)

	local varIndex = x700120_GetShanrenIndex(varMap) 

	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, x700120_var_md_date[1], x700120_var_md_date[2],x700120_var_md_date[3] );
	
	if varLastday ~= varToday  and (varLastday+1) ~= varToday then
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, x700120_var_md_daycount[varIndex][1], x700120_var_md_daycount[varIndex][2],x700120_var_md_daycount[varIndex][3] );

	return varDaycount;

	

end




function x700120_SetDayCount(varMap, varPlayer)
	local varIndex = x700120_GetShanrenIndex(varMap)
	
	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, x700120_var_md_date[1], x700120_var_md_date[2], x700120_var_md_date[3])

	if varLastday ~= varToday  and (varLastday+1) ~= varToday then
		SetPlayerGameData(varMap, varPlayer, x700120_var_md_date[1], x700120_var_md_date[2], x700120_var_md_date[3], varToday)
		SetPlayerGameData(varMap, varPlayer, x700120_var_md_daycount[varIndex][1], x700120_var_md_daycount[varIndex][2], x700120_var_md_daycount[varIndex][3], 1)
	else

			SetPlayerGameData(varMap, varPlayer, x700120_var_md_daycount[varIndex][1], x700120_var_md_daycount[varIndex][2], x700120_var_md_daycount[varIndex][3], 1)

	end
	
	
	
end

function x700120_GetPlayerExchangeState(varMap, varPlayer)

	local varIndex = x700120_GetShanrenIndex(varMap)
	local varDaycount = GetPlayerGameData(varMap, varPlayer, x700120_var_md_daycount[varIndex][1], x700120_var_md_daycount[varIndex][2], x700120_var_md_daycount[varIndex][3])	
	return varDaycount
end
