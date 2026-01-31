

x580059_var_FileId = 580059
x580059_var_QuestName = "领取中游白金卡礼包"


x580059_var_MaxOnceAwardNum = 1

x580059_var_ItemBonus =	{	{zhiye=-1,varId=12030406,varNum=1},
												{zhiye=-1,varId=12030407,varNum=1},
												{zhiye=-1,varId=12030408,varNum=1},
												{zhiye=-1,varId=12030409,varNum=1},
												{zhiye=-1,varId=12030410,varNum=1},
												{zhiye=-1,varId=12030411,varNum=1},
												{zhiye=-1,varId=12030412,varNum=1},
												{zhiye=-1,varId=12030413,varNum=1}
						}


function x580059_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	return 0
	
end




function x580059_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	

	x580059_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

end

function x580059_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

	SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, varIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )
	local varStr = format("%s \n  %s",title,text)

	StartTalkTask(varMap)
	TalkAppendString(varMap,varStr)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x580059_var_FileId, -1);

end


function x580059_AddAward( varMap, varPlayer,itemNum,varIndex, dbIndex )

	StartItemTask( varMap )

	local	zhiye = GetZhiye(varMap, varPlayer)

	local IsHaveItem = 0
	for varI,itm in x580059_var_ItemBonus do
		if itm.zhiye == -1 then
			IsHaveItem = 1
			ItemAppendBind( varMap, itm.varId, itm.varNum*itemNum )	
		elseif itm.zhiye == zhiye then 
			IsHaveItem = 1
			ItemAppendBind( varMap, itm.varId, itm.varNum*itemNum )	
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










	
	local varLogFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" 
	local varLogMsg = format(varLogFmtMsg,GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,dbIndex,varIndex,1,GetServerIndex(),GetWorldID(varMap,varPlayer))
	WriteLog(16,varLogMsg)

end






function x580059_ProcAccept( varMap, varPlayer )
end

function x580059_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x580059_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end




function x580059_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x580059_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x580059_CheckSubmit( varMap, varPlayer )
end



function x580059_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x580059_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


