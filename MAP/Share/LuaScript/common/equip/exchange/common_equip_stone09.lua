



x570018_var_FileId 					= 570018

x570018_var_LevelMin					= 40
x570018_var_LevelMax					= 100
x570018_var_DayCountUntil				= 1

x570018_var_ItemId					= 11030501
x570018_var_NeedItemCount				= 1	
x570018_var_BonusItemId				= 11990112
x570018_CSP_CURRENT_STEP			= 22
x570018_G_STEP						= 6
x570018_var_md_date					= MD_EQUIP_EXCHANGE1_DAY
x570018_var_md_daycount				= MD_EQUIP_EXCHANGE1_DAYCOUNT

x570018_var_QuestName				= "第六轮兑换[国传钻石碎片]"
x570018_var_EnterInfo					= "\t1个#g溶火石#w兑换1个#g国传钻石碎片#w，\n\t#r每轮仅能兑换一次，请慎重选择兑换物品！"






function x570018_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x570018_var_LevelMin then
       return
    end

    if varLevel > x570018_var_LevelMax then
		 return
    end

	local nCurrentGameStep = GetFubenData_Param(varMap, x570018_CSP_CURRENT_STEP )
	
	if nCurrentGameStep==x570018_G_STEP then
		TalkAppendButton(varMap, x570018_var_FileId, x570018_var_QuestName,3,1);
	end
	
end




function x570018_DispatchEnterInfo( varMap, varPlayer, varTalknpc )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x570018_var_QuestName)
		TalkAppendString(varMap,x570018_var_EnterInfo)
        AddQuestItemBonus(varMap, x570018_var_BonusItemId,1)
		

		


	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570018_var_FileId, -1);
end





function x570018_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x570018_ProcAccept( varMap, varPlayer )

	x570018_ProcRequestSubmit(varMap, varPlayer);
end









function x570018_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	if nFlag== nil then
		return
	end

	x570018_DispatchEnterInfo( varMap, varPlayer, varTalknpc )
	
end


function x570018_ProcRequestSubmit(varMap, varPlayer)

	local iRet = x570018_CheckRequest(varMap, varPlayer)

	if iRet>0 then
		x570018_ProcApproveRequest(varMap, varPlayer)
	end
end

function x570018_CheckRequest(varMap, varPlayer)

	if( x570018_var_DayCountUntil > 0 ) then
		
		if x570018_GetDayCount(varMap, varPlayer) >= x570018_var_DayCountUntil then

			local varStr = format("本轮仅能兑换%d次",x570018_var_DayCountUntil)

			StartTalkTask(varMap);
				TalkAppendString(varMap, varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return 0;
		end
	end

	local nCurrentGameStep = GetFubenData_Param(varMap, x570018_CSP_CURRENT_STEP )
	
	if nCurrentGameStep~=x570018_G_STEP then
		local varStr = format("当前波数不是第%d波",x570018_G_STEP)

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	local ItemCnt = GetItemCount( varMap, varPlayer, x570018_var_ItemId )

	if ItemCnt<x570018_var_NeedItemCount then
		local varStr = format("所需任务道具不足%d个",x570018_var_NeedItemCount)

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();

		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	return 1;
	
end

function x570018_ProcApproveRequest(varMap, varPlayer)

	if x570018_GetBonus(varMap, varPlayer)>0 then
		if DelItem(varMap, varPlayer,x570018_var_ItemId,x570018_var_NeedItemCount) ~= 1 then return 0 end

	
		
		x570018_SetDayCount(varMap, varPlayer);
	end
		
	
	
end


function x570018_GetBonus(varMap, varPlayer)
	StartItemTask(varMap)
	ItemAppendBind( varMap, x570018_var_BonusItemId, 1 )
	
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





function x570018_GetDayCount(varMap, varPlayer)



	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, x570018_var_md_date[1], x570018_var_md_date[2],x570018_var_md_date[3] );
	
	if varLastday ~= varToday  and (varLastday+1) ~= varToday then
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, x570018_var_md_daycount[1], x570018_var_md_daycount[2],x570018_var_md_daycount[3] );

	return varDaycount;

	

end




function x570018_SetDayCount(varMap, varPlayer)

	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, x570018_var_md_date[1], x570018_var_md_date[2], x570018_var_md_date[3])

	if varLastday ~= varToday  and (varLastday+1) ~= varToday then
		SetPlayerGameData(varMap, varPlayer, x570018_var_md_date[1], x570018_var_md_date[2], x570018_var_md_date[3], varToday)
		SetPlayerGameData(varMap, varPlayer, x570018_var_md_daycount[1], x570018_var_md_daycount[2], x570018_var_md_daycount[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, x570018_var_md_daycount[1], x570018_var_md_daycount[2], x570018_var_md_daycount[3])
		SetPlayerGameData(varMap, varPlayer, x570018_var_md_daycount[1], x570018_var_md_daycount[2], x570018_var_md_daycount[3], varDaycount+1)
	end
	
	
	
end
