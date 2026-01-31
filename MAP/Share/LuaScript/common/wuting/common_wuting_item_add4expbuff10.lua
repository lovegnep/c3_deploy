
x300187_var_FileId  = 300187
x300187_var_Buf1   = -1
x300187_var_Buf2   = -1 
x300187_var_FarScriptId	= 300160
x300187_var_BuffId        = 7668





function x300187_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x300187_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300187_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300187_ProcConditionCheck( varMap, varPlayer )
    if IsHaveSpecificImpact( varMap, varPlayer, x300187_var_BuffId) == 1 then
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
    if IsHaveSpecificImpact( varMap, varPlayer, 7667) == 1 then
        Msg2Player( varMap, varPlayer, "您身上有相同类型的状态，请等精品芝华士消失后再使用！", 8, 3)
        return 0
    end

    return 1
end






function x300187_ProcDeplete( varMap, varPlayer )
 	if DepletingUsedItem(varMap, varPlayer) == 1 then
 		LuaCallNoclosure(x300187_var_FarScriptId, "ProcUseItem", varMap, varPlayer, x300187_var_BuffId)
		return 1;
	end
	
	return 0;
	
end








function x300187_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x300187_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x300187_var_Buf1, 0);
	end
	return 1;
end







function x300187_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
