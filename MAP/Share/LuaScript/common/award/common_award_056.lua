

x580055_var_FileId = 580055
x580055_var_QuestName = "领取晋级钻石麒麟大礼包"


x580055_var_MaxOnceAwardNum = 1
x580055_var_ItemBonus =	{
						}



function x580055_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	return 0
	
end




function x580055_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	

	x580055_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

end

function x580055_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

	SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, varIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )
	local varStr = format("%s \n  %s",title,text)

	StartTalkTask(varMap)
	TalkAppendString(varMap,varStr)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x580055_var_FileId, -1);

end


function x580055_AddAward( varMap, varPlayer,itemNum,varIndex, dbIndex )

	StartItemTask( varMap )

	local	zhiye = GetZhiye(varMap, varPlayer)

	local IsHaveItem = 0
	for varI,itm in x580055_var_ItemBonus do
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

	AddMoney( varMap, varPlayer, 3, 5000000*itemNum,101 ) 

	
	StartTalkTask(varMap)
	local DoneMSG = format("恭喜您，您获得了金卡%d两！",5000000*itemNum/1000)	
	TalkAppendString(varMap,DoneMSG)
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)

	
	local varLogFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" 
	local varLogMsg = format(varLogFmtMsg,GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,dbIndex,varIndex,1,GetServerIndex(),GetWorldID(varMap,varPlayer))
	WriteLog(16,varLogMsg)

end






function x580055_ProcAccept( varMap, varPlayer )
end

function x580055_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x580055_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end




function x580055_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x580055_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x580055_CheckSubmit( varMap, varPlayer )
end



function x580055_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x580055_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


