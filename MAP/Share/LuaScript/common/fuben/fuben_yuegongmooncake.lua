





x700138_var_FileId 		= 700138 

x700138_var_LevelMin		=	1

x700138_var_QuestId 				= 	1700




function x700138_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x700138_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x700138_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x700138_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x700138_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x700138_ProcActivateOnce( varMap, varPlayer, varImpact )
	

	if IsHaveSpecificImpact( varMap, varPlayer, 7588) == 1 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		DispelSpecificImpact( varMap, varPlayer, 7588 )
			StartTalkTask(varMap)
			TalkAppendString(varMap,"成功解除了月兔魔咒")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
			
			else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"你身上并没有月兔诅咒")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 0 
	end

end




 


function x700138_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
