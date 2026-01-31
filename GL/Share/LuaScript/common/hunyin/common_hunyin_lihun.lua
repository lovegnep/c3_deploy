






x800007_var_FileId 					= 800007
x800007_var_QuestName				= "离婚"
x800007_var_CostMoneyUnmarry	= 55555
x800007_var_FriendPointNotify = 100
x800007_SkillId							= 149







x800007_CHAT_TYPE_NORMAL	= 0
x800007_CHAT_TYPE_SYSTEM	= 4

x800007_OK							= 0
x800007_ERROR_UNKNOWN		= -1
x800007_FAILED_CAPTAIN	= 1
x800007_FAILED_TEAM			= 2
x800007_FAILED_MARRIGE	= 3
x800007_FAILED_DISTANCE	= 4
x800007_FAILED_MONEY		= 5







function x800007_IsCanUnmarry(varMap, varPlayer) 
	
	if (IsCaptain(varMap, varPlayer)) ~= 1 then
		return x800007_FAILED_CAPTAIN;
	end

	if (GetTeamSize(varMap, varPlayer) ~= 2) then
		return x800007_FAILED_TEAM;		
	end
	
	local varTalknpc = GetTeamSceneMember(varMap, varPlayer, 0);
	
	if IsSpouses(varMap, varPlayer, varTalknpc) ~= 1 then
		return x800007_FAILED_MARRIGE;
	end
	
	if IsInDist(varMap, varPlayer,varTalknpc,10) ~= 1 then
		return x800007_FAILED_DISTANCE;		
	end
	
	local money;
	if GetSex(varMap, varPlayer) == 0 then		
		money = GetMoney(varMap, varTalknpc);
	else
		money = GetMoney(varMap, varPlayer);
	end
	
	if money < x800007_var_CostMoneyUnmarry then
		return x800007_FAILED_MONEY;
	end
	
	return x800007_OK;
	
end







function x800007_DoUnmarry(varMap, varPlayer, varTalknpc)

	local varRet = x800007_SafeUnmarryCheck(varMap, varPlayer, varTalknpc, 1);
	if varRet ~= x800007_OK then
		return varRet;
	end
	
	local varTalknpc = GetTeamSceneMember(varMap, varPlayer, 0);
	
	local ManId;
	if GetSex(varMap, varPlayer) == 1 then
		ManId = varPlayer;
	else
		ManId = varTalknpc;
	end
	
	if CostMoney(varMap, ManId, x800007_var_CostMoneyUnmarry,305) == -1 then
		return x800007_FAILED_MONEY;
	end
	
	
	SetFriendPoint(varMap, varPlayer, varTalknpc, x800007_var_FriendPointNotify);
	SetFriendPoint(varMap, varTalknpc, varPlayer, x800007_var_FriendPointNotify);
	
	
	DelSkill(varMap, varPlayer, x800007_SkillId);
	DelSkill(varMap, varTalknpc, x800007_SkillId);
	
	
	AwardSpouseTitle(varMap, varPlayer, "");
	AwardSpouseTitle(varMap, varTalknpc, "");
		
	
	local Msg = "你恢复单身了。\n 失去夫妻称号。\n 失去所有夫妻技能。";
	Msg2Player(varMap, varPlayer, Msg, x800007_CHAT_TYPE_NORMAL);
	Msg2Player(varMap, varTalknpc, Msg, x800007_CHAT_TYPE_NORMAL);
	
	
	UnMarry(varMap, varPlayer, varTalknpc);
	
	return x800007_OK;
end







function x800007_SafeUnmarryCheck(varMap, varPlayer, varTalknpc, bDirect)

	local varRet 	= x800007_IsCanUnmarry(varMap, varPlayer);
	local varStr 	= "已经离婚。";
	
	if varRet == x800007_OK then
		varStr = format("确定要离婚？\n男方需要支付%d金钱。", x800007_var_CostMoneyUnmarry);
	
	elseif varRet == x800007_FAILED_CAPTAIN then
		varStr = "只有队长才能申请结婚。";
	
	elseif varRet == x800007_FAILED_TEAM then
		varStr = "如果想离婚，请男女双方二人组成一队再来找我。";
	
	elseif varRet == x800007_FAILED_MARRIGE then
		varStr = "你们还没结婚呢？为啥要离婚捏？";
	
	elseif varRet == x800007_FAILED_DISTANCE then
		varStr = "只有二人都走到我身边才可以离婚。";
	
	elseif varRet == x800007_FAILED_MONEY then
		varStr = format("男方需要携带%d金钱才能离婚。", x800007_var_CostMoneyUnmarry);
	end
	
	if varRet == x800007_OK and bDirect == 1 then
		return varRet;
	end
	
	StartTalkTask(varMap);
	
		TalkAppendString(varMap, varStr);
	
	StopTalkTask();

	if varRet == x800007_OK then
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x800007_var_FileId);
	else
		DeliverTalkMenu(varMap, varPlayer, varTalknpc);
	end
	
	return varRet;
	
end







function x800007_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x800007_var_FileId, x800007_var_QuestName);
end







function x800007_ProcEventEntry(varMap, varPlayer, varTalknpc)

	x800007_SafeUnmarryCheck(varMap, varPlayer, varTalknpc, 0);
	
end







function x800007_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	return 1;

end







function x800007_ProcAccept(varMap, varPlayer, varTalknpc)

	local varRet = x800007_DoUnmarry(varMap, varPlayer, varTalknpc);
	
	if varRet == x800007_OK then
		return
	end
	
	local varStr = "ERROR。";
	
	if varRet == x800007_FAILED_MONEY then
		varStr = "扣除金钱错误。";
	end
	
	StartTalkTask(varMap);
	
		TalkAppendString(varMap, varStr);
	
	StopTalkTask();

	DeliverTalkMenu(varMap, varPlayer, varTalknpc);

end
