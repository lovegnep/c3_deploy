




--DECLARE_QUEST_INFO_START--


x300576_var_QuestId 				= 	9332                     
x300576_var_FileId 					= 	300576                  
x300576_var_QuestKind 				= 	1                       
x300576_var_LevelLess					= 	40                      


x300576_var_QuestName				= 	"【个人】倾城火雷"
x300576_var_QuestName1				= 	"你可听说过紫青侠女？"
x300576_var_QuestTarget				= 	"仔细研究#g火雷弹安放图#w，找到并拆除#g火雷弹。"
x300576_var_QuestInfo				= 	""
x300576_var_ContinueInfo				= 	""
x300576_var_QuestCompleted			= 	""
x300576_var_QuestHelp				=	""          


x300576_var_ExtTarget					=	{ {type=20,n=1,target="【个人】倾城火雷"}}



x300576_var_ExpBonus					= 	0;
x300576_var_BonusItem					=	{}	

x300576_var_BonusMoney1               = 	0
x300576_var_BonusMoney2               =   0
x300576_var_BonusMoney3               =   0

x300576_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--



x300576_var_NpcCount =10

x300576_var_GrowPointList = {                                  
						{varName = "火雷弹", varX=87.4, z=153.7 ,varItem=13810140,gpid=208},
						{varName = "火雷弹", varX=119.4, z=141.2,varItem=13810141,gpid=209},
						{varName = "火雷弹", varX=101.4, z=119.5,varItem=13810142,gpid=210},
						{varName = "火雷弹", varX=110.7, z=163.1,varItem=13810143,gpid=211},
						{varName = "火雷弹", varX=125.2, z=88.4,varItem=13810144,gpid=212},
						{varName = "火雷弹", varX=94, z=135,varItem=13810145,gpid=213}, 
						{varName = "火雷弹", varX=125.1, z=112.8,varItem=13810146,gpid=214},
						{varName = "火雷弹", varX=89.5, z=89.7,varItem=13810147,gpid=215}, 
						{varName = "火雷弹", varX=131, z=163.5,varItem=13810148,gpid=216},
						{varName = "火雷弹", varX=86.7, z=119.5,varItem=13810149,gpid=217} 
                                                       
					}
					
x300576_var_ReplyNpcId = 143046

x300576_var_GameId	= 1013

x300576_var_TaskItemId = 13810151
x300576_var_ItemId = 12030028


x300576_var_BonusChoiceItem2   = {
								{10019300,10077300,10238300,10208300,10268300,10248300,10258300,10278300},
								{10028300,10087300,10238310,10208310,10268310,10248310,10258310,10278310},
								{10038300,10097300,10238320,10208320,10268320,10248320,10258320,10278320},
								{10048300,10107300,10238330,10208330,10268330,10248330,10258330,10278330},
								{10058300,10117300,10238340,10208340,10268340,10248340,10258340,10278340},
								{10068300,10127300,10238350,10208350,10268350,10248350,10258350,10278350}
									
								}


x300576_var_RewardTable       = {
                                { minLevel = 40, maxLevel = 60,  items = { { varId = 11000201, cnt = 8 }, { varId = 11050002, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030136, cnt = 1 } } }, 
                                { minLevel = 60, maxLevel = 80,  items = { { varId = 11000202, cnt = 8 }, { varId = 11050003, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030137, cnt = 1 } } }, 
                                { minLevel = 80, maxLevel = 100, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030138, cnt = 1 } } }, 
                                { minLevel = 100, maxLevel = 999, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030139, cnt = 1 } } }, 
}


function x300576_GetQuestId( varMap, varPlayer )
	return x300576_var_QuestId
end

function x300576_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x300576_var_LevelLess then
       return
    end

	local varMyQuest = x300576_GetQuestId( varMap, varPlayer )
	
	
	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		
		TalkAppendButton(varMap, varMyQuest, x300576_var_QuestName,8,1);
	else
		local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varMyQuest);

		
		TalkAppendButton(varMap, varMyQuest, x300576_var_QuestName,varState,varState);

	end


	
end





function x300576_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExt )
	
	if GetGameOpenById(x300576_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300576_var_QuestId) == 0 then
		x300576_ShowTips(varMap, varPlayer, "此活动今天不开放，详情请到大都包打听处查询每日新鲜事")
		return
	end

	local varMyQuest = x300576_GetQuestId( varMap, varPlayer )	
	
	
	
	
		
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		x300576_DeliverTalkInfo( varMap, varPlayer, varTalknpc, varMyQuest, 0 )
	else
		if varExt==7 then
			x300576_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varMyQuest )
		else
			x300576_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varMyQuest )
		end
		
	end
end


function x300576_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest )
	
	if GetGameOpenById(x300576_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300576_var_QuestId) == 0 then
		
		return 0;
	end
	return 1;

end

function x300576_CheckRequest(varMap, varPlayer)
	if GetGameOpenById(x300576_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300576_var_QuestId) == 0 then
		x300576_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0
	end
	local varMyQuest = x300576_GetQuestId( varMap, varPlayer )

	if GetLevel(varMap, varPlayer) <x300576_var_LevelLess then
		x300576_ShowTips(varMap, varPlayer, "你等级不足")
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) > 0 then
		x300576_ShowTips(varMap, varPlayer, "你已经有这个任务，请先完成这个任务")
		return 0;
	end

    local varToday = GetDayOfYear()
    if GetPlayerGameData(varMap, varPlayer, MD_LVZHUANG70_DATE[1], MD_LVZHUANG70_DATE[2],MD_LVZHUANG70_DATE[3] ) == varToday then
        x300576_ShowTips(varMap, varPlayer, "很抱歉，您今天已经做过此任务，不能再次领取")
        return 0;
    end

    if GetPlayerGameData( varMap, varPlayer, MD_RICHANG_DAY[ 1], MD_RICHANG_DAY[ 2], MD_RICHANG_DAY[ 3] ) == varToday then
        if GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[ 1], MD_RICHANG_COUNT[ 2], MD_RICHANG_COUNT[ 3] ) >= 3 then
            Msg2Player( varMap, varPlayer, "你不能再领取今天的日常任务了", 8, 3)
            return 0
        end
    else
        SetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3], 0)
    end

	return 1;

end

function x300576_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
	
	
	if GetGameOpenById(x300576_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300576_var_QuestId) == 0 then
		x300576_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	if x300576_CheckRequest(varMap, varPlayer)<=0 then
		
		return 0;
	end

	local varMyQuest = x300576_GetQuestId( varMap, varPlayer )

	
	local varFullQuest = IsQuestFullNM(varMap,varPlayer)
	
	if varFullQuest>0 then
		x300576_ShowTips(varMap, varPlayer, "任务已满，无法接受任务")
		return 0
	end
	

	
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,varMyQuest  )
	if varFrontQuest1 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
			return 0
		end
	end
	if varFrontQuest2 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
			return 0
		end
	end
	if varFrontQuest3 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
			return 0
		end
	end

	local varRet = AddQuest( varMap, varPlayer, varMyQuest, x300576_var_FileId, 0, 0, 0,0)
		
	if varRet > 0 then
		
		
		local varMyQuest = x300576_GetQuestId( varMap, varPlayer )
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

		StartItemTask(varMap)
			ItemAppend( varMap, x300576_var_TaskItemId, 1 )
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
			
			DeliverItemListSendToPlayer(varMap,varPlayer)
			
			
		else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"背包空间不足，请整理背包后再来。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)

			DelQuestNM( varMap, varPlayer, varMyQuest )
			return 0;	
		end

		local varStr = "您接受了任务："..x300576_var_QuestName;
		x300576_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)
		

		local nNpcType = random(1,x300576_var_NpcCount)

		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, nNpcType )
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, 0)

		
		GamePlayScriptLog(varMap, varPlayer, 831)
		return 1
	else
		
		x300576_ShowTips(varMap, varPlayer, "接受任务错误")
	
	end


end



function x300576_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x300576_ProcQuestAbandon( varMap, varPlayer, varQuest )

	local varMyQuest = x300576_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

	if varRet>0 then

		local varStr = "您放弃了任务："..x300576_var_QuestName;
	    x300576_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)


		local n = GetItemCount( varMap, varPlayer, x300576_var_TaskItemId );

	
		if n > 0 then
			if DelItem(varMap, varPlayer,x300576_var_TaskItemId,n) ~= 1 then return 0 end
			
		end

		for varI,item in x300576_var_GrowPointList do
			n = GetItemCount( varMap, varPlayer, item.varItem );
			if n > 0 then
				if DelItem(varMap, varPlayer,item.varItem,n) ~= 1 then return 0 end
				
			end	

		end

        local varToday = GetDayOfYear()
		SetPlayerGameData(varMap, varPlayer, MD_LVZHUANG70_DATE[1], MD_LVZHUANG70_DATE[2], MD_LVZHUANG70_DATE[3], varToday)
		if varToday == GetPlayerGameData( varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2], MD_RICHANG_DAY[3] ) then
            local varCount = GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3] )
            if varCount < 3 then
                SetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3], 1 + varCount)
            end
        else
            SetPlayerGameData( varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2], MD_RICHANG_DAY[3], varToday)
            SetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3], 1)
        end
	else
		x300576_ShowTips(varMap, varPlayer, "放弃任务失败")
	end

	
end



function x300576_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
	if GetGameOpenById(x300576_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300576_var_QuestId) == 0 then
		x300576_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	local varMyQuest = x300576_GetQuestId( varMap, varPlayer )
	
	if x300576_CheckSubmit(varMap, varPlayer )>0 then
		local varToday = GetDayOfYear()
        local varCount = GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3] )
        if varToday == GetPlayerGameData(varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2],MD_RICHANG_DAY[3] ) and varCount >= 3 then
            Msg2Player( varMap, varPlayer, "今天的日常任务已经不能再交了，请明天再来", 8, 3)
            return 0
        end

		local varRet = x300576_GiveReward(varMap,varPlayer,varButtonClick)

		if varRet<=0 then
			return
		end
		local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

		if varRet>0 then
			LuaCallNoclosure( 270300, "ProcSubquestFinished", varMap, varPlayer, x300576_var_QuestId)
			local n = GetItemCount( varMap, varPlayer, x300576_var_TaskItemId );

	
			if n > 0 then
				if DelItem(varMap, varPlayer,x300576_var_TaskItemId,n) ~= 1 then return 0 end
				
			end

			for varI,item in x300576_var_GrowPointList do
				n = GetItemCount( varMap, varPlayer, item.varItem );
				if n > 0 then
					if DelItem(varMap, varPlayer,item.varItem,n) ~= 1 then return 0 end
					
				end	

			end

			local varStr = "您完成了任务:"..x300576_var_QuestName;
			x300576_ShowTips(varMap, varPlayer, varStr)
			Msg2Player(varMap,varPlayer,varStr,8,2)

			GamePlayScriptLog(varMap, varPlayer, 832)

            SetPlayerGameData(varMap, varPlayer, MD_LVZHUANG70_DATE[1], MD_LVZHUANG70_DATE[2], MD_LVZHUANG70_DATE[3], GetDayOfYear() )
			
		else
			x300576_ShowTips(varMap, varPlayer, "交任务失败")
		end
		
	end
end

function x300576_GiveReward(varMap,varPlayer,varRadioSelected)
	
	if GetGameOpenById(x300576_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300576_var_QuestId) == 0 then
		x300576_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	
    -- find item index
    local index = 0
    for i, item in x300576_var_RewardTable do
        for j, iter in item.items do
            if varRadioSelected == iter.varId then
                index = j
                break
            end
        end
        if index ~= 0 then
            break
        end
    end
    
	local varLevel = GetLevel( varMap, varPlayer)
    local varCanBind = 0
    local varCount = 0
    local varId = 0
    if index <= 2 or index  ==5 then
        varCanBind = 1
    end
    for varI, item in x300576_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            varCount = item.items[ index].cnt
            varId = item.items[ index].varId
            break
        end
    end

    if varId == 0 or varCount == 0 then
        Msg2Player( varMap, varPlayer, "异常操作，不能获得奖励", 8, 3)
        local n = GetItemCount( varMap, varPlayer, x300576_var_TaskItemId)
        DelItem( varMap, varPlayer, x300576_var_TaskItemId, n)
        for varI,item in x300576_var_GrowPointList do
            n = GetItemCount( varMap, varPlayer, item.varItem)
            if n > 0 then
                DelItem( varMap, varPlayer, item.varItem, n)
            end	
        end
        DelQuest( varMap, varPlayer, x300576_var_QuestId)
        local strLog = format( "DayCommon: Error in 300576! Perhaps player %s use hack tools. ", GetName( varMap, varPlayer) )
        WriteLog( 1, strLog)
        return 0
    end

	StartItemTask(varMap)
    if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
        if varCanBind == 1 then
            ItemAppend( varMap, varId, varCount)
        else
            ItemAppendBind( varMap, varId, varCount)
        end
    else
		ItemAppendBind( varMap, varId, varCount)
    end
		
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		
		DeliverItemListSendToPlayer(varMap,varPlayer)
		
		
		StartTalkTask(varMap)
			TalkAppendString(varMap,format("您获得了物品：@itemid_%d",varId))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

        local varMyQuest = x300576_GetQuestId( varMap, varPlayer)
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest)
        local useCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
        if useCount <= 4 then
					local bai40 = 12030028
					local bai60 = 12030143
					local bai80 = 12030144
					local bai = 0
					StartItemTask( varMap)
						if varLevel >=40 and varLevel <60 then
							bai = bai40
						elseif 	varLevel <80 then
							bai = bai60
						else
							bai = bai80
						end	
					ItemAppendBind( varMap, bai, 1)	
					if StopItemTask( varMap, varPlayer) > 0 then
						DeliverItemListSendToPlayer( varMap, varPlayer)	
					else
						Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理背包", 8, 3)
					end            
        end
		--送精致的水晶
		if varLevel >= 40 and varLevel < 60 then
			if random( 1 , 100) < 51 then
				StartItemTask(varMap)
				ItemAppendBind( varMap, 11000206, 1)
				if StopItemTask( varMap, varPlayer) > 0 then
					DeliverItemListSendToPlayer( varMap, varPlayer)
					Msg2Player( varMap, varPlayer, "您意外获得额外的奖励物品：#G精致的国传水晶", 8, 3)
				else
					Msg2Player( varMap, varPlayer, "背包空间不足，无法额外奖励物品", 8, 3)
				end
			end 
		elseif varLevel > 59 and varLevel <80 then
			if random( 1 , 100) < 51 then
				StartItemTask(varMap)
				ItemAppendBind( varMap, 11000207, 1)
				if StopItemTask( varMap, varPlayer) > 0 then
					DeliverItemListSendToPlayer( varMap, varPlayer)
					Msg2Player( varMap, varPlayer, "您意外获得额外的奖励物品：#G精致的神传水晶", 8, 3)
				else
					Msg2Player( varMap, varPlayer, "背包空间不足，无法额外奖励物品", 8, 3)
				end
			end
		elseif varLevel > 79 then
			if random( 1 , 100) < 51 then
				StartItemTask(varMap)
				ItemAppendBind( varMap, 11000208, 1)
				if StopItemTask( varMap, varPlayer) > 0 then
					DeliverItemListSendToPlayer( varMap, varPlayer)
					Msg2Player( varMap, varPlayer, "您意外获得额外的奖励物品：#G精致的天传水晶", 8, 3)
				else
					Msg2Player( varMap, varPlayer, "背包空间不足，无法额外奖励物品", 8, 3)
				end
			end
		end
		return 1;

	else
		StartTalkTask(varMap)
			TalkAppendString(varMap,"背包空间不足，无法获得任务奖励物品，交任务失败")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0;	
	end
	
end



function x300576_CheckSubmit(varMap, varPlayer )
	
	if GetGameOpenById(x300576_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300576_var_QuestId) == 0 then
		x300576_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	local varMyQuest = x300576_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local nNpcIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

	local n = GetItemCount( varMap, varPlayer, x300576_var_GrowPointList[nNpcIndex].varItem );

	if n<=0 then
		return 0;
	end
	
		
	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )
	

	if (varCompleted)<=0 then
		return 0
	end

	


	return 1;
end






function x300576_DeliverTalkInfo( varMap, varPlayer, varTalknpc, varQuest, varExt )

	
	
	StartTalkTask(varMap)

		
	
	TalkAppendString(varMap,"#Y"..x300576_var_QuestName)
	TalkAppendString(varMap,"\t自从我大元水军决定东征以来，某东瀛岛国便想尽方法欲图破坏我东征大计，近日，他们更是丧心病狂的在我威海港内安放了威力巨大的火雷弹！根据我们的线人所述，这火雷弹若是被引爆，足以摧毁半个威海港！\n\t#Y@myname#W，这张线人送来的火雷弹安放图部分已经残缺了，但是应该还能提供一些帮助。")
	TalkAppendString( varMap,"#Y任务目标:")
			
	TalkAppendString( varMap,x300576_var_QuestTarget)
	TalkAppendString(varMap," ")

	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300576_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	
	
	
		
	

	
	
		
		
		
	

	StopTalkTask()
	
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300576_var_FileId, varQuest,0);
end





function x300576_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	local varMyQuest = x300576_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300576_var_QuestName)
		TalkAppendString(varMap,"这火雷弹一旦被引爆，后果不堪设想！")
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300576_var_FileId, varQuest,0);
	


end










function x300576_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	local varMyQuest = x300576_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300576_var_QuestName)
		TalkAppendString(varMap,"\t#Y@myname#W，你立了一大功！这火雷弹若是爆炸，恐怕我等都难以逃出生天。\n\t为了表达对你的谢意，这些装备你可任选一件。")
	
	
	
	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300576_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	
	
	
		
	

	
	
		
		
		
	
		
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300576_var_FileId, varQuest);

end










function x300576_QuestLogRefresh( varMap, varPlayer, varQuest)
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end
		
	StartTalkTask(varMap)	
			
		
	AddQuestLogCustomText( varMap,
							"",						
							x300576_GetQuestName(varMap,varPlayer),        
							x300576_GetQuestTask(varMap,varPlayer),		
							x300576_GetReplyNpcId(varMap,varPlayer),			
							x300576_GetQuestMethod(varMap,varPlayer),               
							x300576_GetQuestText(varMap,varPlayer),	
							x300576_GetQuestHelp(varMap,varPlayer)					
							)

	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300576_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	
	
	
		
	

	
	
		
		
		
	

	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
	

end

function x300576_GetQuestName(varMap,varPlayer)
	

	return x300576_var_QuestName;
end

function x300576_GetQuestTask(varMap,varPlayer)
	local varMyQuest = x300576_GetQuestId( varMap, varPlayer )

	

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local nNpcIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

	local nValue = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )

	local varStr = "  通过#G火雷弹安放图#W找到#G"..x300576_var_GrowPointList[nNpcIndex].varName..format("#W(%d/1)",nValue)

	
		
	return varStr;
end

function x300576_GetReplyNpcId(varMap,varPlayer)
	local varMyQuest = x300576_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local nNpcIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )


	
		return "@npc_"..x300576_var_ReplyNpcId
	

		
	
end

function x300576_GetQuestMethod(varMap,varPlayer)
	return "\t您可以#G右键#W点击使用#G火雷弹安放图#W，根据提示，仔细寻找。"
end

function x300576_GetQuestText(varMap,varPlayer)
	return "\t自从我大元水军决定东征以来，某东瀛岛国便想尽方法欲图破坏我东征大计，近日，他们更是丧心病狂的在我威海港内安放了威力巨大的火雷弹！根据我们的线人所述，这火雷弹若是被引爆，足以摧毁半个威海卫港！\n\t#Y@myname#W，这张线人送来的火雷弹安放图部分已经残缺了，但是应该还能提供一些帮助。"
end

function x300576_GetQuestHelp(varMap,varPlayer)
	return "\t右键点击使用火雷弹安放图，会得到相应的提示。"
end



function x300576_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	x300576_QuestLogRefresh( varMap, varPlayer, varQuest );
end


function x300576_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	
	
	
end



function x300576_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


function x300576_GetDirText(varX,z,x1,z1)
	local strDir1 =""
	local strDir2 =""
	local strDir=""
	if varX>x1 then
		strDir1 = "东"
	elseif varX<x1 then
		strDir1 = "西"
	else
		if( z-z1<0) then
			strDir = "正北"
		else
			strDir = "正南"
		end

		return strDir
	end
	

	if z>z1 then
		strDir2 = "南"
	elseif z<z1 then
		strDir2 = "北"
	else
		if( varX-x1<0) then
			strDir = "正西"
		else
			strDir = "正东"
		end

		return strDir
	end

	return strDir1..strDir2;


end




function x300576_PositionUseItem( varMap, varPlayer, varBagIdx )
	

	local varMyQuest = x300576_GetQuestId( varMap, varPlayer )

	

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then	
		return 0
	end


	
	

	if(varMap~=15) then  
		x300576_ShowTips(varMap, varPlayer, "在威海港某个方向很远的地方")
		return
	end


	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local nNpcIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
    local useCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, useCount + 1)

	local varX = x300576_var_GrowPointList[nNpcIndex].varX;
	local z = x300576_var_GrowPointList[nNpcIndex].z;

	

	local x1,z1 = GetWorldPos( varMap, varPlayer )

	local strDir = 	x300576_GetDirText(varX,z,x1,z1)

	strDir = "你仔细研究了一番图纸：在"..strDir.."方向,"
		
	
		
		

	local nDistance = (x1-varX)*(x1-varX) +(z1-z)*(z1-z)
	
	

	local str1 = "";
	if nDistance>80*80 then
		str1 = "很远的地方"
	elseif nDistance>50*50 then
		str1 = "离这里还有一些距离"
	elseif nDistance>30*30 then
		str1 = "离这里不远了"
	elseif nDistance>10*10 then
		str1 = "就快到了"
	else
		str1 = "看来就是这里了！仔细看看周围有没有可疑的物品。"
		x300576_ShowTips(varMap, varPlayer, str1)
		return
	end

	x300576_ShowTips(varMap, varPlayer, strDir..str1)
	
end












function x300576_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, growpointId, varItem)
	
	if GetGameOpenById(x300576_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300576_var_QuestId) == 0 then
        x300576_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 1
    end

	local varMyQuest = x300576_GetQuestId( varMap, varPlayer )

	

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then	
		x300576_ShowTips(varMap, varPlayer, "你没有任务:"..x300576_var_QuestName)
		return 1
	end

   
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest)
	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)

	if varCompleted==1 then
		x300576_ShowTips(varMap, varPlayer, "你已完成任务:"..x300576_var_QuestName)
		return 1;
	end

	return 0;
	
end

function x300576_ProcGpRecycle(varMap, varPlayer, varTalknpc, growpointId, varItem)
	
	if GetGameOpenById(x300576_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300576_var_QuestId) == 0 then
        x300576_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0
    end

	local varMyQuest = x300576_GetQuestId( varMap, varPlayer )

	

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then	
		x300576_ShowTips(varMap, varPlayer, "你没有任务:"..x300576_var_QuestName)
		return 0
	end

   
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest)
	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)

	if varCompleted==1 then
		x300576_ShowTips(varMap, varPlayer, "你已完成任务:"..x300576_var_QuestName)
		return 0;
	end


	local nNpcIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )


	if x300576_var_GrowPointList[nNpcIndex].gpid ~= growpointId then
		x300576_ShowTips(varMap, varPlayer, "一番研究之后，你发现这并不是你要找的火雷弹。")
		return 0;
	end

	

	StartItemTask(varMap)
		ItemAppend( varMap, x300576_var_GrowPointList[nNpcIndex].varItem, 1 )
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		
		DeliverItemListSendToPlayer(varMap,varPlayer)
		x300576_ShowTips(varMap, varPlayer, "你顺利的找到了火雷弹！")
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1 )

		x300576_QuestLogRefresh( varMap, varPlayer, varMyQuest );
		
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

		
	end

	return 1;
	
end



function x300576_ProcGpProcOver(varMap, varPlayer, varTalknpc)
	
	
	

	return 1;
end







