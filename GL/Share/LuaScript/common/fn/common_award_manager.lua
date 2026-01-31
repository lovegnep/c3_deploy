
x561103_var_FileId = 561103
x561103_var_QuestName = "领取奖品"


x561103_var_MaxOnceAwardNum = 5


function x561103_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	return 0
	
end





function x561103_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	

	if  x561103_HaveBagSpace(varMap, varPlayer,varIndex,varTalknpc) == 1 then
		
		x561103_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)
	end

end

function x561103_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex)

	local dbIndex = GetPlayerRuntimeData( varMap, varPlayer, varIndex+x561103_var_MaxOnceAwardNum )
	SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, dbIndex )

	local varId = GetPlayerRuntimeData( varMap, varPlayer, varIndex )

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varId )
	local varStr = format("%s \n  %s",title,text)
	
	local varlevel = GetLevel(varMap, varPlayer)
	
	if varScript == 581628 and varlevel < 70 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"领取当前礼包需要等级达到70级，你当前等级未到70级，请70级以后再来领取！")
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
	elseif varScript == 581629 and varlevel < 80 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"领取当前礼包需要等级达到80级，你当前等级未到80级，请80级以后再来领取！")
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
	elseif varScript == 581630 and varlevel < 90 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"领取当前礼包需要等级达到90级，你当前等级未到90级，请90级以后再来领取！")
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	
	elseif varScript == 581631 and varlevel < 95 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"领取当前礼包需要等级达到95级，你当前等级未到95级，请95级以后再来领取！")
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	
	elseif varScript == 581632 and varlevel < 70 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"领取当前礼包需要等级达到70级，你当前等级未到70级，请70级以后再来领取！")
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
	elseif varScript == 581633 and varlevel < 90 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"领取当前礼包需要等级达到90级，你当前等级未到90级，请90级以后再来领取！")
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
	else

		StartTalkTask(varMap)
		TalkAppendString(varMap,varStr)
		StopTalkTask(varMap)

		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x561103_var_FileId, -1);
	end

end


function x561103_HaveBagSpace(varMap, varPlayer,varIndex,varTalknpc)

	local varId = GetPlayerRuntimeData( varMap, varPlayer, varIndex )
	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varId )

	local BagNum = BagNeedSpace

	if BagNeedSpace > 0 then
		local itemNum = GetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_AWARE_NUM1+varIndex-RD_HUMAN_AWARE_INDEX1 ) 
		if MinSpliceNum == 0 then
			MinSpliceNum = 1
		end

		itemNum = itemNum * BagNeedSpace	
		BagNum = ceil(itemNum / MinSpliceNum )
		if BagNum < BagNeedSpace then
			BagNum = BagNeedSpace
		end		
	else 
		BagNum = BagNeedSpace
	end

	
	if GetBagSpace( varMap, varPlayer ) <	BagNum then

		StartTalkTask(varMap)
		local varStr = format("此次领奖背包中最少需要预留%d个空格，你当前背包空间不够。",BagNum)
		TalkAppendString(varMap,varStr)
		StopTalkTask(varMap)

		if varTalknpc == -1 then
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,varStr,8,2)
		else
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		end

		return 0
	end

	return 1

end



function x561103_ProcAddAwardManager( varMap, varPlayer, result,itemNum,varIndex,dbIndex )
	
	if result == 0 then
		
		StartTalkTask(varMap)
		TalkAppendString(varMap,"领奖失败，没有查询到奖项记录或奖项己过期，请稍后重试")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 
	end

	if result == 2 then
		
		StartTalkTask(varMap)
		TalkAppendString(varMap,"帐号领奖模块暂时冻结，稍后重试")
		StopTalkTask(varMap)
		return 
	end

	
	local runData = -1
	for tmpIndex=0, x561103_var_MaxOnceAwardNum-1 do

		local logicIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_AWARE_INDEX1+tmpIndex )
		local tmpDbIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_AWARE_DB_INDEX1+tmpIndex ) 
		
		if varIndex == logicIndex and tmpDbIndex == dbIndex then
			runData = RD_HUMAN_AWARE_INDEX1 + tmpIndex  	
		end
	end

	if  runData ~=-1 and x561103_HaveBagSpace(varMap, varPlayer,runData,-1) ~= 1 then
		return
	end

	local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )
	LuaCallNoclosure( varScript, "AddAward", varMap, varPlayer ,itemNum,varIndex,dbIndex ) 

	SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, -1 )

	for varI=0, x561103_var_MaxOnceAwardNum-1 do
		SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_AWARE_INDEX1+varI, -1 )
		SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_AWARE_DB_INDEX1+varI, -1 )
		SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_AWARE_NUM1+varI, -1 )
	end

end




function x561103_ProcAccept( varMap, varPlayer )

	local tabIndex = -1	
	local dbIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX )
		
	
	for varI=0, x561103_var_MaxOnceAwardNum-1 do

		if dbIndex ==  GetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_AWARE_DB_INDEX1+varI ) then
			tabIndex = RD_HUMAN_AWARE_DB_INDEX1+varI - x561103_var_MaxOnceAwardNum  
		end
	end

	if tabIndex ~= -1 and x561103_HaveBagSpace(varMap, varPlayer,tabIndex,-1) ~= 1 then
		return		
	end

	local awardType = 0
	
	
	if GetPlayerRuntimeData( varMap, varPlayer, tabIndex )>=1000 then
	
		awardType = 1
		
	else 
	
		awardType = 0
		
	end

	
	GetAward( varMap, varPlayer, dbIndex, awardType )

end


function x561103_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x561103_ProcQuestAccept( varMap, varPlayer, varTalknpc )
end




function x561103_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x561103_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x561103_CheckSubmit( varMap, varPlayer )
end



function x561103_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x561103_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


