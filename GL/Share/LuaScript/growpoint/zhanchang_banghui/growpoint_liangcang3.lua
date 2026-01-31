

x300664_var_GatherPointTypeId = 108 		
x300664_var_ItemId = 12010001
x300664_var_BufIndex = 1210


function 	x300664_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x300664_var_GatherPointTypeId, varMap, 0, x300664_var_ItemId)
end




function	 x300664_ProcGpOpen(varMap,varPlayer,varTalknpc)
    return x300664_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, x300664_var_GatherPointTypeId, x300664_var_ItemId)
end




function	 x300664_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return   x300664_ProcGuildRecycle( varMap, varPlayer, varTalknpc, x300664_var_GatherPointTypeId, x300664_var_ItemId )
end





function	x300664_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x300664_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end





function x300664_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
    
    local nResult = LuaCallNoclosure(GUILDBATTLE_SCRIPTID,"CheckBattleState", varMap)
    if  nResult == 0 then
        return 1
    end

	local guild = GetGuildID(varMap, varPlayer)
	if guild == -1 then
		return 1
	end

	
	local guild = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_BARN3_GUILD)
	if guild == GetGuildID(varMap, varPlayer) then	

		
    	local nGuildA = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_A_GUILD )
        local nGuildB = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_B_GUILD )

        local varFlag = -1

        
        if guild == nGuildA then
            varFlag = 0
        elseif guild == nGuildB then
            varFlag = 1
        end

	  	
    	local IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer,LD_GUILD_BATTLE_DEC_SPEED_BUF )
    	if IsHaveFlag == 0 then
    		
			StartTalkTask(varMap)
			TalkAppendString(varMap, "身上无旗不可交！");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 1
		end

		if GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_BARN1_GUILD) ~= guild and GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_BARN4_GUILD) ~= guild then
  			
 			StartTalkTask(varMap)
			TalkAppendString(varMap, "占领相邻粮仓才能交！");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 1
		end

		local FlagNum = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_FLAG_NUM+varFlag) + 1
        
        SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_A_FLAG_NUM+varFlag,FlagNum )
        
        
        

        
        if varFlag == 0 then
            local Score = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_SOCRE) + 10
            SetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_A_SOCRE ,Score )
        end

        if varFlag == 1 then
            local Score = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_B_SOCRE) + 10
            SetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_B_SOCRE ,Score )
        end

        
        local nGetFlag = GetPlayerRuntimeData(varMap,varPlayer,RD_GUILDBATTLE_GETFLAG) + 1
        SetPlayerRuntimeData(varMap,varPlayer,RD_GUILDBATTLE_GETFLAG,nGetFlag) 

		
	    CancelSpecificImpact(varMap,varPlayer,LD_GUILD_BATTLE_DEC_SPEED_BUF )
	    CancelSpecificImpact(varMap,varPlayer,LD_GUILD_BATTLE_INC_DEFENCE_BUF )
	    
	    SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_FLAG_OWNER,-1 )

		
			
			SetGrowPointPos(varMap,LD_GUILD_BATTLE_FLAG_GROW_POINT,LD_GUILD_BATTLE_FLAG_X,LD_GUILD_BATTLE_FLAG_Y)
			SetGrowPointIntervalContainer(varMap,LD_GUILD_BATTLE_FLAG_GROW_POINT,1000)
			SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_FLAG_TIME,-1 )
            LuaCallNoclosure( GUILDBATTLE_SCRIPTID,"UpdateSceneDataFlag",varMap,7 )
		

        
        if varFlag == 0 then
            
            LuaThisScenceM2Wrold(varMap,"蓝方顺利交付了战旗",2,1)
            LuaThisScenceM2Wrold(varMap,"蓝方顺利交付了战旗",3,1)

        elseif varFlag == 1 then
            
            LuaThisScenceM2Wrold(varMap,"红方顺利交付了战旗",2,1)
            LuaThisScenceM2Wrold(varMap,"红方顺利交付了战旗",3,1)
        end

		return 1
	else
        
    	local IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer,LD_GUILD_BATTLE_DEC_SPEED_BUF )
    	if IsHaveFlag == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "身上有旗不可采集！");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 1
		end
    end

	return 0
end


function x300664_ProcGuildRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
    
    local nResult = LuaCallNoclosure(GUILDBATTLE_SCRIPTID,"CheckBattleState", varMap)
    if  nResult == 0 then
        return 0
    end

	SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_BARN3_GUILD,GetGuildID(varMap, varPlayer) )

	
	SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_BARN3_TIME,-1 )

    LuaCallNoclosure( GUILDBATTLE_SCRIPTID,"UpdateSceneDataFlag",varMap,3 )

    local nGuildA = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_A_GUILD )
    local nGuildB = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_B_GUILD )

    local nGuildId = GetGuildID( varMap,varPlayer )

    
    local nFlag = -1
    if nGuildId == nGuildA then
        nFlag = 0
    elseif nGuildId == nGuildB then
        nFlag = 1
    end

    
    if nFlag == 0 then
        
        LuaThisScenceM2Wrold(varMap,"蓝方夺取了粮仓",2,1)
        LuaThisScenceM2Wrold(varMap,"蓝方夺取了粮仓",3,1)

    elseif nFlag == 1 then
        
        LuaThisScenceM2Wrold(varMap,"红方夺取了粮仓",2,1)
        LuaThisScenceM2Wrold(varMap,"红方夺取了粮仓",3,1)
    end

	return 1

end



