



x700014_var_FileId 					= 700014

x700014_var_LevelMin					= 1
x700014_var_LevelMax					= 100
x700014_var_DayCountUntil				= 1

x700014_var_ItemId					= 11990101
x700014_var_NeedItemCount				= 1	

x700014_var_QuestName				= "【队伍】定鼎天下"
x700014_var_EnterInfo					= "\t真不简单，我记得前一个在我这里看过天机的人是一百多年前一个叫做赵普的人，听说他后来做了宰相。\n\t这传国玉玺你现在不能带走，待天机显示的真龙天子出现之时，也正是此宝再现人间之日。"






function x700014_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x700014_var_LevelMin then
       return
    end

    if varLevel > x700014_var_LevelMax then
		 return
    end
	
	TalkAppendButton(varMap, x700014_var_FileId, x700014_var_QuestName,5,1);
	
end




function x700014_DispatchEnterInfo( varMap, varPlayer, varTalknpc )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x700014_var_QuestName)
		TalkAppendString(varMap,x700014_var_EnterInfo)
		

		


	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x700014_var_FileId, -1);
end





function x700014_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end




function x700014_ProcAccept( varMap, varPlayer )

	x700014_ProcRequestSubmit(varMap, varPlayer);
end









function x700014_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	if nFlag== nil then
		return
	end

	x700014_DispatchEnterInfo( varMap, varPlayer, varTalknpc )
	
end


function x700014_ProcRequestSubmit(varMap, varPlayer)

	local iRet = x700014_CheckRequest(varMap, varPlayer)

	if iRet>0 then
		x700014_ProcApproveRequest(varMap, varPlayer)
	end
end

function x700014_CheckRequest(varMap, varPlayer)

	if( x700014_var_DayCountUntil > 0 ) then
		
		if x700014_GetDayCount(varMap, varPlayer) >= x700014_var_DayCountUntil then

			local varStr = format("此任务次数每天不能超过%d次",x700014_var_DayCountUntil)

			StartTalkTask(varMap);
				TalkAppendString(varMap, varStr);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return 0;
		end
	end

	local ItemCnt = GetItemCount( varMap, varPlayer, x700014_var_ItemId )

	if ItemCnt<x700014_var_NeedItemCount then
		local varStr = format("所需任务道具不足",x700014_var_NeedItemCount)

		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();

		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end

	return 1;
	
end

function x700014_ProcApproveRequest(varMap, varPlayer)

	
	local iRet = DelItem(varMap, varPlayer,x700014_var_ItemId,x700014_var_NeedItemCount)

	if iRet>0 then
		x700014_GetBonus(varMap, varPlayer)
		x700014_SetDayCount(varMap, varPlayer);
	end
		
	
	
end


function x700014_GetBonus(varMap, varPlayer)
	local varLevel = GetLevel(varMap, varPlayer)
	local varExpBonus = varLevel*8000;
    if varExpBonus > 0 then
		AddExp(varMap, varPlayer, varExpBonus);
		
		local varStr = format("你获得%d点的经验奖励",varExpBonus)
  		Msg2Player(varMap,varPlayer,varStr,4,2)
		
	end
end





function x700014_GetDayCount(varMap, varPlayer)



	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HESHIBI_INTER_DATE[1], MD_HESHIBI_INTER_DATE[2],MD_HESHIBI_INTER_DATE[3] );
	
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_HESHIBI_INTER_DAYCOUNT[1], MD_HESHIBI_INTER_DAYCOUNT[2],MD_HESHIBI_INTER_DAYCOUNT[3] );

	return varDaycount;

	

end




function x700014_SetDayCount(varMap, varPlayer)

	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_HESHIBI_INTER_DATE[1], MD_HESHIBI_INTER_DATE[2], MD_HESHIBI_INTER_DATE[3])

	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_HESHIBI_INTER_DATE[1], MD_HESHIBI_INTER_DATE[2], MD_HESHIBI_INTER_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_HESHIBI_INTER_DAYCOUNT[1], MD_HESHIBI_INTER_DAYCOUNT[2], MD_HESHIBI_INTER_DAYCOUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_HESHIBI_INTER_DAYCOUNT[1], MD_HESHIBI_INTER_DAYCOUNT[2], MD_HESHIBI_INTER_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_HESHIBI_INTER_DAYCOUNT[1], MD_HESHIBI_INTER_DAYCOUNT[2], MD_HESHIBI_INTER_DAYCOUNT[3], varDaycount+1)
	end
	
	
	
end
