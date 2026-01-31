




x430155_var_FileId 		= 430155 


x430155_var_LevelMin		= 100
x430155_var_LevelMax		= 161

x430155_var_Exp           = 500000
x430155_var_Money					=	200



function x430155_ProcEventEntry( varMap, varPlayer, varBagIdx)

end






function x430155_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430155_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end






function x430155_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end
    local varLevel = GetLevel( varMap, varPlayer)
    if varLevel < x430155_var_LevelMin then
        Msg2Player( varMap, varPlayer, "你的等级低于使用此物品的最低级别", 8, 3)
        return 0
    end
    if varLevel >= x430155_var_LevelMax then
        Msg2Player( varMap, varPlayer, "你的等级高于使用此物品的最高级别", 8, 3)
        return 0
    end

	return 1; 
end







function x430155_ProcDeplete( varMap, varPlayer)
    if DepletingUsedItem( varMap, varPlayer) == 1 then
        return 1;
    end

    return 0
end








function x430155_ProcActivateOnce( varMap, varPlayer, varImpact)
		local varLevel =GetLevel( varMap, varPlayer)
		local varExp =varLevel * x430155_var_Exp
    AddExp( varMap, varPlayer, varExp)
    AddMoney( varMap, varPlayer, 1, x430155_var_Money*1000)
    Msg2Player(varMap, varPlayer, "#Y获得#R经验"..varExp.."#Y的奖励", 0, 2)
    Msg2Player(varMap, varPlayer, "获得银卡"..x430155_var_Money.."两", 0, 3)
end







function x430155_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

