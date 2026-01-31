


x300802_var_QuestId 	= 7557
x300802_var_ItemId 		= 13011604
x300802_var_FileId 		= 300758
x300802_var_GatherPointType	= 117
x300802_var_ItemCount		= 1





function 		x300802_ProcGpCreate(varMap,varGpType,varX,varY)
	
	local varBoxId = ItemBoxEnterScene(varX,varY,x300802_var_GatherPointType,varMap,0,x300802_var_ItemId)
end





function	 x300802_ProcGpOpen(varMap,varPlayer,varTalknpc)
	if IsHaveQuest(varMap,varPlayer, x300802_var_QuestId) > 0 then
		if GetItemCount(varMap,varPlayer,x300802_var_ItemId) < x300802_var_ItemCount then
			return 0
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




function	 x300802_ProcGpRecycle(varMap,varPlayer,varTalknpc)
local varX = GetItemBoxWorldPosX(varMap,varTalknpc)
	local z = GetItemBoxWorldPosZ(varMap,varTalknpc)
   	
   	local posx = varX - 5;
   	local posz = z;
    CreateMonster(varMap,9560, posx, posz, 16,50, -1,-1,21,1000 * 60 *3 )
   	
   	local posx = varX;
   	local posz = z - 5;
   	CreateMonster(varMap,9560, posx, posz, 16,50, -1,-1,21,1000 * 60 *3 )
   	
   	local posx = varX + 5;
   	local posz = z;
   	CreateMonster(varMap,9560, posx, posz, 16,50, -1,-1,21,1000 * 60 *3 )
	
     return LuaCallNoclosure( x300802_var_FileId, "ProcGetGrowPoint", varMap, varPlayer, x300802_var_QuestId, x300802_var_ItemId )
end




function	x300802_ProcGpProcOver(varMap,varPlayer,varTalknpc)

end

function	x300802_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)

end
