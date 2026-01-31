






x800049_var_FileId 					= 800049
x800049_var_QuestName				= "【婚姻】举办婚礼"
x800049_var_NeedGold					= 68888







function x800049_ProcEnumEvent(varMap, varPlayer, varTalknpc, eventId, varIndex)
	TalkAppendButton(varMap, x800049_var_FileId, x800049_var_QuestName,3);
end







function x800049_ProcEventEntry(varMap, varPlayer, varTalknpc)
	StartTalkTask(varMap);
	local Readme_1 = "#Y【婚姻】举办婚礼#W#r"
	local Readme_2 = "\t成吉思汗中，夫妻们可以通过举办婚礼来召唤亲朋好友，与他们欢聚一堂并能获得他们祝福。#r #r"
	local Readme_3 = "如果您要结婚需要满足四个条件：#r #r"
	local Readme_4 = "1.您必须与您的配偶组成#G2人队伍#W。#r #r"
	local Readme_5 = "2.您必须与您的配偶互相#G在一起#W。#r #r"
	local Readme_6 = "3.您与同一配偶只能举办#G一次婚礼#W。#r #r"
	local Readme_7 = format("4.您只须拥有#Y#{_MONEY%d}金卡（现金）#W便可举办#G一次婚礼#W。#r #r", x800049_var_NeedGold)
	local Readme_8 = "\t一切都准备好了就可以举行婚礼了。"
	local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5..Readme_6..Readme_7..Readme_8
	TalkAppendString(varMap, varReadme);
	StopTalkTask();
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x800049_var_FileId, -1);
end







function x800049_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	return 1;

end







function x800049_ProcAccept(varMap, varPlayer, varTalknpc)
	local varStr = x800049_DoWedding(varMap, varPlayer, varTalknpc)
	if varStr ~= nil then
		Msg2Player(varMap,varPlayer,varStr,CHAT_TYPE_SELF,CHAT_RIGHTDOWN)
		Msg2Player(varMap,varPlayer,varStr,CHAT_TYPE_SELF,CHAT_PLUMB_SCROLL)
	end
end

-- 被邀请者状态检查
function x800049_CheckEnable( varMap, varPlayer)
    if IsHaveSpecificImpact( varMap, varPlayer, 7629) == 1 then
        Msg2Player( varMap, varPlayer, "您有战车加护效果，不能进行此操作", 8, 3)
        Msg2Player( varMap, varPlayer, "您有战车加护效果，不能进行此操作", 8, 2)
        return 0
    end

    return 1
end

function x800049_DoWedding(varMap, varPlayer, varTalknpc)
	
	if 0 >= IsEnoughGold(varMap, varPlayer, x800049_var_NeedGold) then
		return format("很抱歉，需要#{_MONEY%d}金卡（现金）才可以举办婚礼。", x800049_var_NeedGold)
	end
	if IsMarried(varMap, varPlayer) ~= 1 then
		return "很抱歉，您还未结婚，无法选择婚礼。"
	end
	if HasTeam(varMap, varPlayer) ~= 1 then
		return "很抱歉，您还未进行组队无法选择婚礼。"
	end
	
	if (GetTeamSize(varMap, varPlayer) < 2) then
		return "很抱歉，您所在的队伍中成员小于2人，无法选择婚礼。";
	end
	
	if (GetTeamSize(varMap, varPlayer) > 2) then
		return "很抱歉，您所在的队伍中成员大于2人，无法选择婚礼。";
	end

	local varTalknpc = GetTeamSceneMember(varMap, varPlayer, 0);
	
	if IsInDist(varMap, varPlayer, varTalknpc, 10) ~= 1 then
		return "很抱歉，您的队友不在附近，无法选择婚礼。";
	end
	
	if IsSpouses(varMap, varPlayer, varTalknpc) ~= 1 then
		return "很抱歉，您所在的队伍中成员不是夫妻关系，无法选择婚礼。";
	end		
	
	if IsHaveWedding(varMap, varPlayer) == 1 then
		return "很抱歉，您已经举办过婚礼，不可以再次举办。";
	end
	local nEvent = 46 
	local bMutex, errCode = IsMutex(varMap, varPlayer, nEvent) 
	if bMutex == 1 then
		return "很抱歉，您当前的状态不可以举办婚礼。";
	end 
	
	bMutex, errCode = IsMutex(varMap, varTalknpc, nEvent) 
	if bMutex == 1 then
		return "很抱歉，您配偶当前的状态不可以举办婚礼。";
	end
	local IsSelfMan = GetSex(varMap, varPlayer);
	local ManId;
	local WomanId;
	if IsSelfMan > 0 then
		ManId = varPlayer;
		WomanId = varTalknpc;
	else
		ManId = varTalknpc;
		WomanId = varPlayer;
	end
	
	if 0 >= x800049_CostGold(varMap, varPlayer) then
		return "扣钱错误";
	end
	
	DoWedding(varMap, varPlayer)
	DoWedding(varMap, varTalknpc)
	
	local szMsg = format("今日是%s和%s的大喜之日，希望您能参加，并带来你的祝福。", GetName( varMap, WomanId ), GetName(varMap, ManId));
	local MoneyReceiver = GetName( varMap, WomanId )
	WeddingInvite(varMap, varPlayer, MoneyReceiver, szMsg)
	WeddingInvite(varMap, varTalknpc, MoneyReceiver, szMsg)
	
	DispelImpact(varMap, ManId)
	DispelImpact(varMap, WomanId)
	
	SetPlayerPatrolId(varMap, ManId, 74);
	SetPlayerPatrolId(varMap, WomanId, 74);

	Teleport(varMap, WomanId, 318, 252)
	Teleport(varMap, ManId, 318, 257)
	SendSpecificImpactToUnit(varMap, ManId, ManId, ManId, 7642, 0);
	SendSpecificImpactToUnit(varMap, WomanId, WomanId, WomanId, 7642, 0);
	SendSpecificImpactToUnit(varMap, ManId, ManId, ManId, 7641, 0);
	SendSpecificImpactToUnit(varMap, WomanId, WomanId, WomanId, 7640, 0);
	local mamName = GetName(varMap, ManId)
	local womamName = GetName(varMap, WomanId)
	local varStr = format("恭喜%s与%s举办了别开生面的婚礼，并收到了亲朋好友的祝福。", mamName, womamName);
	LuaAllScenceM2Wrold (varMap, varStr, CHAT_MAIN_WINDOW, 1)
	
	SendSpecificImpactToUnit(varMap, ManId, ManId, ManId, 8537, 0);
	
	return nil
	
end

function x800049_CostGold(varMap, varPlayer)
	local nGoldMode = GetGoldMode( varMap, varPlayer )
	
	if nGoldMode == 1 then		
		if CostMoney(varMap, varPlayer, 2, x800049_var_NeedGold,305) == -1 then
			return 0
		end
	
	elseif nGoldMode == 0 then	
		if CostMoney(varMap, varPlayer, 3, x800049_var_NeedGold,305) == -1 then
			if CostMoney(varMap, varPlayer, 2, x800049_var_NeedGold,305) == -1 then
				return 0
			end
		end
	else						
		return 0
	end
	return 1
end
function DispelImpact(varMap, varPlayer)
	DispelSpecificImpact(varMap, varPlayer, 7902)
	DispelSpecificImpact(varMap, varPlayer, 10330)
	for varI = 4211, 4220 do
		DispelSpecificImpact(varMap, varPlayer, varI)
	end
end
