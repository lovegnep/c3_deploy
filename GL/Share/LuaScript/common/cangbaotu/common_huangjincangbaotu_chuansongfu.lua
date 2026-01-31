




x300340_var_FileId = 300340 
x300340_var_ID     = 12035019
x300340_var_BUFFID 				= 30578    --长生天的赐福（骑乘）
x300340_var_BUFFID1 			= 30579    --长生天的赐福（宝石）
x300340_var_BUFFID2 			= 30580    --长生天的赐福（洗石剂）
x300340_var_BUFFID3 			= 30581    --长生天的赐福（外装）
x300340_var_BUFFID4 			= 30582    --长生天的赐福（奥钻）


x300340_var_BUFF = {
[30578] = {QuestID = {8046,8047},QuestName = "【个人】骑乘黄金藏宝图的秘密"},
[30579]	= {QuestID = {8048,8049},QuestName = "【个人】秘钻黄金藏宝图的秘密"},
[30580]	= {QuestID = {8099,8100},QuestName = "【个人】洗石黄金藏宝图的秘密"},
[30581]	= {QuestID = {8101,8102},QuestName = "【个人】外装黄金藏宝图的秘密"},
[30582]	= {QuestID = {8103,8104},QuestName = "【个人】奥钻黄金藏宝图的秘密"},
}



x300340_var_QuestID         = 0
x300340_MP_TARGET1					= 1   --地图信息
x300340_MP_TARGET2					= 2   --坐标X
x300340_MP_TARGET3					= 3   --坐标Y
x300340_MP_TARGET4					= 4   --挖宝地图ID
x300340_MP_ISCOMPLETE				= 7	  --任务是否完成







function x300340_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )

end






function x300340_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300340_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300340_ProcConditionCheck( varMap, varPlayer, varBagIdx)

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300340_var_QuestID)
	local varx 	 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300340_MP_TARGET2)
  local varz 	 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300340_MP_TARGET3)
  local mapID = GetQuestParam( varMap, varPlayer, varQuestIdx, x300340_MP_TARGET4) 
	local X, Z = GetWorldPos( varMap, varPlayer)
	
	if varMap == mapID and X == varx and Z == varz then
		local varMsg = "您已找到宝藏，请在此处使用#G铁铲#cffcf00耐心挖掘！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return
	end	

	local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < 40 then
		local varMsg = "40级以上才能使用黄金藏宝图传送符！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return
	end
	if IsBusMember(varMap, varPlayer) == 1 then
		local varMsg = "运镖、乘坐公车或者护送状态时不能使用黄金藏宝图传送符！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 
	end
	
	if varMap == 12 then
		local varMsg = "监狱中不能使用黄金藏宝图传送符！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 0
	end

	if IsHaveSpecificImpact( varMap, varPlayer, 7702 ) > 0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "扛着旗子不能使用黄金藏宝图传送符！");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"扛着旗子不能使用黄金藏宝图传送符！",8,2)
		return 0
	end
	if IsHaveSpecificImpact( varMap, varPlayer, 7062 ) > 0 
		or IsHaveSpecificImpact( varMap, varPlayer, 7063 ) >0 
		or IsHaveSpecificImpact( varMap, varPlayer, 7064 ) >0
		or IsHaveSpecificImpact( varMap, varPlayer, 7065 ) >0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "携带龙魂状态不能使用黄金藏宝图传送符");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"携带龙魂状态不能使用黄金藏宝图传送符",8,2)
		return 0
	end
	local IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 7536  )
    if IsHaveFlag ~= 0 then
    	local varMsg = "在暴龙大作战期间，不能传送"
    	StartTalkTask(varMap)
			TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 0
    end
    
    IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 7537 )
    if IsHaveFlag ~= 0 then
    	local varMsg = "在暴龙大作战期间，不能传送"
    	StartTalkTask(varMap)
			TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 0
    end
	

	
	local selfType = GetObjType(varMap, varPlayer)
	
	if selfType == 1 then 
		if IsHaveQuestNM( varMap, varPlayer, 7537) ~= 0 or  IsHaveQuestNM( varMap, varPlayer, 7538) ~= 0 or IsHaveQuestNM( varMap, varPlayer, 7539) ~= 0 then
			Msg2Player(varMap,varPlayer,"很抱歉，未完成#G铁人三项#cffcf00任务不能使用黄金藏宝图传送符！",8,2)
			Msg2Player(varMap,varPlayer,"很抱歉，未完成#G铁人三项#cffcf00任务不能使用黄金藏宝图传送符！",8,3)
			return
		end
	end
	
		if IsHaveQuestNM( varMap, varPlayer, 9106) ~= 0 then
			Msg2Player(varMap,varPlayer,"未完成#G【个人】暗渡陈仓#cffcf00任务不能使用黄金藏宝图传送符",8,3)
			Msg2Player(varMap,varPlayer,"未完成#G【个人】暗渡陈仓#cffcf00任务不能使用黄金藏宝图传送符",8,2)
			return -1
		end
	
	if GetSceneType(varMap) == 2 then
		local varMsg = "战场内，不能传送"
    	StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return -1
	end
	
	if GetSceneType(varMap) == 1 then
		local varMsg = "副本内，不能传送"
    	StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return -1
	end
	

	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end


function x300340_ProcAddItem(varMap, varPlayer, varItem)
end






function x300340_ProcDeplete( varMap, varPlayer,varBagIdx )
		local n = 0
		local m = 0
		local QuestName = ""
		for i , item in x300340_var_BUFF do 
		 if IsHaveSpecificImpact(varMap, varPlayer, i) == 1 then
		 QuestName = item.QuestName
		 	m = m + 1
		 		for j , k in item.QuestID do 
		 			if IsHaveQuestNM( varMap, varPlayer, k) > 0 then 
		 				x300340_var_QuestID = k
		 				n = n + 1
		 			end
		 		end
		 		if n == 0 then
		 			Msg2Player( varMap, varPlayer, format("你没有#G"..QuestName.."#cffcf00任务,无法使用传送符！"), 8, 3)   
  	 			Msg2Player( varMap, varPlayer, format("你没有#G"..QuestName.."#cffcf00任务,无法使用传送符！"), 8, 2)    
  	 			return 0
  	 		end
		 end
		end  
	  if m == 0 then
		 	Msg2Player( varMap, varPlayer, "你没有#G洞彻玄机#cffcf00的能力,无法使用传送符！", 8, 3)   
  	 	Msg2Player( varMap, varPlayer, "你没有#G洞彻玄机#cffcf00的能力,无法使用传送符！", 8, 2)    
  	 	return 0
  	end
	  
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300340_var_QuestID)
	local varx 	 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300340_MP_TARGET2)
  local varz 	 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300340_MP_TARGET3)
  local mapID = GetQuestParam( varMap, varPlayer, varQuestIdx, x300340_MP_TARGET4) 
  x300340_ClearSpcialEvents(varMap,varPlayer)
  if varMap == mapID then
  	SetPos(varMap,varPlayer,varx,varz) 
  else
  	NewWorld(varMap,varPlayer,mapID,varx,varz, 300340)
  end
 return 1
end

function x300340_ProcAddMoney(varMap, varPlayer)
end

function x300340_ProcAddItemByLevel(varMap, varPlayer)	
end








function x300340_ProcActivateOnce( varMap, varPlayer, varImpact )	
end







function x300340_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x300340_ClearSpcialEvents(varMap,varPlayer)

	local varCount = GetItemCountInBag( varMap, varPlayer, 13080024)
    if varCount > 0 then
        if DelItem( varMap, varPlayer, 13080024, varCount ) ~= 1 then return 0 end
    end
    
  	if varMap == 14 then
        	SetPlayerMutexState( varMap, varPlayer, PLAYER_STATE_DANCERY, 0)
            
            if IsHaveSpecificImpact( varMap, varPlayer, 7651) == 1 then
                CancelSpecificImpact( varMap, varPlayer, 7651)
            elseif IsHaveSpecificImpact( varMap, varPlayer, 7652) == 1 then
                CancelSpecificImpact( varMap, varPlayer, 7652)
            elseif IsHaveSpecificImpact( varMap, varPlayer, 7653) == 1 then
                CancelSpecificImpact( varMap, varPlayer, 7653)
            elseif IsHaveSpecificImpact( varMap, varPlayer, 7654) == 1 then
                CancelSpecificImpact( varMap, varPlayer, 7654)
            elseif IsHaveSpecificImpact( varMap, varPlayer, 7655) == 1 then
                CancelSpecificImpact( varMap, varPlayer, 7655)
            elseif IsHaveSpecificImpact( varMap, varPlayer, 7656) == 1 then
                CancelSpecificImpact( varMap, varPlayer, 7656)
            end
	  end
end
