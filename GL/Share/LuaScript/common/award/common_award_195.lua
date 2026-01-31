

x580195_var_FileId = 580195
x580195_var_QuestName = "全福月饼"


x580195_var_MaxOnceAwardNum = 1
x580195_var_ItemBonus =	{	{zhiye=-1,varId=12030258,varNum=1}	
						}



function x580195_ProcDoEnum( varMap, varPlayer, varTalknpc, varQuest )
	return 0
	
end




function x580195_ProcDefaultEvent( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	

	x580195_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

end

function x580195_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

	SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, varIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )
	local varStr = format("%s \n  %s",title,text)

	StartTalkTask(varMap)
	TalkAppendString(varMap,varStr)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x580195_var_FileId, -1);

end


function x580195_AddAward( varMap, varPlayer,itemNum,varIndex, dbIndex )

	StartItemTask( varMap )

	local	zhiye = GetZhiye(varMap, varPlayer)

	local IsHaveItem = 0
	for varI,itm in x580195_var_ItemBonus do
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






function x580195_ProcDoAccept( varMap, varPlayer )
end

function x580195_CheckCanAccept( varMap, varPlayer, varTalknpc )
	return 1
end

function x580195_CheckAndAccept( varMap, varPlayer, varTalknpc )
end




function x580195_ProcAbandon( varMap, varPlayer, varQuest )
end



function x580195_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x580195_CheckSubmit( varMap, varPlayer )
end



function x580195_ProcSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x580195_ProcKillObject( varMap, varPlayer, varObjData, varObj, varQuest )
end


