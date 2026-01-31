


--DECLARE_QUEST_INFO_START--
x211000_var_FileId = 211000
x211000_var_QuestName = "【帮会】创建帮会"

--DECLARE_QUEST_INFO_STOP--






function x211000_ProcEventEntry(varMap, varPlayer, varTalknpc)	

	StartTalkTask(varMap)
	
	local Readme_1 = "#Y【帮会】创建帮会#W#r #r"
	
	local Readme_2 = "创建帮会您要满足二个条件：#r #r"
	
	local Readme_3 = " 第一个条件：您的等级必须大于或等于30级。#r #r"
	
	local Readme_4 = " 第二个条件：您所拥有的现银大于或等于50两。#r #r"
	
	local Readme_5 = "您是否要创建帮会？"
	
	
	
	
	
	local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
	
	TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkMenu(varMap,varPlayer,varTalknpc);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x211000_var_FileId, -1 );
	
end









function x211000_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	local varFlag = GetMergeDBToggle()
	if varFlag==1 then
		return
	end
	
	
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
	
 	local pos = GetGuildOfficial(varMap, varPlayer)
	if pos ~= -1 then
		return
	end
		TalkAppendButton(varMap, x211000_var_FileId, x211000_var_QuestName,3)
end









function x211000_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	
	local nLevel = GetLevel(varMap, varPlayer)
	if nLevel < 30 then
        StartTalkTask(varMap);
        TalkAppendString(varMap, "很抱歉，您的等级低于30级，无法创建帮会。");
		Msg2Player(varMap, varPlayer,"很抱歉，您的等级低于30级，无法创建帮会。",8,2)
        StopTalkTask();
        DeliverTalkTips(varMap, varPlayer);	
		return 0
	end
	
	local nMoney = GetMoney(varMap, varPlayer, 0)
	if nMoney < 50000 then
        StartTalkTask(varMap);
        TalkAppendString(varMap, "很抱歉，您包裹中的现银不足50两，无法创建帮会。");
		Msg2Player(varMap, varPlayer,"很抱歉，您包裹中的现银不足50两，无法创建帮会。",8,2)
        StopTalkTask();
        DeliverTalkTips(varMap, varPlayer);		
		return 0
	end
	
	
        
        
		
        
        
		
	
	
	return 1
end






function x211000_ProcAccept(varMap, varPlayer)
	GuildCreate(varMap, varPlayer, 0)
end









function x211000_ProcQuestAbandon(varMap, varPlayer, varQuest)

end









function x211000_CheckSubmit( varMap, varPlayer, varTalknpc)

end









function x211000_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

end









function x211000_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)

end









function x211000_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)

end









function x211000_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)

end
