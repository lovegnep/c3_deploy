

x301225_var_GatherPointTypeId = 184 
x301225_var_ItemId = 13030081 



function 	x301225_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301225_var_GatherPointTypeId, varMap, 0, x301225_var_ItemId)
end




function	 x301225_ProcGpOpen(varMap,varPlayer,varTalknpc)

local isHaveQuest = IsHaveQuestNM(varMap,varPlayer,1718)
		if isHaveQuest == 1 then
		if GetItemCount(varMap,varPlayer,13030105) == 0 then

		  return 0
		else
    	  	StartTalkTask(varMap)
					TalkAppendString(varMap,"你已经获得了菩提树心")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
			return 1
		end
		else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"神秘的力量阻止你接近这颗枯树！")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
    	return 1
    end

end





function	 x301225_ProcGpRecycle(varMap,varPlayer,varTalknpc)
		local varX,varY = GetWorldPos ( varMap, varPlayer )
		varX,varY = floor ( varX + random ( 1,2 ) ) , floor ( varY + random ( 1,2 ) )
		CreateMonster(varMap,1150, varX, varY, 5, 0, -1,-1,21,120000)
end





function	x301225_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


