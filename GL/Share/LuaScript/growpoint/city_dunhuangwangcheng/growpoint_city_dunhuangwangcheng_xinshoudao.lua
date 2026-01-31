

x301200_var_GatherPointTypeId = 150 
x301200_var_ItemId = 10010010



function 	x301200_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301200_var_GatherPointTypeId, varMap, 0, x301200_var_ItemId)
end




function	 x301200_ProcGpOpen(varMap,varPlayer,varTalknpc)

if GetItemCount(varMap,varPlayer,10010010) == 0 then
	if GetZhiye( varMap, varPlayer)==0 then
		     return 0  	                 
	else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"与你的职业不符") 
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer) 
			return 1
	end
else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"你已经有一把武器了") 
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer) 
			return 1
end






end





function	 x301200_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	StartItemTask(varMap)                                                    
		ItemAppendBind( varMap,10010010, 1 ) 
		local varRet = StopItemTask(varMap,varPlayer)                                 
	  if varRet > 0 then                                                  
	    DeliverItemListSendToPlayer(varMap,varPlayer) 
	  else                                                             
		  StartTalkTask(varMap)                                      
		  TalkAppendString(varMap,"物品栏已满，请整理下再来！")                    
		  StopTalkTask(varMap)                                        
		  DeliverTalkTips(varMap,varPlayer)                      
	   end    
end





function	x301200_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


