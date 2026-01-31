

x550597_var_FileId = 550597
x550597_var_ask ={"前往帕尔马港","确定"}
x550597_var_answer ={"\t帕尔马港是我们下一次远征的主要地方，你要前往帕尔马港吗？"}


function x550597_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	

		local varLevel =GetLevel(varMap, varPlayer)
		if which == 0 then
				StartTalkTask(varMap)
				TalkAppendButton(varMap, x550597_var_FileId, x550597_var_ask[1],0,1)
		  	StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x550597_var_answer[1])
			TalkAppendButton(varMap, x550597_var_FileId, x550597_var_ask[2],0,2)
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
		
				NewWorld( varMap, varPlayer, 567, 180 + random( -2,2 ), 375 + random( -2, 2), 550597)
		end
end








function x550597_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

		if GetCountryParam(varMap,0,CD_COUNTRY_DIZHONGHAI_POINT) <POINT_KADIZI_TRANS or IsQuestHaveDone(varMap, varPlayer, 1605) <= 0 then
				TalkAppendButton(varMap, x550597_var_FileId, x550597_var_ask[1],18,1)
		end	
	
		
		
end








