
x300161_var_FileId  = 300161
x300161_var_Buf1   = -1
x300161_var_Buf2   = -1 
x300161_var_FarScriptId	= 300160
x300161_var_BuffId        = 7650





function x300161_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x300161_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300161_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300161_ProcConditionCheck( varMap, varPlayer )
		if IsNewServer()==1 then
	--		if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 60 then
	--				Msg2Player(varMap,varPlayer,"很抱歉，等级排行榜最后一名玩家未到60级，无法使用轩尼诗理查",8,3)
       --		return 0
    --	end
    end
    
    if GetImpactContinuanceByDataIndex( varMap, varPlayer, x300161_var_BuffId) - GetImpactContinuanceElapsed( varMap, varPlayer, x300161_var_BuffId) > 35400000 then
        Msg2Player( varMap, varPlayer, "已经达到累加上限，不能继续使用轩尼诗理查", 8, 3)
        return 0
    end
    if IsHaveSpecificImpact( varMap, varPlayer, 7649) == 1 then
        Msg2Player( varMap, varPlayer, "您身上有相同类型的状态，请等路易十三消失后再使用！", 8, 3)
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






function x300161_ProcDeplete( varMap, varPlayer )
 	if DepletingUsedItem(varMap, varPlayer) == 1 then
 		LuaCallNoclosure(x300161_var_FarScriptId, "ProcUseItem", varMap, varPlayer, x300161_var_BuffId)
		return 1;
	end
	
	return 0;
	
end








function x300161_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x300161_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x300161_var_Buf1, 0);
	end
	return 1;
end







function x300161_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
