
x561101_var_FileId = 561101
x561101_var_QuestName = "领取奖励补偿"


x561101_var_MaxOnceAwardNum = 5	


x561101_var_MaxAwardCount = 2000

x561101_var_GetAwardScript = 561103


function x561101_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x561101_var_FileId,x561101_var_QuestName,3,-1)
	
end




function x561101_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	

	if varIndex == -1 then
		
		for varI=0, x561101_var_MaxOnceAwardNum-1 do
			SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_AWARE_INDEX1+varI, -1 )
			SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_AWARE_DB_INDEX1+varI, -1 )
			SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_AWARE_NUM1+varI, -1 )
		end

		
		QueryAwardInfo( varMap, varPlayer )
		
		SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_NPCID,varTalknpc  )

	else
		LuaCallNoclosure( x561101_var_GetAwardScript, "ProcEventEntry", varMap, varPlayer ,varTalknpc,varState,varIndex) 
	end

end


function x561101_ProcShowAwardInfo( varMap, varPlayer, awardNum, awardType )

	if GetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_NPCID ) ~= -1 then
			
		if awardNum < 1 then
			
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y奖品领取")
			TalkAppendString(varMap,"\t很抱歉，没有查询到您的奖励记录！请稍后再来！")
			StopTalkTask(varMap)
			DeliverTalkMenu( varMap,varPlayer,GetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_NPCID ) )
			return 
		end

		StartTalkTask(varMap)

        local bShow = 0
		for varI=0, x561101_var_MaxOnceAwardNum-1 do
			
			local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_AWARE_INDEX1+varI )

			if varIndex >= 0 and varIndex < x561101_var_MaxAwardCount then
			
				if awardType == 1 then
					
					local haveSpace = LuaCallNoclosure( x561101_var_GetAwardScript, "HaveBagSpace", varMap, varPlayer ,RD_HUMAN_AWARE_INDEX1+varI, RD_HUMAN_CURR_AWARD_NPCID ) 
					if haveSpace == 1 then
						local dbIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_AWARE_INDEX1+varI+x561101_var_MaxOnceAwardNum )
						SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, dbIndex )
	
						LuaCallNoclosure( x561101_var_GetAwardScript, "ProcAccept", varMap, varPlayer )
					end
					
					return 
				end
				
				local title,text,varScript,BagNeedSpace,MinSpliceNum = GetAwardInfo( varMap, varPlayer,varIndex )
				local varItemNum = GetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_AWARE_NUM1+varI )

				if varItemNum > 1 then
					title = format("%s * %d",title,varItemNum)
				end
				if bShow == 0 then
    				TalkAppendString(varMap,"#Y奖品领取")
    				TalkAppendString(varMap,"\t您可以领取以下奖品：")
    				bShow = 1
				end
				TalkAppendButton(varMap,x561101_var_FileId,title,0,RD_HUMAN_AWARE_INDEX1+varI)
			end
		end

		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,GetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_NPCID ) )
	end

end


function x561101_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	
	
	

end






function x561101_ProcAccept( varMap, varPlayer )
end



function x561101_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x561101_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x561101_CheckSubmit( varMap, varPlayer )
end



function x561101_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x561101_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x561101_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x561101_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
