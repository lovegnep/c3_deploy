













x416000_var_FileId = 416000 
x416000_var_QuestId ={3209,3309,3409,3709}



x416000_var_Buf1 = 8001 
x416000_var_Buf2 = -1 




function x416000_ProcEventEntry( varMap, varPlayer, varBagIdx,torf )
if IsHaveQuest(varMap,varPlayer, x416000_var_QuestId[1]) > 0 then
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x416000_var_QuestId[1] )
	if torf == 0 then
				if GetHorseCount(varMap,varPlayer) > 0 then
						if IsHaveMount(varMap, varPlayer,1) > 0 then
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
							 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,11) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
								LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,21) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,31) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
							  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,41) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
							 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,51) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
								LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
						end
				end
	elseif torf == 1 then
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
	end
end
if IsHaveQuest(varMap,varPlayer, x416000_var_QuestId[2]) > 0 then
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x416000_var_QuestId[2] )
	if torf == 0 then
				if GetHorseCount(varMap,varPlayer) > 0 then
						if IsHaveMount(varMap, varPlayer,1) > 0 then
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
							 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,11) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
								LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,21) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,31) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
							  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,41) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
							 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,51) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
								LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
						end
				end
	elseif torf == 1 then
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
	end
end
if IsHaveQuest(varMap,varPlayer, x416000_var_QuestId[3]) > 0 then
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x416000_var_QuestId[3] )
	if torf == 0 then
				if GetHorseCount(varMap,varPlayer) > 0 then
						if IsHaveMount(varMap, varPlayer,1) > 0 then
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
							 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,11) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
								LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,21) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,31) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
							  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,41) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
							 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,51) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
								LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
						end
				end
	elseif torf == 1 then
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
	end
end
if IsHaveQuest(varMap,varPlayer, x416000_var_QuestId[4]) > 0 then
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x416000_var_QuestId[4] )
	if torf == 0 then
				if GetHorseCount(varMap,varPlayer) > 0 then
						if IsHaveMount(varMap, varPlayer,1) > 0 then
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
							 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,11) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
								LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,21) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
						   LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,31) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
							  LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,41) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
							 LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
				    elseif IsHaveMount(varMap, varPlayer,51) > 0 then
				    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
								LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,14,0 )
						end
				end
	elseif torf == 1 then
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
								SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
	end
end


end






function x416000_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x416000_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x416000_ProcConditionCheck( varMap, varPlayer )
	
	
		
	
	
end







function x416000_ProcDeplete( varMap, varPlayer )
	
		
	
	
end








function x416000_ProcActivateOnce( varMap, varPlayer )
	
		
	
	
end







function x416000_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
