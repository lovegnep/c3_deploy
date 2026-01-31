
--高级经验符





x418566_var_FileId 		= 418566

x418566_var_LevelMin		=	1





function x418566_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418566_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418566_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418566_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418566_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418566_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	

		if(DepletingUsedItem(varMap, varPlayer)) == 1 then

			local varLevel = GetLevel( varMap, varPlayer)
			local varXp = 30000
								
				
			AddExp(varMap, varPlayer, varXp)
			GamePlayScriptLog(varMap, varPlayer, 2511)
			Msg2Player(varMap,varPlayer,format("你获得了%d点经验", varXp),4,3)
			Msg2Player(varMap,varPlayer,format("你获得了%d点经验", varXp),4,2)

   		GamePlayScriptLog( varMap, varPlayer, 3049)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end

end







function x418566_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
