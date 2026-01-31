
--DECLARE_QUEST_INFO_START--

x800206_var_FileId = 800206







x800206_var_QuestName="【国家】申请皇帝"

--DECLARE_QUEST_INFO_STOP--



function x800206_ProcEventEntry( varMap, varPlayer, varTalknpc )	

	StartTalkTask(varMap)
	
	local Readme_1 = "#Y【国家】申请皇帝#W#r #r"
	
	local Readme_2 = "\t成吉思汗中，想要成为皇帝必须要满足四个条件：#r #r"
	
	local Readme_3 = "  1，您身上的#G现银#W不少于#G50两#W。#r #r"
	
                local Readme_4 = "  2，您必须是某个#G帮会#W的#G帮主#W。#r #r"
	
	local Readme_5 = "  3，您的#G帮会等级#W必须大于#G1级#W。#r #r"
	
	local Readme_6 = "  4，您的#G帮会人数#W必须大于#G1人#W。#r #r"
	
	local Readme_7 = "您是否决定要申请皇帝？"
	
	local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5..Readme_6..Readme_7
	
	TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkMenu(varMap,varPlayer,varTalknpc);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x800206_var_FileId, -1 )
	
end




function x800206_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x800206_var_FileId,x800206_var_QuestName,3)

end





function x800206_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	
	--if GetMoney(varMap, varPlayer, 0) < 50000 then
       -- StartTalkTask(varMap);
        --TalkAppendString(varMap, "现银不足50两，不能申请皇帝");
        --StopTalkTask();
        --DeliverTalkTips(varMap, varPlayer);	
		--return 0		
	--end
	
	
	if GetGuildOfficial(varMap, varPlayer) ~= 5 then
        StartTalkTask(varMap);
        TalkAppendString(varMap, "不是帮主，不能申请皇帝");
        StopTalkTask();
        DeliverTalkTips(varMap, varPlayer);	
		return 0		
	end
	
	local guildID = GetGuildID(varMap, varPlayer)
	if guildID == -1 then
		return 0
	end
	
	local nLevel, varCount, nExp = GetGuildSimpleData(guildID)
	
	if nLevel<1 then
        StartTalkTask(varMap);
        TalkAppendString(varMap, "帮会等级小于1级，不能申请皇帝");
        StopTalkTask();
        DeliverTalkTips(varMap, varPlayer);	
		return 0		
	end
	
	
	if varCount<1 then
        StartTalkTask(varMap);
        TalkAppendString(varMap, "帮会成员不足1人，不能申请皇帝");
        StopTalkTask();
        DeliverTalkTips(varMap, varPlayer);	
		return 0		
	end




	return 1
end




function x800206_ProcAccept( varMap, varPlayer )
	--ApplyKing(varMap, varPlayer)
CreateEmperor(varMap, varPlayer, 1)
end




function x800206_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800206_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800206_CheckSubmit( varMap, varPlayer )

end




function x800206_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800206_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800206_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800206_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
