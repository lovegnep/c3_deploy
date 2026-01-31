

x310013_var_GrowpointId = 402 		
x310013_var_MinLevel = 20   	
x310013_var_ItemIndex =  12030051


x310013_var_QuestList = {8022,8023,8024,8025,8026,8027,8028,8029,8030,8031,8032,8033,8034,8035,8036,8037,8038,8039,8040, 8041, 8042, 8043, 8044, 8045}
x310013_var_ItemNum = 3
x310013_var_ItemList = {12030051, 12030052, 12030053}
x310013_var_MaterialNum = 8
x310013_var_MaterialList ={11020001, 11020002, 11020006, 11020007, 11030001, 11030003, 11030401, 11030402}

function x310013_HaveAccepted(varMap, varPlayer)

	for varI, item in x310013_var_QuestList do
		if IsHaveQuestNM( varMap, varPlayer, item ) > 0 then
			return 1
		end
	end
	return -1
end

function x310013_RandItem(varMap, varPlayer)
	local kindIndex = random(1, 3);
	
	if kindIndex == 1 then
		local itemIndex = random(1, x310013_var_ItemNum)
		return x310013_var_ItemList[itemIndex]
	end

	if kindIndex == 2 then
		local materialIndex = random(1, x310013_var_MaterialNum)
		return x310013_var_MaterialList[materialIndex]
	end

    return -1

end



function 	x310013_ProcGpCreate(varMap,growPointType,varX,varY,varViewGroup)
	local varBoxId = ItemBoxEnterScene(varX, varY, x310013_var_GrowpointId, varMap, 0, x310013_var_ItemIndex, -1, varViewGroup)
	SetGrowPointObjID(varMap,x310013_var_GrowpointId,varX, varY,varBoxId)
end




function	 x310013_ProcGpOpen(varMap,varPlayer,varTalknpc)
		
    return x310013_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, x310013_var_GrowpointId, x310013_var_ItemIndex)	
end




function	 x310013_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return   x310013_ProcGuildRecycle( varMap, varPlayer, varTalknpc, x310013_var_GrowpointId, x310013_var_ItemIndex )
end





function	x310013_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x310013_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end





function x310013_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	
	if x310013_HaveAccepted(varMap, varPlayer) < 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您没有任务【个人】天降宝箱，请您关注系统公告。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return -31
	end
	    
	if GetLevel(varMap, varPlayer) < x310013_var_MinLevel then  		
		return -31
	end

	return 0
end


function x310013_ProcGuildRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
  	
	
	local varItemAdd = 1
	varNeedItem = x310013_RandItem(varMap, varPlayer)

	if varNeedItem == nil or varNeedItem < 0 then 
		StartTalkTask(varMap)
		TalkAppendString(varMap,"箱子里什么也没有")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		return 1
	end

	StartItemTask( varMap )
	ItemAppend( varMap, varNeedItem, varItemAdd )
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartTalkTask(varMap)
		TalkAppendString(varMap,format("#Y获得物品#G#{_ITEM%d}#Y！", varNeedItem))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		
		return 1
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，请整理背包！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end
	return 0
end
