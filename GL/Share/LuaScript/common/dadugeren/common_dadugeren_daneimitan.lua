




--DECLARE_QUEST_INFO_START--


x300572_var_QuestId 				= 	9325                     
x300572_var_FileId 					= 	300572                  
x300572_var_QuestKind 				= 	1                       
x300572_var_LevelLess					= 	40                      


x300572_var_QuestName				= 	"【个人】大内密探"
x300572_var_QuestName1				= 	"这个......上算干坤？"
x300572_var_QuestTarget				= 	"  找到伪装成#G算命先生半仙刘#W的大内密探，他通常在天坛一带走动"
x300572_var_QuestInfo				= 	""
x300572_var_ContinueInfo				= 	""
x300572_var_QuestCompleted			= 	""
x300572_var_QuestHelp				=	"半仙刘通常会在天坛一带走动。"          


x300572_var_ExtTarget					=	{ {type=20,n=1,target="大内密探"}}



x300572_var_ExpBonus					= 	0;
x300572_var_BonusItem					=	{}	

x300572_var_BonusMoney1               = 	0
x300572_var_BonusMoney2               =   0
x300572_var_BonusMoney3               =   0

x300572_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--


x300572_var_HourCountLimited			=	1

x300572_var_EnterTime					=	{                       
											{min=0*60+0,  max=23*60+59},
										}

x300572_var_SubNpcId = 139137
x300572_var_ReplyNpcId = 139134

x300572_var_GameId	= 1010
x300572_var_BuffId	= 7715


x300572_var_nTypeCount = 4

x300572_var_TypeList = {
						{varName="@npc_141022",varId=1178, tipname = "东瀛刺客" },
						{varName="@npc_141023",varId=1179, tipname = "高丽细作" },
						{varName="@npc_141024",varId=1180, tipname = "爪哇奸细" },
						{varName="@npc_141025",varId=1181, tipname = "安南密探" }
					 }	


x300572_var_BonusChoiceItem2   = {
								{10019000,10077000,10238000,10208000,10268000,10248000,10258000,10278000},
								{10028000,10087000,10238010,10208010,10268010,10248010,10258010,10278010},
								{10038000,10097000,10238020,10208020,10268020,10248020,10258020,10278020},
								{10048000,10107000,10238030,10208030,10268030,10248030,10258030,10278030},
								{10058000,10117000,10238040,10208040,10268040,10248040,10258040,10278040},
								{10068000,10127000,10238050,10208050,10268050,10248050,10258050,10278050}
									
								}



x300572_var_RewardTable       = {
                                { minLevel = 40, maxLevel = 60,  items = { { varId = 11000201, cnt = 8 }, { varId = 11050002, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030136, cnt = 1 } } }, 
                                { minLevel = 60, maxLevel = 80,  items = { { varId = 11000202, cnt = 8 }, { varId = 11050003, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030137, cnt = 1 } } }, 
                                { minLevel = 80, maxLevel = 100, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030138, cnt = 1 } } }, 
                                { minLevel = 100, maxLevel = 999, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030139, cnt = 1 } } }, 
}



function x300572_GetQuestId( varMap, varPlayer )
	return x300572_var_QuestId
end

function x300572_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x300572_var_LevelLess then
       return
    end

	local varMyQuest = x300572_GetQuestId( varMap, varPlayer )
	
	
	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		
		TalkAppendButton(varMap, varMyQuest, x300572_var_QuestName,8,1);
	else
		local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varMyQuest);

		
		TalkAppendButton(varMap, varMyQuest, x300572_var_QuestName,varState,varState);

	end


	
end





function x300572_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExt )
	
	if GetGameOpenById(x300572_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300572_var_QuestId) == 0 then
		x300572_ShowTips(varMap, varPlayer, "此活动今天不开放，详情请到大都包打听处查询每日新鲜事")
		return
	end

	local varMyQuest = x300572_GetQuestId( varMap, varPlayer )	
	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest )>0 then
		if varExt==30 then
			x300572_GiveSubQuest(varMap, varPlayer, varTalknpc, varQuest,2)
			return
		end
	end

	
	
	
		
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		x300572_DeliverTalkInfo( varMap, varPlayer, varTalknpc, varMyQuest, 0 )
	else
		if varExt==7 then 
			x300572_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varMyQuest )
			
			
		else
			
			x300572_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varMyQuest )
		end
	end
	
end


function x300572_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest )
	
	if GetGameOpenById(x300572_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300572_var_QuestId) == 0 then
		
		return 0;
	end
	return 1;

end

function x300572_CheckRequest(varMap, varPlayer)
	if GetGameOpenById(x300572_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300572_var_QuestId) == 0 then
		x300572_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0
	end
	local varMyQuest = x300572_GetQuestId( varMap, varPlayer )

	if GetLevel(varMap, varPlayer) <x300572_var_LevelLess then
		x300572_ShowTips(varMap, varPlayer, "等级不足")
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) > 0 then
		x300572_ShowTips(varMap, varPlayer, "你已经有这个任务，请先完成这个任务")
		return 0;
	end

	if  x300572_CheckCommonCondition_Time(varMap, varPlayer)<=0 then
		return 0;
	end

    local varToday = GetDayOfYear()
    if GetPlayerGameData(varMap, varPlayer, MD_LVZHUANG40_DATE[1], MD_LVZHUANG40_DATE[2],MD_LVZHUANG40_DATE[3] ) == varToday then
        x300572_ShowTips(varMap, varPlayer, "很抱歉，您今天已经做过此任务，不能再次领取")
        return 0
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

function x300572_CheckCommonCondition_Time(varMap, varPlayer)
	local hour,minute,sec =GetHourMinSec();
	local nowtime = hour*60+minute
	
	for varI, item in x300572_var_EnterTime do
		if nowtime >= item.min and nowtime <= item.max then
			
			
			return 1;
			
		end
	end
	StartTalkTask(varMap);
		TalkAppendString(varMap, "请在14：00-21：59来接任务");
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	return 0;
end

function x300572_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
	
	
	if GetGameOpenById(x300572_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300572_var_QuestId) == 0 then
		x300572_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	if x300572_CheckRequest(varMap, varPlayer)<=0 then
		
		return 0;
	end

	local varMyQuest = x300572_GetQuestId( varMap, varPlayer )

	
	local varFullQuest = IsQuestFullNM(varMap,varPlayer)
	
	if varFullQuest>0 then
		x300572_ShowTips(varMap, varPlayer, "任务已满，无法接受任务")
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

	local varRet = AddQuest( varMap, varPlayer, varMyQuest, x300572_var_FileId, 1, 0, 0,1)
		
	if varRet > 0 then
		local varStr = "您接受了任务"..x300572_var_QuestName;
		x300572_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)
		
		local varMyQuest = x300572_GetQuestId( varMap, varPlayer )
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, 0 )

        SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, x300572_var_BuffId, 0)
		GamePlayScriptLog(varMap, varPlayer, 801)
		
		return 1
	else
		
		x300572_ShowTips(varMap, varPlayer, "接受任务错误")
	
	end


end

function x300572_GiveSubQuest(varMap, varPlayer, varTalknpc, varQuest, varExt)
	
	if GetGameOpenById(x300572_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300572_var_QuestId) == 0 then
		x300572_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end
	local varMyQuest = x300572_GetQuestId( varMap, varPlayer )

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, 1 )  
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )

	local killType = random(1, x300572_var_nTypeCount)
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, killType )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 3, 0 )

    if IsHaveSpecificImpact( varMap, varPlayer, x300572_var_BuffId) == 1 then
        CancelSpecificImpact( varMap, varPlayer, x300572_var_BuffId)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 4, 1)
    else
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 4, 3)
    end

	x300572_ShowSubQuest( varMap, varPlayer, varTalknpc,varQuest, varExt )

	x300572_QuestLogRefresh( varMap, varPlayer, varMyQuest );
end

function x300572_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x300572_ProcQuestAbandon( varMap, varPlayer, varQuest )

	local varMyQuest = x300572_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

	if varRet>0 then

		local varStr = "您放弃了任务:"..x300572_var_QuestName;
	    x300572_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)

        local varToday = GetDayOfYear()
		SetPlayerGameData( varMap, varPlayer, MD_LVZHUANG40_DATE[1], MD_LVZHUANG40_DATE[2], MD_LVZHUANG40_DATE[3], varToday)
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
		x300572_ShowTips(varMap, varPlayer, "放弃任务失败")
	end

	
end



function x300572_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varRadioSelected, varQuest )
	
	if GetGameOpenById(x300572_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300572_var_QuestId) == 0 then
		x300572_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end
	
	if IsHaveQuestNM( varMap, varPlayer, x300572_var_QuestId ) <= 0 then
		return
	end

	local varMyQuest = x300572_GetQuestId( varMap, varPlayer )
	
	if x300572_CheckSubmit(varMap, varPlayer )>0 then
		local varToday = GetDayOfYear()
        local varCount = GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3] )
        if varToday == GetPlayerGameData(varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2],MD_RICHANG_DAY[3] ) and varCount >= 3 then
            Msg2Player( varMap, varPlayer, "今天的日常任务已经不能再交了，请明天再来", 8, 3)
            return 0
        end

		local varRet = x300572_GiveReward(varMap,varPlayer,varRadioSelected)

		if varRet<=0 then
			return
		end
		local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

		if varRet>0 then
            LuaCallNoclosure( 270300, "ProcSubquestFinished", varMap, varPlayer, x300572_var_QuestId)

			local varStr = "您完成了任务:"..x300572_var_QuestName;
			x300572_ShowTips(varMap, varPlayer, varStr)
			Msg2Player(varMap,varPlayer,varStr,8,2)

			SetPlayerGameData(varMap, varPlayer, MD_LVZHUANG40_DATE[1], MD_LVZHUANG40_DATE[2], MD_LVZHUANG40_DATE[3], GetDayOfYear() )

			GamePlayScriptLog(varMap, varPlayer, 802)
			
		else
			x300572_ShowTips(varMap, varPlayer, "交任务失败")
		end
		
	end
end

function x300572_GiveReward(varMap,varPlayer,varRadioSelected)
	
	if GetGameOpenById(x300572_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300572_var_QuestId) == 0 then
		x300572_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

    -- find item index
    local index = 0
    for i, item in x300572_var_RewardTable do
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
    for varI, item in x300572_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            varCount = item.items[ index].cnt
            varId = item.items[ index].varId
            break
        end
    end

    if varId == 0 or varCount == 0 then
        Msg2Player( varMap, varPlayer, "异常操作，不能获得奖励", 8, 3)
        DelQuest( varMap, varPlayer, x300572_var_QuestId)
        local strLog = format( "DayCommon: Error in 300572! Perhaps player %s use hack tools. ", GetName( varMap, varPlayer) )
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

	else
		StartTalkTask(varMap)
			TalkAppendString(varMap,"背包空间不足，无法获得任务奖励物品，交任务失败")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0;	
	end
		if varLevel >=60 then 
		  if random( 1, 100) <= 20 then
				local bai = 12030143
				local bai80 = 12030144
				StartItemTask( varMap)
					if varLevel >=80 then
						bai = bai80
					end	
				ItemAppendBind( varMap, bai, 1)	
					if StopItemTask( varMap, varPlayer) > 0 then
					DeliverItemListSendToPlayer( varMap, varPlayer)
					else
					Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理背包", 8, 3)
					end    
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
	return 1

	
	
end



function x300572_CheckSubmit(varMap, varPlayer )
	
	if GetGameOpenById(x300572_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300572_var_QuestId) == 0 then
		x300572_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	local varMyQuest = x300572_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )
	

	if (varCompleted)<=0 then
		return 0
	end

	return 1;
end






function x300572_DeliverTalkInfo( varMap, varPlayer, varTalknpc, varQuest, varExt )

	
	
	StartTalkTask(varMap)

		
	
	TalkAppendString(varMap,"#Y"..x300572_var_QuestName)
	TalkAppendString(varMap,"\t方才，我收到消息，有蛮夷之国派出了部分人马，悄悄潜入大都。虽不知他们是何企图，但这般藏头露尾，定然没有什么好事。\n\t你可速去找到我手下的首席密探，他化装成了一个算命先生，在大都天坛一带走动。\n\t记住，和他的切口是：#G上算干坤#W。")
	TalkAppendString( varMap,"#Y任务目标:")
			
	TalkAppendString( varMap,x300572_var_QuestTarget)
	TalkAppendString(varMap," ")

	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300572_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	
	
	
		
	

	
	
		
		
		
	

	StopTalkTask()
	
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300572_var_FileId, varQuest,0);
end





function x300572_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	local varMyQuest = x300572_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300572_var_QuestName)
		TalkAppendString(varMap,"\t怎么？！你还没找到密探？他这次应该化装成了一个算命先生，就在天坛一带走动。")
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300572_var_FileId, varQuest,0);
	


end










function x300572_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	local varMyQuest = x300572_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300572_var_QuestName)
		TalkAppendString(varMap,"\t好！这等蛮夷小国也敢派人来我大元国都造次，真是可笑之极。\n\t#Y@myname#W，你此次功劳不小，这些装备，可随意挑选一件。")
	
	
	
	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300572_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	
	
	
		
	

	
	
		
		
		
	
		
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300572_var_FileId, varQuest);

end





function x300572_ShowSubQuest( varMap, varPlayer, varTalknpc,varQuest, varExt )


	
	local varMyQuest = x300572_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )


	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300572_var_QuestName)
		TalkAppendString(varMap,format("\t唔......下算九幽！\n\t既然你能说出切口，定然是达鲁花将军派你来的。\n\t我已经打探清楚，最近一批"..x300572_var_TypeList[value2].varName.."在大都城外聚集，图谋不轨，你速去将他们消灭，然后报知将军！"))
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300572_var_FileId, varQuest,0);
	


end










function x300572_QuestLogRefresh( varMap, varPlayer, varQuest)
	
	
		
	StartTalkTask(varMap)	
			
		
	AddQuestLogCustomText( varMap,
							"",						
							x300572_GetQuestName(varMap,varPlayer),        
							x300572_GetQuestTask(varMap,varPlayer),		
							"@npc_"..x300572_GetReplyNpcId(varMap,varPlayer),			
							x300572_GetQuestMethod(varMap,varPlayer),               
							x300572_GetQuestText(varMap,varPlayer),	
							x300572_GetQuestHelp(varMap,varPlayer)					
							)

	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300572_var_RewardTable do
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

function x300572_GetQuestName(varMap,varPlayer)
	

	return x300572_var_QuestName;
end

function x300572_GetQuestTask(varMap,varPlayer)
	local varMyQuest = x300572_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local varStep = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )

	if varStep==0 then
		
		return "  找到伪装成#G算命先生半仙刘#W的大内密探，他通常在天坛一带走动"
	end
	

	
	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )

	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )

    local killCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 4)


	local strTable ="  ";
	local str1 = strTable.."消灭#G"..x300572_var_TypeList[value2].varName.."#W"..format("(%d/%d)",value1,killCount)
	

	if value1>=killCount then
		str1 = "#G"..str1
	else
		str1 = "#W"..str1
	end

	return str1
end

function x300572_GetReplyNpcId(varMap,varPlayer)
	return x300572_var_ReplyNpcId;
end

function x300572_GetQuestMethod(varMap,varPlayer)

	local varMyQuest = x300572_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local varStep = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )

	if varStep==0 then
		
		return "找到伪装成#G算命先生半仙刘#W的大内密探，他通常在天坛一带走动。"
	end

	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )

	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )

	local killCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 4)

	local strTable = "";
	local str1 = strTable.."消灭#G"..x300572_var_TypeList[value2].varName.."#W"..format("(%d/%d)",value1,killCount)
	

	if value1>=killCount then
		str1 = "#G"..str1
	else
		str1 = "#W"..str1
	end

	return str1

	
end

function x300572_GetQuestText(varMap,varPlayer)
	return "\t方才，我收到消息，有蛮夷之国派出了部分人马，悄悄潜入大都。虽不知他们是何企图，但这般藏头露尾，定然没有什么好事。\n\t你可速去找到我手下的首席密探，他化装成了一个算命先生，在大都天坛一带走动。\n\t记住，和他的切口是：#G上算干坤#W。"
end

function x300572_GetQuestHelp(varMap,varPlayer)
	return "\t半仙刘通常会在天坛一带打探消息。"
end



function x300572_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	x300572_QuestLogRefresh( varMap, varPlayer, varQuest );
end


function x300572_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	
	local varMyQuest = x300572_GetQuestId( varMap, varPlayer )

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		return
	end


	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	
	
	
	
	
	local bFind =0;
	local iIndex=0
	
	if varTalkNpcGUID==x300572_var_SubNpcId then
		bFind=1;
		
	end

	

	if bFind==0 then
		return
	end

	local varStep = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )

	if varStep~=0 then
		return
	end



	
	


	TalkAppendButton(varMap, x300572_var_QuestId, x300572_var_QuestName1,2,30);
	
	
	

	
end



function x300572_CheckSceneOnKill(varMap, varPlayer)
	if varMap==0  then
		return 1
	else
		return 0
	end
end

function x300572_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

	local HumenNum = GetMonsterOwnerCount( varMap, varObj ) 
	for varI = 0, HumenNum-1 do
		local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
		if humanObjId ~= -1 then
		local varMyQuest = x300572_GetQuestId( varMap, humanObjId )
			if IsHaveQuestNM( varMap, humanObjId, varMyQuest ) > 0 then	
				x300572_ProcValidKillObject( varMap, humanObjId, varObjData, varObj, varQuest )
			end
		end
	end
	
end

function x300572_ProcValidKillObject( varMap, varPlayer, varObjData, varObj, varQuest )

	if x300572_CheckSceneOnKill(varMap, varPlayer)<=0 then
		return 0;
	end

	local varMyQuest = x300572_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local varStep = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )

	if varStep~=1 then
		return
	end

	

	
	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )

	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )

    local killCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 4)

	if value1>=killCount then
		return
	end

	

	if x300572_var_TypeList[value2].varId~=varObjData then
		return
	end

	

	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, value1+1 )

	if (value1+1)==killCount then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
	end

	x300572_ShowTips(varMap, varPlayer, format("消灭"..x300572_var_TypeList[value2].tipname.."(%d/%d)",value1+1,killCount ))

	x300572_QuestLogRefresh( varMap, varPlayer, varMyQuest );
	
end









