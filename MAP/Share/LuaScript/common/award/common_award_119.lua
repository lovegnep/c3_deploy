
x580118_var_FileId = 580118
x580118_var_QuestName = "领取称号补偿"


x580118_var_MaxOnceAwardNum = 1


function x580118_ProcDoEnum( varMap, varPlayer, varTalknpc, varQuest )
	return 0
	
end




function x580118_ProcDefaultEvent( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	

	x580118_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

end

function x580118_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

	SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, varIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )
	local varStr = format("%s \n  %s",title,text)

	StartTalkTask(varMap)
	TalkAppendString(varMap,varStr)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x580118_var_FileId, -1);

end


function x580118_AddAward( varMap, varPlayer,itemNum,varIndex, dbIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )
     local varLevel = GetLevel(varMap, varPlayer)
     local varExp = varLevel * 240000
     AddExp(varMap, varPlayer, varExp)  
		AwardTitle(varMap, varPlayer, 37)
		
		StartTalkTask(varMap)
		local sex = GetSex(varMap,varPlayer)
		local TitleName = GetTitleNameByTitleID(37, sex)
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






function x580118_ProcDoAccept( varMap, varPlayer )
end

function x580118_CheckCanAccept( varMap, varPlayer, varTalknpc )
	return 1
end

function x580118_CheckAndAccept( varMap, varPlayer, varTalknpc )
end




function x580118_ProcAbandon( varMap, varPlayer, varQuest )
end



function x580118_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x580118_CheckSubmit( varMap, varPlayer )
end



function x580118_ProcSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x580118_ProcKillObject( varMap, varPlayer, varObjData, varObj, varQuest )
end


