





x418612_var_FileId 		= 418612 

x418612_var_LevelMin		=	1






function x418612_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418612_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418612_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418612_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418612_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418612_ProcActivateOnce( varMap, varPlayer, varImpact )

				if(DepletingUsedItem(varMap, varPlayer)) == 1 then
					local varShengWang = GetShengWang( varMap, varPlayer )
					
					varShengWang = varShengWang + 300
					SetShengWang( varMap, varPlayer, varShengWang )
					Msg2Player(varMap,varPlayer,format("您获得了%d点声望", 300),8,3)
					Msg2Player(varMap,varPlayer,format("您获得了%d点声望", 300),8,2)
					
				else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"使用物品异常！")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
				end

end







function x418612_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
