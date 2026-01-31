





x930171_var_FileId 		= 930171

x930171_var_LevelMin		=	-1

x930171_var_userec={}




function x930171_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x930171_ProcIsSpellLikeScript( varMap, varPlayer)
    return 1;
end






function x930171_ProcCancelImpacts( varMap, varPlayer )
    return 0;
end






function x930171_ProcConditionCheck( varMap, varPlayer )



    if(1~=VerifyUsedItem(varMap, varPlayer)) then
        return 0
    end
    return 1;
end







function x930171_ProcDeplete( varMap, varPlayer )

    local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
    local curTimes = GetBagItemMultTimes( varMap, varPlayer, varBagIdx)
    local result = 1

    if curTimes <= 1 then

        if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end

    else

        SetBagItemMultTimes( varMap, varPlayer, varBagIdx, curTimes - 1)
        result = 0
    end

    SetPlayerVigor(varMap, varPlayer, GetPlayerVigor(varMap, varPlayer) + 10000 )

    return result
end









function x930171_ProcActivateOnce( varMap, varPlayer, varImpact )

end







function x930171_ProcActivateEachTick( varMap, varPlayer)
    return 1;
end



