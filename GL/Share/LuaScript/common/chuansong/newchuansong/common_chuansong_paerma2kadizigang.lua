

x550598_var_FileId = 550598
x550598_var_ask ={"前往卡迪兹港","确定"}
x550598_var_answer ={"\t卡迪兹港是我们进入地中海的第一个港口，你要前往卡迪兹港吗？"}


function x550598_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	

		local varLevel =GetLevel(varMap, varPlayer)
		if which == 0 then
				StartTalkTask(varMap)
				TalkAppendButton(varMap, x550598_var_FileId, x550598_var_ask[1],0,1)
		  	StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x550598_var_answer[1])
			TalkAppendButton(varMap, x550598_var_FileId, x550598_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
		
				if IsInChariot(varMap, varPlayer) > 0 then
					StartTalkTask(varMap)
					TalkAppendString(varMap,"抱歉，乘坐战车状态不能进入天上人间·梦聊。")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					return 0
				end 
			
			
				if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,0) == 0 then
					
					return
				end
		
				NewWorld( varMap, varPlayer, 569, 205 + random( -1,1 ), 358 + random( -1, 1), 550598)
		end
end








function x550598_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		if GetCountryParam(varMap,0,CD_COUNTRY_DIZHONGHAI_POINT) <POINT_KADIZI_TRANS then
				TalkAppendButton(varMap, x550598_var_FileId, x550598_var_ask[1],18,1)
		end	
	
		
		
end








