









x301026_var_QuestId = 117




function 		x301026_ProcGpCreate(varMap,varGpType,varX,varY)
	
	local varBoxId = ItemBoxEnterScene(varX,varY,34,varMap,0,13010260)
	
	
	
end










function	 x301026_ProcGpOpen(varMap,varPlayer,varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x301026_var_QuestId)
	if IsHaveQuest(varMap,varPlayer, x301026_var_QuestId) > 0 then
			if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == 0 then
				if GetItemCount(varMap,varPlayer,13010026) < 1 then
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




function	 x301026_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	StartItemTask(varMap)                                                    
	ItemAppend( varMap,13010026, 1 )             
	local varRet = StopItemTask(varMap,varPlayer)                                 
	if varRet > 0 then                                                  
		StartTalkTask(varMap)
		TalkAppendString(varMap,format("得到炮弹   %d/1", GetItemCount(varMap,varPlayer,13010026)+1))
	        StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		DeliverItemListSendToPlayer(varMap,varPlayer) 
		return 1 
	else                                                             
		StartTalkTask(varMap)                                      
		TalkAppendString(varMap,"物品栏已满！")                    
		StopTalkTask(varMap)                                        
		DeliverTalkTips(varMap,varPlayer) 
		return 0
	end   
 
	
end





function	x301026_ProcGpProcOver(varMap,varPlayer,varTalknpc)

end




function	x301026_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

end
