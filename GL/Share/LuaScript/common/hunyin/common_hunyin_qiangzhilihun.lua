
x800008_var_FileId 					= 800008
x800008_var_QuestName				= "【婚姻】我要离婚"
x800008_var_CostMoneyDivorce  = 50000
x800008_var_CostMoneyType  		= 0
x800008_var_FriendPointNotify	= 100
x800008_var_SkillID						= 149
x800008_var_Buf						= 7642

function x800008_DoDivorce(varMap, varPlayer, varTalknpc)

	local varRet = x800008_SafeDivorceCheck(varMap, varPlayer);
	if varRet ~= nil then
		Msg2Player(varMap,varPlayer,varRet,8,2)
		StartTalkTask(varMap);
		TalkAppendString(varMap, varRet);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return
	end
	
	if CostMoney(varMap, varPlayer, x800008_var_CostMoneyType, x800008_var_CostMoneyDivorce,305) == -1 then
		return
	end
	
	local targetGUId = GetSpouseGUID(varMap, varPlayer);
	local spouseName = GetFriendName(varMap, varPlayer, targetGUId)
	
	local mail = format("%s与您解除了夫妻关系。",GetName(varMap, varPlayer));
	SendSystemPost(varMap, spouseName, mail);
	
	
	SendScriptPost( varMap, spouseName, MAIL_REPUDIATE, GetGUID(varMap, varPlayer), 0, 0, varPlayer )
	
	varRet = format("您解除了与%s的夫妻关系。", spouseName)
	Msg2Player(varMap,varPlayer,varRet,8,2)
	StartTalkTask(varMap);
	TalkAppendString(varMap, varRet);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
		
	
	Divorce(varMap, varPlayer);
	
	for varI , varQuest in SPOUSE_TASK do
		if varQuest == SPOUSE_TASK[2] and 1 == IsHaveQuest(varMap, varPlayer, varQuest) and GetSex(varMap, varPlayer) == 1 then			
			local varBusID  =  GetBusId(varMap, varPlayer)
			if varBusID ~= -1 then
				DeleteBus(varMap, varBusID,1)
			end
		end
		if varQuest == SPOUSE_TASK[3] and 1 == IsHaveQuest(varMap, varPlayer, varQuest) then
			if DelItem(varMap, varPlayer, SPOUSE_TASK_POSITION_USE_ITEM, 1) ~= 1 then return 0 end
		end
		if 1 == IsHaveQuest(varMap, varPlayer, varQuest) then
			DelQuestNM( varMap, varPlayer, varQuest )
		end
	end
	
end







function x800008_SafeDivorceCheck(varMap, varPlayer)

	if IsMarried(varMap, varPlayer) ~= 1 then
		return "你没有结婚，就想离婚么？"
	end
	
	if GetMoney(varMap, varPlayer, x800008_var_CostMoneyType) < x800008_var_CostMoneyDivorce then
		return format("很抱歉，您包裹中的银子不足%d两现银，无法进行离婚。", tonumber(x800008_var_CostMoneyDivorce/1000))
	end	
	
	if IsHaveSpecificImpact(varMap, varPlayer, x800008_var_Buf) == 1 then
		return "很抱歉，您正在举行婚礼中，您的离婚请求被终止。"
	end
		
	return nil
end







function x800008_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x800008_var_FileId, x800008_var_QuestName,3);
end







function x800008_ProcEventEntry(varMap, varPlayer, varTalknpc)
	
	StartTalkTask(varMap);
		TalkAppendString(varMap, "#Y【婚姻】我要离婚");
		TalkAppendString(varMap, "\t十年修得同船渡，百年修得共枕眠。请珍惜你们的缘分，但是如果真的无法挽回，给我#G50两现银#W我可以帮您解除婚姻关系！#r你确定要离婚吗？");
	StopTalkTask();
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x800008_var_FileId,-1);
	
end







function x800008_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	return 1;

end







function x800008_ProcAccept(varMap, varPlayer, varTalknpc)

	x800008_DoDivorce(varMap, varPlayer, varTalknpc);

end
