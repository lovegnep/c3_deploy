



x570088_var_FileId 					= 570088

x570088_var_LevelMin					= 60
x570088_var_LevelMax					= 160
x570088_var_DayCountUntil				= 1

x570088_var_ItemId					= {11000632, 11000632, 11000632, 11000633, 11000633}
x570088_var_NeedItemCount					= 1	
x570088_var_ExchangeItemCount				= 8
x570088_var_BonusItemId				= {11000630, 11000630, 11000630, 11000630, 11000630}
x570088_CSP_CURRENT_STEP			= 22
--x570088_G_STEP						= 6
x570088_var_md_date					= MD_EQUIP_MINGZHUANG_SHENGJI_DAY
x570088_var_md_daycount				= MD_EQUIP_MINGZHUANG_SHENGJI_DAYCOUNT

x570088_var_QuestName				= "第%s轮兑换[幽冥之华]"
x570088_var_EnterInfo					= "\t%s个#G#{_ITEM%d}#W兑换%s个#G#{_ITEM%d}#W，\n\t#R每轮仅能兑换一次，请慎重选择兑换物品！"






function x570088_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	local varLastday = GetPlayerGameData(varMap, varPlayer, x570088_var_md_date[1], x570088_var_md_date[2],x570088_var_md_date[3] )	
	local nCurrentGameStep = GetFubenData_Param(varMap, x570088_CSP_CURRENT_STEP )
	local item1, item2 = x570088_ExchangeItemTime(varMap, varPlayer)
	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x570088_var_LevelMin then
       return
    end

    if varLevel > x570088_var_LevelMax then
		 return
    end

	if  nCurrentGameStep > 5 and nCurrentGameStep > x570088_GetDayCount(varMap, varPlayer) then
		TalkAppendButton(varMap, x570088_var_FileId, format(x570088_var_QuestName, x570088_GetBarrierNum(varMap, varPlayer)),3,1);
	end
	
end

--function x570088_IsExchanged(varMap, varPlayer)
--
--	if( x570088_var_DayCountUntil > 0 ) then
--		
--		if x570088_GetDayCount(varMap, varPlayer) >= x570088_var_DayCountUntil then
--
--			return 1;
--		end
--	end
--	return 0
--	
--end

function x570088_ExchangeItemTime(varMap, varPlayer)
	
	local num = x570088_GetDayCount(varMap, varPlayer)
	if num < 5 then
		num = 5
	end
	return x570088_var_ItemId[num-4], x570088_var_BonusItemId[num-4]

end


function x570088_DispatchEnterInfo( varMap, varPlayer, varTalknpc )
	local item1, item2 = x570088_ExchangeItemTime(varMap, varPlayer)
	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..format(x570088_var_QuestName, x570088_GetBarrierNum(varMap, varPlayer)))
		TalkAppendString(varMap, format(x570088_var_EnterInfo, x570088_var_NeedItemCount, item1, x570088_var_ExchangeItemCount, item2))
        AddQuestItemBonus(varMap, item2,x570088_var_ExchangeItemCount)
		

		


	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570088_var_FileId, -1);
end


function x570088_GetBarrierNum(varMap, varPlayer)
	local varIndex = GetFubenData_Param(varMap, x570088_CSP_CURRENT_STEP )
	local varIndex1 = x570088_GetDayCount(varMap, varPlayer) 
	local barrier = ""
	if varIndex1 < 6 then
		barrier = "六"
		return barrier
	elseif varIndex1 == 6 then
		barrier = "七"
		return barrier
	elseif varIndex1 == 7 then
		barrier = "八"
		return barrier
	elseif varIndex1 == 8 then
		barrier = "九"
		return barrier
	elseif varIndex1 == 9 then
		barrier = "十"
		return barrier		
	end				
end


function x570088_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x570088_ProcAccept( varMap, varPlayer )

	x570088_ProcRequestSubmit(varMap, varPlayer);
end









function x570088_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	if nFlag== nil then
		return
	end

	x570088_DispatchEnterInfo( varMap, varPlayer, varTalknpc )
	
end


function x570088_ProcRequestSubmit(varMap, varPlayer)

	local iRet = x570088_CheckRequest(varMap, varPlayer)

	if iRet>0 then
		x570088_ProcApproveRequest(varMap, varPlayer)
	end
end

function x570088_CheckRequest(varMap, varPlayer)
	local nCurrentGameStep = GetFubenData_Param(varMap, x570088_CSP_CURRENT_STEP )
	local item1, item2 = x570088_ExchangeItemTime(varMap, varPlayer)
	if( x570088_var_DayCountUntil > 0 ) then
		
		if x570088_GetDayCount(varMap, varPlayer) >= nCurrentGameStep then

			local varStr = format("本轮仅能兑换%d次",x570088_var_DayCountUntil)

			StartTalkTask(varMap);
				TalkAppendString(varMap, varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return 0;
		end
	end


	










	local ItemCnt = GetItemCount( varMap, varPlayer, item1 )

	if ItemCnt<x570088_var_NeedItemCount then
		local varStr = format("所需任务道具不足%d个",x570088_var_NeedItemCount)

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();

		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	return 1;
	
end

function x570088_ProcApproveRequest(varMap, varPlayer)
	local item1, item2 = x570088_ExchangeItemTime(varMap, varPlayer)
	if x570088_GetBonus(varMap, varPlayer)>0 then
		if DelItem(varMap, varPlayer,item1,x570088_var_NeedItemCount) ~= 1 then return 0 end

	
		
		x570088_SetDayCount(varMap, varPlayer);
	end
		
	
	
end


function x570088_GetBonus(varMap, varPlayer)
	local item1, item2 = x570088_ExchangeItemTime(varMap, varPlayer)
	StartItemTask(varMap)
	ItemAppendBind( varMap, item2, x570088_var_ExchangeItemCount )
	
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





function x570088_GetDayCount(varMap, varPlayer)


	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, x570088_var_md_date[1], x570088_var_md_date[2],x570088_var_md_date[3] );
	
	if varLastday ~= varToday  and (varLastday+1) ~= varToday then
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, x570088_var_md_daycount[1], x570088_var_md_daycount[2],x570088_var_md_daycount[3] );

	return varDaycount;

	

end




function x570088_SetDayCount(varMap, varPlayer)

	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, x570088_var_md_date[1], x570088_var_md_date[2], x570088_var_md_date[3])

	if varLastday ~= varToday  and (varLastday+1) ~= varToday then
		SetPlayerGameData(varMap, varPlayer, x570088_var_md_date[1], x570088_var_md_date[2], x570088_var_md_date[3], varToday)
		SetPlayerGameData(varMap, varPlayer, x570088_var_md_daycount[1], x570088_var_md_daycount[2], x570088_var_md_daycount[3], 6)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, x570088_var_md_daycount[1], x570088_var_md_daycount[2], x570088_var_md_daycount[3])
		SetPlayerGameData(varMap, varPlayer, x570088_var_md_daycount[1], x570088_var_md_daycount[2], x570088_var_md_daycount[3], varDaycount+1)
	end
	
	
	
end
