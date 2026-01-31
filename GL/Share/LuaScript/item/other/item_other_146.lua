
x418146_var_FileId = 418146
x418146_var_QuestName = "幸运密保礼包"

x418146_var_Profession1       = {
                                { lmin =  1, lmax = 30,  varItem = 14030001 }, 
                                { lmin = 31, lmax = 40,  varItem = 14030002 }, 
                                { lmin = 41, lmax = 50,  varItem = 14030003 }, 
                                { lmin = 51, lmax = 60,  varItem = 14030004 }, 
                                { lmin = 61, lmax = 70,  varItem = 14030005 }, 
                                { lmin = 71, lmax = 80,  varItem = 14030031 }, 
                                { lmin = 81, lmax = 160, varItem = 14030032 },
}                                                          
x418146_var_Profession2       = {
                                { lmin =  1, lmax = 30,  varItem = 14030006 }, 
                                { lmin = 31, lmax = 40,  varItem = 14030007 }, 
                                { lmin = 41, lmax = 50,  varItem = 14030008 }, 
                                { lmin = 51, lmax = 60,  varItem = 14030009 }, 
                                { lmin = 61, lmax = 70,  varItem = 14030010 }, 
                                { lmin = 71, lmax = 80,  varItem = 14030035 }, 
                                { lmin = 81, lmax = 160, varItem = 14030036 }, 
}                                                          
x418146_var_Profession3       = {
                                { lmin =  1, lmax = 30,  varItem = 14030011 }, 
                                { lmin = 31, lmax = 40,  varItem = 14030012 }, 
                                { lmin = 41, lmax = 50,  varItem = 14030013 }, 
                                { lmin = 51, lmax = 60,  varItem = 14030014 }, 
                                { lmin = 61, lmax = 70,  varItem = 14030015 }, 
                                { lmin = 71, lmax = 80,  varItem = 14030039 }, 
                                { lmin = 81, lmax = 160, varItem = 14030040 }, 
}                                                          

function x418146_var_Gem( varMap, varPlayer)
    local prof = GetZhiye( varMap, varPlayer)
    local varLevel = GetLevel( varMap, varPlayer)
    local varItem = 14030001
    local tab = nil

    if prof == 0 or prof == 1 or prof == 6 or prof == 7 then
        tab = x418146_var_Profession1
    elseif prof == 2 or prof == 3 or prof == 8 or prof == 9 then
        tab = x418146_var_Profession2
    elseif prof == 4 or prof == 5 or prof == 10 or prof == 11 then
        tab = x418146_var_Profession3
    end
    for varI, item in tab do
        if varLevel >= item.lmin and varLevel <= item.lmax then
            varItem = item.varItem
            break
        end
    end

    StartItemTask( varMap)
    ItemAppendBind( varMap, varItem, 1)
    if StopItemTask( varMap, varPlayer) > 0 then
        DeliverItemListSendToPlayer( varMap, varPlayer)
    else
        Msg2Player( varMap, varPlayer, "背包已满，无法获得物品", 8, 3)
    end
end

x418146_var_ItemTable         = {
                                { varItem = 12031019, probability = 157, proc = nil }, 
                                { varItem = 12031013, probability = 157, proc = nil }, 
                                { varItem = 12031007, probability = 157, proc = nil }, 
                                { varItem = 12110206, probability = 157, proc = nil }, 
                                { varItem = 12031000, probability = 100, proc = nil }, 
                                { varItem = 11990011, probability = 100, proc = nil }, 
                                { varItem = 12050009, probability = 100, proc = nil }, 
                                { varItem = 11000501, probability =  50, proc = nil }, 
                                { varItem = 12030200, probability =  20, proc = nil }, 
                                { varItem = 12030200, probability =   2, proc = x418146_var_Gem }, 
}                                                              

x418146_var_ItemList = {}
x418146_var_LevelMin = 1






function x418146_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418146_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418146_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418146_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418146_ProcDeplete( varMap, varPlayer )
    if GetBagSpace( varMap, varPlayer) < 1 then
        Msg2Player( varMap, varPlayer, format( "背包空间不足#G%d#cffcc00个，无法获得礼包物品", 1), 8, 3)
        return 0
    end
    
	if(DepletingUsedItem(varMap, varPlayer) > 0) then
		return 1;
	end
	return 0;
end








function x418146_ProcActivateOnce( varMap, varPlayer, varImpact )

    if GetBagSpace( varMap, varPlayer) < 1 then
        Msg2Player( varMap, varPlayer, format( "背包空间不足#G%d#cffcc00个，无法获得礼包物品", 1), 8, 3)
        return
    end

	local r = random( 1, 1000)
    local top = 1
    local bottom = 1
    local varIndex = 1
    for varI, item in x418146_var_ItemTable do
        top = top + item.probability
        if r >= bottom and r < top then
            varIndex = varI
            break
        end
        bottom = bottom + item.probability
    end
    if x418146_var_ItemTable[ varIndex].proc ~= nil then
        x418146_var_ItemTable[ varIndex].proc( varMap, varPlayer)
    else
 		StartItemTask( varMap)
		ItemAppendBind( varMap, x418146_var_ItemTable[ varIndex].varItem, 1)
		if StopItemTask( varMap, varPlayer) > 0 then
			DeliverItemListSendToPlayer( varMap, varPlayer)
		else
            Msg2Player( varMap, varPlayer, "背包已满，无法获得物品", 8, 3)
		end
    end

end







function x418146_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end


