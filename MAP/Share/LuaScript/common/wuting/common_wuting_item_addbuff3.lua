
x300170_var_FileId  = 300170
x300170_var_Buf1   = -1
x300170_var_Buf2   = -1 
x300170_var_FarScriptId	= 300160
x300170_var_BuffId        = 7648





function x300170_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x300170_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300170_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300170_ProcConditionCheck( varMap, varPlayer )
		if IsNewServer()==1 then
	--		if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 60 then
	--				Msg2Player(varMap,varPlayer,"很抱歉，等级排行榜最后一名玩家未到60级，无法使用芝华士",8,3)
      -- 		return 0
    --	end
    end
    
    if GetImpactContinuanceByDataIndex( varMap, varPlayer, x300170_var_BuffId) - GetImpactContinuanceElapsed( varMap, varPlayer, x300170_var_BuffId) > 35400000 then
        Msg2Player( varMap, varPlayer, "已经达到累加上限，不能继续使用芝华士了", 8, 3)
        return 0
    end
    if IsHaveSpecificImpact( varMap, varPlayer, 7647) == 1 then
        Msg2Player( varMap, varPlayer, "您身上有相同类型的状态，请等杰克丹尼消失后再使用！", 8, 3)
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






function x300170_ProcDeplete( varMap, varPlayer )
 	if DepletingUsedItem(varMap, varPlayer) == 1 then
 		LuaCallNoclosure(x300170_var_FarScriptId, "ProcUseItem", varMap, varPlayer, x300170_var_BuffId)
		return 1;
	end
	
	return 0;
	
end








function x300170_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x300170_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x300170_var_Buf1, 0);
	end
	return 1;
end







function x300170_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
