
x300740_var_FileId_ = 300740
x300740_var_QuestName = "离开监狱"
x300740_var_QuestInfo = "想要离开监狱吗"


function x300740_ProcEnumEvent( varMap, varPlayer, varTalknpc )

	TalkAppendButton(varMap,x300740_var_FileId_,x300740_var_QuestName)
	
end




function x300740_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)	


	
		StartTalkTask(varMap);TalkAppendString(varMap,x300740_var_QuestInfo);StopTalkTask(varMap);
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, 300740, -1)
		

	
end




function x300740_ProcAcceptCheck( varMap, varPlayer )


	local IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer,PK_PUNISH_PRISON_TIME_BUF_ID )

	if IsHaveFlag > 0 then
		StartTalkTask(varMap);TalkAppendString(varMap,"时间没到，继续在监狱里享受生活吧");StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer)	
		Msg2Player(varMap,varPlayer,"时间没到，继续在监狱里享受生活吧",8,2)
		return
	end

	SetPKValue(varMap, varPlayer, 0)
	SetCurPKMode(varMap, varPlayer, 0, 1)		

	StartTalkTask(varMap);TalkAppendString(varMap,"出狱了，记得出去以后一定要低调呀");StopTalkTask(varMap);
	DeliverTalkTips(varMap,varPlayer)

	Msg2Player(varMap,varPlayer,"出狱了，记得出去以后一定要低调呀",8,2)
	SetPlayerMutexState( varMap, varPlayer,PLAYER_STATE_READYFUBEN,0 )
	SetPlayerMutexState( varMap,varPlayer ,PLAYER_STATE_PRISON ,0)

	if GetLevel(varMap, varPlayer) >= 10 then
		local PosX,PosY = 128,82
		if GetCurCountry( varMap, varPlayer ) == 0 then
			NewWorld( varMap, varPlayer ,50,PosX,PosY,300740)
		elseif GetCurCountry( varMap, varPlayer ) == 1 then
			NewWorld( varMap, varPlayer ,150,PosX,PosY,300740)
		elseif GetCurCountry( varMap, varPlayer ) == 2 then
			NewWorld( varMap, varPlayer ,250,PosX,PosY,300740)
		elseif GetCurCountry( varMap, varPlayer ) == 3 then
			NewWorld( varMap, varPlayer ,350,PosX,PosY,300740)
		end
	else
		local PosX,PosY = 76,62
		if GetCurCountry( varMap, varPlayer ) == 0 then
			NewWorld( varMap, varPlayer ,87,PosX,PosY,300740)
		elseif GetCurCountry( varMap, varPlayer ) == 1 then
			NewWorld( varMap, varPlayer ,187,PosX,PosY,300740)
		elseif GetCurCountry( varMap, varPlayer ) == 2 then
			NewWorld( varMap, varPlayer ,287,PosX,PosY,300740)
		elseif GetCurCountry( varMap, varPlayer ) == 3 then
			NewWorld( varMap, varPlayer ,387,PosX,PosY,300740)
		end		
	end

end




function x300740_ProcAccept( varMap, varPlayer )

end



function x300740_ProcQuestAbandon( varMap, varPlayer )
end



function x300740_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300740_CheckSubmit( varMap, varPlayer )
end



function x300740_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected )
end



function x300740_ProcQuestObjectKilled( varMap, varPlayer, varObjData )
end



function x300740_ProcAreaEntered( varMap, varPlayer, varArea )
end



function x300740_ProcQuestItemChanged( varMap, varPlayer, varItemData )
end
