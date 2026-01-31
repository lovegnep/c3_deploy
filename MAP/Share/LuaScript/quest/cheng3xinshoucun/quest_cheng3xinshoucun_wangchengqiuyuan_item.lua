





x203378_var_FileId = 203378 
x203378_var_Buf1 = 7520 
x203378_var_QuestId = 3212
x203378_var_itemID = 13810501

function x203378_ProcEventEntry( varMap, varPlayer, varBagIdx )
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203378_var_QuestId)
	local queststate = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)

	if queststate < 1 then
		Msg2Player(varMap, varPlayer, "请先前往指定区域再使用", 0, 3)
		return
	end
	if x203378_var_Buf1 ~= -1 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x203378_var_Buf1, 0);
	end
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203377_var_QuestId)
	SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,2)
	Msg2Player(varMap, varPlayer, "一道明亮的焰火在空中炸开", 0, 3)
	if DelItem(varMap, varPlayer,x203378_var_itemID,1) ~=1 then return end
	SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	SetViewGroup(varMap, varPlayer,5)
	
end

function x203378_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	
end

function x203378_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x203378_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x203378_ProcDeplete( varMap, varPlayer )

	return 0
end

function x203378_ProcActivateOnce( varMap, varPlayer )
end

function x203378_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
