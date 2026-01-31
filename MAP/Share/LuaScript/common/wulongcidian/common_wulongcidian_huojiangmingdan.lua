
--DECLARE_QUEST_INFO_START--
x310191_var_FileId = 310191
x310191_var_QuestName1="查看获奖名单"
--DECLARE_QUEST_INFO_STOP--

function x310191_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
local minute =  GetMinOfDay()
		if GetWeek() ~= 0 or minute <17*60+1 then
			return
		end     

		TalkAppendButton(varMap, x310191_var_FileId, x310191_var_QuestName1,13,1)
end

function x310191_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)

  StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x310191_var_QuestName1)
		for varI=1, WULONGCIDIAN_AWARD_COUNT do
			if varI==1 then
			local first = "\t第一名：乌龙宗师-#G"..WULONGCIDIAN_AWARD_NAME[varI]
			TalkAppendString(varMap,first)
			elseif varI==2 then
			local second = "\t第二名：乌龙高手-#G"..WULONGCIDIAN_AWARD_NAME[varI]
			TalkAppendString(varMap,second)
			elseif varI==3 then
			local third = "\t第三名：乌龙强人-#G"..WULONGCIDIAN_AWARD_NAME[varI]
			TalkAppendString(varMap,third)
			end
		end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310191_var_FileId, x310191_var_QuestName1)

end
