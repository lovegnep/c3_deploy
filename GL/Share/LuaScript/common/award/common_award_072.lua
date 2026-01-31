
x580071_var_FileId = 580071
x580071_var_QuestName = "领取经验包"


x580071_var_MaxOnceAwardNum = 5
x580071_var_5070Exp = 352800
x580071_var_7090Exp = 554400


function x580071_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	return 0
	
end




function x580071_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	

	x580071_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

end

function x580071_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

	SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, varIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )
	local varStr = format("%s \n  %s",title,text)

	StartTalkTask(varMap)
	TalkAppendString(varMap,varStr)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x580071_var_FileId, -1);

end


function x580071_AddAward( varMap, varPlayer,itemNum,varIndex, dbIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )
	local nLevel = GetLevel(varMap,varPlayer)
	local nExp = 0

	if nLevel >= 60 and nLevel < 70 then
		nExp = nLevel*x580071_var_5070Exp*itemNum
		AddExpAutoLevelup(varMap,varPlayer,nExp)
			
		StartTalkTask(varMap)
		local DoneMSG = format("恭喜您，您获得了%d点经验值",nExp)
		TalkAppendString(varMap,DoneMSG)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		
		
		local varLogFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" 
		local varLogMsg = format(varLogFmtMsg,GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,dbIndex,varIndex,1,GetServerIndex(),GetWorldID(varMap,varPlayer))
		WriteLog(16,varLogMsg)

	elseif nLevel >= 70 and nLevel < 85 then
		nExp = nLevel*x580071_var_7090Exp*itemNum
		AddExpAutoLevelup(varMap,varPlayer,nExp)
		
		StartTalkTask(varMap)
		local DoneMSG = format("恭喜您，您获得了%d点经验值",nExp)
		TalkAppendString(varMap,DoneMSG)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	else
		StartTalkTask(varMap)
		local DoneMSG = "对不起，您的等级已经超过了奖励范围，无法获得奖励！"
		TalkAppendString(varMap,DoneMSG)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

end






function x580071_ProcAccept( varMap, varPlayer )
end

function x580071_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x580071_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end




function x580071_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x580071_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x580071_CheckSubmit( varMap, varPlayer )
end



function x580071_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x580071_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


