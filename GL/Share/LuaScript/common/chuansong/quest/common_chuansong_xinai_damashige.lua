

x300281_var_FileId = 300281
x300281_var_ask ={"回到领地大马士革","确定"}
x300281_var_answer ={"\t你要离开这里，返回领地大马士革吗？"}

function x300281_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		local varLevel =GetLevel(varMap, varPlayer)
		if which == 0 then
		
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x300281_var_FileId, x300281_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x300281_var_answer[1])
			TalkAppendButton(varMap, x300281_var_FileId, x300281_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            
            
            if varLevel>= 40 then
            	if IsQuestHaveDone(varMap, varPlayer, 1512) > 0 then
            		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,0) == 0 then
							return
					end
           			NewWorld( varMap, varPlayer, 23, 115 + random( 0, 5), 82 + random( 0, 5), 300281)
            	else 
            		StartTalkTask(varMap)
            		TalkAppendString(varMap,"\t很抱歉，你没有开通#G领地大马士革的传送#W，我不能将你送到那里。")
            		StopTalkTask()
            		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
            	end
            end
		end

	
	
end








function x300281_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		local varLevel =GetLevel(varMap, varPlayer)
		if varLevel>= 40 then
			TalkAppendButton(varMap, x300281_var_FileId, x300281_var_ask[1],0,1)
		end
end








