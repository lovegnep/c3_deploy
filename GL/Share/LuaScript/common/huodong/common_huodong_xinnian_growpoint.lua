

x310925_var_GrowpointId = 241 		
x310925_var_MinLevel = 40   	
x310925_var_ItemIndex =  12035210

x310925_var_normal ={12035201, 12035202, 12035203, 12035205, 12035206}

function x310925_HaveAccepted(varMap, varPlayer)
	return 1
end

function x310925_RandItem(varMap, varPlayer)
	local kindIndex = random(1, 100);
	
	if 1 == kindIndex then
		return 12035210
	elseif 4 >= kindIndex then
		return 12035207
	elseif 10 >= kindIndex then
		return 12035204
	elseif 85>= kindIndex then
		local ran =random(1,getn( x310925_var_normal))	
		return x310925_var_normal[ran]
	end

    return -1

end



function 	x310925_ProcGpCreate(varMap,growPointType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x310925_var_GrowpointId, varMap, 0, x310925_var_ItemIndex)
	SetGrowPointObjID(varMap,x310925_var_GrowpointId,varX, varY,varBoxId)
end




function	 x310925_ProcGpOpen(varMap,varPlayer,varTalknpc)
		
    return x310925_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, x310925_var_GrowpointId, x310925_var_ItemIndex)	
end




function	 x310925_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return   x310925_ProcGuildRecycle( varMap, varPlayer, varTalknpc, x310925_var_GrowpointId, x310925_var_ItemIndex )
end





function	x310925_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x310925_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end





function x310925_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	
	if x310925_HaveAccepted(varMap, varPlayer) < 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您没有任务【个人】天降宝箱，请您关注系统公告。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return -31
	end
	    
	if GetLevel(varMap, varPlayer) < x310925_var_MinLevel then  		
		return -31
	end

	return 0
end


function x310925_ProcGuildRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )

	
	local varItemAdd = 1
	varNeedItem = x310925_RandItem(varMap, varPlayer)
	SetGrowPointIntervalContainer(varMap, 241, -1)
	if varNeedItem == nil or varNeedItem < 0 then 
		local varLevel =GetLevel( varMap, varPlayer)
		local xp = varLevel*100
		AddExp( varMap, varPlayer, xp)
		local varStr =format("获得经验%d点",xp)
		Msg2Player(varMap, varPlayer, varStr, 0, 2)
		Msg2Player(varMap, varPlayer, varStr, 0, 3)
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
	
end
