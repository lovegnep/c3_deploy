





x300371_var_FileId 		= 300371  

x300371_var_LevelMin		=	90

x300371_var_rand		= 12

x300371_var_num		= 12

x300371_var_item		=	{
									{ varItem = 11000850, varNum = 1, rand1 = 1, rand2 = 2 },
									{ varItem = 11000851, varNum = 1, rand1 = 2, rand2 = 3 },
									{ varItem = 11000852, varNum = 1, rand1 = 3, rand2 = 4 },
									{ varItem = 11000853, varNum = 1, rand1 = 4, rand2 = 5 },
									{ varItem = 11000854, varNum = 1, rand1 = 5, rand2 = 6 },
									{ varItem = 11000855, varNum = 1, rand1 = 6, rand2 = 7 },
									{ varItem = 11000856, varNum = 1, rand1 = 7, rand2 = 8 },
									{ varItem = 11000857, varNum = 1, rand1 = 8, rand2 = 9 },
									{ varItem = 11000860, varNum = 1, rand1 = 9, rand2 = 10 },
									{ varItem = 11000861, varNum = 1, rand1 = 10, rand2 = 11 },
									{ varItem = 11000862, varNum = 1, rand1 = 11, rand2 = 12 },
									{ varItem = 11000863, varNum = 1, rand1 = 12, rand2 = 13 },	
						}



function x300371_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x300371_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300371_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300371_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x300371_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x300371_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x300371_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)	
	local suiji = random(1,x300371_var_rand)
	
	for varI = 1,x300371_var_num do
		if suiji >= x300371_var_item[varI].rand1 and suiji < x300371_var_item[varI].rand2 then
			StartItemTask(varMap)
			
			if IsItemBind(varMap,varPlayer,varBagIdx) == 0 then
				ItemAppend( varMap, x300371_var_item[varI].varItem, x300371_var_item[varI].varNum )
			else
				ItemAppendBind( varMap,x300371_var_item[varI].varItem, x300371_var_item[varI].varNum )
			end
			
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"物品栏已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
				break
		end
	end 
end







function x300371_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
