
x580000_var_FileId = 580000
x580000_var_QuestName = "领取奖品"


x580000_var_MaxOnceAwardNum = 5

x580000_var_ItemBonus =	{
							{zhiye=-1,varId=11000213,varNum=10},
							{zhiye=-1,varId=11010003,varNum=10},
							{zhiye=-1,varId=12010006,varNum=5},
							{zhiye=0, varId=12020001,varNum=5},
							{zhiye=0, varId=10010060,varNum=1},
							{zhiye=1, varId=12020002,varNum=5},
							{zhiye=1, varId=10020060,varNum=1},
							{zhiye=2, varId=12020003,varNum=5},
							{zhiye=2, varId=10030060,varNum=1},
							{zhiye=3, varId=12020004,varNum=5},
							{zhiye=3, varId=10040060,varNum=1},
							{zhiye=4, varId=12020005,varNum=5},
							{zhiye=4, varId=10050060,varNum=1},
							{zhiye=5, varId=12020006,varNum=5},
							{zhiye=5, varId=10060060,varNum=1},
							{zhiye=-1,varId=12030202,varNum=1},
							{zhiye=-1,varId=12030203,varNum=1}
						}


function x580000_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	return 0
	
end




function x580000_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	

	x580000_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

end

function x580000_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

	SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, varIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )
	local varStr = format("%s \n  %s",title,text)

	StartTalkTask(varMap)
	TalkAppendString(varMap,varStr)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x580000_var_FileId, -1);

end


function x580000_AddAward( varMap, varPlayer,itemNum,varIndex, dbIndex )

	StartItemTask( varMap )

	local	zhiye = GetZhiye(varMap, varPlayer)

	local IsHaveItem = 0
	for varI,itm in x580000_var_ItemBonus do
		if itm.zhiye == -1 then
			IsHaveItem = 1
			ItemAppend( varMap, itm.varId, itm.varNum*itemNum )	
		elseif itm.zhiye == zhiye then 
			IsHaveItem = 1
			ItemAppend( varMap, itm.varId, itm.varNum*itemNum )	
		end
	end

	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		if IsHaveItem == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer) 
		end
	else
		
		local varLogFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" 
		local varLogMsg = format(varLogFmtMsg,GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,dbIndex,varIndex,0,GetServerIndex(),GetWorldID(varMap,varPlayer))
		WriteLog(16,varLogMsg)
		return
	end

	local varExp = GetLevel(varMap, varPlayer) * 2000*itemNum
	AddExp( varMap, varPlayer,varExp )
	AddMoney( varMap, varPlayer, 1, 2000*itemNum,101 ) 
	AddMoney( varMap, varPlayer, 3, 1000*itemNum,101 )	

	
	StartTalkTask(varMap)
	
	TalkAppendString(varMap,"恭喜你，你获得超级无敌大礼包一个！")
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)

	
	local varLogFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" 
	local varLogMsg = format(varLogFmtMsg,GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,dbIndex,varIndex,1,GetServerIndex(),GetWorldID(varMap,varPlayer))
	WriteLog(16,varLogMsg)

end






function x580000_ProcAccept( varMap, varPlayer )
end

function x580000_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x580000_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end




function x580000_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x580000_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x580000_CheckSubmit( varMap, varPlayer )
end



function x580000_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x580000_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


