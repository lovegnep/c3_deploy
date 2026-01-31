




x430153_var_FileId 		= 430153 


x430153_var_LevelMin		= 80
x430153_var_LevelMax		= 161

x430153_var_Exp           = 350000
x430153_var_Money					=	125	



function x430153_ProcEventEntry( varMap, varPlayer, varBagIdx)

end






function x430153_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430153_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end






function x430153_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end
    local varLevel = GetLevel( varMap, varPlayer)
    if varLevel < x430153_var_LevelMin then
        Msg2Player( varMap, varPlayer, "你的等级低于使用此物品的最低级别", 8, 3)
        return 0
    end
    if varLevel >= x430153_var_LevelMax then
        Msg2Player( varMap, varPlayer, "你的等级高于使用此物品的最高级别", 8, 3)
        return 0
    end

	return 1; 
end







function x430153_ProcDeplete( varMap, varPlayer)
    if DepletingUsedItem( varMap, varPlayer) == 1 then
        return 1;
    end

    return 0
end








function x430153_ProcActivateOnce( varMap, varPlayer, varImpact)
		local varLevel =GetLevel( varMap, varPlayer)
		local varExp =varLevel * x430153_var_Exp
    AddExp( varMap, varPlayer, varExp)
    AddMoney( varMap, varPlayer, 1, x430153_var_Money*1000)
    Msg2Player(varMap, varPlayer, "#Y获得#R经验"..varExp.."#Y的奖励", 0, 2)
    Msg2Player(varMap, varPlayer, "获得银卡"..x430153_var_Money.."两", 0, 3)
end







function x430153_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

