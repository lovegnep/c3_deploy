

x580049_var_FileId = 580049
x580049_var_QuestName = "领取极品武器卡礼包"


x580049_var_MaxOnceAwardNum = 1

x580049_var_ItemBonus =	{	{zhiye=-1,varId=12030388,varNum=1},
												{zhiye=-1,varId=12030389,varNum=1},
												{zhiye=-1,varId=12030390,varNum=1},
												{zhiye=-1,varId=12030391,varNum=1},
												{zhiye=-1,varId=12030392,varNum=1},
												{zhiye=-1,varId=12030393,varNum=1},
												{zhiye=-1,varId=12030394,varNum=1},
												{zhiye=-1,varId=12030395,varNum=1}
						}


function x580049_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	return 0
	
end




function x580049_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	

	x580049_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

end

function x580049_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

	SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, varIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )
	local varStr = format("%s \n  %s",title,text)

	StartTalkTask(varMap)
	TalkAppendString(varMap,varStr)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x580049_var_FileId, -1);

end


function x580049_AddAward( varMap, varPlayer,itemNum,varIndex, dbIndex )

	StartItemTask( varMap )

	local	zhiye = GetZhiye(varMap, varPlayer)

	local IsHaveItem = 0
	for varI,itm in x580049_var_ItemBonus do
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






function x580049_ProcAccept( varMap, varPlayer )
end

function x580049_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x580049_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end




function x580049_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x580049_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x580049_CheckSubmit( varMap, varPlayer )
end



function x580049_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x580049_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


