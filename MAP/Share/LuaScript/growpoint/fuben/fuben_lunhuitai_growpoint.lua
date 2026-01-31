

x301028_var_GatherPointTypeId = 548 		
x301028_var_MinLimitLevel = 20   	

x301028_var_QuestName=""

x301028_var_ItemId = -1

x700028_var_HasOpen = {}		

x301028_var_LevelItemTab           	= 	{  	
											{ varLevel =39,
												items = {
															{varItem = 11000200, varCount = 6},
															{varItem = 11050001, varCount = 6},
														},
													
											},
											{ varLevel =59,
												items = {
															{varItem = 11000201, varCount = 6},
															{varItem = 11050002, varCount = 6},
														},
											},
											{ varLevel =79,
												items = {
															{varItem = 11000202, varCount = 6},
															{varItem = 11050003, varCount = 6},
														},
											},
											{ varLevel =99,
												items = {
															{varItem = 11000203, varCount = 6},
															{varItem = 11050004, varCount = 6},
														},
										  },
											{ varLevel =119,
												items = {
															{varItem = 11000203, varCount = 6},
															{varItem = 11050005, varCount = 6},
														},
											},
											{ varLevel =200,
												items = {
															{varItem = 11000203, varCount = 6},
															{varItem = 11050005, varCount = 6},
														},
											},
										}	
										

function x301028_HaveAccepted(varMap, varPlayer)
	
end




function 	x301028_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301028_var_GatherPointTypeId, varMap, 0, x301028_var_ItemId)
	SetGrowPointObjID(varMap,x301028_var_GatherPointTypeId,varX, varY,varBoxId)
	
	x700028_var_HasOpen[varMap] = {}
end




function	 x301028_ProcGpOpen(varMap,varPlayer,varTalknpc)
		return x301028_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, x301028_var_GatherPointTypeId, x301028_var_ItemId)	
end




function	 x301028_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return   x301028_ProcGuildRecycle( varMap, varPlayer, varTalknpc, x301028_var_GatherPointTypeId, x301028_var_ItemId )
	
end





function	x301028_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	local myGuid = GetPlayerGUID( varMap,varPlayer )
	myGuid = format("%u", myGuid)
	local t = 0
	
	
	
	
	local humancount = GetFuben_PlayerCount(varMap)
  	for varI=0, 6-1 do
        local paramidx = 248 + varI
        local nGUID = GetFubenData_Param(varMap, paramidx  )
        nGUID = format("%u", nGUID)	
    		if nGUID == myGuid then
    			t = varI
    			break
		    end
       			
        
    end
    
    
	local varLevel = GetLevel(varMap, varPlayer)
	StartItemTask( varMap )
	
	for varI,item in x301028_var_LevelItemTab do
		if varLevel <= item.varLevel then
			for j,s in item.items do
				ItemAppend( varMap, s.varItem, s.varCount )	
				
			end
			
			break
			
		end
	end
	local varRet = StopItemTask( varMap, varPlayer )
	
	if varRet > 0 then
		x700028_var_HasOpen[varMap][myGuid] = 1
		DeliverItemListSendToPlayer(varMap,varPlayer) 
		SetFubenData_Param(varMap, 200+t,1);
		
	else
		Msg2Player(varMap, varPlayer, "背包已满或空间不够，请清理背包。", 0, 2)
		return 1
		
	end
	
	











	
end




function	x301028_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
	
end





function x301028_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )

	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，请清理背包。", 0, 2)
		return 1
	end
	local myGuid = GetPlayerGUID( varMap,varPlayer )
	myGuid = format("%u", myGuid)
 	
 	if x700028_var_HasOpen[varMap][myGuid] ~= nil and x700028_var_HasOpen[varMap][myGuid] == 1 then	
 		varStr = "您只能采集一次！"
		StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		
		return 1
	end
	
	return 0
end

function x301028_ShowTipsToAll(varMap, varStr)

	local varHumanCount = GetScenePlayerCount( varMap)
    if varHumanCount > 0 then
        for varI = 0, varHumanCount do
            local varObj = GetScenePlayerObjId( varMap,varI)
            if varObj >= 0 then
                Msg2Player(varMap, varObj, varStr, 0, 2)
            end
        end
    end
end


function x301028_ProcGuildRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )

	




















	SetGrowPointIntervalContainer(varMap, x301028_var_GatherPointTypeId, 1)
	
	return 0
	
end
