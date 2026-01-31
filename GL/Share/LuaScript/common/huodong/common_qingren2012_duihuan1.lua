

--DECLARE_QUEST_INFO_START--
x310844_var_FileId = 310844
x310844_var_QuestName = "【个人】等级奖励"
x310844_var_TargetLevel= 90
x310844_var_RequireLevel= 1
x310844_var_LevelExp = {10,45,140,325,630,1085,1720,2565,3650,5005,6660,8645,10990,13725,16880,20485,24570,29165,34300,68956,95810,120000,150579,187824,201192,222841,259924,302592,310990,1251143,1320651,1390160,1469597,1539105,1618543,1697980,1777418,1856856,3813009,4855871,5085377,5302804,5544390,5785976,6039640,6293305,6559050,6824794,13939491,11446321,11908062,12381955,12880149,19672605,16027280,16646985,17278842,17935000,27364242,28024350,34189707,41700232,50847380,61985378,94430849,105471995,117777061,131488420,200133111,203278075,247418457,301083868,366318707,445604125,903251606,1006824457,1122079362,1250317003,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379,1392981379}

--DECLARE_QUEST_INFO_STOP--


function x310844_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)	
	StartTalkTask( varMap)
	TalkAppendString( varMap, x310844_var_QuestName..format( "\n\t当第一名达到70级时，凡是等级达到%d级的玩家可以在我这提升等级到%d级。", x310844_var_RequireLevel, GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) )-3 ) )
	StopTalkTask()
	DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310844_var_FileId, -1)
end

function x310844_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) )>=70 then
	TalkAppendButton( varMap, x310844_var_FileId, x310844_var_QuestName, 3)
	end
end


function x310844_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    return 1
end

function x310844_ProcAccept( varMap, varPlayer)
	if GetLevel(varMap,varPlayer) < x310844_var_RequireLevel then
		Msg2Player( varMap, varPlayer, "您等级过低，无法领取奖励", 8, 3)
		return
	end

	if GetLevel(varMap,varPlayer) >= GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) )-3 then
		Msg2Player( varMap, varPlayer, "您等级过高，无法领取奖励", 8, 3)
		return
	end

	local b=GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) )-3
		AddExpAutoLevelup(varMap,varPlayer,0)
		AddExpAutoLevelup(varMap,varPlayer,0)
		AddExpAutoLevelup(varMap,varPlayer,0)
		AddExpAutoLevelup(varMap,varPlayer,0)
		AddExpAutoLevelup(varMap,varPlayer,0)
		AddExpAutoLevelup(varMap,varPlayer,0)
		AddExpAutoLevelup(varMap,varPlayer,0)
		AddExpAutoLevelup(varMap,varPlayer,0)
		AddExpAutoLevelup(varMap,varPlayer,0)
		AddExpAutoLevelup(varMap,varPlayer,0)
	for varI, item in x310844_var_LevelExp do
		AddExpAutoLevelup(varMap,varPlayer,0)
		local nLevel = GetLevel(varMap,varPlayer)
		if varI < nLevel then
			varFlag = 0
		else
			varFlag = 1
		end
		
		if varFlag == 1 then
			if nLevel < b then
				AddExpAutoLevelup(varMap,varPlayer,item*0.5)
			else
				break
			end
		end
	end	
	Msg2Player( varMap, varPlayer, "领取奖励成功", 8, 3)
end

function x310844_ProcQuestAbandon( varMap, varPlayer, varQuest )
end
function x310844_ProcContinue( varMap, varPlayer, varTalknpc )
end
function x310844_CheckSubmit( varMap, varPlayer )
end
function x310844_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end
function x310844_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end
function x310844_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end
function x310844_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end

