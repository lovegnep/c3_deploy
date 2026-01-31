





x417006_var_FileId 		= 417006 
x417006_var_FileItemId 		= 12030204







function x417006_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x417006_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x417006_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x417006_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x417006_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x417006_ProcActivateOnce( varMap, varPlayer, varImpact )

	
	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		local varShengWang = 100
		local nOldValue = GetShengWang( varMap, varPlayer )
		SetShengWang( varMap, varPlayer, nOldValue+varShengWang )
		Msg2Player(varMap,varPlayer,"获得声望"..varShengWang.."点！",8,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end


function x417006_Procautouseshengwang( varMap, varPlayer )





    local Num = GetItemCount( varMap, varPlayer, x417006_var_FileItemId )
    if Num > 0 then
        if DelItem(varMap,varPlayer,x417006_var_FileItemId,Num) == 1 then
            local varShengWang = 100*Num
            local nOldValue = GetShengWang( varMap, varPlayer )
            SetShengWang( varMap, varPlayer, nOldValue+varShengWang )
            Msg2Player(varMap,varPlayer,"获得声望"..varShengWang.."点！",8,2)

        end
    end

end





function x417006_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
