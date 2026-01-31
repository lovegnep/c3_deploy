

x301202_var_GatherPointTypeId = 152 
x301202_var_ItemId = 10030010 



function 	x301202_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301202_var_GatherPointTypeId, varMap, 0, x301202_var_ItemId)
end




function	 x301202_ProcGpOpen(varMap,varPlayer,varTalknpc)

if GetItemCount(varMap,varPlayer,10030010) == 0 then
	if GetZhiye( varMap, varPlayer)==2 then
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





function	 x301202_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	StartItemTask(varMap)                                                    
		ItemAppendBind( varMap,10030010, 1 )             
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





function	x301202_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


