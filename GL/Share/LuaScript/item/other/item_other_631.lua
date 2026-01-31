





x418631_var_FileId 		= 418631

x418631_var_LevelMin		=	1





function x418631_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418631_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418631_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418631_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418631_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418631_ProcActivateOnce( varMap, varPlayer, varImpact )

				if(DepletingUsedItem(varMap, varPlayer)) == 1 then
					local varXp = 100000			
					AddExp(varMap, varPlayer, varXp)
					Msg2Player(varMap,varPlayer,format("您获得了%d点经验", varXp),8,3)
					Msg2Player(varMap,varPlayer,format("您获得了%d点经验", varXp),8,2)
				else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"使用物品异常！")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
				end

end







function x418631_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
