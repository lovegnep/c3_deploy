





x310834_var_FileId = 310834






function x310834_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x310834_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x310834_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x310834_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end

	if GetTiredTime( varMap, varPlayer) >= 480 then
        Msg2Player( varMap, varPlayer, "您处于疲劳状态，无法再次使用爽口薄荷糖", 8, 3)
        return 0
    end
	return 1; 
end







function x310834_ProcDeplete( varMap, varPlayer )
	return 1;
end








function x310834_ProcActivateOnce( varMap, varPlayer, varImpact )
	local varLevel = GetLevel(varMap, varPlayer)
	local xiyan = varLevel*300; 
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		GamePlayScriptLog( varMap, varPlayer, 2652)
		AddExp(varMap, varPlayer, xiyan);
		IncreaseTiredTime( varMap, varPlayer, 3)
		StartTalkTask(varMap);
		TalkAppendString(varMap, "您使用了爽口薄荷糖");
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer,"您使用了爽口薄荷糖，获得"..xiyan.."点经验",CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
	end
end







function x310834_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
