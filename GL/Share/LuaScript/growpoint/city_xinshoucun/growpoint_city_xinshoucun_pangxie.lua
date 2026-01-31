

x301310_var_GatherPointTypeId = 176 
x301310_var_ItemId = 13030081 



function 	x301310_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301310_var_GatherPointTypeId, varMap, 0, x301310_var_ItemId)
end




function	 x301310_ProcGpOpen(varMap,varPlayer,varTalknpc)

local isHaveQuest = IsHaveQuestNM(varMap,varPlayer,3039)
		if isHaveQuest == 1 then
		if GetItemCount(varMap,varPlayer,13030081) == 0 then

		  return 0
		else
    	  	StartTalkTask(varMap)
					TalkAppendString(varMap,"你已经抓到了小螃蟹！")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
			return 1
		end
		else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"河里的石头还是别乱翻的好！")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
    	return 1
    end

end





function	 x301310_ProcGpRecycle(varMap,varPlayer,varTalknpc)
		local varX,varY = GetWorldPos ( varMap, varPlayer )
		varX,varY = floor ( varX + random ( 1,2 ) ) , floor ( varY + random ( 1,2 ) )
		CreateMonster(varMap,1838, varX, varY, 1, 0, -1,-1,21,30000)
end





function	x301310_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


