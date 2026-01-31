x802002_var_FileId = 802002

x802002_GiftLevelCfg =
{
	[1] = {limitLv = 1, recLV = 30}, --原始的  --限制等级和直接领循环礼包等级
	[2] = {limitLv = 15, recLV = 40},--经验的
	[3] = {limitLv = 25, recLV = 45},--成就的
	[4] = {limitLv = 40, recLV = 50},--银卡的
}

x802002_GiftMaxNumLine = 300
------------------------------------------------------------------------------
--在线礼包的操作
------------------------------------------------------------------------------
function x802002_CheckGiftPack(varMap, varPlayer, varGiftType)
	local GiftToggle = 1
	if GiftToggle == 0 then
		SendGiftTime(varMap, varPlayer, varGiftType, 0, -1, 0) --关闭客户端礼包
		return
	end
	
	local guid = GetGUID(varMap, varPlayer)
	local level = GetLevel(varMap, varPlayer)
	
	if varGiftType < 0 or varGiftType >= 4 then
		WriteLog(1, format("bad gift request befor gift Type!! guid:%x,giftType:%d", guid, varGiftType))
		return
	end
	
	local giftMD = x802002_GetGiftMD(varGiftType)
	local overGiftIndex = 0		
	local index = varGiftType + 1
	local limitLv = x802002_GiftLevelCfg[index].limitLv
	if level < limitLv then
		SendGiftTime(varMap, varPlayer, varGiftType, limitLv, -1, 0) --关闭客户端礼包(时间代替等级)
		return
	elseif level >= x802002_GiftLevelCfg[index].recLV then
		overGiftIndex = x802002_GiftMaxNumLine
	else
		overGiftIndex = GetPlayerGameData(varMap, varPlayer, giftMD[1], giftMD[2], giftMD[3])	
	end
			
	local giftIndex, giftID, giftNum, giftNeedTime, isBind = GetGiftInfo(varMap, varPlayer, overGiftIndex, 0, varGiftType) --0表示本次
	
	if giftIndex < 0 then
		return 0
	end

	local totleTime = GetGiftTime(varMap, varPlayer, varGiftType) --上次领取到现在的时间
	if totleTime < 0 then
		return 0
	end

	--时间没到就发领取礼包的消息
	if totleTime < giftNeedTime then
		WriteLog(1, format("bad gift request befor gift time!! guid:%x,totleTime:%d,needTime%d", guid, totleTime, giftNeedTime))
		return
	end
	
	--检查背包
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，请整理您的背包", 8, 3)
		return 0
	end
	
	--给礼包
	StartItemTask(varMap)
	if isBind == 1 then
		ItemAppendBind(varMap, giftID, giftNum) 
	else
		ItemAppend(varMap, giftID, giftNum)
	end
	
	local ret = StopItemTask(varMap,varPlayer)
	if ret <= 0 then
		WriteLog(1, format("add gift packet error!! guid:%x,gift:%d,Num:%d",guid, giftID, giftNum));
		Msg2Player(varMap, varPlayer, "背包已满，请整理您的背包", 8, 3)
		return 0
	end

	--给物品，写日志，清理时间
	DeliverItemListSendToPlayer(varMap, varPlayer)
	local varStr = "#Y你获得了线上礼品：#G#{_ITEM"..giftID.."}" .. giftNum .. "个"
	Msg2Player(varMap, varPlayer, varStr, 8, 3)	
	WriteLog(1, format("add gift packet to player. guid:%x,gift:%d,Num:%d", guid, giftID, giftNum))	
	
	ClearGiftTime(varMap, varPlayer, varGiftType)
		
	--记录当前index
	giftIndex, giftID, giftNum, giftNeedTime, isBind = GetGiftInfo(varMap, varPlayer, giftIndex, 1, varGiftType)--下次已经成为本次，下下次就是下次
	SetPlayerGameData(varMap, varPlayer, giftMD[1], giftMD[2], giftMD[3], giftIndex)	
	SendGiftTime(varMap, varPlayer, varGiftType, giftNeedTime, giftID, giftNum)
		
	return 1
end

function x802002_SendRemainTime(varMap, varPlayer, varGiftType)	

	local guid = GetGUID(varMap, varPlayer)
	if varGiftType < 0 or varGiftType >= 4 then
		WriteLog(1, format("bad gift request befor gift Time!! guid:%x,giftType:%d", guid, varGiftType))
		return
	end
	
	local overGiftIndex = 0	
	local level = GetLevel(varMap, varPlayer)	
	local giftMD = x802002_GetGiftMD(varGiftType)
	local overGiftIndex = 0		
	local index = varGiftType + 1
	local limitLv = x802002_GiftLevelCfg[index].limitLv
	
	if level < limitLv then
		SendGiftTime(varMap, varPlayer, varGiftType, limitLv, -1, 0) --关闭客户端礼包(时间代替等级)
		return
	elseif level >= x802002_GiftLevelCfg[index].recLV then
		overGiftIndex = x802002_GiftMaxNumLine
	else
		overGiftIndex = GetPlayerGameData(varMap, varPlayer, giftMD[1], giftMD[2], giftMD[3])	
	end
	
	local giftIndex, giftID, giftNum, giftNeedTime, isBind = GetGiftInfo(varMap, varPlayer, overGiftIndex ,0, varGiftType)
	if giftIndex < 0 then
		return 0
	end
	
	local totleTime = GetGiftTime(varMap, varPlayer, varGiftType) --上次领取到现在的时间
	local remainTime = giftNeedTime - totleTime
	if remainTime < 0 then
		remainTime = 0
	end
	
	SendGiftTime(varMap, varPlayer,varGiftType, remainTime, giftID, giftNum)	
end

function x802002_GetGiftMD(varGiftType)
	local giftMD = MD_ONLINE_GIFT_0
	if varGiftType == 0 then
		giftMD = MD_ONLINE_GIFT_0
	elseif varGiftType == 1 then
		giftMD = MD_ONLINE_GIFT_1
	elseif varGiftType == 2 then
		giftMD = MD_ONLINE_GIFT_2
	elseif varGiftType == 3 then
		giftMD = MD_ONLINE_GIFT_3
	end
	return giftMD
end

--end礼包
------------------------------------
