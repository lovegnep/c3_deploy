

x300279_var_FileId = 300279
x300279_var_ask ={"回到莫斯科公国","确定"}
x300279_var_answer ={"\t你要离开这里，返回莫斯科公国吗？"}

function x300279_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		local varLevel =GetLevel(varMap, varPlayer)
		if which == 0 then
		
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x300279_var_FileId, x300279_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x300279_var_answer[1])
			TalkAppendButton(varMap, x300279_var_FileId, x300279_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			local selfcountry =GetCurCountry( varMap, varPlayer)
            
            
            if varLevel>= 40 then
            	if IsQuestHaveDone(varMap, varPlayer, 1512) > 0 then
            		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,0) == 0 then
							return
					end
           			NewWorld( varMap, varPlayer, 17, 169 + random( 0, 5), 122 + random( 0, 5), 300279)
            	else 
            		StartTalkTask(varMap)
            		TalkAppendString(varMap,"\t很抱歉，你没有开通#G莫斯科公国的传送#W，我不能将你送到那里。")
            		StopTalkTask()
            		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
            	end
            end
		end

	
	
end








function x300279_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		local varLevel =GetLevel(varMap, varPlayer)
		if varLevel>= 40 then
			TalkAppendButton(varMap, x300279_var_FileId, x300279_var_ask[1],0,1)
		end
end








