

x580058_var_FileId = 580058
x580058_var_QuestName = "领取奖品"


x580058_var_MaxOnceAwardNum = 5

x580058_var_ItemBonus =	{
						}


function x580058_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	return 0
	
end




function x580058_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	

	x580058_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

end

function x580058_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

	SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, varIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )
	local varStr = format("%s \n  %s",title,text)

	StartTalkTask(varMap)
	TalkAppendString(varMap,varStr)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x580058_var_FileId, -1);

end


function x580058_AddAward( varMap, varPlayer,itemNum,varIndex, dbIndex )

	if GetGuildID(varMap, varPlayer) < 0 then
		
		StartTalkTask(varMap)
		TalkAppendString(varMap,"对不起，你目前没有帮会, 领取失败！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		
		local varLogFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" 
		local varLogMsg = format(varLogFmtMsg,GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,dbIndex,varIndex,0,GetServerIndex(),GetWorldID(varMap,varPlayer))
		WriteLog(16,varLogMsg)
		return
	end
	
	local nValue = 1*itemNum
	AddGuildUserPoint(varMap, varPlayer, nValue)	
	
	
	StartTalkTask(varMap)
	
	TalkAppendString(varMap,format("恭喜你，你获得了%d点帮贡", nValue))
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)

	
	local varLogFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" 
	local varLogMsg = format(varLogFmtMsg,GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,dbIndex,varIndex,1,GetServerIndex(),GetWorldID(varMap,varPlayer))
	WriteLog(16,varLogMsg)

end






function x580058_ProcAccept( varMap, varPlayer )
end

function x580058_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x580058_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end




function x580058_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x580058_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x580058_CheckSubmit( varMap, varPlayer )
end



function x580058_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x580058_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


