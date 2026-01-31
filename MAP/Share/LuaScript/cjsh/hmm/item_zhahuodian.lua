





x930159_var_FileId 		= 930159

x930159_var_LevelMin		=	-1

x930159_var_userec={}




function x930159_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x930159_ProcIsSpellLikeScript( varMap, varPlayer)
    return 1;
end






function x930159_ProcCancelImpacts( varMap, varPlayer )
    return 0;
end






function x930159_ProcConditionCheck( varMap, varPlayer )



    if(1~=VerifyUsedItem(varMap, varPlayer)) then
        return 0
    end
    return 1;
end







function x930159_ProcDeplete( varMap, varPlayer )

    local shi,fen,miao = GetHourMinSec()
    local pguid = GetGUID(varMap, varPlayer)
    if x930159_var_userec[pguid] ~= nil and x930159_var_userec[pguid] == fen then
        Msg2Player(varMap,varPlayer,"请1分钟后再尝试",8,2)
        Msg2Player(varMap,varPlayer,"请1分钟后再尝试",8,3)
        return 0
    end

    local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
    local curTimes = GetBagItemMultTimes( varMap, varPlayer, varBagIdx)
    local result = 1

    if curTimes <= 1 then

        if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end

    else

        SetBagItemMultTimes( varMap, varPlayer, varBagIdx, curTimes - 1)
        result = 0
    end

    local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )


    x930159_var_userec[pguid] = fen

    local varObj, objGuid =CreateMonster( varMap, 4206, PlayerPosX, PlayerPosZ, 1, 754, -1, 139067, 20, 1*60*1000, 20, "随身杂货店", "随身杂货店", -1)


    return result
end









function x930159_ProcActivateOnce( varMap, varPlayer, varImpact )

end







function x930159_ProcActivateEachTick( varMap, varPlayer)
    return 1;
end



