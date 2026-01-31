




x430156_var_FileId 		= 430156 


x430156_var_LevelMin		= 110
x430156_var_LevelMax		= 161

x430156_var_Exp           = 500000
x430156_var_Money					=	200



function x430156_ProcEventEntry( varMap, varPlayer, varBagIdx)

end






function x430156_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x430156_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end






function x430156_ProcConditionCheck( varMap, varPlayer)
	
	if( 1~=VerifyUsedItem( varMap, varPlayer) ) then
		return 0
	end
    local varLevel = GetLevel( varMap, varPlayer)
    if varLevel < x430156_var_LevelMin then
        Msg2Player( varMap, varPlayer, "你的等级低于使用此物品的最低级别", 8, 3)
        return 0
    end
    if varLevel >= x430156_var_LevelMax then
        Msg2Player( varMap, varPlayer, "你的等级高于使用此物品的最高级别", 8, 3)
        return 0
    end

	return 1; 
end







function x430156_ProcDeplete( varMap, varPlayer)
    if DepletingUsedItem( varMap, varPlayer) == 1 then
        return 1;
    end

    return 0
end








function x430156_ProcActivateOnce( varMap, varPlayer, varImpact)
		local varLevel =GetLevel( varMap, varPlayer)
		local varExp =varLevel * x430156_var_Exp
    AddExp( varMap, varPlayer, varExp)
    AddMoney( varMap, varPlayer, 1, x430156_var_Money*1000)
    Msg2Player(varMap, varPlayer, "#Y获得#R经验"..varExp.."#Y的奖励", 0, 2)
    Msg2Player(varMap, varPlayer, "获得银卡"..x430156_var_Money.."两", 0, 3)
end







function x430156_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

