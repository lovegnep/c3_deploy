

x310328_var_FileId = 310328
x310328_var_ask ={"离开天上人间·麒麟","确定"}
x310328_var_answer ={"\t在天上人间·麒麟里玩得尽兴么？如果你感到有些疲劳，我可以将你送出天上人间·麒麟，别忘记下周继续来这里寻找无尽的欢乐。\n\t你现在要离开么？"}
x310328_var_HongBuff		= 7536
x310328_var_LanBuff		= 7537
function x310328_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		local varLevel =GetLevel(varMap, varPlayer)
		if which == 0 then
		
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x310328_var_FileId, x310328_var_ask[1],0,1)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x310328_var_answer[1])
			TalkAppendButton(varMap, x310328_var_FileId, x310328_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			
            
            
           if IsHaveSpecificImpact( varMap, varPlayer, x310328_var_HongBuff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, x310328_var_LanBuff) == 1 then
           		StartTalkTask(varMap)
				TalkAppendString(varMap,"变身状态无法传送。")
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc)
           else
          	if IsHaveSpecificImpact( varMap, varPlayer, 7717) == 1 then
							CancelSpecificImpact( varMap, varPlayer, 7717)	
						end
           	NewWorld( varMap, varPlayer, 36, 127 + random( 0, 5), 66 + random( 0, 5), 310328)
           end
       
        end
	

	
	
end








function x310328_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		
			TalkAppendButton(varMap, x310328_var_FileId, x310328_var_ask[1],3,1)
end








