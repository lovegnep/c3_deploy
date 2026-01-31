x930156_var_FileId = 930156


function x930156_ProcEventEntry( varMap, varPlayer, varBagIdx )
    local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )


    local varObj, objGuid =CreateMonster( varMap, 4804, PlayerPosX, PlayerPosZ, 1, 754, -1, 122993, 20, 5*60*1000, 20, "福星", "福星", -1)
    local mm = format("随机商人%s出现在%s [%d,%d]，抓好机会，一夜暴富！！！", "福星", varMap,PlayerPosX,PlayerPosZ)
    LuaAllScenceM2Wrold(varMap, mm, CHAT_PLANE_SCROLL, 1)
    LuaAllScenceM2Wrold(varMap, mm, CHAT_LEFTDOWN, 1)
    LuaAllScenceM2Wrold(varMap, mm, CHAT_MAIN_RIGHTDOWN, 1)

end

function x930156_ProcIsSpellLikeScript( varMap, varPlayer)
    return 0;


end

function x930156_ProcCancelImpacts( varMap, varPlayer )
    return 0;
end

function x930156_ProcConditionCheck( varMap, varPlayer )
    return 0
end

function x930156_ProcDeplete( varMap, varPlayer )

    return 0
end

function x930156_ProcActivateOnce( varMap, varPlayer )
end

function x930156_ProcActivateEachTick( varMap, varPlayer)
    return 1;
end

function x930156_ProcDie(varMap, varPlayer, varKiller)

    GamePlayScriptLog(varMap, varKiller, 551)

end

