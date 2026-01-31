x311103_var_FileId = 311103
x311103_var_ButtonName = "【国家】龙魂封赏"
x311103_var_BonusItem	=	{
[0] ={item=12500153,n=1},
[1] ={item=12500154,n=1},
[2] ={item=12500155,n=1},
[3] ={item=12500156,n=1},
}
x311103_var_GameOpenId = 1088

function x311103_ProcEnumEvent(varMap, varPlayer, varTalknpc, varIndex)
	if x311103_var_GameOpenId > 0 and GetGameOpenById( x311103_var_GameOpenId ) <= 0 then
      return
  end
		TalkAppendButton(varMap, x311103_var_FileId, x311103_var_ButtonName, 3, 0)
end

function x311103_ProcEventEntry(varMap ,varPlayer ,varTalknpc , varState , varIndex)
	
	LuaCallNoclosure(311104, "ProcSwitchDay", varMap, varPlayer)

	if (x311103_ProcPublicCheck(varMap, varPlayer, varTalknpc) == 0) then
		return
	end

	StartTalkTask(varMap)
	TalkAppendString(varMap,"#Y【国家】龙魂封赏")
	TalkAppendString(varMap,"  您为国家所做的贡献有目共睹，这是你应得的奖励。")
	StartItemTask(varMap)

	local nOrder = x311103_GetOrderOfBanZhuan(varMap, varPlayer)

	if  nOrder <=3 and  nOrder >=0 then
		AddQuestItemBonus(varMap, x311103_var_BonusItem[nOrder].item, x311103_var_BonusItem[nOrder].n)
	end

	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x311103_var_FileId, -1, 0)
end

function x311103_ProcPublicCheck(varMap, varPlayer, varTalknpc)
	
	local hour,minute,sec =GetHourMinSec();
	local nowtime = hour*3600+minute*60+sec
	local nCount =  x311103_GetMD(varMap, varPlayer,  MD_LAST_BANZHUAN_DAYCOUNT)
	local nGetPrize =  x311103_GetMD(varMap, varPlayer,  MD_LAST_BANZHUAN_GET_PRIZE)
	local nWorldId = GetWorldIdEx()
	if nowtime >= 0 and nowtime <= 1*3600+0*60+0 then
		Msg2Player(varMap, varPlayer, "1：00之后才能领取龙魂封赏", 8, 2)
		Msg2Player(varMap, varPlayer, "1：00之后才能领取龙魂封赏", 8, 3)
		return 0
	end	
		
	if GetToplistCount(nWorldId, WORLDCUP_TOPLIST_A) <= 0 then
		Msg2Player(varMap, varPlayer, "【国家】争夺龙魂任务尚未达到开放条件", 8, 2)
		Msg2Player(varMap, varPlayer, "【国家】争夺龙魂任务尚未达到开放条件", 8, 3)
		return 0
	end

	if nCount < 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y【国家】龙魂封赏")
		--TalkAppendString(varMap,"#Y龙魂封赏：")
		TalkAppendString(varMap,"  很遗憾，昨日你至少需要夺取了一次龙魂，才能获得龙魂封赏。")
		TalkAppendString(varMap," ")
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x311103_var_FileId, -1, 1)
		return 0
	end

	if 1 == nGetPrize then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y【国家】龙魂封赏")
		--TalkAppendString(varMap,"#Y龙魂封赏：")
		TalkAppendString(varMap,"  您今天已经领取过龙魂封赏了。")
		TalkAppendString(varMap," ")
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x311103_var_FileId, -1, 1)
		return 0
	end
	
	return 1
end

function x311103_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if x311103_var_GameOpenId > 0 and GetGameOpenById( x311103_var_GameOpenId ) <= 0 then
      return
  end
  
  if (x311103_ProcPublicCheck(varMap, varPlayer, varTalknpc) == 0) then
		return 0
	end
  
	local nCount =  x311103_GetMD(varMap, varPlayer,  MD_LAST_BANZHUAN_DAYCOUNT)

	if nCount < 1 or nCount > 3 then
		return 0
	end
	
	local nGetPrize =  x311103_GetMD(varMap, varPlayer,  MD_LAST_BANZHUAN_GET_PRIZE)
	
	if 1 == nGetPrize then
		return 0
	end
	
	return 1
end

function x311103_ProcAccept(varMap, varPlayer)
	StartItemTask(varMap)
	
	local nOrder = x311103_GetOrderOfBanZhuan(varMap, varPlayer)
	
	if 4 == nOrder then
		local nPlayerGuid = GetPlayerGUID(varMap, varPlayer)
		WriteLog(1, "x311103_GetGiftOfBanZhuan error varPlayerGuid="..nPlayerGuid)
		return
	end

	ItemAppendBind(varMap, x311103_var_BonusItem[nOrder].item, x311103_var_BonusItem[nOrder].n)

	local nRet = StopItemTask(varMap,varPlayer)

	if nRet <= 0 then
		x311103_DiliverStrInfo(varMap, varPlayer, "背包空间不足，请清理后再来！")
		return
	end

	x311103_SetMD(varMap, varPlayer, MD_LAST_BANZHUAN_GET_PRIZE, 1)
	DeliverItemListSendToPlayer(varMap,varPlayer)
	GamePlayScriptLog(varMap, varPlayer, 2523)
end

function x311103_SetMD(varMap, varPlayer, varMDIndex, varVvalue)
	SetPlayerGameData(varMap, varPlayer, varMDIndex[1], varMDIndex[2], varMDIndex[3], varVvalue)
end

function x311103_GetMD(varMap, varPlayer, varMDIndex)
	local varValue= GetPlayerGameData(varMap, varPlayer, varMDIndex[1], varMDIndex[2], varMDIndex[3])
	return varValue
end

function x311103_DiliverStrInfo(varMap, varPlayer, varStr)
	StartTalkTask(varMap)
	TalkAppendString(varMap, varStr)
	StopTalkTask()
	DeliverTalkTips(varMap, varPlayer)
end

function x311103_GetOrderOfBanZhuan(varMap, varPlayer)
	local nCountry = GetCurCountry(varMap, varPlayer)
	local nBrickNum = GetCountryParam(varMap, nCountry, CD_LASTDATE_BANZHUAN_NUM)
	local nOrder = 4
	
	for i=0, 3 do
		if nBrickNum >= GetCountryParam(varMap, i, CD_LASTDATE_BANZHUAN_NUM) then
			nOrder = nOrder - 1
		end
	end
	
	return nOrder	
end
