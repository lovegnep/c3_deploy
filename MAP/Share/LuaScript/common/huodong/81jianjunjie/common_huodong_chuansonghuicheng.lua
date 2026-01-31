

x302545_var_FileId = 302545
x302545_var_ask ={"前往大都","确定"}
x302545_var_answer ={"\t我可以将您送回大都，你要前往大都吗？"}


function x302545_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	

		local varLevel =GetLevel(varMap, varPlayer)
		if which == 0 then
				StartTalkTask(varMap)
				TalkAppendButton(varMap, x302545_var_FileId, x302545_var_ask[1],0,1)
		  	StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x302545_var_answer[1])
			TalkAppendButton(varMap, x302545_var_FileId, x302545_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
		
				if IsInChariot(varMap, varPlayer) > 0 then
					StartTalkTask(varMap)
					TalkAppendString(varMap,"抱歉，乘坐战车状态不能进行传送。")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					return 0
				end 
			
			
				if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,0) == 0 then
					
					return
				end
		
				NewWorld( varMap, varPlayer, 0, 254 + random( -2,2 ), 233 + random( -2, 2), 302545)
		end
end








function x302545_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		--if GetCountryParam(varMap,0,CD_COUNTRY_DIZHONGHAI_POINT) <POINT_KADIZI_TRANS or IsQuestHaveDone(varMap, varPlayer, 1605) <= 0 then
				TalkAppendButton(varMap, x302545_var_FileId, x302545_var_ask[1],18,1)
		--end	
	
		
		
end








