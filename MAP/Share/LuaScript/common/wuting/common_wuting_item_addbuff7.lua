
x300175_var_FileId  = 300175
x300175_var_Buf1   = -1
x300175_var_Buf2   = -1 
x300175_var_FarScriptId	= 300160
x300175_var_BuffId        = 7645





function x300175_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x300175_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300175_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300175_ProcConditionCheck( varMap, varPlayer )
    
        
        
        
        
        
    
        
        if GetImpactContinuanceByDataIndex( varMap, varPlayer, x300175_var_BuffId) - GetImpactContinuanceElapsed( varMap, varPlayer, x300175_var_BuffId) > 35400000 then
            Msg2Player( varMap, varPlayer, "已经达到累加上限，不能继续使用哈瓦那雪茄", 8, 3)
            return 0
        end
        if IsHaveSpecificImpact( varMap, varPlayer, 7665) == 1 then
            Msg2Player( varMap, varPlayer, "您身上有相同类型的状态，请等精品哈瓦那雪茄消失后再使用！", 8, 3)
            return 0
        end
        
            
			
            
        

        return 1
    
end






function x300175_ProcDeplete( varMap, varPlayer )
 	if DepletingUsedItem(varMap, varPlayer) == 1 then
 		LuaCallNoclosure(x300175_var_FarScriptId, "ProcUseItem", varMap, varPlayer, x300175_var_BuffId)
		return 1;
	end
	
	return 0;
	
end








function x300175_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x300175_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x300175_var_Buf1, 0);
	end
	return 1;
end







function x300175_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
