

x301307_var_GatherPointTypeId = 172 
x301307_var_ItemId = {10011001,10021001,10031001,10041001,10051001,10061001} 


function 	x301307_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301307_var_GatherPointTypeId, varMap, 0, x301307_var_ItemId[1])
end




function	 x301307_ProcGpOpen(varMap,varPlayer,varTalknpc)
if IsHaveQuest(varMap,varPlayer, 3002) > 0 then
local zhiye =GetZhiye( varMap, varPlayer)+1
if GetItemCount(varMap,varPlayer,x301307_var_ItemId[zhiye]) == 0 then
	
		  return 0
	
else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"你已经获得了前辈的馈赠，别太贪心") 
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer) 
			return 1
end

else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"你没有此任务") 
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer) 
			return 1
end
end




function	 x301307_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	StartItemTask(varMap)  
	if GetZhiye( varMap, varPlayer) == 0   then                                               
		ItemAppend( varMap,10011001, 1 )
			StartTalkTask(varMap)                                      
		  TalkAppendString(varMap,"你获得了物品：#R家传刀")                    
		  StopTalkTask(varMap)                                        
		  DeliverTalkTips(varMap,varPlayer) 
	end  
	if  GetZhiye( varMap, varPlayer) ==1   then
		ItemAppend( varMap,10021001, 1 )
					StartTalkTask(varMap)                                      
		  TalkAppendString(varMap,"你获得了物品：#R家传剑")                    
		  StopTalkTask(varMap)                                        
		  DeliverTalkTips(varMap,varPlayer) 
	end    
	if  GetZhiye( varMap, varPlayer) ==2   then
		ItemAppend( varMap,10031001, 1 )
					StartTalkTask(varMap)                                      
		  TalkAppendString(varMap,"你获得了物品：#R家传弓")                    
		  StopTalkTask(varMap)                                        
		  DeliverTalkTips(varMap,varPlayer) 
	end    
	if  GetZhiye( varMap, varPlayer) ==3   then
		ItemAppend( varMap,10041001, 1 )
					StartTalkTask(varMap)                                      
		  TalkAppendString(varMap,"你获得了物品：#R家传枪")                    
		  StopTalkTask(varMap)                                        
		  DeliverTalkTips(varMap,varPlayer) 
	end    
	if  GetZhiye( varMap, varPlayer) ==4   then
		ItemAppend( varMap,10051001, 1 ) 
					StartTalkTask(varMap)                                      
		  TalkAppendString(varMap,"你获得了物品：#R家传杖")                    
		  StopTalkTask(varMap)                                        
		  DeliverTalkTips(varMap,varPlayer) 
	end    
	if  GetZhiye( varMap, varPlayer) ==5   then
		ItemAppend( varMap,10061001, 1 )
					StartTalkTask(varMap)                                      
		  TalkAppendString(varMap,"你获得了物品：#R家传槌")                    
		  StopTalkTask(varMap)                                        
		  DeliverTalkTips(varMap,varPlayer) 
	end         
		local varRet = StopItemTask(varMap,varPlayer)                                 
	  if varRet > 0 then                                                  
	    DeliverItemListSendToPlayer(varMap,varPlayer) 
	  else                                                             
		  StartTalkTask(varMap)                                      
		  TalkAppendString(varMap,"物品栏已满，请整理再来！")                    
		  StopTalkTask(varMap)                                        
		  DeliverTalkTips(varMap,varPlayer)                      
	   end           	               
end





function	x301307_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end



