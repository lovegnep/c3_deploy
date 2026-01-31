





x930138_var_FileId 		= 930138 
x930138_var_FileItemId 		= 12274010

x930138_var_LevelMin		=	30
x930138_var_exp		=	100






function x930138_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x930138_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x930138_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x930138_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x930138_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x930138_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x930138_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	if GetGuildID( varMap, varPlayer ) == -1 then	
		StartTalkTask(varMap)
		TalkAppendString(varMap,"没有帮会无法使用该礼包")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end	


	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		AddGuildExp(varMap,varPlayer,x930138_var_exp)
		Msg2Player(varMap,varPlayer,format("您获得了%d点帮会经验", x930138_var_exp),4,3)
		Msg2Player(varMap,varPlayer,format("您获得了%d点帮会经验", x930138_var_exp),4,2)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"使用物品异常！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end
function x930138_Procautouseguildbao( varMap, varPlayer )


	if GetLevel(varMap, varPlayer)< x930138_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	if GetGuildID( varMap, varPlayer ) == -1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"没有帮会无法使用该礼包")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end


    local Num = GetItemCount( varMap, varPlayer, x930138_var_FileItemId )
    if Num > 0 then
        if DelItem(varMap,varPlayer,x930138_var_FileItemId,Num) == 1 then
            if GetGuildID( varMap, varPlayer ) ~= -1 then
                AddGuildExp(varMap,varPlayer,x930138_var_exp*Num)
                Msg2Player(varMap,varPlayer,format("您获得了%d点帮会经验", x930138_var_exp*Num),4,3)
                Msg2Player(varMap,varPlayer,format("您获得了%d点帮会经验", x930138_var_exp*Num),4,2)
            end

        end
    end

end







function x930138_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
