
x300169_var_FileId  = 300169
x300169_var_Buf1   = -1
x300169_var_Buf2   = -1 
x300169_var_FarScriptId	= 300160
x300169_var_BuffId        = 7647





function x300169_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x300169_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300169_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300169_ProcConditionCheck( varMap, varPlayer )
    
    if GetImpactContinuanceByDataIndex( varMap, varPlayer, x300169_var_BuffId) - GetImpactContinuanceElapsed( varMap, varPlayer, x300169_var_BuffId) > 35400000 then
        Msg2Player( varMap, varPlayer, "已经达到累加上限，不能继续使用杰克丹尼了", 8, 3)
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
    if IsHaveSpecificImpact( varMap, varPlayer, 7668) == 1 then
        Msg2Player( varMap, varPlayer, "您身上有相同类型的状态，请等精品杰克丹尼消失后再使用！", 8, 3)
        return 0
    end

    return 1
end






function x300169_ProcDeplete( varMap, varPlayer )
 	if DepletingUsedItem(varMap, varPlayer) == 1 then
 		LuaCallNoclosure(x300169_var_FarScriptId, "ProcUseItem", varMap, varPlayer, x300169_var_BuffId)
		return 1;
	end
	
	return 0;
	
end








function x300169_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x300169_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x300169_var_Buf1, 0);
	end
	return 1;
end







function x300169_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
