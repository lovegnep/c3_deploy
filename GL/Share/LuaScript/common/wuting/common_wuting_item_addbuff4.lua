
x300171_var_FileId  = 300171
x300171_var_Buf1   = -1
x300171_var_Buf2   = -1 
x300171_var_FarScriptId	= 300160
x300171_var_BuffId        = 7649





function x300171_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x300171_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300171_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300171_ProcConditionCheck( varMap, varPlayer )
    
    if GetImpactContinuanceByDataIndex( varMap, varPlayer, x300171_var_BuffId) - GetImpactContinuanceElapsed( varMap, varPlayer, x300171_var_BuffId) > 35400000 then
        Msg2Player( varMap, varPlayer, "已经达到累加上限，不能继续使用路易十三了", 8, 3)
        return 0
    end
    if IsHaveSpecificImpact( varMap, varPlayer, 7650) == 1 then
        Msg2Player( varMap, varPlayer, "您身上有相同类型的状态，请等轩尼诗理查消失后再使用！", 8, 3)
        return 0
    end
    if IsHaveSpecificImpact( varMap, varPlayer, 7666) == 1 then
        Msg2Player( varMap, varPlayer, "您身上有相同类型的状态，请等精品轩尼诗理查消失后再使用！", 8, 3)
        return 0
    end
    if IsHaveSpecificImpact( varMap, varPlayer, 7669) == 1 then
        Msg2Player( varMap, varPlayer, "您身上有相同类型的状态，请等精品路易十三消失后再使用！", 8, 3)
        return 0
    end

    return 1
end






function x300171_ProcDeplete( varMap, varPlayer )
 	if DepletingUsedItem(varMap, varPlayer) == 1 then
 		LuaCallNoclosure(x300171_var_FarScriptId, "ProcUseItem", varMap, varPlayer, 7649)
		return 1;
	end
	
	return 0;
	
end








function x300171_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x300171_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x300171_var_Buf1, 0);
	end
	return 1;
end







function x300171_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
