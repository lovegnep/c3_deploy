





x400217_var_FileId = 400217 
x400217_var_Buf1 = 3001 

function x400217_ProcEventEntry( varMap, varPlayer, varBagIdx )
			LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400217_var_Buf1 )
			if GetItemCount(varMap,varPlayer,13020412) == 0 then
						local talknpc2 =FindMonsterByGUID( varMap,112006)
						if IsObjValid (varMap,talknpc2) == 1 then
								NpcTalk(varMap, talknpc2, "拜托你不要再敲了！", -1)
						end
			end
	

end

function x400217_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400217_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400217_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400217_ProcDeplete( varMap, varPlayer )

	return 0
end

function x400217_ProcActivateOnce( varMap, varPlayer )
end

function x400217_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
