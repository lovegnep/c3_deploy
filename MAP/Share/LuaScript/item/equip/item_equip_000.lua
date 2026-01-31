













x415000_var_FileId = 415000 
x415000_var_QuestId = 3004



x415000_var_Buf1 = 8001 
x415000_var_Buf2 = -1 




function x415000_ProcEventEntry( varMap, varPlayer, Pos,OPType )
local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x415000_var_QuestId )
		if IsHaveQuest(varMap,varPlayer, x415000_var_QuestId) > 0 then
			if OPType ==0 then
				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
			elseif OPType ==1 then
				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
			end
		end

end






function x415000_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x415000_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x415000_ProcConditionCheck( varMap, varPlayer )
	
	
		
	
	
end







function x415000_ProcDeplete( varMap, varPlayer )
	
		
	
	
end








function x415000_ProcActivateOnce( varMap, varPlayer )
	
		
	
	
end







function x415000_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
