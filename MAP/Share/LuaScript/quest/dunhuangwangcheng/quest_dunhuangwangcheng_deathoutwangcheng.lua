

x256011_var_FileId = 256011
x256011_var_ask ={"回到王国","确定"}
x256011_var_answer ={"\t生死有命，灾祸常生，所以，你也不必太过沮丧。\n\t你要离开这里，返回王国吗？"}

function x256011_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x256011_var_FileId, x256011_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x256011_var_answer[1])
			TalkAppendButton(varMap, x256011_var_FileId, x256011_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            
            
            if selfcountry == 0 then
            	NewWorld( varMap, varPlayer, 50, 254 + random( 0, 5), 115 + random( 0, 5), 256011)
            elseif selfcountry == 1 then
            	NewWorld( varMap, varPlayer, 150, 254 + random( 0, 5), 115 + random( 0, 5), 256011)
            elseif selfcountry == 2 then
            	NewWorld( varMap, varPlayer, 250, 254 + random( 0, 5), 115 + random( 0, 5), 256011)
           	elseif selfcountry == 3 then
            	NewWorld( varMap, varPlayer, 350, 254 + random( 0, 5), 115 + random( 0, 5), 256011)
            end
		end

	
	
end








function x256011_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x256011_var_FileId, x256011_var_ask[1],0,1)
end








