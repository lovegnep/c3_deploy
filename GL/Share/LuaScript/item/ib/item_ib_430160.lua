




x430160_var_FileId 		= 430160 


x430160_var_LevelMin		= 20
x430160_var_LevelMax		= 161

x430160_var_Exp           = 2000




function x430160_ProcEventEntry( varMap, varPlayer, varBagIdx)

end






function x430160_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430160_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end






function x430160_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end
    local varLevel = GetLevel( varMap, varPlayer)
    if varLevel < x430160_var_LevelMin then
        Msg2Player( varMap, varPlayer, "你的等级低于使用此物品的最低级别", 8, 3)
        return 0
    end
    if varLevel >= x430160_var_LevelMax then
        Msg2Player( varMap, varPlayer, "你的等级高于使用此物品的最高级别", 8, 3)
        return 0
    end
   
	return 1; 
end







function x430160_ProcDeplete( varMap, varPlayer)
    if DepletingUsedItem( varMap, varPlayer) == 1 then
        return 1;
    end

    return 0
end








function x430160_ProcActivateOnce( varMap, varPlayer, varImpact)
    AddExp( varMap, varPlayer, x430160_var_Exp)
end







function x430160_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

