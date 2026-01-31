

x300666_var_ItemId = 12010001


function 	x300666_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, LD_GUILD_BATTLE_FLAG_GROW_POINT, varMap, 0, x300666_var_ItemId)
    SetGrowPointObjID(varMap,LD_GUILD_BATTLE_FLAG_GROW_POINT,varX,varY,varBoxId)
end




function	 x300666_ProcGpOpen(varMap,varPlayer,varTalknpc)
    return x300666_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, LD_GUILD_BATTLE_FLAG_GROW_POINT, x300666_var_ItemId)
end




function	 x300666_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return   x300666_ProcGuildRecycle( varMap, varPlayer, varTalknpc, LD_GUILD_BATTLE_FLAG_GROW_POINT, x300666_var_ItemId )
end





function	x300666_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x300666_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end





function x300666_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return 0
end


function x300666_ProcGuildRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )

    if LuaCallNoclosure(GUILDBATTLE_SCRIPTID,"CheckBattleState", varMap) == 0 then
        return 0
    end

    ReCallHorse( varMap, varPlayer )

 	SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer,LD_GUILD_BATTLE_DEC_SPEED_BUF,200)  
 	SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer,LD_GUILD_BATTLE_INC_DEFENCE_BUF,200)
 	

 	if GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_FLAG_TIME) == -1 then
 	 	SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_FLAG_TIME,60*10 )     
 	end

 	SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_FLAG_OWNER,varPlayer )  
	
	SetGrowPointIntervalContainer(varMap,LD_GUILD_BATTLE_FLAG_GROW_POINT,-1)

    LuaCallNoclosure( GUILDBATTLE_SCRIPTID,"UpdateSceneDataFlag",varMap,7 )
    LuaCallNoclosure( 300669,"CancelBuffer",varMap,varPlayer )

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
        
        LuaThisScenceM2Wrold(varMap,"蓝方夺取了战旗",2,1)
        LuaThisScenceM2Wrold(varMap,"蓝方夺取了战旗",3,1)

    elseif nFlag == 1 then
        
        LuaThisScenceM2Wrold(varMap,"红方夺取了战旗",2,1)
        LuaThisScenceM2Wrold(varMap,"红方夺取了战旗",3,1)
    end

	return 1

end



