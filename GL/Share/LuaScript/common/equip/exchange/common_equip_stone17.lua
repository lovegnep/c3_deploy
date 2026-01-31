



x570027_var_FileId 					= 570027

x570027_var_LevelMin					= 40
x570027_var_LevelMax					= 100
x570027_var_DayCountUntil				= 1

x570027_var_ItemId					= 11990114
x570027_var_NeedItemCount				= 1	
x570027_var_BonusItemId				= 11990112
x570027_CSP_CURRENT_STEP			= 22
x570027_G_STEP						= 9
x570027_var_md_date					= MD_EQUIP_EXCHANGE5_DAY
x570027_var_md_daycount				= MD_EQUIP_EXCHANGE5_DAYCOUNT

x570027_var_QuestName				= "第九轮兑换[国传钻石碎片]"
x570027_var_EnterInfo					= "\t1个#g国传钻石碎片?#w兑换1个#g国传钻石碎片#w，\n\t#r每轮仅能兑换一次，请慎重选择兑换物品！"






function x570027_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x570027_var_LevelMin then
       return
    end

    if varLevel > x570027_var_LevelMax then
		 return
    end

	local nCurrentGameStep = GetFubenData_Param(varMap, x570027_CSP_CURRENT_STEP )
	
	if nCurrentGameStep==x570027_G_STEP then
		TalkAppendButton(varMap, x570027_var_FileId, x570027_var_QuestName,3,1);
	end
	
end




function x570027_DispatchEnterInfo( varMap, varPlayer, varTalknpc )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x570027_var_QuestName)
		TalkAppendString(varMap,x570027_var_EnterInfo)
        AddQuestItemBonus(varMap, x570027_var_BonusItemId,1)
		

		


	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570027_var_FileId, -1);
end





function x570027_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x570027_ProcAccept( varMap, varPlayer )

	x570027_ProcRequestSubmit(varMap, varPlayer);
end









function x570027_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	if nFlag== nil then
		return
	end

	x570027_DispatchEnterInfo( varMap, varPlayer, varTalknpc )
	
end


function x570027_ProcRequestSubmit(varMap, varPlayer)

	local iRet = x570027_CheckRequest(varMap, varPlayer)

	if iRet>0 then
		x570027_ProcApproveRequest(varMap, varPlayer)
	end
end

function x570027_CheckRequest(varMap, varPlayer)

	if( x570027_var_DayCountUntil > 0 ) then
		
		if x570027_GetDayCount(varMap, varPlayer) >= x570027_var_DayCountUntil then

			local varStr = format("本轮仅能兑换%d次",x570027_var_DayCountUntil)

			StartTalkTask(varMap);
				TalkAppendString(varMap, varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return 0;
		end
	end

	local nCurrentGameStep = GetFubenData_Param(varMap, x570027_CSP_CURRENT_STEP )
	
	if nCurrentGameStep~=x570027_G_STEP then
		local varStr = format("当前波数不是第%d波",x570027_G_STEP)

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	local ItemCnt = GetItemCount( varMap, varPlayer, x570027_var_ItemId )

	if ItemCnt<x570027_var_NeedItemCount then
		local varStr = format("所需任务道具不足%d个",x570027_var_NeedItemCount)

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();

		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	return 1;
	
end

function x570027_ProcApproveRequest(varMap, varPlayer)

	if x570027_GetBonus(varMap, varPlayer)>0 then
		if DelItem(varMap, varPlayer,x570027_var_ItemId,x570027_var_NeedItemCount) ~= 1 then return 0 end


		
		x570027_SetDayCount(varMap, varPlayer);
	end
		
	
	
end


function x570027_GetBonus(varMap, varPlayer)
	StartItemTask(varMap)
	ItemAppendBind( varMap, x570027_var_BonusItemId, 1 )
	
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





function x570027_GetDayCount(varMap, varPlayer)



	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, x570027_var_md_date[1], x570027_var_md_date[2],x570027_var_md_date[3] );
	
	if varLastday ~= varToday  and (varLastday+1) ~= varToday then
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, x570027_var_md_daycount[1], x570027_var_md_daycount[2],x570027_var_md_daycount[3] );

	return varDaycount;

	

end




function x570027_SetDayCount(varMap, varPlayer)

	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, x570027_var_md_date[1], x570027_var_md_date[2], x570027_var_md_date[3])

	if varLastday ~= varToday  and (varLastday+1) ~= varToday then
		SetPlayerGameData(varMap, varPlayer, x570027_var_md_date[1], x570027_var_md_date[2], x570027_var_md_date[3], varToday)
		SetPlayerGameData(varMap, varPlayer, x570027_var_md_daycount[1], x570027_var_md_daycount[2], x570027_var_md_daycount[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, x570027_var_md_daycount[1], x570027_var_md_daycount[2], x570027_var_md_daycount[3])
		SetPlayerGameData(varMap, varPlayer, x570027_var_md_daycount[1], x570027_var_md_daycount[2], x570027_var_md_daycount[3], varDaycount+1)
	end
	
	
	
end
