--DECLARE_QUEST_INFO_START--

x302514_var_FileId = 302514
x302514_var_Name = "【端午节有礼活动说明】"


--DECLARE_QUEST_INFO_STOP--

function x302514_ProcEnumEvent(varMap, varPlayer, varTalknpc, varIndex)
	local year, month, day = GetYearMonthDay();
		local day1 = GetDayOfYear()
		if year == 2012 and  day1 <= 176 then
			TalkAppendButton(varMap, x302514_var_FileId, x302514_var_Name, 13, 0)
		end
end

function x302514_ProcEventEntry(varMap , varPlayer , varTalknpc , varScripId , varIndex)
		local str ="\n#W活动时间：#R6月22日、6月23日和6月24日#W，#R20：00#W到#R21：00#W可在NPC领奖大使处参与本活动。"
		local str1 ="\n#G活动说明：#W\n\t在领奖大使领取#G端午快乐#W的buff后，将会在一小时内每隔10秒获得一份奖励，有机会获得烈焱碎片、掌门牌等稀有金币道具！"
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y【端午节有礼活动说明】")
	  	TalkAppendString(varMap,str)
		TalkAppendString(varMap,str1)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x302514_var_FileId, -1, 1)	
end

function x302514_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)

end




function x302514_ProcQuestAttach(varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)

end

