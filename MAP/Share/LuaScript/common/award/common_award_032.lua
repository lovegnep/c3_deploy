
x580031_var_FileId = 580031
x580031_var_QuestName = "开启扩展仓库"


x580031_var_MaxOnceAwardNum = 5

x580031_var_ItemBonus =	{
							{zhiye=-1,varId=12030302,varNum=1}
						}


function x580031_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	return 0
	
end




function x580031_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	
	
	

	x580031_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

end

function x580031_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

	SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, varIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )
	local varStr = format("%s \n  %s",title,text)

	StartTalkTask(varMap)
	TalkAppendString(varMap,varStr)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x580031_var_FileId, -1);

end


function x580031_AddAward( varMap, varPlayer,itemNum,varIndex, dbIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )
	local storesize = GetBankSize(varMap,varPlayer)
	if storesize == 36 then
		ExpandBankSize(varMap,varPlayer,36)
		if storesize == 72 then
			
			StartTalkTask(varMap)
			local DoneMSG = "恭喜您，您顺利开启了扩展仓库！"
			TalkAppendString(varMap,DoneMSG)
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		
			
			local varLogFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" 
			local varLogMsg = format(varLogFmtMsg,GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,dbIndex,varIndex,1,GetServerIndex(),GetWorldID(varMap,varPlayer))
			WriteLog(16,varLogMsg)
		else
			
			local varLogFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" 
			local varLogMsg = format(varLogFmtMsg,GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,dbIndex,varIndex,0,GetServerIndex(),GetWorldID(varMap,varPlayer))
			WriteLog(16,varLogMsg)
			return
		end
	elseif storesize > 36 then

		StartTalkTask(varMap)
		TalkAppendString(varMap,"您已经开启了扩展仓库，无法获得本次开启扩展仓库的奖励！")

		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		
		
			local varLogFmtMsg         = "%u,%d,%s,%d,%d,%d,%d,%d,%d,%d" 
			local varLogMsg = format(varLogFmtMsg,GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),varMap,dbIndex,varIndex,0,GetServerIndex(),GetWorldID(varMap,varPlayer))
			WriteLog(16,varLogMsg)
			
		return
		
	end

end






function x580031_ProcAccept( varMap, varPlayer )
end

function x580031_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x580031_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end




function x580031_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x580031_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x580031_CheckSubmit( varMap, varPlayer )
end



function x580031_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x580031_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


