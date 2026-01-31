

x301226_var_GatherPointTypeId = 185 
x301226_var_ItemId = 13030106 



function 	x301226_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301226_var_GatherPointTypeId, varMap, 0, x301226_var_ItemId)
end




function	 x301226_ProcGpOpen(varMap,varPlayer,varTalknpc)

local isHaveQuest = IsHaveQuestNM(varMap,varPlayer,1721)
		if isHaveQuest == 1 then
		if GetItemCount(varMap,varPlayer,13030106) == 0 then

		  return 0
		else
    	  	StartTalkTask(varMap)
					TalkAppendString(varMap,"你已经获得了木棉袈裟")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
			return 1
		end
		else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"一股恐怖的力量阻止了你！")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
    	return 1
    end

end





function	 x301226_ProcGpRecycle(varMap,varPlayer,varTalknpc)
		
		
		CreateMonster(varMap,1151, 458, 280, 5, 0, -1,-1,21,120000)
		CreateMonster(varMap,1147, 454, 276, 5, 0, -1,-1,21,120000)
		CreateMonster(varMap,1147, 461, 276, 5, 0, -1,-1,21,120000)
end





function	x301226_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end


