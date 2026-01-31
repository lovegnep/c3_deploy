


x300801_var_QuestId 	= 7554
x300801_var_ItemId 		= 13011603
x300801_var_FileId 		= 300755
x300801_var_GatherPointType	= 116
x300801_var_ItemCount		= 1





function 		x300801_ProcGpCreate(varMap,varGpType,varX,varY)
	
	local varBoxId = ItemBoxEnterScene(varX,varY,x300801_var_GatherPointType,varMap,0,x300801_var_ItemId)
end





function	 x300801_ProcGpOpen(varMap,varPlayer,varTalknpc)
	if IsHaveQuest(varMap,varPlayer, x300801_var_QuestId) > 0 then
		
			return 0
		
		
		
		
		
		
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您没有这个任务")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 1
	end
end




function	 x300801_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	local varX = GetItemBoxWorldPosX(varMap,varTalknpc)
	local z = GetItemBoxWorldPosZ(varMap,varTalknpc)
   	
   	local posx = varX - 5;
   	local posz = z;
   
   	
   	local posx = varX;
   	local posz = z - 5;
   
   	
   	local posx = varX + 5;
   	local posz = z;
   	CreateMonster(varMap,9560, posx, posz, 16,50, -1,-1,21,1000 * 60 *3 )
	return LuaCallNoclosure( x300801_var_FileId, "ProcGetGrowPoint", varMap, varPlayer, x300801_var_QuestId, x300801_var_ItemId )
end




function	x300801_ProcGpProcOver(varMap,varPlayer,varTalknpc)

end

function	x300801_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

end
