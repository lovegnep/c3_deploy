x802001_var_FileId = 802001

x802001_var_PEERVIP_MAXGOLD = 999999999


function x802001_PeerVipProcess(varMap, varPlayer, varIndex)
	
	local nDayNow = GetDayOfYear();

	local nDayRecord = GetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_DATE[1], MD_PEER_VIP_REWORD_DATE[2], MD_PEER_VIP_REWORD_DATE[3]);
	
	-- 不是一天的话重置值
	if nDayNow ~= nDayRecord then 
		SetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_DATE[1], MD_PEER_VIP_REWORD_DATE[2], MD_PEER_VIP_REWORD_DATE[3], nDayNow)
		SetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_ITEM1[1], MD_PEER_VIP_REWORD_ITEM1[2], MD_PEER_VIP_REWORD_ITEM1[3], 0)
		SetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_ITEM2[1], MD_PEER_VIP_REWORD_ITEM2[2], MD_PEER_VIP_REWORD_ITEM2[3], 0)
		SetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_ITEM3[1], MD_PEER_VIP_REWORD_ITEM3[2], MD_PEER_VIP_REWORD_ITEM3[3], 0)
		
		--通知客户端物品可领按钮回复正常
		MsgPeerVipItemOK(varMap, varPlayer, 4);
	end
		
	local nAwardItem1 = GetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_ITEM1[1], MD_PEER_VIP_REWORD_ITEM1[2], MD_PEER_VIP_REWORD_ITEM1[3]);
	local nAwardItem2 = GetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_ITEM2[1], MD_PEER_VIP_REWORD_ITEM2[2], MD_PEER_VIP_REWORD_ITEM2[3]);
	local nAwardItem3 = GetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_ITEM3[1], MD_PEER_VIP_REWORD_ITEM3[2], MD_PEER_VIP_REWORD_ITEM3[3]);	
	

	local nItemID, nItemNum = GetPeerVipInfo(varMap, varPlayer, varIndex);

	if nItemID == nil or nItemID <= 0 then 
		return 0;
	end
	
	-- 是否领过检查
	if varIndex == 1 and nAwardItem1 == 1 then 
		--Msg2Player(varMap, varPlayer, "该物品今天已领过，不可再领", 8, 3)
		return 0
	elseif 	varIndex == 2 and nAwardItem2 == 1 then 
		--Msg2Player(varMap, varPlayer, "该物品今天已领过，不可再领", 8, 3)
		return 0
	elseif 	varIndex == 3 and nAwardItem3 == 1 then 
		--Msg2Player(varMap, varPlayer, "该物品今天已领过，不可再领", 8, 3)
		return 0
	end
	
	
	--检查背包
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，请整理您的背包", 8, 3)
		return 0
	end

	--给物品
	StartItemTask(varMap)	
	ItemAppend(varMap, nItemID, nItemNum)
	
	local ret = StopItemTask(varMap,varPlayer)
	if ret <= 0 then
		WriteLog(1, format("add gift packet error!! guid:%x,item:%d,num:%d",guid, nItemID, nItemNum));
		Msg2Player(varMap, varPlayer, "背包已满，请整理您的背包", 8, 3)
		return 0
	end
	
	--给完物品，重置标记位	
	if varIndex == 1 then 
		SetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_ITEM1[1], MD_PEER_VIP_REWORD_ITEM1[2], MD_PEER_VIP_REWORD_ITEM1[3], 1)	
		SetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_DATE[1], MD_PEER_VIP_REWORD_DATE[2], MD_PEER_VIP_REWORD_DATE[3], GetDayOfYear())		
	elseif varIndex == 2 then 
		SetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_ITEM2[1], MD_PEER_VIP_REWORD_ITEM2[2], MD_PEER_VIP_REWORD_ITEM2[3], 1)
		SetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_DATE[1], MD_PEER_VIP_REWORD_DATE[2], MD_PEER_VIP_REWORD_DATE[3], GetDayOfYear())
	elseif varIndex == 3 then 
		SetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_ITEM3[1], MD_PEER_VIP_REWORD_ITEM3[2], MD_PEER_VIP_REWORD_ITEM3[3], 1)
		SetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_DATE[1], MD_PEER_VIP_REWORD_DATE[2], MD_PEER_VIP_REWORD_DATE[3], GetDayOfYear())
	end

	--给物品，写日志
	DeliverItemListSendToPlayer(varMap, varPlayer)
	local varStr = "#Y你获得了物品：#G#{_ITEM"..nItemID.."}" .. nItemNum .. "个"
	Msg2Player(varMap, varPlayer, varStr, 8, 3)	
	WriteLog(1, format("item award to player. guid:%x,item:%d,num:%d", GetPlayerGUID(varMap, varPlayer), nItemID, nItemNum))	
	
	--通知客户端UI更新
	MsgPeerVipItemOK(varMap, varPlayer, varIndex);
end


function x802001_ProcessGold(varMap, varPlayer, varGoldPre, varCount)
		
	local nItemID, nItemNum, nLevelPre = GetPeerVipInfo(varMap, varPlayer, 1);

	if varGoldPre > x802001_var_PEERVIP_MAXGOLD or varGoldPre + varCount > x802001_var_PEERVIP_MAXGOLD then 
		
		SetPeerVipValue(varMap, varPlayer, x802001_var_PEERVIP_MAXGOLD);

		-- 记录log信息
		WriteLog(16, format("PeerVip Gold Prcocess: guid:%x,goldpre:%d,goldcount:%d, goldafter:%d", GetPlayerGUID(varMap, varPlayer), varGoldPre, varCount, x802001_var_PEERVIP_MAXGOLD));
		WriteLog(1, format("PeerVip Gold Prcocess: guid:%x,goldpre:%d,goldcount:%d, goldafter:%d", GetPlayerGUID(varMap, varPlayer), varGoldPre, varCount, x802001_var_PEERVIP_MAXGOLD));
			
		local nItemID1, nItemNum1, nLevelAfter1 = GetPeerVipInfo(varMap, varPlayer, 1);
		
		-- 领金改变MD值
		if nLevelPre ~= nLevelAfter1 then 
			SetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_ITEM1[1], MD_PEER_VIP_REWORD_ITEM1[2], MD_PEER_VIP_REWORD_ITEM1[3], 0) 
			SetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_ITEM2[1], MD_PEER_VIP_REWORD_ITEM2[2], MD_PEER_VIP_REWORD_ITEM2[3], 0)
			SetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_ITEM3[1], MD_PEER_VIP_REWORD_ITEM3[2], MD_PEER_VIP_REWORD_ITEM3[3], 0)


			--通知客户端物品可领按钮回复正常
			MsgPeerVipItemOK(varMap, varPlayer, 4);
		end

	else 
		SetPeerVipValue(varMap, varPlayer, varGoldPre + varCount);

		local nGoldNow = varGoldPre + varCount;		
		
		-- 记录log信息
		--WriteLog(16, format("PeerVip Gold Prcocess: guid:%x,goldpre:%d,goldcount:%d, goldafter:%d", GetPlayerGUID(varMap, varPlayer), varGoldPre, varCount, nGoldNow));
		WriteLog(1, format("PeerVip Gold Prcocess: guid:%x,goldpre:%d,goldcount:%d, goldafter:%d", GetPlayerGUID(varMap, varPlayer), varGoldPre, varCount, nGoldNow));

		local nItemID2, nItemNum2, nLevelAfter2 = GetPeerVipInfo(varMap, varPlayer, 1);

		-- 领金改变MD值
		if nLevelPre ~= nLevelAfter2 then 
			SetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_ITEM1[1], MD_PEER_VIP_REWORD_ITEM1[2], MD_PEER_VIP_REWORD_ITEM1[3], 0) 
			SetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_ITEM2[1], MD_PEER_VIP_REWORD_ITEM2[2], MD_PEER_VIP_REWORD_ITEM2[3], 0)
			SetPlayerGameData(varMap, varPlayer, MD_PEER_VIP_REWORD_ITEM3[1], MD_PEER_VIP_REWORD_ITEM3[2], MD_PEER_VIP_REWORD_ITEM3[3], 0)

			--通知客户端物品可领按钮回复正常
			MsgPeerVipItemOK(varMap, varPlayer, 4);
			
			LuaCallNoclosure( SCENE_SCRIPT_ID, "OnPlayerVipLvChg", varMap, varPlayer, nLevelAfter2)
		end

	end

end
