

x301023_var_GatherPointTypeId = 547 		
x301023_var_MinLimitLevel = 20   	

x301023_var_QuestName=""
x301023_var_QuestId = 9050
x301023_var_ItemId = -1

x301023_CSP_HEIWUCHANG_ID			=   22		

function x301023_HaveAccepted(varMap, varPlayer)
	
end




function 	x301023_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301023_var_GatherPointTypeId, varMap, 0, x301023_var_ItemId)
	SetGrowPointObjID(varMap,x301023_var_GatherPointTypeId,varX, varY,varBoxId)
end




function	 x301023_ProcGpOpen(varMap,varPlayer,varTalknpc)
		
    return x301023_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, x301023_var_GatherPointTypeId, x301023_var_ItemId)	
end




function	 x301023_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return   x301023_ProcGuildRecycle( varMap, varPlayer, varTalknpc, x301023_var_GatherPointTypeId, x301023_var_ItemId )
	
end





function	x301023_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301023_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end





function x301023_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return 0
end

function x301023_ShowTipsToAll(varMap, varStr)

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


function x301023_ProcGuildRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	
	local ran = random(2,2) 
	if ran == 1 then  	
		local varX,z = GetWorldPos(varMap, varPlayer)
		
		local Num =  GetNearPlayerCount(varMap, varPlayer,varX,z,5)  
		for varI = 0, Num-1 do
			local humanObjId = GetNearPlayerMember(varMap, varPlayer,varI);
			if humanObjId >= 0 then
				if IsPlayerStateNormal(varMap, humanObjId) > 0 then
					local hp = GetHp(varMap, humanObjId)
					local maxhp = GetPlayerMaxHP(varMap, humanObjId)
					local ranIndex = random(10,40) 
					hp = floor(- maxhp*(ranIndex/100))
					SetHp(varMap, humanObjId, hp)
					local varStr = format("Äã¼õÑª%d",-hp)
					Msg2Player(varMap, humanObjId, varStr, 0, 2)
				end
			end
		end
		
	elseif ran == 2 then  	
			
		local heiwuchangId = GetFubenData_Param(varMap, x301023_CSP_HEIWUCHANG_ID )
		if heiwuchangId >= 0 then			
			SendSpecificImpactToUnit( varMap, varPlayer,varPlayer, heiwuchangId, 7712, 0)
			local varStr = "ºÚÎÞ³£Í£Áô30Ãë"
			local varX,z = GetWorldPos(varMap, varPlayer)
			local Num =  GetNearPlayerCount(varMap, varPlayer,varX,z,5)  
			for varI = 0, Num-1 do
				local humanObjId = GetNearPlayerMember(varMap, varPlayer,varI);
				if humanObjId >= 0 then
					Msg2Player(varMap, humanObjId, varStr, 0, 2)
					Msg2Player(varMap,humanObjId, varStr, 0, 3)
				end
			end
		end
	end
	
	SetGrowPointIntervalContainer(varMap, x301023_var_GatherPointTypeId, 40000)
	
	return 1
	
end
