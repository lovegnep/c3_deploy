
--DECLARE_QUEST_INFO_START--
x310190_var_FileId = 310190
x310190_var_QuestName1="查看入围终极挑战赛名单"
--DECLARE_QUEST_INFO_STOP--

function x310190_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
local minute =  GetMinOfDay()
		if GetWeek() ~= 0 or minute <16*60+1 then
			return
		end  

		TalkAppendButton(varMap, x310190_var_FileId, x310190_var_QuestName1,13,1)
end

function x310190_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)
	
 		local varCount=0
 		local varStr=""

    StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x310190_var_QuestName1)
			for varI=1, WULONGCIDIAN_STEPIN_COUNT do
			
				varCount = varCount+1
				local 	mingdan = "#G\t"..WULONGCIDIAN_STEPIN_NAME[varI]
				varStr = varStr..mingdan;
				if varCount == 2 or varI == WULONGCIDIAN_STEPIN_COUNT then
					TalkAppendString(varMap,varStr)
					varCount = 0
					varStr =""
				end
			end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc,x310190_var_FileId, x310190_var_QuestName1)

end
