
x300182_var_FileId  = 300182
x300182_var_Buf1   = -1
x300182_var_Buf2   = -1 
x300182_var_FarScriptId	= 300160
x300182_var_BuffId        = 7667





function x300182_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x300182_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300182_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300182_ProcConditionCheck( varMap, varPlayer )
		if IsNewServer()==1 then
		--	if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 60 then
		--			Msg2Player(varMap,varPlayer,"很抱歉，等级排行榜最后一名玩家未到60级，无法使用精品芝华士",8,3)
       	--	return 0
    --	end
    end
    if IsHaveSpecificImpact( varMap, varPlayer, x300182_var_BuffId) == 1 then
        Msg2Player( varMap, varPlayer, "您身上已有此类型状态，不能叠加，必须待其完全消失才能继续使用", 8, 3)
        return 0
    end
    if IsHaveSpecificImpact( varMap, varPlayer, 7647) == 1 then
        Msg2Player( varMap, varPlayer, "您身上有相同类型的状态，请等杰克丹尼消失后再使用！", 8, 3)
        return 0
    end
    if IsHaveSpecificImpact( varMap, varPlayer, 7648) == 1 then
        Msg2Player( varMap, varPlayer, "您身上有相同类型的状态，请等芝华士消失后再使用！", 8, 3)
        return 0
    end
    if IsHaveSpecificImpact( varMap, varPlayer, 7668) == 1 then
        Msg2Player( varMap, varPlayer, "您身上有相同类型的状态，请等10小时4倍经验状态消失后再使用！", 8, 3)
        return 0
    end

    return 1
end






function x300182_ProcDeplete( varMap, varPlayer )
 	if DepletingUsedItem(varMap, varPlayer) == 1 then
 		LuaCallNoclosure(x300182_var_FarScriptId, "ProcUseItem", varMap, varPlayer, x300182_var_BuffId)
		return 1;
	end
	
	return 0;
	
end








function x300182_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x300182_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x300182_var_Buf1, 0);
	end
	return 1;
end







function x300182_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
