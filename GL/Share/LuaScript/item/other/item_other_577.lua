
--初级经验符





x418577_var_FileId 		= 418577

x418577_var_LevelMin		=	1



 

function x418577_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418577_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418577_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418577_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418577_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418577_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	

		if(DepletingUsedItem(varMap, varPlayer)) == 1 then

			local varLevel = GetLevel( varMap, varPlayer)
			local varXp = 500
								
				
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







function x418577_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
