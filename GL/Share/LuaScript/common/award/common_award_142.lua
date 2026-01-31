
x580141_var_FileId = 580141
x580141_var_QuestName = "领取称号补偿"


x580141_var_MaxOnceAwardNum = 1


function x580141_ProcDoEnum( varMap, varPlayer, varTalknpc, varQuest )
	return 0
	
end




function x580141_ProcDefaultEvent( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	

	x580141_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

end

function x580141_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

	SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, varIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )
	local varStr = format("%s \n  %s",title,text)

	StartTalkTask(varMap)
	TalkAppendString(varMap,varStr)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x580141_var_FileId, -1);

end


function x580141_AddAward( varMap, varPlayer,itemNum,varIndex, dbIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )
     local varLevel = GetLevel(varMap, varPlayer)
     local varExp = varLevel * 240000
     AddExp(varMap, varPlayer, varExp)  
		AwardTitle(varMap, varPlayer, 44)
		
		StartTalkTask(varMap)
		local sex = GetSex(varMap,varPlayer)
		local TitleName = GetTitleNameByTitleID(44, sex)
        local level1 = GetLevel(varMap, varPlayer)
        local varExp1 = level1 * 240000
		local DoneMSG = format("恭喜您，您获得了%s称号",TitleName)
		local MSG     = format("您获得了%d点经验",varExp1)
		TalkAppendString(varMap,DoneMSG)
		TalkAppendString(varMap,MSG)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		
		
		local varLogFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" 
		local varLogMsg = format(varLogFmtMsg,GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,dbIndex,varIndex,1,GetServerIndex(),GetWorldID(varMap,varPlayer))
		WriteLog(16,varLogMsg)


end






function x580141_ProcDoAccept( varMap, varPlayer )
end

function x580141_CheckCanAccept( varMap, varPlayer, varTalknpc )
	return 1
end

function x580141_CheckAndAccept( varMap, varPlayer, varTalknpc )
end




function x580141_ProcAbandon( varMap, varPlayer, varQuest )
end



function x580141_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x580141_CheckSubmit( varMap, varPlayer )
end



function x580141_ProcSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x580141_ProcKillObject( varMap, varPlayer, varObjData, varObj, varQuest )
end


