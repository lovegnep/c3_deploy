

x310923_var_FileId 		= 310923
x310923_var_QuestKind 	= 	1                       
x310923_var_QuestName	= "【个人】仲夏庆典"
x310923_var_UICommandID	= 110


x310923_var_IsEnableId    = 1072
x310923_var_LimitLevel	= 40			


x310923_var_RefreshTime	= 60*10*1000

x310923_var_SubmitItem	= {12500311,12500312,12500313,12500314,12500305,12500306,12500315,12500316}

x310923_var_SubmitItemState = {}




function x310923_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4,Param5 )
		--if varMap == 36 then
		--	CreateMonster( varMap, 11001, 129, 175, 1, 971, x310923_var_FileId, -1, 21, 60*60*1000, 0)
		--elseif varMap == 37 then
		--	CreateMonster( varMap, 11001, 193, 164, 1, 971, x310923_var_FileId, -1, 21, 60*60*1000, 0)
		--elseif varMap == 38 then
		--	CreateMonster( varMap, 11001, 96, 147, 1, 971, x310923_var_FileId, -1, 21, 60*60*1000, 0)
		--	local varMsg1 = "贺岁兽王出现在大都东、南、西！"
		--	LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
		--	LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
		--	LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
		--end
end



function x310923_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if GetGameOpenById( x310923_var_IsEnableId) <= 0 then
        return
    end
    
  local year, month, day = GetYearMonthDay();  
 	local varday = GetDayOfYear()
	if year ~= 2012 or varday < 207 or varday > 242 then   --2012年7月26日到8月30日
				return
	end
    
	TalkAppendButton(varMap,x310923_var_FileId, x310923_var_QuestName, 3, -1)
	--TalkAppendButton(varMap,x310923_var_FileId, "个人节日积分查询", 3, 0)
	--TalkAppendButton(varMap, x310923_var_FileId, "全服新年积分查询", 3, 3)
	--TalkAppendButton(varMap, x310923_var_FileId, "领取全服新年积分大礼", 3, 2)
 -- TalkAppendButton(varMap, x310923_var_FileId, "新年活动说明", 13, 4)
end




function x310923_ProcEventEntry( varMap ,varPlayer, varTalknpc, idScript, idExt )

	if GetGameOpenById( x310923_var_IsEnableId) <= 0 then
        return
    end
    
   if idExt < 0 then
   	StartTalkTask(varMap)
   	TalkAppendString(varMap,"\t@myname，欢迎来参与#R仲夏庆典#W活动，如果你能收集到#G纪念章“成”、“吉”、“思”、“汗”、“仲”、“夏”、“庆”、“典”#W这些限量的仲夏庆典纪念章，可以在这里兑换#G仲夏庆典大礼包#W，集齐所有的纪念章在更可额外获得#G火狐盛典礼包#W。\n \n#G注#W：纪念章可以通过开仲夏狂欢活动的#G欢乐集气的捐献仲夏娱乐币#W和#G仲夏嘉年华#W获得。")
   	TalkAppendButton(varMap, x310923_var_FileId, "兑换仲夏庆典大礼包", 3, 1)
   	
   	
   	StopTalkTask()
   	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
   	
   elseif idExt == 1 then
    ---判断等级不足40级
   	local level =GetLevel( varMap, varPlayer)
   	if level < 40 then
   	 	Msg2Player(varMap, varPlayer, "等级不足40级，无法参与本活动。", 0, 2)
			Msg2Player(varMap, varPlayer, "等级不足40级，无法参与本活动", 0, 3)
			return
   	end
   
	   StartGCDTask(varMap)
	   GCDAppendInt(varMap, x310923_var_FileId)
	   GCDAppendInt(varMap, varTalknpc)
	   DeliverGCDInfo(varMap,varPlayer, x310923_var_UICommandID)
	   StopGCDTask(varMap)
   
   --elseif idExt == 2 then
   -----判断等级不足40级
   --	local level =GetLevel( varMap, varPlayer)
   --	if level < 40 then
   --	 	Msg2Player(varMap, varPlayer, "等级不足40级，无法领取新年积分大礼", 0, 2)
		----		Msg2Player(varMap, varPlayer, "等级不足40级，无法领取新年积分大礼", 0, 3)
		----		return
   --	end
   --
   --	local score = GetCountryParam(varMap, 0, CD_HUODONG_XINNIAN)
   --	local varCount = GetPlayerGameData(varMap, varPlayer, MD_XINNIAN_ITEMCOUNT[1], MD_XINNIAN_ITEMCOUNT[2],MD_XINNIAN_ITEMCOUNT[3])
   --	
   --	if varCount < floor(score/20000) then
   --		StartTalkTask(varMap)          
		----		TalkAppendString(varMap, "#Y".."领取全服新年积分大礼".."#W")
		----		TalkAppendString(varMap, "\t当新全服新年积分达到2万及2万的倍数时，每名玩家可以在我这里领取一份礼物——10个宾利大礼包。\n\t你现在领取这份礼物吗？")
		----		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310923_var_FileId, x310923_var_FileId)
		----	else
		----		StartTalkTask(varMap)          
		----		TalkAppendString(varMap, "#Y".."领取全服新年积分大礼".."#W")
		----		TalkAppendString(varMap, "\t当新全服新年积分达到2万及2万的倍数时，每名玩家可以在我这里领取一份神秘礼物。")
		----		StopTalkTask()
		----		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310923_var_FileId, x310923_var_FileId, 1)
   	--end
   --	
   --	
   --elseif 	idExt == 0 then
    	--StartTalkTask( varMap)
      --      TalkAppendString( varMap, "#Y【个人】节日积分查询" )
      --      TalkAppendString( varMap, format( "\n\t您目前的节日积分为#G%d#W。", GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] ) ) )
      --  StopTalkTask()
      --DeliverTalkMenu( varMap, varPlayer, varTalknpc)	
    --elseif idExt == 3 then
    --	local score = GetCountryParam(varMap, 0, CD_HUODONG_XINNIAN)
    --	if score < 0 then
    --		score = 0
    --		SetCountryQuestData(varMap, 0, CD_HUODONG_XINNIAN, score)
    --	end
    --	
    --	StartTalkTask(varMap)
    --	TalkAppendString(varMap, "#Y".."全服新年积分查询".."#W")
		--	TalkAppendString(varMap, "\t当前新年积分是:#G"..score.."\n \n\t#W当积分到达500及500的整数倍时，大都附近会出现喜兽王。\n\t当积分到达5000及5000的整数倍时，大都附近刷出大量新年礼包。\n\t当积分到达10000及10000的整数倍时，大都附近场景出现掉落新年坐骑的九旄战神。\n\t#W当积分到达2万及2万整数倍时，可在活动使者处领取一份奖品。\n \n#G注：每次只会触发一个事件。") 
    --	StopTalkTask()
    --	DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310923_var_FileId, x310923_var_FileId, 1)
    --elseif idExt == 4 then
    --	StartTalkTask(varMap)          
		--TalkAppendString(varMap, "#Y".."新年活动说明".."#W")
		--TalkAppendString(varMap, "\t在12月21日至1月3日期间，每天11：00、15：00、17：00、21：00点。大都郊区和威海港刷出贺岁喜兽。将其消灭会得到黄金纪念币和宾利部件。\n\t在大都活动使者处兑换黄金纪念币会获得经验、节日积分和宾利部件（有几率）。\n\t宾利部件可以在大都活动使者处换取大礼,一次兑换8个宾利部件更可得到一张#G毛驴降世符#W。\n\t每次兑换黄金纪念币和每次兑换宾利部件，都会增加全服新年积分。当新年积分到达特定数值时，全服会有惊喜事件发生。")   	
		--StopTalkTask()
		--DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310923_var_FileId, x310923_var_FileId, 1)
    end
end

function x310923_ProcMutliSubmitItem(varMap, varPlayer, varTalknpc, submitCode )
	
	local varCount = 0
	local varFlag = 128
	local j = 8
	for varI = 1, 8 do
		if submitCode >= varFlag then
			varCount = varCount+1
			x310923_var_SubmitItemState[j] = 1
			submitCode = submitCode-varFlag
		else
			x310923_var_SubmitItemState[j] = 0
		end
		varFlag = varFlag/2
		j = j-1
	end
	
	if varCount < 2 then
		return
	end
	
	if GetBagSpace(varMap, varPlayer) <= 1 then
		Msg2Player(varMap, varPlayer, "很抱歉，兑换仲夏庆典大礼包需要至少2个背包空位。", 0, 2)
		Msg2Player(varMap, varPlayer, "很抱歉，兑换仲夏庆典大礼包需要至少2个背包空位", 0, 3)
		return
	end
	
	local isbind = 1       --所有都为绑定的礼包
	for varI, item in x310923_var_SubmitItem do
		if x310923_var_SubmitItemState[varI] == 1 then
			local varBagIdx = FindFirstBagIndexOfItem(varMap, varPlayer, item)
			if varBagIdx >= 0 and IsItemBind(varMap, varPlayer, varBagIdx) > 0 then
				isbind = 1
			end
		end
	end
	for varI, item in x310923_var_SubmitItem do
		if x310923_var_SubmitItemState[varI] == 1 then
			if DelItemByIDInBag(varMap, varPlayer, item, 1) ~= 1 then return 0 end
		end
	end
	
	if varCount <= 3 then
	
		StartItemTask( varMap )
		if isbind == 1 then
			ItemAppendBind( varMap, 12500310, 1)
		else
			ItemAppend( varMap, 12500310, 1)
		end
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			local varStr = format("兑换完成，恭喜您获得1个@item_%d",12500310)
			Msg2Player(varMap, varPlayer, varStr, 8, 3)
			Msg2Player(varMap, varPlayer, varStr, 8, 2)
		else
			local varStr = "#Y背包空间不足，请整理背包后再试！"
			Msg2Player(varMap, varPlayer, varStr, 8, 3)
			Msg2Player(varMap, varPlayer, varStr, 8, 2)
			return
		end
		
		--SetCountryQuestData(varMap, 0, CD_HUODONG_XINNIAN, 1, 2)
		--local myGuid = GetPlayerGUID( varMap,varPlayer )
		--GetCountryQuestDataNM(varMap, myGuid, 0, CD_HUODONG_XINNIAN, x310923_var_FileId, -1, "ProcScoreChanged", 3)
	elseif varCount <= 5 then
	
		StartItemTask( varMap )
		if isbind == 1 then
			ItemAppendBind( varMap, 12500310, 2)
		else
			ItemAppend( varMap, 12500310, 2)
		end
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			local varStr = format("兑换完成，恭喜您获得2个@item_%d",12500310)
			Msg2Player(varMap, varPlayer, varStr, 8, 3)
			Msg2Player(varMap, varPlayer, varStr, 8, 2)			
		else
			local varStr = "#Y背包空间不足，请整理背包后再试！"
			Msg2Player(varMap, varPlayer, varStr, 8, 3)
			Msg2Player(varMap, varPlayer, varStr, 8, 2)
			return
		end
		
		--SetCountryQuestData(varMap, 0, CD_HUODONG_XINNIAN, 2, 2)
		--local myGuid = GetPlayerGUID( varMap,varPlayer )
		--GetCountryQuestDataNM(varMap, myGuid, 0, CD_HUODONG_XINNIAN, x310923_var_FileId, -1, "ProcScoreChanged", 3)
	elseif varCount <= 7 then
	
		StartItemTask( varMap )
		if isbind == 1 then
			ItemAppendBind( varMap, 12500310, 6)
		else
			ItemAppend( varMap, 12500310, 6)
		end
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			local varStr = format("兑换完成，恭喜您获得6个@item_%d",12500310)
			Msg2Player(varMap, varPlayer, varStr, 8, 3)
			Msg2Player(varMap, varPlayer, varStr, 8, 2)			
		else
			local varStr = "#Y背包空间不足，请整理背包后再试！"
			Msg2Player(varMap, varPlayer, varStr, 8, 3)
			Msg2Player(varMap, varPlayer, varStr, 8, 2)
			return
		end
		
		--SetCountryQuestData(varMap, 0, CD_HUODONG_XINNIAN, 3, 2 )
		--local myGuid = GetPlayerGUID( varMap,varPlayer )
		--GetCountryQuestDataNM(varMap, myGuid, 0, CD_HUODONG_XINNIAN, x310923_var_FileId, -1, "ProcScoreChanged", 3)
	elseif varCount == 8 then
		StartItemTask( varMap )
		if isbind == 1 then
			ItemAppendBind( varMap, 12500310, 10)
		else
			ItemAppend( varMap, 12500310, 10)
		end
			ItemAppendBind( varMap, 12030077, 1)   --火狐盛典礼包
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local varStr = format("兑换完成，恭喜您获得10个@item_%d#cffcf00和1个#G火狐盛典礼包",12500310 )
				Msg2Player(varMap, varPlayer, varStr, 8, 3)
				Msg2Player(varMap, varPlayer, varStr, 8, 2)			
			else
				local varStr = "#Y背包空间不足，请整理背包后再试！"
				Msg2Player(varMap, varPlayer, varStr, 8, 3)
				Msg2Player(varMap, varPlayer, varStr, 8, 2)
				return
		end
		--SetCountryQuestData(varMap, 0, CD_HUODONG_XINNIAN, 10, 2)
		--local myGuid = GetPlayerGUID( varMap,varPlayer )
		--GetCountryQuestDataNM(varMap, myGuid, 0, CD_HUODONG_XINNIAN, x310923_var_FileId, -1, "ProcScoreChanged", 3)
		
		GamePlayScriptLog( varMap, varPlayer, 2502)
	end
	
		
	StartGCDTask(varMap)
    GCDAppendInt(varMap, x310923_var_FileId)
    GCDAppendInt(varMap, varTalknpc)
    DeliverGCDInfo(varMap,varPlayer, x310923_var_UICommandID)
    StopGCDTask(varMap)
end

function x310923_ProcScoreChanged(varMap, guid, questData)
	if mod(questData, 10000) == 0 then
		if varMap ==36 then
			CreateMonster( 36, 11002, 98, 180, 1, 952, x310923_var_FileId, -1, 21, 60*60*1000, 0, "")
			local varMsg1 = format("新年活动积分到%d分，九旄战神出现在大都南！",questData)
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)

		end
		
	elseif mod(questData, 5000) == 0 then
		if varMap ==36 or varMap ==37 or varMap ==38 then
			SetSystemTimerTick( varMap, 310926, "ProcTimerDoingStart", 307, 60*1000 ) 
			local varMsg1 = format("新年活动积分到%d分，大量新年礼物即将出现在大都郊区！",questData)
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
			
		end	
	elseif mod(questData, 500) == 0 then
		if varMap ==36 or varMap ==37 or varMap ==38 then
			local varMsg1 = format("新年活动积分到%d分，贺岁兽王即将出现在大都郊区",questData)
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
			LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
			
			SetSystemTimerTick( varMap, x310923_var_FileId, "ProcTimerDoingStart", 308, 60*1000 ) 
		end
	end
	
	if varMap == 0 then
	
		local varPlayer = Guid2ObjId(varMap, guid)
		
		if mod(questData, 10000) == 0 then
			GamePlayScriptLog( varMap, varPlayer, 2506)
		elseif mod(questData, 5000) == 0 then
			GamePlayScriptLog( varMap, varPlayer, 2507)
		elseif mod(questData, 500) == 0 then
			GamePlayScriptLog( varMap, varPlayer, 2508)
		end
	end

	
	
	
end

function x310923_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

    return 1
end




function x310923_ProcAccept( varMap, varPlayer )

  local year, month, day = GetYearMonthDay();  
 	local varday = GetDayOfYear()
	if year ~= 2012 or varday < 207 or varday > 242 then   --2012年7月26日到8月30日
				return
	end
	
	if GetBagSpace(varMap, varPlayer) <= 1 then
		Msg2Player(varMap, varPlayer, "需要两个剩余背包位置，才能进行兑换", 0, 2)
		Msg2Player(varMap, varPlayer, "需要两个剩余背包位置，才能进行兑换", 0, 3)
		return
	end		

	--local score = GetCountryParam(varMap, 0, CD_HUODONG_XINNIAN)
  --local varCount = GetPlayerGameData(varMap, varPlayer, MD_XINNIAN_ITEMCOUNT[1], MD_XINNIAN_ITEMCOUNT[2],MD_XINNIAN_ITEMCOUNT[3])
  --  	
  --if varCount >= floor(score/20000) then
  --  return
  --end	
	--		
	--StartItemTask( varMap )
	--
	--
	--if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
	--	ItemAppend( varMap, 12500310, 10)
	--else
	--	ItemAppendBind( varMap, 12500310, 10)
	--end
	--
	--local varRet = StopItemTask( varMap, varPlayer )
	--if varRet > 0 then
	--	DeliverItemListSendToPlayer(varMap,varPlayer)
	--	Msg2Player(varMap, varPlayer, "领取成功，获得10个宾利大礼包", 0, 2)
	--	Msg2Player(varMap, varPlayer, "领取成功，获得10个宾利大礼包", 0, 3)
	--	local varCount = GetPlayerGameData(varMap, varPlayer, MD_XINNIAN_ITEMCOUNT[1], MD_XINNIAN_ITEMCOUNT[2],MD_XINNIAN_ITEMCOUNT[3])
	--	SetPlayerGameData(varMap, varPlayer, MD_XINNIAN_ITEMCOUNT[1], MD_XINNIAN_ITEMCOUNT[2], MD_XINNIAN_ITEMCOUNT[3], varCount+1)
	--else
	--	local varStr = "#Y背包空间不足，请整理背包后再试！"
	--	Msg2Player(varMap, varPlayer, varStr, 8, 3)
	--	Msg2Player(varMap, varPlayer, varStr, 8, 2)
	--end
end

function x310923_ProcDie(varMap, varPlayer, varKiller)
	
	if IsObjValid( varMap,varKiller ) ~=1 then
		return
	end
end




function x310923_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x310923_ProcContinue( varMap, varPlayer, varTalknpc )
end




function x310923_CheckSubmit( varMap, varPlayer )
end




function x310923_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end




function x310923_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x310923_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310923_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end


