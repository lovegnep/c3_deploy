


function x300811_ProcEventEntry( varMap, varPlayer, bufIndex,varOpType )

	if varOpType == 1 then 
        if GetBattleSceneName( varMap) == "zhanchang_shijiebeizhanchang/zhanchang_shijiebeizhanchang.scn" then
            
            if IsPlayerMutexState( varMap, varPlayer, PLAYER_STATE_DIE) ~= 1 then
                CancelSpecificImpact( varMap, varPlayer, 7801)
                CancelSpecificImpact( varMap, varPlayer, 7802)
                local varX,varY = GetWorldPos( varMap, varPlayer)
                local growPointid = GetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID)
                if growPointid ~= 0 then
                    SetGrowPointPos( varMap, growPointid, varX + 1, varY + 1)
                    SetGrowPointIntervalContainer( varMap, growPointid, 1000)
                    SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_FLAGOCCUPY, -2)
                end
            end
            return
        end

        local nOwnerId = GetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_FLAG_OWNER )
        if nOwnerId ~= -1 and nOwnerId == varPlayer then
            CancelSpecificImpact(varMap,varPlayer,LD_GUILD_BATTLE_DEC_SPEED_BUF )
            local FlagNumA = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_FLAG_NUM)
            local FlagNumB = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_B_FLAG_NUM)
            if FlagNumA < LD_GUILD_BATTLE_FLAG_COUNT and FlagNumB < LD_GUILD_BATTLE_FLAG_COUNT then
                
                if GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_FLAG_OWNER) ~= -1 then
                    
                    local varX,varY = GetWorldPos(varMap, varPlayer)
                    SetGrowPointPos(varMap,LD_GUILD_BATTLE_FLAG_GROW_POINT,varX+1,varY+1)
                    SetGrowPointIntervalContainer(varMap,LD_GUILD_BATTLE_FLAG_GROW_POINT,1000)
                end
            end

            SetGuildBattleSceneData_Param( varMap,LD_GUILD_BATTLE_FLAG_OWNER,-1 )
            LuaCallNoclosure( GUILDBATTLE_SCRIPTID,"UpdateSceneDataFlag",varMap,7 )
       end
	end


end

