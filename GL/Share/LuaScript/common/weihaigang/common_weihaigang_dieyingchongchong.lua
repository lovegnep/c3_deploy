




--DECLARE_QUEST_INFO_START--


x300575_var_QuestId 				= 	9331                     
x300575_var_FileId 					= 	300575                  
x300575_var_QuestKind 				= 	1                       
x300575_var_LevelLess					= 	40                      


x300575_var_QuestName				= 	"【个人】谍影重重"
x300575_var_QuestName1				= 	"这个......上算干坤？"
x300575_var_QuestTarget				= 	"消灭东瀛岛国派来的忍者"
x300575_var_QuestInfo				= 	""
x300575_var_ContinueInfo				= 	""
x300575_var_QuestCompleted			= 	""
x300575_var_QuestHelp				=	"根据情报，东瀛岛国的忍者们似乎在城外埋伏。"          


x300575_var_ExtTarget					=	{ {type=20,n=1,target="谍影重重"}}



x300575_var_ExpBonus					= 	0;
x300575_var_BonusItem					=	{}	

x300575_var_BonusMoney1               = 	0
x300575_var_BonusMoney2               =   0
x300575_var_BonusMoney3               =   0

x300575_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--


x300575_var_EnterTime					=	{                       
											{min=0*60+0,  max=23*60+59},
										}

x300575_var_SubNpcId = 139137
x300575_var_ReplyNpcId = 143049

x300575_var_GameId	= 1012

x300575_var_ItemList  = {
                        12030113, 
                        12030114, 
                        12030115, 
}

x300575_var_DropProbability   = 100
x300575_var_ItemId            = 12030028

x300575_var_TypeList = {
						{varName="@npc_85050",varId=1208,varCount=3, tipname = "武藏流忍者" },
						{varName="@npc_85051",varId=1207,varCount=3, tipname = "甲贺流忍者" },
						{varName="@npc_85052",varId=1206,varCount=3, tipname = "伊贺流忍者" },
						{varName="@npc_85053",varId=1209,varCount=3, tipname = "伊纪流忍者" }
					 }	


x300575_var_BonusChoiceItem2   = {
								{10019200,10077200,10238200,10208200,10268200,10248200,10258200,10278200},
								{10028200,10087200,10238210,10208210,10268210,10248210,10258210,10278210},
								{10038200,10097200,10238220,10208220,10268220,10248220,10258220,10278220},
								{10048200,10107200,10238230,10208230,10268230,10248230,10258230,10278230},
								{10058200,10117200,10238240,10208240,10268240,10248240,10258240,10278240},
								{10068200,10127200,10238250,10208250,10268250,10248250,10258250,10278250}
									
								}


x300575_var_RewardTable       = {
                                { minLevel = 40, maxLevel = 60,  items = { { varId = 11000201, cnt = 8 }, { varId = 11050002, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030136, cnt = 1 } } }, 
                                { minLevel = 60, maxLevel = 80,  items = { { varId = 11000202, cnt = 8 }, { varId = 11050003, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030137, cnt = 1 } } }, 
                                { minLevel = 80, maxLevel = 100, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030138, cnt = 1 } } }, 
                                { minLevel = 100, maxLevel = 999, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030139, cnt = 1 } } }, 
}


function x300575_GetQuestId( varMap, varPlayer )
	return x300575_var_QuestId
end

function x300575_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x300575_var_LevelLess then
       return
    end

	local varMyQuest = x300575_GetQuestId( varMap, varPlayer )
	
	
	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		
		TalkAppendButton(varMap, varMyQuest, x300575_var_QuestName,8,1);
	else
		local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varMyQuest);

		
		TalkAppendButton(varMap, varMyQuest, x300575_var_QuestName,varState,varState);

	end


	
end

function x300575_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExt )
	
	if GetGameOpenById(x300575_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300575_var_QuestId) == 0 then
		x300575_ShowTips(varMap, varPlayer, "此活动今天不开放，详情请到大都包打听处查询每日新鲜事")
		return
	end

	local varMyQuest = x300575_GetQuestId( varMap, varPlayer )	
	
	

	
	
	
		
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		x300575_DeliverTalkInfo( varMap, varPlayer, varTalknpc, varMyQuest, 0 )
	else
		if varExt==7 then 
			x300575_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varMyQuest )
			
			
		else
			
			x300575_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varMyQuest )
		end
	end
	
end


function x300575_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest )
	
	if GetGameOpenById(x300575_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300575_var_QuestId) == 0 then
		
		return 0;
	end
	return 1;

end

function x300575_CheckRequest(varMap, varPlayer)
	if GetGameOpenById(x300575_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300575_var_QuestId) == 0 then
		x300575_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0
	end
	local varMyQuest = x300575_GetQuestId( varMap, varPlayer )

	if GetLevel(varMap, varPlayer) <x300575_var_LevelLess then
		x300575_ShowTips(varMap, varPlayer, "等级不足")
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) > 0 then
		x300575_ShowTips(varMap, varPlayer, "你已经有这个任务，请先完成这个任务")
		return 0;
	end

	if  x300575_CheckCommonCondition_Time(varMap, varPlayer)<=0 then
		return 0;
	end

    local varToday = GetDayOfYear()
    if GetPlayerGameData(varMap, varPlayer, MD_LVZHUANG60_DATE[1], MD_LVZHUANG60_DATE[2], MD_LVZHUANG60_DATE[3] ) == varToday then
        x300575_ShowTips(varMap, varPlayer, "很抱歉，您今天已经做过此任务，不能再次领取")
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

function x300575_CheckCommonCondition_Time(varMap, varPlayer)
	local hour,minute,sec =GetHourMinSec();
	local nowtime = hour*60+minute
	
	for varI, item in x300575_var_EnterTime do
		if nowtime >= item.min and nowtime <= item.max then
			
			
			return 1;
			
		end
	end
	StartTalkTask(varMap);
		TalkAppendString(varMap, "请14：00-21：59来接任务");
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	return 0;
end

function x300575_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
	
	
	if GetGameOpenById(x300575_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300575_var_QuestId) == 0 then
		x300575_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	if x300575_CheckRequest(varMap, varPlayer)<=0 then
		
		return 0;
	end

	local varMyQuest = x300575_GetQuestId( varMap, varPlayer )

	
	local varFullQuest = IsQuestFullNM(varMap,varPlayer)
	
	if varFullQuest>0 then
		x300575_ShowTips(varMap, varPlayer, "任务已满，无法接受任务")
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

	local varRet = AddQuest( varMap, varPlayer, varMyQuest, x300575_var_FileId, 1, 0, 0,0)
		
	if varRet > 0 then
		local varStr = "您接受了任务："..x300575_var_QuestName;
		x300575_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)
		
		local varMyQuest = x300575_GetQuestId( varMap, varPlayer )
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, 0 )

		x300575_GiveSubQuest(varMap, varPlayer, varTalknpc, varMyQuest,2)
		GamePlayScriptLog(varMap, varPlayer, 821)
		return 1
	else
		
		x300575_ShowTips(varMap, varPlayer, "接受任务错误")
	
	end


end

function x300575_GetKillType()
	local hour,minute,sec =GetHourMinSec();
	
	
	local tr=hour-20+1
	
	if tr>4 or tr < 1 then 
		return random(1,4)  
  end
  
  	return tr
  
end

function x300575_GiveSubQuest(varMap, varPlayer, varTalknpc, varQuest, varExt)
	
	if GetGameOpenById(x300575_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300575_var_QuestId) == 0 then
		x300575_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end
	local varMyQuest = x300575_GetQuestId( varMap, varPlayer )

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, 1 )  
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )

	local killType = x300575_GetKillType()
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, killType )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 3, 0 )

	x300575_ShowSubQuest( varMap, varPlayer, varTalknpc,varQuest, varExt )

	x300575_QuestLogRefresh( varMap, varPlayer, varMyQuest );
end

function x300575_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x300575_ProcQuestAbandon( varMap, varPlayer, varQuest )

	local varMyQuest = x300575_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

	if varRet>0 then

		local varStr = "您放弃了任务："..x300575_var_QuestName;
	    x300575_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)

        local varToday = GetDayOfYear()
		SetPlayerGameData(varMap, varPlayer, MD_LVZHUANG60_DATE[1], MD_LVZHUANG60_DATE[2], MD_LVZHUANG60_DATE[3], varToday)
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
		x300575_ShowTips(varMap, varPlayer, "放弃任务失败")
	end

	
end

function x300575_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varRadioSelected, varQuest )
	
	if GetGameOpenById(x300575_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300575_var_QuestId) == 0 then
		x300575_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	local varMyQuest = x300575_GetQuestId( varMap, varPlayer )
	
	if x300575_CheckSubmit(varMap, varPlayer )>0 then
		local varToday = GetDayOfYear()
        local varCount = GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3] )
        if varToday == GetPlayerGameData(varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2],MD_RICHANG_DAY[3] ) and varCount >= 3 then
            Msg2Player( varMap, varPlayer, "今天的日常任务已经不能再交了，请明天再来", 8, 3)
            return 0
        end

		local varRet = x300575_GiveRewardTest(varMap,varPlayer,varRadioSelected)

		if varRet<=0 then
			return 0
		end

        if x300575_GiveReward(varMap,varPlayer,varRadioSelected) <= 0 then
            return 0
        end

        local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

		if varRet>0 then
            LuaCallNoclosure( 270300, "ProcSubquestFinished", varMap, varPlayer, x300575_var_QuestId)

			local varStr = "您完成了任务:"..x300575_var_QuestName;
			x300575_ShowTips(varMap, varPlayer, varStr)
			Msg2Player(varMap,varPlayer,varStr,8,2)

			SetPlayerGameData(varMap, varPlayer, MD_LVZHUANG60_DATE[1], MD_LVZHUANG60_DATE[2], MD_LVZHUANG60_DATE[3], GetDayOfYear() )

            if x300575_DelDroppedItems( varMap, varPlayer) == 1 then
							local bai40 = 12030028
							local bai60 = 12030143
							local bai80 = 12030144
							local bai = 0
							local level = GetLevel( varMap, varPlayer)
							StartItemTask( varMap)
								if level >=40 and level <60 then
									bai = bai40
								elseif 	level <80 then
									bai = bai60
								else
									bai = bai80
								end	
							ItemAppendBind( varMap, bai, 1)	
							if StopItemTask( varMap, varPlayer) > 0 then
								DeliverItemListSendToPlayer( varMap, varPlayer)	
								LuaThisScenceM2Wrold( varMap, format( "%s实在了得，竟然搜集到了完整的情报，特奖励一个@item_%d。", 
									GetName( varMap, varPlayer), bai), 1, 1)
							else
								Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
							end            
            end


			GamePlayScriptLog(varMap, varPlayer, 822)
			
		else
			x300575_ShowTips(varMap, varPlayer, "交任务失败")
		end
		
	end
end

function x300575_GiveRewardTest(varMap,varPlayer,varRadioSelected)
	
	if GetGameOpenById(x300575_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300575_var_QuestId) == 0 then
		x300575_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	
	

	StartItemTask(varMap)
		ItemAppend( varMap, varRadioSelected, 1 )
		
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		
		

		return 1;
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap,"背包空间不足，无法获得任务奖励物品，交任务失败")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0;	
	end
	
	
	
end

function x300575_GiveReward(varMap,varPlayer,varRadioSelected)
	if GetGameOpenById(x300575_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300575_var_QuestId) == 0 then
		x300575_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

    -- find item index
    local index = 0
    for i, item in x300575_var_RewardTable do
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
    for varI, item in x300575_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            varCount = item.items[ index].cnt
            varId = item.items[ index].varId
            break
        end
    end

    if varId == 0 or varCount == 0 then
        Msg2Player( varMap, varPlayer, "异常操作，不能获得奖励", 8, 3)
        x300575_DelDroppedItems( varMap, varPlayer)
        DelQuest( varMap, varPlayer, x300575_var_QuestId)
        local strLog = format( "DayCommon: Error in 300575! Perhaps player %s use hack tools. ", GetName( varMap, varPlayer) )
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

function x300575_CheckSubmit(varMap, varPlayer )
	
	if GetGameOpenById(x300575_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300575_var_QuestId) == 0 then
		x300575_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	local varMyQuest = x300575_GetQuestId( varMap, varPlayer )
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

function x300575_DeliverTalkInfo( varMap, varPlayer, varTalknpc, varQuest, varExt )

	
	
	StartTalkTask(varMap)

		
	
	TalkAppendString(varMap,"#Y"..x300575_var_QuestName)
	TalkAppendString(varMap,"\t方才得到的情报，那东瀛岛国，竟然也敢派出他们那些所谓的“忍者”，来我威海港伺机破坏。\n\t更为可笑的是，那东瀛岛国的忍者们居然分为：甲贺，武藏，伊贺，伊纪的四大流派。号称每个流派都有其独特的“威力”。\n\t此等可笑弱小之徒，实不值我元军前往，不如就由你前去给他们点颜色看看？")
	TalkAppendString( varMap,"#Y任务目标:")
			
	TalkAppendString( varMap,x300575_var_QuestTarget)
	TalkAppendString(varMap," ")

	
	local varLevel = GetLevel(varMap, varPlayer)
	
	
	
		
	

	
	
		
		
		
	
    for varI, item in x300575_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end

	StopTalkTask()
	
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300575_var_FileId, varQuest,0);
end

function x300575_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	local varMyQuest = x300575_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300575_var_QuestName)
		TalkAppendString(varMap,"\t怎么？！难道一东瀛小国的忍者也能让你如此惧怕？")
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300575_var_FileId, varQuest,0);
	


end

function x300575_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	local varMyQuest = x300575_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300575_var_QuestName)
		TalkAppendString(varMap,"\t事情办完了？好！这就是那东瀛小国自不量力的下场。\n\t#y@myname#w，消灭这些忍者虽不是什么大功，但这些装备，你也可随意挑选一件。")
	
	
	
	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300575_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	
	
	
		
	

	
	
		
		
		
	
		
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300575_var_FileId, varQuest);

end

function x300575_ShowSubQuest( varMap, varPlayer, varTalknpc,varQuest, varExt )


	
	local varMyQuest = x300575_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )


	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300575_var_QuestName)
		TalkAppendString(varMap,format("\t唔......下算九幽！\n\t既然你能说出切口，定然是达鲁花将军派你来的。\n\t我已经打探清楚，最近一批"..x300575_var_TypeList[value2].varName.."在大都城外聚集，图谋不轨，你速去将他们消灭，然后报知将军！"))
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300575_var_FileId, varQuest,0);
	


end

function x300575_QuestLogRefresh( varMap, varPlayer, varQuest)
	
	if IsHaveQuestNM( varMap, varPlayer, x300575_var_QuestId ) <= 0 then	
		return 0
	end	
		
	StartTalkTask(varMap)	
			
		
	AddQuestLogCustomText( varMap,
							"",						
							x300575_GetQuestName(varMap,varPlayer),        
							x300575_GetQuestTask(varMap,varPlayer),		
							"@npc_"..x300575_GetReplyNpcId(varMap,varPlayer),			
							x300575_GetQuestMethod(varMap,varPlayer),               
							x300575_GetQuestText(varMap,varPlayer),	
							x300575_GetQuestHelp(varMap,varPlayer)					
							)

	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300575_var_RewardTable do
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

function x300575_GetQuestName(varMap,varPlayer)
	

	return x300575_var_QuestName;
end

function x300575_GetQuestTask(varMap,varPlayer)
	local varMyQuest = x300575_GetQuestId( varMap, varPlayer )
	
	if IsHaveQuestNM( varMap,varPlayer,varMyQuest) ~= 1 then
		return ""
	end
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	
	
	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )

	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )

	local varCount = getn(x300575_var_TypeList)
	if value2 < 1 or value2 > varCount then
		return ""
	end
	

	local strTable = "  ";
	local str1 = strTable.."消灭#G"..x300575_var_TypeList[value2].varName.."#W"..format("(%d/%d)",value1,x300575_var_TypeList[value2].varCount)
	

	if value1>=1 then
		str1 = "#G"..str1
	else
		str1 = "#W"..str1
	end

	return str1
end

function x300575_GetReplyNpcId(varMap,varPlayer)
	return x300575_var_ReplyNpcId;
end

function x300575_GetQuestMethod(varMap,varPlayer)
	return "\t消灭东瀛岛国派来的忍者。"
end

function x300575_GetQuestText(varMap,varPlayer)
	return "\t方才得到的情报，那东瀛岛国，竟然也敢派出他们那些所谓的“忍者”，来我威海港伺机破坏。听说那东瀛岛国的忍者们居然分为四大流派，着实可笑之极。\n\t此等弱小之徒，实不值我元军前往，不如就由你前去给他们点颜色看看？"
end

function x300575_GetQuestHelp(varMap,varPlayer)
	return "\t根据情报，东瀛岛国的忍者们似乎在城外埋伏。"
end

function x300575_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	x300575_QuestLogRefresh( varMap, varPlayer, varQuest );
end

function x300575_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	
	
	
	
	

	
end

function x300575_CheckSceneOnKill(varMap, varPlayer)
	if varMap==15 then
		return 1
	else
		return 0
	end
end

function x300575_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

	local HumenNum = GetMonsterOwnerCount( varMap, varObj ) 
	for varI = 0, HumenNum-1 do
		local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
		if humanObjId ~= -1 then
			local varMyQuest = x300575_GetQuestId( varMap, humanObjId )
	
			if IsHaveQuestNM( varMap, humanObjId, varMyQuest ) > 0 then	
				x300575_ProcValidKillObject( varMap, humanObjId, varObjData, varObj, varQuest )
			end
		end
	end
	
end

function x300575_ProcValidKillObject( varMap, varPlayer, varObjData, varObj, varQuest )

	if x300575_CheckSceneOnKill(varMap, varPlayer)<=0 then
		return 0;
	end

	local varMyQuest = x300575_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local varStep = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )
	

	if varStep~=1 then
		return
	end

	

	
	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )

	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )

	if value1>=x300575_var_TypeList[value2].varCount then
		return
	end

	

	if x300575_var_TypeList[value2].varId~=varObjData then
		return
	end

	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, value1+1 )

    
    if GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 0 and random( 1, 100) <= x300575_var_DropProbability then
        StartItemTask( varMap)
        if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
            ItemAppend( varMap, x300575_var_ItemList[ random( 1, 3) ], 1)
        else
            ItemAppendBind( varMap, x300575_var_ItemList[ random( 1, 3) ], 1)
        end
        if StopItemTask( varMap, varPlayer) == 0 then
            Msg2Player( varMap, varPlayer, "背包已满，无法获得掉落物品", 8, 3)
        else
            DeliverItemListSendToPlayer( varMap, varPlayer)
        end
    end

	if (value1+1)==x300575_var_TypeList[value2].varCount then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
	end

	x300575_ShowTips(varMap, varPlayer, format("消灭"..x300575_var_TypeList[value2].tipname.."(%d/%d)",value1+1,x300575_var_TypeList[value2].varCount ))

	x300575_QuestLogRefresh( varMap, varPlayer, varMyQuest );
	
end

function x300575_DelDroppedItems( varMap, varPlayer)
    local allItems = 1
    for varI, item in x300575_var_ItemList do
        local varCount = GetItemCountInBag( varMap, varPlayer, item)
        if varCount > 0 then
            if DelItem( varMap, varPlayer, item, varCount) ~= 1 then return 0 end
        else
            allItems = 0
        end
    end

    return allItems
end






