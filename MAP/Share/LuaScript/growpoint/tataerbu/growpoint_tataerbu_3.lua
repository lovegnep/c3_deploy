









x301027_var_QuestId = 117




function 		x301027_ProcGpCreate(varMap,varGpType,varX,varY)
	
	local varBoxId = ItemBoxEnterScene(varX,varY,35,varMap,0,13010270)
	
	
	
end










function	 x301027_ProcGpOpen(varMap,varPlayer,varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x301027_var_QuestId)
	if IsHaveQuest(varMap,varPlayer, x301027_var_QuestId) > 0 then
			if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == 0 then
				if GetItemCount(varMap,varPlayer,13010026) == 1 then
						return 0
				end
		  else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"您无法这样做")                    
					StopTalkTask(varMap)                                        
					DeliverTalkTips(varMap,varPlayer)
					return 1 
			end
	else
		StartTalkTask(varMap)                                      
		TalkAppendString(varMap,"您没有这个任务")                    
		StopTalkTask(varMap)                                        
		DeliverTalkTips(varMap,varPlayer) 
		return 1
	end

end




function	 x301027_ProcGpRecycle(varMap,varPlayer,varTalknpc)
		StartTalkTask(varMap)
		TalkAppendString(varMap,"发射火炮 1/1")  
	  StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)

		return 0
 
	
end





function	x301027_ProcGpProcOver(varMap,varPlayer,varTalknpc)

end




function	x301027_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

end
