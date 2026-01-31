

x256012_var_FileId = 256012
x256012_var_ask ={"回到边塞","确定"}
x256012_var_answer ={"\t生死有命，灾祸常生，所以，你也不必太过沮丧。\n\t你要离开这里，返回边塞吗？"}

function x256012_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		local varCountry = GetCurCountry(varMap, varPlayer)
		local varLevel =GetLevel(varMap, varPlayer)
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x256012_var_FileId, x256012_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
			
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x256012_var_answer[1])
			TalkAppendButton(varMap, x256012_var_FileId, x256012_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
		
			local selfcountry =GetCurCountry( varMap, varPlayer)
           
           
            if varLevel	>=	30 then
            	
            if IsQuestHaveDone(varMap, varPlayer, 1502) > 0 then
            	
            	if varCountry == 0 then 
            		NewWorld( varMap, varPlayer, selfcountry * 100 + 51, 298 + random( 0, 5), 193 + random( 0, 5), 256012)
            	elseif 	varCountry == 1 then 
            		NewWorld( varMap, varPlayer, selfcountry * 100 + 51, 298 + random( 0, 5), 193 + random( 0, 5), 256012)
              elseif 	varCountry == 2 then 
            		NewWorld( varMap, varPlayer, selfcountry * 100 + 51, 298 + random( 0, 5), 193 + random( 0, 5), 256012)
            	elseif 	varCountry == 3 then 
            		NewWorld( varMap, varPlayer, selfcountry * 100 + 51, 298 + random( 0, 5), 193 + random( 0, 5), 256012)
            	end
           	else
           			StartTalkTask(varMap)
            		TalkAppendString(varMap,"\t很抱歉，你没有开通#g边塞玉门关传送#w，我不能将你送到那里。")
            		StopTalkTask()	
            		DeliverTalkMenu(varMap, varPlayer, varTalknpc)

            end
            end
		end

	
	
end








function x256012_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			local varLevel =GetLevel(varMap, varPlayer)
			if varLevel	>=	30 then
			TalkAppendButton(varMap, x256012_var_FileId, x256012_var_ask[1],0,1)
			end
end








