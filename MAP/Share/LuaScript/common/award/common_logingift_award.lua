x802004_var_FileId = 802004
x802004_var_MaxDay = 6				--最大天数
x802004_var_ItemInfo = {			--物品信息表
												[1] = {ItemID = 0, ItemNum = 0, },
												[2] = {ItemID = 0, ItemNum = 0, },
												[3] = {ItemID = 0, ItemNum = 0, },
												[4] = {ItemID = 0, ItemNum = 0, },
												};
--存储累计天数的新MD声明
--MD_NEW_LOGINGIFT_ADDUP	   = {312, 11, 10}		
------------------------------------------------------------------------------
--玩家进入地图后执行
------------------------------------------------------------------------------
function x802004_ProcPlayerEnterFinished(varMap, varPlayer)

		--------------------------------------------------------------------------------------------------------------------------------
			--登录有礼MD迁移
			--2012.6.6--将登录有礼累计天数的旧MD迁移到新MD上
			
			local oldDaysCount = GetPlayerGameData(varMap, varPlayer, MD_LOGINGIFT_ADDUP[1], MD_LOGINGIFT_ADDUP[2], MD_LOGINGIFT_ADDUP[3])
			
			if oldDaysCount ~= 0 then
					SetPlayerGameData(varMap, varPlayer, MD_NEW_LOGINGIFT_ADDUP[1], MD_NEW_LOGINGIFT_ADDUP[2], MD_NEW_LOGINGIFT_ADDUP[3], oldDaysCount)
					SetPlayerGameData(varMap, varPlayer, MD_LOGINGIFT_ADDUP[1], MD_LOGINGIFT_ADDUP[2], MD_LOGINGIFT_ADDUP[3], 0)
			end
		
		--------------------------------------------------------------------------------------------------------------------------------	

		local varToday 		 = GetDayTime()
		local varLastday 	 = GetPlayerGameData( varMap, varPlayer, MD_LOGINGIFT_DAY[1], MD_LOGINGIFT_DAY[2], MD_LOGINGIFT_DAY[3] )
		local varDaysAdded = GetPlayerGameData( varMap, varPlayer, MD_NEW_LOGINGIFT_ADDUP[1], MD_NEW_LOGINGIFT_ADDUP[2], MD_NEW_LOGINGIFT_ADDUP[3] )
		local varRewarded = GetPlayerGameData(varMap, varPlayer, MD_LOGINGIFT_ISREWARDED[1], MD_LOGINGIFT_ISREWARDED[2], MD_LOGINGIFT_ISREWARDED[3])
		
		WriteLog( 1, format("x802004_ProcPlayerEnterFinished varMap=%d,PlayerGUID=%X,varLastDay=%d,varToDay=%d",varMap,GetGUID(varMap,varPlayer),varLastday,varToday));
		--如果不是同一天登陆或者未领取过
		if not (varToday == varLastday and varRewarded == 1) then
				if (varToday - varLastday == 1) then
						--判断累计天数是否达到最大值1023天
						if (varDaysAdded < 1023) then
								varDaysAdded = varDaysAdded + 1						
						end
						varRewarded  = 0
				elseif ( varToday - varLastday > 1 or varLastday - varToday > 1 ) then
						varDaysAdded = 1
						varRewarded  = 0
				end
				--是否领取和累计天数存MD
				SetPlayerGameData(varMap, varPlayer, MD_LOGINGIFT_ISREWARDED[1], MD_LOGINGIFT_ISREWARDED[2], MD_LOGINGIFT_ISREWARDED[3], varRewarded)						
				SetPlayerGameData(varMap, varPlayer, MD_NEW_LOGINGIFT_ADDUP[1], MD_NEW_LOGINGIFT_ADDUP[2], MD_NEW_LOGINGIFT_ADDUP[3], varDaysAdded)
		end
		
		SetPlayerGameData(varMap, varPlayer, MD_LOGINGIFT_DAY[1], MD_LOGINGIFT_DAY[2], MD_LOGINGIFT_DAY[3], varToday)
		
		SendLoginGiftIndex(varMap, varPlayer, varDaysAdded, varRewarded);

end
------------------------------------------------------------------------------
--登录有礼处理
------------------------------------------------------------------------------
function x802004_ProcLoginGiftEvent(varMap, varPlayer, varHandler)

		local varLastday 		= GetPlayerGameData(varMap, varPlayer, MD_LOGINGIFT_DAY[1], MD_LOGINGIFT_DAY[2], MD_LOGINGIFT_DAY[3] )		
		local varDays 			= GetPlayerGameData(varMap, varPlayer, MD_NEW_LOGINGIFT_ADDUP[1], MD_NEW_LOGINGIFT_ADDUP[2], MD_NEW_LOGINGIFT_ADDUP[3] )		
		local varRewarded 	= GetPlayerGameData(varMap, varPlayer, MD_LOGINGIFT_ISREWARDED[1], MD_LOGINGIFT_ISREWARDED[2], MD_LOGINGIFT_ISREWARDED[3]) 
		local varMsg				= "登录礼包每日仅可领取一次"
		
		WriteLog( 1, format("x802004_ProcLoginGiftEvent varMap=%d,PlayerGUID=%X,varDaysAdded=%d",varMap,GetGUID(varMap,varPlayer),varDays));
		--检查累计登陆时间是否足够
		if varDays <= 0 then
				Msg2Player(varMap, varPlayer, "累计天数不足,无法领取礼包", 4, 3 )
				return
		end
		
		--检查是否已经领取过
		if (varRewarded == 1) then
				Msg2Player(varMap, varPlayer, varMsg, 4, 3)
				return
		--执行领取
		elseif (varRewarded == 0) then
				x802004_GetLoginGift(varMap,varPlayer,varDays)		
		end
end

--------------------------------------------------------------------------------
--领取登陆有礼
--------------------------------------------------------------------------------
function x802004_GetLoginGift(varMap,varPlayer,varDays)
		
		local MaxItemKindNum = 4;--最大物品种类
		local ItemKindNum	 	 = 0;--物品种类
		local szBagFull			 = "背包不足，请整理您的背包";
		local varIndex			 = varDays;
		
		if varIndex > x802004_var_MaxDay then
				varIndex = x802004_var_MaxDay;
		end
		
		x802004_var_ItemInfo[1].ItemID,x802004_var_ItemInfo[1].ItemNum,
		x802004_var_ItemInfo[2].ItemID,x802004_var_ItemInfo[2].ItemNum,
		x802004_var_ItemInfo[3].ItemID,x802004_var_ItemInfo[3].ItemNum,
		x802004_var_ItemInfo[4].ItemID,x802004_var_ItemInfo[4].ItemNum = GetLoginGiftInfo(varMap,varPlayer,varIndex);
		
		for i = 1, MaxItemKindNum do
				if x802004_var_ItemInfo[i].ItemID > 0 then
						ItemKindNum = ItemKindNum + 1;
				end			
		end

		if ItemKindNum <= 0 then
			return
		end
		
		--检查背包
		if GetBagSpace(varMap, varPlayer) < ItemKindNum then
			Msg2Player(varMap, varPlayer, szBagFull, 4, 3)
			return 
		end	
		
		--给礼包事件
		StartItemTask(varMap)
		
		for i = 1, ItemKindNum do
				ItemAppendBind(varMap, x802004_var_ItemInfo[i].ItemID, x802004_var_ItemInfo[i].ItemNum)
				local ret = StopItemTask(varMap,varPlayer)
				
				if ret <= 0 then
						WriteLog(1, format("add LoginGift error!! guid:%x,dayIndex:%d,giftId:%d",GetGUID(varMap,varPlayer),i,x802004_var_ItemInfo[i].ItemID));
						Msg2Player(varMap, varPlayer, szBagFull, 4, 3 )
						return 0
				end
		end
		
		--给物品，写日志
		DeliverItemListSendToPlayer(varMap, varPlayer)
		
		for i = 1, MaxItemKindNum do
				if x802004_var_ItemInfo[i].ItemID > 0 then
					local varStr = "#Y您获得了登录礼品：#G#{_ITEM"..x802004_var_ItemInfo[i].ItemID.."}" .. x802004_var_ItemInfo[i].ItemNum .. "个"
					Msg2Player(varMap, varPlayer, varStr, 8, 3)	
				end			
		end
		--通知客户端
		SendLoginGiftIndex(varMap, varPlayer, varDays, 1);
		
		WriteLog(1, format("add LoginGift to player. guid:%x,dayIndex:%d", GetGUID(varMap,varPlayer),varDays))	
		
		--记录当天已领取
		SetPlayerGameData(varMap, varPlayer, MD_LOGINGIFT_ISREWARDED[1], MD_LOGINGIFT_ISREWARDED[2], MD_LOGINGIFT_ISREWARDED[3], 1)

end
--在线跨天
function x802004_ProcSwitchDayCheck(varMap, varPlayer)
--------------------------------------------------------------------------------------------------------------------------------
			--登录有礼MD迁移
			--2012.6.6--将登录有礼累计天数的旧MD迁移到新MD上
			
			local oldDaysCount = GetPlayerGameData(varMap, varPlayer, MD_LOGINGIFT_ADDUP[1], MD_LOGINGIFT_ADDUP[2], MD_LOGINGIFT_ADDUP[3])
			
			if oldDaysCount ~= 0 then
					SetPlayerGameData(varMap, varPlayer, MD_NEW_LOGINGIFT_ADDUP[1], MD_NEW_LOGINGIFT_ADDUP[2], MD_NEW_LOGINGIFT_ADDUP[3], oldDaysCount)
					SetPlayerGameData(varMap, varPlayer, MD_LOGINGIFT_ADDUP[1], MD_LOGINGIFT_ADDUP[2], MD_LOGINGIFT_ADDUP[3], 0)
			end
		
--------------------------------------------------------------------------------------------------------------------------------	

		local varToday 		 = GetDayTime()
		local varLastday 	 = GetPlayerGameData( varMap, varPlayer, MD_LOGINGIFT_DAY[1], MD_LOGINGIFT_DAY[2], MD_LOGINGIFT_DAY[3] )
		local varDaysAdded = GetPlayerGameData( varMap, varPlayer, MD_NEW_LOGINGIFT_ADDUP[1], MD_NEW_LOGINGIFT_ADDUP[2], MD_NEW_LOGINGIFT_ADDUP[3] )
		local varRewarded = GetPlayerGameData(varMap, varPlayer, MD_LOGINGIFT_ISREWARDED[1], MD_LOGINGIFT_ISREWARDED[2], MD_LOGINGIFT_ISREWARDED[3]) 
		
		WriteLog( 1, format("x802004_ProcTimerDoingStart varMap=%d,PlayerGUID=%X,varLastDay=%d,varToDay=%d",varMap,GetGUID(varMap,varPlayer),varLastday,varToday));

		if (varToday == varLastday and varRewarded == 1) then
				
		else 
				if (varToday - varLastday == 1) then
						--判断累计天数是否达到最大值1023天
						if (varDaysAdded < 1023) then
								varDaysAdded = varDaysAdded + 1						
						end
						varRewarded  = 0
				elseif ( varToday - varLastday > 1 or varLastday - varToday > 1 ) then
						varDaysAdded = 1
						varRewarded  = 0
				end
				--是否领取和累计天数存MD
				SetPlayerGameData(varMap, varPlayer, MD_LOGINGIFT_ISREWARDED[1], MD_LOGINGIFT_ISREWARDED[2], MD_LOGINGIFT_ISREWARDED[3], varRewarded)						
				SetPlayerGameData(varMap, varPlayer, MD_NEW_LOGINGIFT_ADDUP[1], MD_NEW_LOGINGIFT_ADDUP[2], MD_NEW_LOGINGIFT_ADDUP[3], varDaysAdded)
		end
		
		SetPlayerGameData(varMap, varPlayer, MD_LOGINGIFT_DAY[1], MD_LOGINGIFT_DAY[2], MD_LOGINGIFT_DAY[3], varToday)
		
		SendLoginGiftIndex(varMap, varPlayer, varDaysAdded, varRewarded);
		
end
