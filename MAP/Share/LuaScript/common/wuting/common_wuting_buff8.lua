
x300180_var_FileId = 300180
x300180_var_FarScriptId = 300160
x300180_var_BuffId = 8401
x300180_var_PosTable              = {
                                    { varX =94 , z =67}, 
                                    { varX =157 , z =73}, 
                                    { varX = 50, z = 95}, 
                                    { varX = 127, z =58 }, 
									{ varX = 206, z =77 },
}                                


function x300180_ProcIntervalOverEvent( varMap, varPlayer)
end


function x300180_ProcActiveEvent( varMap, varPlayer )
end


function x300180_ProcFadeOutEvent( varMap, varPlayer )
    if varMap == 14 and GetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID) == 1 then
        SetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID, 0)

        x300160_ChangeBody( varMap, varPlayer, 0, 0)
        SetPlayerMutexState( varMap, varPlayer, PLAYER_STATE_DANCERY, 0)
        local varIndex = random( 1, getn( x300180_var_PosTable) )
        NewWorld( varMap, varPlayer, 0, x300180_var_PosTable[ varIndex].varX, x300180_var_PosTable[ varIndex].z, 300160)
    end

end




function x300180_ProcEventEntry( varMap, varPlayer, varBagIdx)
end


