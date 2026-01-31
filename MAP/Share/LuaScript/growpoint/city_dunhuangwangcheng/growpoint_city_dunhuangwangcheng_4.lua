

x301005_var_GatherPointTypeId = 6 
x301005_var_ItemId = 13020006 



function 	x301005_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301005_var_GatherPointTypeId, varMap, 0, x301005_var_ItemId)
end




function	 x301005_ProcGpOpen(varMap,varPlayer,varTalknpc)
	if IsHaveQuest(varMap,varPlayer, 2893) > 0 then
		if GetItemCount(varMap,varPlayer,x301005_var_ItemId) < 5 then
				return 0
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"你已经采够了芨芨草") 
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer) 
			return 1
		end
	else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"你没有接此任务") 
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer) 
			return 1
	end
end




function	 x301005_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	StartItemTask(varMap)                                                    
		ItemAppend( varMap,x301005_var_ItemId, 1 )             
	  local varRet = StopItemTask(varMap,varPlayer)                                 
	  if varRet > 0 then                                                  
	    DeliverItemListSendToPlayer(varMap,varPlayer) 
	    StartTalkTask(varMap)
			TalkAppendString(varMap,"得到一棵芨芨草") 
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer) 
		return 1
	  else                                                             
		  StartTalkTask(varMap)                                      
		  TalkAppendString(varMap,"物品栏已满，请整理下再来！")                    
		  StopTalkTask(varMap)                                        
		  DeliverTalkTips(varMap,varPlayer)                      
	   end           	   
end





function	x301005_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


