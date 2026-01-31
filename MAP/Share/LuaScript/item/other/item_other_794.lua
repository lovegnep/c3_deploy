





x418794_var_FileId 		= 418794

x418794_var_LevelMin		=	1






function x418794_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418794_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418794_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418794_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418794_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418794_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

	
					if(DepletingUsedItem(varMap, varPlayer)) == 1 then
					AddMingWang(varMap, varPlayer,50000)
					Msg2Player(varMap,varPlayer,format("您获得了%d点灵力值", 50000),8,3)
					Msg2Player(varMap,varPlayer,format("您获得了%d点灵力值", 50000),8,2)
					
				else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"使用物品异常！")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
				end


			end







function x418794_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
