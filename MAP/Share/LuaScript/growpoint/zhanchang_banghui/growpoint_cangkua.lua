

x300667_var_GatherPointTypeId = 112 		
x300667_var_ItemId = 12010001
x300667_var_Flag = 0             		


function 	x300667_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x300667_var_GatherPointTypeId, varMap, 0, x300667_var_ItemId)
end




function	 x300667_ProcGpOpen(varMap,varPlayer,varTalknpc)
    return x300667_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, x300667_var_GatherPointTypeId, x300667_var_ItemId)
end




function	 x300667_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return   x300667_ProcGuildRecycle( varMap, varPlayer, varTalknpc, x300667_var_GatherPointTypeId, x300667_var_ItemId )
end





function	x300667_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x300667_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end



function x300667_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )

    if LuaCallNoclosure(GUILDBATTLE_SCRIPTID,"CheckBattleState", varMap) == 0 then
        return 1
    end

	local guild = GetGuildID(varMap, varPlayer)
	if guild == -1 then
		return 1
	end

	
    
	local nGuildA = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_A_GUILD )
    local nGuildB = GetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_B_GUILD )

    local nGuildId = GetGuildID( varMap,varPlayer )

    
    local nFlag = -1
    if nGuildId == nGuildA then
        nFlag = 0
    elseif nGuildId == nGuildB then
        nFlag = 1
    end

	if nFlag ~= x300667_var_Flag then      
		StartTalkTask(varMap)
		TalkAppendString(varMap, "敌方仓库：不可以存储！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 1
	else
	  	
    	local IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer,LD_GUILD_BATTLE_DEC_SPEED_BUF )
    	if IsHaveFlag == 0 then
    		
			StartTalkTask(varMap)
			TalkAppendString(varMap, "身上无旗不可交！");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 1
		else
			

            local FlagNum = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_FLAG_NUM+nFlag) + 1
			
            SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_A_FLAG_NUM+nFlag,FlagNum )
			
			
			

            
            if nFlag == 0 then
                local Score = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_SOCRE) + 10
                SetGuildBattleSceneData_Param( varMap, LD_GUILD_BATTLE_A_SOCRE ,Score )
            end

            if nFlag == 1 then
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

			

            
            if nFlag == 0 then
                
                LuaThisScenceM2Wrold(varMap,"蓝方顺利交付了战旗",2,1)
                LuaThisScenceM2Wrold(varMap,"蓝方顺利交付了战旗",3,1)

            elseif nFlag == 1 then
                
                LuaThisScenceM2Wrold(varMap,"红方顺利交付了战旗",2,1)
                LuaThisScenceM2Wrold(varMap,"红方顺利交付了战旗",3,1)
            end
		end
		return 1
	end

	return 1
end


function x300667_ProcGuildRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )

    if LuaCallNoclosure(GUILDBATTLE_SCRIPTID,"CheckBattleState", varMap) == 0 then
        return 0
    end

	return 1

end



