





x418799_var_FileId 		= 418799

x418799_var_LevelMin		=	1






function x418799_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418799_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418799_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418799_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418799_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418799_ProcActivateOnce( varMap, varPlayer, varImpact )
	
				if GetLevel(varMap, varPlayer) <70 then
					Msg2Player(varMap,varPlayer,"等级不足70级，无法获得灵力",8,3)
					Msg2Player(varMap,varPlayer,"等级不足70级，无法获得灵力",8,2)
					return
				end
	
				if(DepletingUsedItem(varMap, varPlayer)) == 1 then
					AddMingWang(varMap, varPlayer,100)
					Msg2Player(varMap,varPlayer,format("您获得了%d点灵力值", 100),8,3)
					Msg2Player(varMap,varPlayer,format("您获得了%d点灵力值", 100),8,2)
					
				else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"使用物品异常！")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
				end


			end







function x418799_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
