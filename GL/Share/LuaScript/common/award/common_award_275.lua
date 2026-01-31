

x580275_var_FileId = 580275
x580275_var_QuestName = "天传·情深似海对戒礼包"


x580275_var_MaxOnceAwardNum = 1
x580275_var_ItemBonus =	{	{zhiye=-1,varId=12030559,varNum=1}	
						}



function x580275_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	return 0
	
end




function x580275_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	

	x580275_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

end

function x580275_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

	SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, varIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )
	local varStr = format("%s \n  %s",title,text)

	StartTalkTask(varMap)
	TalkAppendString(varMap,varStr)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x580275_var_FileId, -1);

end


function x580275_AddAward( varMap, varPlayer,itemNum,varIndex, dbIndex )

	StartItemTask( varMap )

	local	zhiye = GetZhiye(varMap, varPlayer)

	local IsHaveItem = 0
	for varI,itm in x580275_var_ItemBonus do
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



	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )

	
	StartTalkTask(varMap)
	local DoneMSG =  format("恭喜您，您获得了"..title..itemNum.."个")
	TalkAppendString(varMap,DoneMSG)
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)

	
	local varLogFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" 
	local varLogMsg = format(varLogFmtMsg,GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,dbIndex,varIndex,1,GetServerIndex(),GetWorldID(varMap,varPlayer))
	WriteLog(16,varLogMsg)

end






function x580275_ProcAccept( varMap, varPlayer )
end

function x580275_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x580275_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end




function x580275_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x580275_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x580275_CheckSubmit( varMap, varPlayer )
end



function x580275_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x580275_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


