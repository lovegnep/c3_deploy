





x800010_var_FileId 			= 800010
x800010_var_QuestName		= "出师"
x800010_var_LevelMin			= 40
x800010_var_ItemId				= 10280001
x800010_var_MoralPoint		= 100
x800010_var_MoralPointUp	= 1000
x800010_var_LevelOver			= 45
x800010_var_FriendLess		= 300







x800010_CHAT_TYPE_NORMAL	= 0
x800010_CHAT_TYPE_SYSTEM	= 4

x800010_OK									= 0
x800010_ERROR_UNKNOWN				= -1
x800010_FAILED_TEAM					= 1
x800010_FAILED_LEVEL				= 2
x800010_FAILED_MASTER				= 3
x800010_FAILED_BAG_MASTER		= 4
x800010_FAILED_BAG_PRENTICE	= 5







function x800010_IsCanChuShi(varMap, varPlayer)

	if (GetTeamSize(varMap, varPlayer) ~= 2) then
		return x800010_FAILED_TEAM;
	end

	
	local varTalknpc = GetTeamSceneMember(varMap, varPlayer, 0);
	
	if IsMaster(varMap, varTalknpc, varPlayer) ~= 1 then
		return x800010_FAILED_MASTER;
	end
	
	if GetLevel(varMap, varTalknpc) < x800010_var_LevelMin then
		return x800010_FAILED_LEVEL;
	end
	
	
	if (GetItemIsEmpty(varMap, varPlayer) == -1) then
		return x800010_FAILED_BAG_MASTER;
	end
		
	if (GetItemIsEmpty(varMap, varTalknpc) == -1) then
		return x800010_FAILED_BAG_PRENTICE;
	end
	
	return x800010_OK;

end







function x800010_DoChuShi(varMap, varPlayer, varTalknpc)

	local varRet = x800010_SafeChuShiCheck(varMap, varPlayer, varTalknpc, 1);

	if varRet ~= x800010_OK then
		return varRet;
	end
	
	
	local varTalknpc = GetTeamSceneMember(varMap, varPlayer, 0);
	
	
	if (TryRecieveItem(varMap, varPlayer, x800010_var_ItemId, 1) == -1) then
		return x800010_FAILED_BAG_MASTER;
	end
	
	if (TryRecieveItem(varMap, varTalknpc, x800010_var_ItemId, 1) == -1) then
		return x800010_FAILED_BAG_PRENTICE;
	end
	
	FinishAprentice(varMap, varTalknpc, varPlayer);	
	
	
	local point = GetMasterMoralPoint(varMap, varPlayer);
	
	
	point = point + x800010_var_MoralPoint;
	SetMasterMoralPoint(varMap, varPlayer, point);
	
	
	local Msg = format(" 出师完成！\n 你得到出师糖豆一个。\n 得到师德点数%d。", x800010_var_MoralPoint);
	
	
	if point >= x800010_var_MoralPointUp then
		
		
		Msg = format("%s\n 获得称号%s", Msg, "称号名");
	end

	Msg2Player(varMap, varPlayer, Msg, x800010_CHAT_TYPE_NORMAL);
	
	
	
	Msg = format("出师完成！\n 你得到出师糖豆一个。\n 获得称号：%s之徒。", GetName(varMap, varPlayer));
	Msg2Player(varMap, varTalknpc, Msg, x800010_CHAT_TYPE_NORMAL);
	
	if GetLevel(varMap, varPlayer) < x800010_var_LevelOver or GetFriendPoint(varMap, varPlayer, varTalknpc) < x800010_var_FriendLess then
		
		
		local Msg = format("出师完成！\n 由于友好度不到%d或者徒弟等级大于%d级，没有奖励。", x800010_var_FriendLess, x800010_var_LevelOver);
		Msg2Player(varMap, varPlayer, Msg, x800010_CHAT_TYPE_NORMAL);
		
		Msg2Player(varMap, varTalknpc, Msg, x800010_CHAT_TYPE_NORMAL);
	end	
	
	return x800010_OK;

end







function x800010_SafeChuShiCheck(varMap, varPlayer, varTalknpc, bDirect)

	local varRet 	= x800010_IsCanChuShi(varMap, varPlayer);
	local varStr 	= "顺利出师。";
	
	if varRet == x800010_OK then
		varStr = "确定要出师？";
	
	elseif varRet == x800010_FAILED_TEAM then
		varStr = "需要师徒二人组队来找我。";
	
	elseif varRet == x800010_FAILED_LEVEL then
		varStr = format("徒弟等级达到%d级才能出师。", x800010_var_LevelMin);
	
	elseif varRet == x800010_FAILED_MASTER then
		varStr = "你们不是师徒关系。";
	
	elseif varRet == x800010_FAILED_BAG_MASTER then
		varStr = format("%s必须有一个背包空位。", varPlayer);
		
	elseif varRet == x800010_FAILED_BAG_PRENTICE then
		local varTalknpc = GetTeamSceneMember(varMap, varPlayer, 0);
		varStr = format("%s必须有一个背包空位。", varTalknpc);
	
	end
	
	if varRet == x800010_OK and bDirect == 1 then
		return varRet;
	end
	
	StartTalkTask(varMap);
	
		TalkAppendString(varMap, varStr);
	
	StopTalkTask();

	if varRet == x800010_OK then
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x800010_var_FileId);
	else
		DeliverTalkMenu(varMap, varPlayer, varTalknpc);
	end
	
	return varRet;
	
end







function x800010_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x800010_var_FileId, x800010_var_QuestName);
end







function x800010_ProcEventEntry(varMap, varPlayer, varTalknpc)

	x800010_SafeChuShiCheck(varMap, varPlayer, varTalknpc, 0);
	
end







function x800010_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	return 1;

end







function x800010_ProcAccept(varMap, varPlayer, varTalknpc)

	local varRet = x800010_DoChuShi(varMap, varPlayer, varTalknpc);
		
	if varRet == x800010_OK then
		return
	end

end
