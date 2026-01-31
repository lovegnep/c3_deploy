
x300177_var_FileId  = 300177
x300177_var_Buf1   = -1
x300177_var_Buf2   = -1 
x300177_var_FarScriptId	= 300160
x300177_var_BuffId        = 7644





function x300177_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x300177_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300177_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300177_ProcConditionCheck( varMap, varPlayer )
    
        
        
        
        
        
    
        
        if GetImpactContinuanceByDataIndex( varMap, varPlayer, x300177_var_BuffId) - GetImpactContinuanceElapsed( varMap, varPlayer, x300177_var_BuffId) > 35400000 then
            Msg2Player( varMap, varPlayer, "已经达到累加上限，不能继续使用黑雪茄", 8, 3)
            return 0
        end
        if IsHaveSpecificImpact( varMap, varPlayer, 7645) == 1 then
            Msg2Player( varMap, varPlayer, "您身上有相同类型的状态，请等哈瓦那雪茄消失后再使用！", 8, 3)
            return 0
        end
        
            
			
            
        

        return 1
    
end






function x300177_ProcDeplete( varMap, varPlayer )
 	if DepletingUsedItem(varMap, varPlayer) == 1 then
 		LuaCallNoclosure(x300177_var_FarScriptId, "ProcUseItem", varMap, varPlayer, x300177_var_BuffId)
		return 1;
	end
	
	return 0;
	
end








function x300177_ProcActivateOnce( varMap, varPlayer )
	if(-1~=x300177_var_Buf1) then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x300177_var_Buf1, 0);
	end
	return 1;
end







function x300177_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
