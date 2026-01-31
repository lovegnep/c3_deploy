





x400216_var_FileId = 400216 
x400216_var_Buf1 = 3001 

function x400216_ProcEventEntry( varMap, varPlayer, varBagIdx )
			LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem", varMap, varPlayer, varBagIdx, x400216_var_Buf1 )
			if GetItemCount(varMap,varPlayer,13020412) == 0 then
						local talknpc =FindMonsterByGUID( varMap,112027)
						if IsObjValid (varMap,talknpc) == 1 then
								NpcTalk(varMap, talknpc, "万岁！！成吉思汗万岁！", -1)
						end
						local talknpc2 =FindMonsterByGUID( varMap,112028)
						if IsObjValid (varMap,talknpc2) == 1 then
								NpcTalk(varMap, talknpc2, "万民之主成吉思汗万岁！", -1)
						end
			end
	

end

function x400216_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x400216_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400216_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400216_ProcDeplete( varMap, varPlayer )

	return 0
end

function x400216_ProcActivateOnce( varMap, varPlayer )
end

function x400216_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
