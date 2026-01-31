

--DECLARE_QUEST_INFO_START--
x300503_var_FileId = 300503
x300503_var_QuestName="机械法训练"
x300503_var_QuestId = 5600
--DECLARE_QUEST_INFO_STOP--






function x300503_ProcEventEntry(varMap, varPlayer, varTalknpc)	
		local winorlose ="\n本次训练失败"
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x300503_var_QuestId)
			SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,GetQuestParam(varMap,varPlayer,varQuestIdx,0)-1)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,2) < 100 then
			SetQuestByIndex(varMap,varPlayer,varQuestIdx,2,GetQuestParam(varMap,varPlayer,varQuestIdx,2)+5)
		end
		if GetQuestParam(varMap,varPlayer,varQuestIdx,3) < 100 then
			SetQuestByIndex(varMap,varPlayer,varQuestIdx,3,GetQuestParam(varMap,varPlayer,varQuestIdx,3)+5)
		end
		if GetQuestParam(varMap,varPlayer,varQuestIdx,1) > random (1,100) then
				SetQuestByIndex(varMap,varPlayer,varQuestIdx,4,GetQuestParam(varMap,varPlayer,varQuestIdx,4)+5)
				winorlose ="\n训练完成得到#G5#W分"
		end                                                                                      
			SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,GetQuestParam(varMap,varPlayer,varQuestIdx,1)-10)
					if GetQuestParam(varMap,varPlayer,varQuestIdx,0) > 0 then
											
      								
      								
      	    					
		 									
		 									
		 									
		 									
      								
      								
            					
            					
            					StartTalkTask(varMap)
            					TalkAppendString(varMap,"机械法训练如果顺利的话，这只藏獒会得到5分；食物法训练如果顺利的话，这只藏獒会得到4到6分；模仿法训练如果顺利的话，这只藏獒会得到3到7分；如果重复用一种方法训练的话，顺利的几率会降低。选择一种方法训练藏獒吧。") 
		 									TalkAppendString(varMap,winorlose) 
		 									TalkAppendString(varMap,format("\n你还能训练这只藏獒  #g%d#w  次",GetQuestParam(varMap,varPlayer,varQuestIdx,0)))
		 									TalkAppendString(varMap,format("\n你现在训练的藏獒得分为  #G%d#W",GetQuestParam(varMap,varPlayer,varQuestIdx,4))) 
		 									TalkAppendButton(varMap, x300503_var_FileId, "机械法训练藏獒")
		 									StopTalkTask()
		 									DeliverTalkMenu(varMap, varPlayer, varTalknpc)
          elseif GetQuestParam(varMap,varPlayer,varQuestIdx,0) == 0 then
          			StartTalkTask(varMap)
          			TalkAppendString(varMap,format("你的藏獒得分为#G%d#W,去把这只藏獒给孙相马带过去吧。",GetQuestParam(varMap,varPlayer,varQuestIdx,4))) 
          			StopTalkTask()
            		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
         end

	
end
function x300503_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


    if IsHaveQuest(varMap,varPlayer, x300503_var_QuestId) > 0 then
        
        local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x300503_var_QuestId)
        if GetQuestParam(varMap,varPlayer,varQuestIdx,0) > 0 then
            TalkAppendButton(varMap, x300503_var_FileId, "机械法训练藏獒")
        end
    end
	
end

