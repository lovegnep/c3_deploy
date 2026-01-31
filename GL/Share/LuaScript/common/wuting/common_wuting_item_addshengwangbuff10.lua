
x300184_var_FileId  = 300184
x300184_var_Buf1   = -1
x300184_var_Buf2   = -1 
x300184_var_FarScriptId	= 300160
x300184_var_BuffId        = 7666





function x300184_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x300184_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300184_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300184_ProcConditionCheck( varMap, varPlayer )
		if IsNewServer()==1 then
	--		if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 60 then
	--				Msg2Player(varMap,varPlayer,"很抱歉，等级排行榜最后一名玩家未到60级，无法使用精品轩尼诗理查",8,3)
       --		return 0
    --	end
    end
    if IsHaveSpecificImpact( varMap, varPlayer, x300184_var_BuffId) == 1 then
        Msg2Player( varMap, varPlayer, "您身上已有此类型状态，不能叠加，必须待其完全消失才能继续使用", 8, 3)
        return 0
    end
    if IsHaveSpecificImpact( varMap, varPlayer, 7649) == 1 then
        Msg2Player( varMap, varPlayer, "您身上有相同类型的状态，请等路易十三消失后再使用！", 8, 3)
        return 0
    end
    if IsHaveSpecificImpact( varMap, varPlayer, 7650) == 1 then
        Msg2Player( varMap, varPlayer, "您身上有相同类型的状态，请等轩尼诗理查消失后再使用！", 8, 3)
        return 0
    end
    if IsHaveSpecificImpact( varMap, varPlayer, 7669) == 1 then
        Msg2Player( varMap, varPlayer, "您身上有相同类型的状态，请等10小时4倍声望状态消失后再使用！", 8, 3)
        return 0
    end

    return 1
end






function x300184_ProcDeplete( varMap, varPlayer )
 	if DepletingUsedItem(varMap, varPlayer) == 1 then
 		LuaCallNoclosure(x300184_var_FarScriptId, "ProcUseItem", varMap, varPlayer, x300184_var_BuffId)
		return 1;
	end
	
	return 0;
	
end








function x300184_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x300184_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x300184_var_Buf1, 0);
	end
	return 1;
end







function x300184_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
