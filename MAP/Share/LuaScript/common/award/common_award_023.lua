

x580022_var_FileId = 580022
x580022_var_QuestName = "领取暑假回归礼包"


x580022_var_MaxOnceAwardNum = 1

x580022_var_ItemBonus =	{	}


function x580022_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	return 0
	
end




function x580022_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	

	x580022_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

end

function x580022_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

	SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, varIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )
	local varStr = format("%s \n  %s",title,text)

	StartTalkTask(varMap)
	TalkAppendString(varMap,varStr)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x580022_var_FileId, -1);

end


function x580022_AddAward( varMap, varPlayer,itemNum,varIndex, dbIndex )

	StartItemTask( varMap )

	local	nLevel = GetLevel(varMap, varPlayer)
	local nExp = nLevel * 180000 * itemNum
	local nMoney = nLevel * 1000 * itemNum
	
	AddExpAutoLevelup(varMap,varPlayer,nExp) 
	AddMoney(varMap,varPlayer,1,nMoney,101)	










	
	local varLogFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" 
	local varLogMsg = format(varLogFmtMsg,GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,dbIndex,varIndex,1,GetServerIndex(),GetWorldID(varMap,varPlayer))
	WriteLog(16,varLogMsg)

end






function x580022_ProcAccept( varMap, varPlayer )
end

function x580022_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x580022_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end




function x580022_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x580022_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x580022_CheckSubmit( varMap, varPlayer )
end



function x580022_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x580022_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


