--DECLARE_QUEST_INFO_START--

x311105_var_FileId = 311105
x311105_var_Name = "【国家】龙魂数量查询"


--DECLARE_QUEST_INFO_STOP--

function x311105_ProcEnumEvent(varMap, varPlayer, varTalknpc, varIndex)

	TalkAppendButton(varMap, x311105_var_FileId, x311105_var_Name, 3, 0)
end

function x311105_ProcEventEntry(varMap , varPlayer , varTalknpc , varScripId , varIndex)
	local nWorldId = GetWorldIdEx()
	if GetToplistCount(nWorldId, WORLDCUP_TOPLIST_A) <= 0 then
		Msg2Player(varMap, varPlayer, "【国家】争夺龙魂任务尚未达到开放条件", 8, 2)
		Msg2Player(varMap, varPlayer, "【国家】争夺龙魂任务尚未达到开放条件", 8, 3)
		return
	end
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y【国家】龙魂数量查询")
		local loulan1 = GetCountryParam(varMap, 0, CD_LASTDATE_BANZHUAN_NUM)
		local tianshan1 = GetCountryParam(varMap, 1, CD_LASTDATE_BANZHUAN_NUM)
		local kunlun1 = GetCountryParam(varMap, 2, CD_LASTDATE_BANZHUAN_NUM)
		local dunhuang1 = GetCountryParam(varMap, 3, CD_LASTDATE_BANZHUAN_NUM)
		local loulan = GetCountryParam(varMap, 0, CD_CURDATE_BANZHUAN_NUM)
		local tianshan = GetCountryParam(varMap, 1, CD_CURDATE_BANZHUAN_NUM)
		local kunlun = GetCountryParam(varMap, 2, CD_CURDATE_BANZHUAN_NUM)
		local dunhuang = GetCountryParam(varMap, 3, CD_CURDATE_BANZHUAN_NUM)
		TalkAppendString(varMap,format("#Y昨日龙魂数量#W：\n楼兰龙魂数量：%d\n天山龙魂数量：%d\n昆仑龙魂数量：%d\n敦煌龙魂数量：%d",loulan1,tianshan1,kunlun1,dunhuang1))
		TalkAppendString(varMap,format("#Y今日龙魂数量#W：\n楼兰龙魂数量：%d\n天山龙魂数量：%d\n昆仑龙魂数量：%d\n敦煌龙魂数量：%d",loulan,tianshan,kunlun,dunhuang))
		TalkAppendString(varMap,"#G小提示：#W昨日龙魂数量最少的国家今日将受到长生天的庇佑，不能再被抢夺，昨日龙魂数量最多的国家今日在01：00-24：00中的任意时间可以被抢夺，其余国家在12：00-24：00中的任意时间中可以被抢夺。\n  当日龙魂数量不高于100的国家将不能再被抢夺。")
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x311105_var_FileId, -1, 1)	
end

function x311105_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)

end




function x311105_ProcQuestAttach(varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)

end

