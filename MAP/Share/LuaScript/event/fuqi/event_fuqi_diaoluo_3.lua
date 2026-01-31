





x300392_var_FileId = 300392






function x300392_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x300392_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300392_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300392_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end

	if GetTiredTime( varMap, varPlayer) >= 480 then
        Msg2Player( varMap, varPlayer, "您处于疲劳状态，无法再次使用喜酒", 8, 3)
        return 0
    end
	
	return 1; 
end







function x300392_ProcDeplete( varMap, varPlayer )
	return 1;
end








function x300392_ProcActivateOnce( varMap, varPlayer, varImpact )
	local varLevel = GetLevel(varMap, varPlayer)
	local xijiu = varLevel*1500; 
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		AddExp(varMap, varPlayer, xijiu);
		IncreaseTiredTime( varMap, varPlayer, 15)
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您使用了喜酒");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您使用了喜酒，获得"..xijiu.."点经验",CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
	end
end







function x300392_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
