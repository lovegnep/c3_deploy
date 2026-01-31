

x256014_var_FileId = 256014
x256014_var_ask ={"回到威海港","确定"}
x256014_var_answer ={"\t生死有命，灾祸常生，所以，你也不必太过沮丧。\n\t你要离开这里，返回威海港吗？"}

function x256014_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		local varLevel =GetLevel(varMap, varPlayer)
		if which == 0 then
		
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x256014_var_FileId, x256014_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x256014_var_answer[1])
			TalkAppendButton(varMap, x256014_var_FileId, x256014_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            
            
            if varLevel >=60 then
            	if IsQuestHaveDone(varMap, varPlayer, 1522) > 0 then
            		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,15) == 0 then
							return
					end
            		NewWorld( varMap, varPlayer, 15, 111 + random( 0, 5), 111 + random( 0, 5), 256014)
            	else 
            		StartTalkTask(varMap)
            		TalkAppendString(varMap,"\t很抱歉，你没有开通#g威海港的传送#w，我不能将你送到那里。")
            		StopTalkTask()
            		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
            	end
            end
		end

	
	
end








function x256014_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		local varLevel =GetLevel(varMap, varPlayer)
		if varLevel >=60 then
			TalkAppendButton(varMap, x256014_var_FileId, x256014_var_ask[1],0,1)
		end
end








