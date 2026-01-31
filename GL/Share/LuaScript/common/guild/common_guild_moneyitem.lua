


x300673_var_FileId 		= 300673 

x300673_var_ItemID		= 13030128

x300673_var_QuestId		= 7026
x300673_var_QuestId1	= 7027
x300673_var_QuestId2	= 7028
x300673_var_QuestId3	= 7029




function x300673_ProcEventEntry( varMap, varPlayer, varBagIdx )

	if IsHaveQuestNM( varMap, varPlayer, x300673_var_QuestId ) == 1 then	
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300673_var_QuestId)
		local nMoney = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
		local varMsg = "帮会银票内的金钱数额：#G"..nMoney
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		Msg2Player(varMap,varPlayer,varMsg,8,2)	
		return	
	elseif IsHaveQuestNM( varMap, varPlayer, x300673_var_QuestId1 ) == 1 then	
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300673_var_QuestId1)
		local nMoney = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
		local varMsg = "帮会银票内的金钱数额：#G"..nMoney
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		Msg2Player(varMap,varPlayer,varMsg,8,2)	
		return	
	elseif IsHaveQuestNM( varMap, varPlayer, x300673_var_QuestId2 ) == 1 then	
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300673_var_QuestId2)
		local nMoney = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
		local varMsg = "帮会银票内的金钱数额：#G"..nMoney
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		Msg2Player(varMap,varPlayer,varMsg,8,2)	
		return	
	elseif IsHaveQuestNM( varMap, varPlayer, x300673_var_QuestId3 ) == 1 then	
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300673_var_QuestId3)
		local nMoney = GetQuestParam( varMap, varPlayer, varQuestIdx, 0)
		local varMsg = "帮会银票内的金钱数额：#G"..nMoney
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		Msg2Player(varMap,varPlayer,varMsg,8,2)	
		return	
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap, "\t你还没有接受帮会跑商任务");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		Msg2Player(varMap,varPlayer,"你还没有接受帮会跑商任务",8,2)	
		return
	end

end

function x300673_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end
