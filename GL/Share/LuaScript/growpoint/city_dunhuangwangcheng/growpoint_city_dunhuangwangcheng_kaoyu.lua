

x301312_var_GatherPointTypeId = 178 
x301312_var_ItemId = 13030089 



function 	x301312_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301312_var_GatherPointTypeId, varMap, 0, x301312_var_ItemId)
end




function	 x301312_ProcGpOpen(varMap,varPlayer,varTalknpc)
if IsHaveQuest(varMap,varPlayer, 1608) > 0 then
if GetItemCount(varMap,varPlayer,13030089) == 0 then
		if GetItemCount(varMap,varPlayer,13030087) == 1 then
	
		  return 0
		end
else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"鱼已经烤好了！") 
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer) 
			return 1
end
end







end





function	 x301312_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	StartItemTask(varMap)                                                    
		ItemAppend( varMap,13030089, 1 )  
		TalkAppendString(varMap,"您获得了物品：烤鱼！")           
		local varRet = StopItemTask(varMap,varPlayer)                                 
	  if varRet > 0 then                                                  
	    DeliverItemListSendToPlayer(varMap,varPlayer) 
	    if DelItem(varMap, varPlayer, 13030087, 1) ~= 1 then return 0 end
	  else                                                             
		  StartTalkTask(varMap)                                      
		  TalkAppendString(varMap,"物品栏已满，请整理下再来！")                    
		  StopTalkTask(varMap)                                        
		  DeliverTalkTips(varMap,varPlayer)                      
	   end           	               
end





function	x301312_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


