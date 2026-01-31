

x570019_var_FileId 					= 570019

x570019_var_LevelMin					= 60
x570019_var_LevelMax					= 160
x570019_var_DayCountUntil				= 1

x570019_var_ItemId					= 11990114
x570019_var_NeedItemCount				= 1	
x570019_var_BonusItemId				= 11990113
x570019_CSP_CURRENT_STEP			= 22
x570019_G_STEP						= 6
x570019_var_md_date					= MD_EQUIP_EXCHANGE1_DAY
x570019_var_md_daycount				= MD_EQUIP_EXCHANGE1_DAYCOUNT

x570019_var_QuestName				= "第六轮兑换[钻石原石]"
x570019_var_EnterInfo					= "\t1个#g次生钻石矿#w兑换1个#g钻石原石#w，\n\t#r每轮仅能兑换一次，请慎重选择兑换物品！"


function x570019_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x570019_var_LevelMin then
       return
    end

    if varLevel > x570019_var_LevelMax then
		 return
    end

	local nCurrentGameStep = GetFubenData_Param(varMap, x570019_CSP_CURRENT_STEP )
	if x570019_IsExchanged(varMap, varPlayer) == 0  and x570019_G_STEP <= nCurrentGameStep then
		TalkAppendButton(varMap, x570019_var_FileId, x570019_var_QuestName,3,1);
	end
	
end
function x570019_IsExchanged(varMap, varPlayer)

	if( x570019_var_DayCountUntil > 0 ) then
		
		if x570019_GetDayCount(varMap, varPlayer) >= x570019_var_DayCountUntil then

			return 1;
		end
	end
	return 0
	
end



function x570019_DispatchEnterInfo( varMap, varPlayer, varTalknpc )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x570019_var_QuestName)
		TalkAppendString(varMap,x570019_var_EnterInfo)
        AddQuestItemBonus(varMap, x570019_var_BonusItemId,1)
		

		


	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570019_var_FileId, -1);
end



function x570019_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x570019_ProcAccept( varMap, varPlayer )

	x570019_ProcRequestSubmit(varMap, varPlayer);
end





function x570019_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	if nFlag== nil then
		return
	end

	x570019_DispatchEnterInfo( varMap, varPlayer, varTalknpc )
	
end


function x570019_ProcRequestSubmit(varMap, varPlayer)

	local iRet = x570019_CheckRequest(varMap, varPlayer)

	if iRet>0 then
		x570019_ProcApproveRequest(varMap, varPlayer)
	end
end

function x570019_CheckRequest(varMap, varPlayer)

	if( x570019_var_DayCountUntil > 0 ) then
		
		if x570019_GetDayCount(varMap, varPlayer) >= x570019_var_DayCountUntil then

			local varStr = format("本轮仅能兑换%d次",x570019_var_DayCountUntil)

			StartTalkTask(varMap);
				TalkAppendString(varMap, varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return 0;
		end
	end


	










	local ItemCnt = GetItemCount( varMap, varPlayer, x570019_var_ItemId )

	if ItemCnt<x570019_var_NeedItemCount then
		local varStr = format("所需任务道具不足%d个",x570019_var_NeedItemCount)

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

function x570019_ProcApproveRequest(varMap, varPlayer)


		local iRet = DelItem(varMap, varPlayer,x570019_var_ItemId,x570019_var_NeedItemCount)

	
		if iRet > 0 then
			if x570019_GetBonus(varMap, varPlayer)>0 then
			x570019_SetDayCount(varMap, varPlayer);
		end
	end
		
	
	
end


function x570019_GetBonus(varMap, varPlayer)
	StartItemTask(varMap)
	ItemAppendBind( varMap, x570019_var_BonusItemId, 1 )
	
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



function x570019_GetDayCount(varMap, varPlayer)



	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, x570019_var_md_date[1], x570019_var_md_date[2],x570019_var_md_date[3] );
	
	if varLastday ~= varToday  and (varLastday+1) ~= varToday then
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, x570019_var_md_daycount[1], x570019_var_md_daycount[2],x570019_var_md_daycount[3] );

	return varDaycount;

	

end




function x570019_SetDayCount(varMap, varPlayer)

	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, x570019_var_md_date[1], x570019_var_md_date[2], x570019_var_md_date[3])

	if varLastday ~= varToday  and (varLastday+1) ~= varToday then
		SetPlayerGameData(varMap, varPlayer, x570019_var_md_date[1], x570019_var_md_date[2], x570019_var_md_date[3], varToday)
		SetPlayerGameData(varMap, varPlayer, x570019_var_md_daycount[1], x570019_var_md_daycount[2], x570019_var_md_daycount[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, x570019_var_md_daycount[1], x570019_var_md_daycount[2], x570019_var_md_daycount[3])
		SetPlayerGameData(varMap, varPlayer, x570019_var_md_daycount[1], x570019_var_md_daycount[2], x570019_var_md_daycount[3], varDaycount+1)
	end
	
	
	
end
