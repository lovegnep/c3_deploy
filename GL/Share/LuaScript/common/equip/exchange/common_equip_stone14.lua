

x570023_var_FileId 					= 570023

x570023_var_LevelMin					= 60
x570023_var_LevelMax					= 160
x570023_var_DayCountUntil				= 1

x570023_var_ItemId					= 11990115
x570023_var_NeedItemCount				= 1	
x570023_var_BonusItemId				= 11990113
x570023_CSP_CURRENT_STEP			= 22
x570023_G_STEP						= 10
x570023_var_md_date					= MD_EQUIP_EXCHANGE3_DAY
x570023_var_md_daycount				= MD_EQUIP_EXCHANGE3_DAYCOUNT

x570023_var_QuestName				= "第十轮兑换[钻石原石]"
x570023_var_EnterInfo					= "\t1个#g原生钻石矿#w兑换1个#g钻石原石#w，\n\t#r每轮仅能兑换一次，请慎重选择兑换物品！"


function x570023_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x570023_var_LevelMin then
       return
    end

    if varLevel > x570023_var_LevelMax then
		 return
    end

	local nCurrentGameStep = GetFubenData_Param(varMap, x570023_CSP_CURRENT_STEP )
	
	if x570023_IsExchanged(varMap, varPlayer) == 0  and x570023_G_STEP <= nCurrentGameStep then
		TalkAppendButton(varMap, x570023_var_FileId, x570023_var_QuestName,3,1);
	end
	
end

function x570023_IsExchanged(varMap, varPlayer)

	if( x570023_var_DayCountUntil > 0 ) then
		
		if x570023_GetDayCount(varMap, varPlayer) >= x570023_var_DayCountUntil then

			return 1;
		end
	end
	return 0
	
end



function x570023_DispatchEnterInfo( varMap, varPlayer, varTalknpc )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x570023_var_QuestName)
		TalkAppendString(varMap,x570023_var_EnterInfo)
        AddQuestItemBonus(varMap, x570023_var_BonusItemId,1)
		

		


	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570023_var_FileId, -1);
end



function x570023_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x570023_ProcAccept( varMap, varPlayer )

	x570023_ProcRequestSubmit(varMap, varPlayer);
end





function x570023_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	if nFlag== nil then
		return
	end

	x570023_DispatchEnterInfo( varMap, varPlayer, varTalknpc )
	
end


function x570023_ProcRequestSubmit(varMap, varPlayer)

	local iRet = x570023_CheckRequest(varMap, varPlayer)

	if iRet>0 then
		x570023_ProcApproveRequest(varMap, varPlayer)
	end
end

function x570023_CheckRequest(varMap, varPlayer)

	if( x570023_var_DayCountUntil > 0 ) then
		
		if x570023_GetDayCount(varMap, varPlayer) >= x570023_var_DayCountUntil then

			local varStr = format("本轮仅能兑换%d次",x570023_var_DayCountUntil)

			StartTalkTask(varMap);
				TalkAppendString(varMap, varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return 0;
		end
	end













	local ItemCnt = GetItemCount( varMap, varPlayer, x570023_var_ItemId )

	if ItemCnt<x570023_var_NeedItemCount then
		local varStr = format("所需任务道具不足%d个",x570023_var_NeedItemCount)

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();

		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法兑换", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法兑换", 0, 3)
		return 0
	end
	
	return 1;
	
end

function x570023_ProcApproveRequest(varMap, varPlayer)
	

		local iRet = DelItem(varMap, varPlayer,x570023_var_ItemId,x570023_var_NeedItemCount)

	
		if iRet > 0 then
			if x570023_GetBonus(varMap, varPlayer)>0 then
			x570023_SetDayCount(varMap, varPlayer);
		end
	end
		
	
	
end


function x570023_GetBonus(varMap, varPlayer)
	StartItemTask(varMap)
	ItemAppendBind( varMap, x570023_var_BonusItemId, 1 )
	
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



function x570023_GetDayCount(varMap, varPlayer)



	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, x570023_var_md_date[1], x570023_var_md_date[2],x570023_var_md_date[3] );
	
	if varLastday ~= varToday  and (varLastday+1) ~= varToday then
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, x570023_var_md_daycount[1], x570023_var_md_daycount[2],x570023_var_md_daycount[3] );

	return varDaycount;

	

end




function x570023_SetDayCount(varMap, varPlayer)

	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, x570023_var_md_date[1], x570023_var_md_date[2], x570023_var_md_date[3])

	if varLastday ~= varToday  and (varLastday+1) ~= varToday then
		SetPlayerGameData(varMap, varPlayer, x570023_var_md_date[1], x570023_var_md_date[2], x570023_var_md_date[3], varToday)
		SetPlayerGameData(varMap, varPlayer, x570023_var_md_daycount[1], x570023_var_md_daycount[2], x570023_var_md_daycount[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, x570023_var_md_daycount[1], x570023_var_md_daycount[2], x570023_var_md_daycount[3])
		SetPlayerGameData(varMap, varPlayer, x570023_var_md_daycount[1], x570023_var_md_daycount[2], x570023_var_md_daycount[3], varDaycount+1)
	end
	
	
	
end
