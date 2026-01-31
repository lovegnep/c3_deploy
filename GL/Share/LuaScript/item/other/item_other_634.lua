





x418634_var_FileId 		= 418634

x418634_var_LevelMin		=	1





function x418634_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418634_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418634_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418634_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418634_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418634_ProcActivateOnce( varMap, varPlayer, varImpact )

				if(DepletingUsedItem(varMap, varPlayer)) == 1 then		
					local varLevel = GetLevel( varMap, varPlayer)
					local varXp = 360000					
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







function x418634_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
