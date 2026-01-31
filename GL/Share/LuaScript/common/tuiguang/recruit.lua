--招募关系服务器功能相关

x802007_Mail_Recruit = 10111--招募邮件区分,15级前也能发邮件
x802007_Level = 50			--加入招募的等级
x802007_MsgType_1 = 58		--请求别人招募我
x802007_MsgType_2 = 64		--同意别人招募我
x802007_MsgType_3 = 59		--我要招募新人
x802007_MsgType_4 = 62		--同意某人的申请
x802007_MsgType_5 = 102		--领取奖品
x802007_MsgType_6 = 103		--领取奖品成功
x802007_MsgType_7 = 66		--解除上级
x802007_MsgType_8 = 60		--删除下级
x802007_MsgType_9 = 102		--显示领取奖品
x802007_SeverId ={}
--服务器限制
function x802007_RecruitToggle()
	local nToggle = 0		
	if getn(x802007_SeverId) == 0 then
			nToggle = 1
	else
			for i, v in x802007_SeverId do 
				if GetWorldIdEx() == v then
					nToggle = 1
					break
				end
			end
	end
	return nToggle
end
function x802007_IsServerOpen()
	local nToggle = 1	
	if x802007_RecruitToggle() ~= 1 then
		nToggle = 0
	end	
	return nToggle
end
--加入招募
function x802007_AddRecruit(varMap, varPlayer, nType)
	if x802007_IsServerOpen() ~= 1 then
		StartTalkTask(varMap)
		TalkAppendString( varMap, "该服务器暂未开放推广功能" )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return 0
	end
	local returnValue = 1;
	local nLevel = GetLevel( varMap, varPlayer)
	local szMsg = "";
	
	if nType == x802007_MsgType_1 or nType == x802007_MsgType_2 then
		if nLevel > x802007_Level then
			returnValue = 0;
			szMsg = "50以下才可以成为招募下级"
		end
	end
	
	if nType == x802007_MsgType_3 or nType == x802007_MsgType_4 then
		if nLevel < x802007_Level then
			returnValue = 0;
			szMsg = "50以上才可以成为招募上级"
		end
	end
	
	Msg2Player(varMap,varPlayer,szMsg,8,2)
	Msg2Player(varMap,varPlayer,szMsg,8,3)
	
	return returnValue;
end

--离开招募
function x802007_LeaveRecruit(varMap, varPlayer)
	x802007_SetRecruitWeekMD(varMap, varPlayer, 0)
end

--记录招募状态的现金消耗
function x802007_ConsumeGold(varMap, varPlayer, nGold)
	local nState = x802007_GetRecruitStateMD(varMap, varPlayer);
	if nState == 0 then
		return
	end
	
	x802007_CheckWeek(varMap, varPlayer)
	local nMoney = x802007_GetRecruitToGoldMD(varMap, varPlayer) + nGold;
	x802007_SetRecruitToGoldMD(varMap, varPlayer, nMoney)
end

function x802007_RecruitState(varMap, varPlayer, nState)
	if nState == 1 then
		local ToWeek = GetWeekIndex(varMap, varPlayer)
		x802007_SetRecruitWeekMD(varMap, varPlayer, ToWeek)
		x802007_SetRecruitStateMD(varMap, varPlayer, nState)
		
		--显示领取奖品
		if x802007_GetRecruitGiftMD(varMap, varPlayer) == 0 then
			ScriptXCRecruiMsg(varMap, varPlayer, x802007_MsgType_9)
		end
	else
		x802007_SetRecruitWeekMD(varMap, varPlayer, 0)
		x802007_SetRecruitStateMD(varMap, varPlayer, nState)
	end

end

--进入地图
function x802007_ProcPlayerEnterFinished(varMap, varPlayer)
	x802007_CheckWeek(varMap, varPlayer)
	
	--检测是否发送领取招募物品消息
	local szName = GetRecruitName(varMap, varPlayer, 1, 0)
	local IsGift = x802007_GetRecruitGiftMD(varMap, varPlayer)
	if szName == "" or IsGift == 1 then
		return 
	end
	
	ScriptXCRecruiMsg(varMap, varPlayer, x802007_MsgType_5)
	
end

--跨周检测
function x802007_CheckWeek(varMap, varPlayer)
	local ToWeek = GetWeekIndex(varMap, varPlayer)
	local oldWeek = x802007_GetRecruitWeekMD(varMap, varPlayer)
	
	if ToWeek > oldWeek then
		x802007_SetRecruitWeekMD(varMap, varPlayer, ToWeek)
		local gold = x802007_GetRecruitGoldMD(varMap, varPlayer) + x802007_GetRecruitToGoldMD(varMap, varPlayer)
		x802007_SetRecruitGoldMD(varMap, varPlayer, gold) 
		x802007_SetRecruitToGoldMD(varMap, varPlayer, 0)
	end
end

--招募提示
function x802007_RecruitDelet(varMap, varPlayer, nType, nSnid)
	local nReturn = 0;
	nSnid = GetLuaVariable(varMap, 1, 2)
	if nSnid <= 0 then
		Msg2Player(varMap,varPlayer,"您没有上级",8,2)
		Msg2Player(varMap,varPlayer,"您没有上级",8,3)
		return nReturn;
	end
	
	local Msg = nil;
	--解除上級
	if nType == x802007_MsgType_7 then
		local szName = GetRecruitName(varMap, varPlayer, 1, nSnid)
		if szName == "" then
			Msg = "你没有上级"
		else
			RecruitDelet(varMap, varPlayer, nType, nSnid, szName)
			Msg = format("很遗憾，您解除了与上级%s的招募关系", szName)
		
			SendSystemPost( varMap, szName, "很遗憾，您的下级" .. GetName(varMap, varPlayer) .. "与您解除了招募关系.^" )
			SendScriptPost( varMap, szName, MAIL_RECRUIT_DELET, x802007_MsgType_8, GetGUID(varMap, varPlayer), x802007_Mail_Recruit, varPlayer )
			nReturn = 1;
		end
	end
	
	--上级解除下级
	if nType == x802007_MsgType_8 then
		local szName = GetRecruitName(varMap, varPlayer, 0, nSnid)
		if szName == "" then
			Msg = "你没有该下级"
		else
			RecruitDelet(varMap, varPlayer, nType, nSnid, szName)
			Msg = format("很遗憾，您解除了与下级级%s的招募关系", szName)
		
			SendSystemPost( varMap, szName, "很遗憾，您的上级" .. GetName(varMap, varPlayer) .. "与您解除了招募关系。^" )
			SendScriptPost( varMap, szName, MAIL_RECRUIT_DELET, x802007_MsgType_7, GetGUID(varMap, varPlayer), x802007_Mail_Recruit, varPlayer )
			nReturn = 1
		end
	end
	
	if Msg ~= nil then
		Msg2Player(varMap,varPlayer,Msg,8,2)
		Msg2Player(varMap,varPlayer,Msg,8,3)
	end

	return nReturn
	
end

--通过邮件形式删除招募
function x802007_Mail_RecruitDelet(varMap, varPlayer, nMailType, nType, nSnid, varParam3)
	if nType == x802007_MsgType_7 then
		nType = 1;
	end
	if nType == x802007_MsgType_8 then
		nType = 0;
	end
	
	local szName = GetRecruitName(varMap, varPlayer, nType, nSnid)
	if szName == "" then
		return
	end

	if nType == 1 then
		nType = x802007_MsgType_7;
	end
	if nType == 0 then
		nType = x802007_MsgType_8;
	end
	
	RecruitDelet(varMap, varPlayer, nType, nSnid, szName)
end

--下级获得的经验
function x802007_RecruitExp(varMap, varPlayer, nExp)
		--排行榜最后一名等级
	local TopListMinLevel = GetTopListInfo_MinLevel(GetWorldID( varMap, varPlayer));
	local abc = GetLevel(varMap , varPlayer) + 5
	if abc > TopListMinLevel then
	 return nExp
	end
	local szName = GetRecruitName(varMap, varPlayer, 1, 1)
	if szName == "" then
		return nExp
	end
	local lv = GetRecruitLevel(varMap, varPlayer, 1)
	if lv > 0 then
		return (1 + (lv + 1)/10) * nExp
	end
	
	return nExp;
end

--领取招募礼物
function x802007_RecruitGift(varMap, varPlayer)
	StartItemTask(varMap);
	ItemAppendBind(varMap, 12035287 , 1);
--	DeliverItemListSendToPlayer(varMap,varPlayer)
	if StopItemTask(varMap,varPlayer) > 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"获得物品")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)	
			DeliverItemListSendToPlayer(varMap,varPlayer)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)		
	end


	
	x802007_SetRecruitGiftMD(varMap, varPlayer, 1);
	ScriptXCRecruiMsg(varMap, varPlayer, x802007_MsgType_6)
end


--招募上周MD
function x802007_SetRecruitWeekMD(varMap, varPlayer, value)
	SetPlayerGameData(varMap, varPlayer, MD_RECRUIT_WEEK[1], MD_RECRUIT_WEEK[2], MD_RECRUIT_WEEK[3], value)
end

function x802007_GetRecruitWeekMD(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_RECRUIT_WEEK[1], MD_RECRUIT_WEEK[2], MD_RECRUIT_WEEK[3])
end

--招募上周花费的现金MD
function x802007_SetRecruitGoldMD(varMap, varPlayer, value)
	SetPlayerGameData(varMap, varPlayer, MD_RECRUIT_GOLD[1], MD_RECRUIT_GOLD[2], MD_RECRUIT_GOLD[3], value)
end

function x802007_GetRecruitGoldMD(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_RECRUIT_GOLD[1], MD_RECRUIT_GOLD[2], MD_RECRUIT_GOLD[3])
end

--招募本周花费的现金MD
function x802007_SetRecruitToGoldMD(varMap, varPlayer, value)
	SetPlayerGameData(varMap, varPlayer, MD_RECRUIT_TOGOLD[1], MD_RECRUIT_TOGOLD[2], MD_RECRUIT_TOGOLD[3], value)
end

function x802007_GetRecruitToGoldMD(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_RECRUIT_TOGOLD[1], MD_RECRUIT_TOGOLD[2], MD_RECRUIT_TOGOLD[3])
end

--招募状态
function x802007_SetRecruitStateMD(varMap, varPlayer, value)
	SetPlayerGameData(varMap, varPlayer, MD_RECRUIT_STATE[1], MD_RECRUIT_STATE[2], MD_RECRUIT_STATE[3], value)
end

function x802007_GetRecruitStateMD(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_RECRUIT_STATE[1], MD_RECRUIT_STATE[2], MD_RECRUIT_STATE[3])
end

--是否领取过招募礼品
function x802007_SetRecruitGiftMD(varMap, varPlayer, value)
	SetPlayerGameData(varMap, varPlayer, MD_RECRUIT_GIFT[1], MD_RECRUIT_GIFT[2], MD_RECRUIT_GIFT[3], value)
end

function x802007_GetRecruitGiftMD(varMap, varPlayer)
	return GetPlayerGameData(varMap, varPlayer, MD_RECRUIT_GIFT[1], MD_RECRUIT_GIFT[2], MD_RECRUIT_GIFT[3])
end
