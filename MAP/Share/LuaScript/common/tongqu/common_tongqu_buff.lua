












x300321_var_FileId = 300321 
x300321_var_QuestList = { 8066, 8074, 8067, 8068, 8069,8070, 8071, 8072, 8073 }



function x300321_ProcEventEntry( varMap, varPlayer, varIndex, sign )
	if sign==1 then
		CancelSpecificImpact(varMap, varPlayer,7534)
		ClearMutexState(varMap, varPlayer, 21)

		local varQuest = -1
		for varI, item in x300321_var_QuestList do
			if IsHaveQuestNM( varMap, varPlayer, item ) > 0 then
				varQuest = item
				break
			end
		end

		if varQuest == -1 then
			return
		end

		local varRet = 0
		varRet = DelQuestNM( varMap, varPlayer, varQuest )
		if varRet == 1 then
			
			local ItemCnt = GetItemCount( varMap, varPlayer, 13013500 )
			if ItemCnt > 0 then 
				if DelItem(varMap, varPlayer,13013500, 1) ~= 1 then return 0 end
			end

			ItemCnt = GetItemCount( varMap, varPlayer, 13013501 )
			if ItemCnt > 0 then 
				if DelItem(varMap, varPlayer,13013501, 1) ~= 1 then return 0 end
			end

			local message ="巫术已经失效，任务失败"
			StartTalkTask(varMap);
			TalkAppendString(varMap, message);
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
		end
	end
end






function x300321_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300321_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300321_ProcConditionCheck( varMap, varPlayer )
	
	
		
	
	return 1; 
end







function x300321_ProcDeplete( varMap, varPlayer )
	
		
	
	return 1;
end








function x300321_ProcActivateOnce( varMap, varPlayer )
	
		
	
	return 1;
end







function x300321_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
