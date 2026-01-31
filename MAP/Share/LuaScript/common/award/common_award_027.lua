

x580026_var_FileId = 580026
x580026_var_QuestName = "领取公测新手卡礼包"


x580026_var_MaxOnceAwardNum = 1

x580026_var_ItemBonus =	{	{zhiye=-1,varId=12030311,varNum=1},
												{zhiye=-1,varId=12030337,varNum=1},
												{zhiye=-1,varId=12030338,varNum=1},
												{zhiye=-1,varId=12030339,varNum=1},
												{zhiye=-1,varId=12030340,varNum=1},
												{zhiye=-1,varId=12030341,varNum=1},
												{zhiye=-1,varId=12030342,varNum=1},
												{zhiye=-1,varId=12030343,varNum=1}
						}


function x580026_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	return 0
	
end




function x580026_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	

	x580026_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

end

function x580026_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

	SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, varIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )
	local varStr = format("%s \n  %s",title,text)

	StartTalkTask(varMap)
	TalkAppendString(varMap,varStr)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x580026_var_FileId, -1);

end


function x580026_AddAward( varMap, varPlayer,itemNum,varIndex, dbIndex )

	StartItemTask( varMap )

	local	zhiye = GetZhiye(varMap, varPlayer)

	local IsHaveItem = 0
	for varI,itm in x580026_var_ItemBonus do
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










	
	local varLogFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" 
	local varLogMsg = format(varLogFmtMsg,GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,dbIndex,varIndex,1,GetServerIndex(),GetWorldID(varMap,varPlayer))
	WriteLog(16,varLogMsg)

end






function x580026_ProcAccept( varMap, varPlayer )
end

function x580026_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x580026_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end




function x580026_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x580026_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x580026_CheckSubmit( varMap, varPlayer )
end



function x580026_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x580026_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


