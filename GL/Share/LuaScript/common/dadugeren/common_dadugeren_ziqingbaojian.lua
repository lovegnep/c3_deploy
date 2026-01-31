




--DECLARE_QUEST_INFO_START--


x300573_var_QuestId 				= 	9330                     
x300573_var_FileId 					= 	300573                  
x300573_var_QuestKind 				= 	1                       
x300573_var_LevelLess					= 	40                      


x300573_var_QuestName				= 	"【个人】紫青宝剑"
x300573_var_QuestName1				= 	"你可听说过紫青侠女？"
x300573_var_QuestTarget				= 	"按照#G紫青宝剑#W的指引，找到紫云的#G有缘人"
x300573_var_QuestInfo				= 	""
x300573_var_ContinueInfo				= 	""
x300573_var_QuestCompleted			= 	""
x300573_var_QuestHelp				=	""          


x300573_var_ExtTarget					=	{ {type=20,n=1,target="【个人】紫青宝剑"}}



x300573_var_ExpBonus					= 	0;
x300573_var_BonusItem					=	{}	

x300573_var_BonusMoney1               = 	0
x300573_var_BonusMoney2               =   0
x300573_var_BonusMoney3               =   0

x300573_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--



x300573_var_NpcCount =13
x300573_var_NpcList = {						
           {varId=139405,varName = "有缘人", varX=464.057312, z=151.135574},
           {varId=139406,varName = "有缘人", varX=405.208191, z=66.060196}, 
           {varId=139407,varName = "有缘人", varX=399.463226, z=97.718781}, 
           {varId=139408,varName = "有缘人", varX=410.987732, z=98.122185}, 
           {varId=140006,varName = "有缘人", varX=455.822723, z=268.042419},
           {varId=139806,varName = "有缘人", varX=122.074524, z=185.353088},
           {varId=139129,varName = "有缘人", varX=232, z=326},             
           {varId=139100,varName = "有缘人", varX=358.152893, z=230.466125},
           {varId=139078,varName = "有缘人", varX=270.769867, z=227.178879},
           {varId=140417,varName = "有缘人", varX=260.015747, z=235.573334},
           {varId=141533,varName = "有缘人", varX=417.223572, z=61.512596}, 
           {varId=141105,varName = "有缘人", varX=177.238129, z=193.144043},
           {varId=141107,varName = "有缘人", varX=262.7034, z=172.589523},  
 
       


					}

x300573_var_GameId	= 1011

x300573_var_TaskItemId = 13810110
x300573_var_ItemId        = 12030028


x300573_var_BonusChoiceItem2   = {
								{10019100,10077100,10238100,10208100,10268100,10248100,10258100,10278100},
								{10028100,10087100,10238110,10208110,10268110,10248110,10258110,10278110},
								{10038100,10097100,10238120,10208120,10268120,10248120,10258120,10278120},
								{10048100,10107100,10238130,10208130,10268130,10248130,10258130,10278130},
								{10058100,10117100,10238140,10208140,10268140,10248140,10258140,10278140},
								{10068100,10127100,10238150,10208150,10268150,10248150,10258150,10278150}
									
								}


x300573_var_RewardTable       = {
                                { minLevel = 40, maxLevel = 60,  items = { { varId = 11000201, cnt = 8 }, { varId = 11050002, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030136, cnt = 1 } } }, 
                                { minLevel = 60, maxLevel = 80,  items = { { varId = 11000202, cnt = 8 }, { varId = 11050003, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030137, cnt = 1 } } }, 
                                { minLevel = 80, maxLevel = 100, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030138, cnt = 1 } } }, 
                                { minLevel = 100, maxLevel = 999, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030139, cnt = 1 } } }, 
}


function x300573_GetQuestId( varMap, varPlayer )
	return x300573_var_QuestId
end

function x300573_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x300573_var_LevelLess then
       return
    end

	local varMyQuest = x300573_GetQuestId( varMap, varPlayer )
	
	
	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		
		TalkAppendButton(varMap, varMyQuest, x300573_var_QuestName,8,1);
	else
		

		
		

	end


	
end





function x300573_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExt )
	
	if GetGameOpenById(x300573_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300573_var_QuestId) == 0 then
		x300573_ShowTips(varMap, varPlayer, "此活动今天不开放，详情请到大都包打听处查询每日新鲜事")
		return
	end

	local varMyQuest = x300573_GetQuestId( varMap, varPlayer )	
	
	
	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest )>0 then
		if varExt==30 then
			x300573_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varMyQuest )
			return
		end
	end
		
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		x300573_DeliverTalkInfo( varMap, varPlayer, varTalknpc, varMyQuest, 0 )
	else
		
	end
end


function x300573_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest )
	
	if GetGameOpenById(x300573_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300573_var_QuestId) == 0 then
		
		return 0;
	end
	return 1;

end

function x300573_CheckRequest(varMap, varPlayer)
	if GetGameOpenById(x300573_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300573_var_QuestId) == 0 then
		x300573_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0
	end
	local varMyQuest = x300573_GetQuestId( varMap, varPlayer )

	if GetLevel(varMap, varPlayer) <x300573_var_LevelLess then
		x300573_ShowTips(varMap, varPlayer, "你等级不足")
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) > 0 then
		x300573_ShowTips(varMap, varPlayer, "你已经有这个任务，请先完成这个任务")
		return 0;
	end

    local varToday = GetDayOfYear()
    if GetPlayerGameData(varMap, varPlayer, MD_LVZHUANG50_DATE[1], MD_LVZHUANG50_DATE[2],MD_LVZHUANG50_DATE[3] ) == varToday then
        x300573_ShowTips(varMap, varPlayer, "很抱歉，您今天已经做过此任务，不能再次领取")
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

function x300573_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
	
	
	if GetGameOpenById(x300573_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300573_var_QuestId) == 0 then
		x300573_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	if x300573_CheckRequest(varMap, varPlayer)<=0 then
		
		return 0;
	end

	local varMyQuest = x300573_GetQuestId( varMap, varPlayer )

	
	local varFullQuest = IsQuestFullNM(varMap,varPlayer)
	
	if varFullQuest>0 then
		x300573_ShowTips(varMap, varPlayer, "任务已满，无法接受任务")
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

	local varRet = AddQuest( varMap, varPlayer, varMyQuest, x300573_var_FileId, 0, 0, 0,1)
		
	if varRet > 0 then
		
		
		local varMyQuest = x300573_GetQuestId( varMap, varPlayer )
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

		StartItemTask(varMap)
			ItemAppend( varMap, x300573_var_TaskItemId, 1 )
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
			
			DeliverItemListSendToPlayer(varMap,varPlayer)
			
			
		else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"背包空间不足，无法获得任务物品，接任务失败")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)

			DelQuestNM( varMap, varPlayer, varMyQuest )
			return 0;	
		end

		local varStr = "您接受了任务："..x300573_var_QuestName;
		x300573_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)


		

		local nNpcType = random(1,x300573_var_NpcCount)

		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, nNpcType )
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, 0)

		
		GamePlayScriptLog(varMap, varPlayer, 811)
		return 1
	else
		
		x300573_ShowTips(varMap, varPlayer, "接受任务错误")
	
	end


end



function x300573_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x300573_ProcQuestAbandon( varMap, varPlayer, varQuest )

	local varMyQuest = x300573_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

	if varRet>0 then

		local varStr = "您放弃了任务:"..x300573_var_QuestName;
	    x300573_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)


		local n = GetItemCount( varMap, varPlayer, x300573_var_TaskItemId );

	
		if n > 0 then
			if DelItem(varMap, varPlayer,x300573_var_TaskItemId,n) ~= 1 then return 0 end
			
		end

        local varToday = GetDayOfYear()
		SetPlayerGameData(varMap, varPlayer, MD_LVZHUANG50_DATE[1], MD_LVZHUANG50_DATE[2], MD_LVZHUANG50_DATE[3], varToday)
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
		x300573_ShowTips(varMap, varPlayer, "放弃任务失败")
	end

	
end

function x300573_CheckSubmitNPC( varMap,varPlayer,idScript,idQuest,varTalkNpcGUID )
	
	local varMyQuest = x300573_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then	
		return 0
	end
	
	for varI, setitem in x300573_var_NpcList do
		if setitem.varId == varTalkNpcGUID then
			return 1
		end
	end
	
	
	
	return 0
	
end


function x300573_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
	if GetGameOpenById(x300573_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300573_var_QuestId) == 0 then
		x300573_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	local varMyQuest = x300573_GetQuestId( varMap, varPlayer )
	
	if x300573_CheckSubmit(varMap, varPlayer )>0 then
		local varToday = GetDayOfYear()
        local varCount = GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3] )
        if varToday == GetPlayerGameData(varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2],MD_RICHANG_DAY[3] ) and varCount >= 3 then
            Msg2Player( varMap, varPlayer, "今天的日常任务已经不能再交了，请明天再来", 8, 3)
            return 0
        end

		local varRet = x300573_GiveReward(varMap,varPlayer,varButtonClick)

		if varRet<=0 then
			return
		end
		local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

		if varRet>0 then
			LuaCallNoclosure( 270300, "ProcSubquestFinished", varMap, varPlayer, x300573_var_QuestId)

			local n = GetItemCount( varMap, varPlayer, x300573_var_TaskItemId );

	
			if n > 0 then
				if DelItem(varMap, varPlayer,x300573_var_TaskItemId,n) ~= 1 then return 0 end
				
			end

			local varStr = "您完成了任务:"..x300573_var_QuestName;
			x300573_ShowTips(varMap, varPlayer, varStr)
			Msg2Player(varMap,varPlayer,varStr,8,2)

            SetPlayerGameData(varMap, varPlayer, MD_LVZHUANG50_DATE[1], MD_LVZHUANG50_DATE[2], MD_LVZHUANG50_DATE[3], GetDayOfYear() )

			GamePlayScriptLog(varMap, varPlayer, 812)
			
		else
			x300573_ShowTips(varMap, varPlayer, "交任务失败")
		end
		
	end
end

function x300573_GiveReward(varMap,varPlayer,varRadioSelected)
	
	if GetGameOpenById(x300573_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300573_var_QuestId) == 0 then
		x300573_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	
    -- find item index
    local index = 0
    for i, item in x300573_var_RewardTable do
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
    for varI, item in x300573_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            varCount = item.items[ index].cnt
            varId = item.items[ index].varId
            break
        end
    end

    if varId == 0 or varCount == 0 then
        Msg2Player( varMap, varPlayer, "异常操作，不能获得奖励", 8, 3)
        local n = GetItemCount( varMap, varPlayer, x300573_var_TaskItemId)
        DelItem( varMap, varPlayer, x300573_var_TaskItemId, n)
        DelQuest( varMap, varPlayer, x300573_var_QuestId)
        local strLog = format( "DayCommon: Error in 300573! Perhaps player %s use hack tools. ", GetName( varMap, varPlayer) )
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

        local varMyQuest = x300573_GetQuestId( varMap, varPlayer)
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest)
        local useCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
        if useCount <= 4 then
          local varLevel = GetLevel( varMap, varPlayer)
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



function x300573_CheckSubmit(varMap, varPlayer )
	
	if GetGameOpenById(x300573_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300573_var_QuestId) == 0 then
		x300573_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	local varMyQuest = x300573_GetQuestId( varMap, varPlayer )
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






function x300573_DeliverTalkInfo( varMap, varPlayer, varTalknpc, varQuest, varExt )

	
	
	StartTalkTask(varMap)

		
	
	TalkAppendString(varMap,"#Y"..x300573_var_QuestName)
	TalkAppendString(varMap,"\t这些天来，紫青宝剑一直在低鸣，莫非......\n\t#Y@myname#W，带上这把宝剑，帮我找到它指引的人吧。")
	TalkAppendString( varMap,"#Y任务目标:")
			
	TalkAppendString( varMap,x300573_var_QuestTarget)
	TalkAppendString(varMap," ")

	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300573_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	
	
	
		
	

	
	
		
		
		
	

	StopTalkTask()
	
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300573_var_FileId, varQuest,0);
end





function x300573_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	local varMyQuest = x300573_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300573_var_QuestName)
		TalkAppendString(varMap,"这紫青宝剑指引的有缘人，究竟是何人呢？")
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300573_var_FileId, varQuest,0);
	


end










function x300573_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	local varMyQuest = x300573_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300573_var_QuestName)
		TalkAppendString(varMap,"\t#Y@myname#W，你说是这把宝剑指引你前来？这个......难道我竟然是那鼎鼎大名的紫青侠女的......")
	
	
	
	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300573_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	
	
	
		
	

	
	
		
		
		
	
		
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300573_var_FileId, varQuest);

end










function x300573_QuestLogRefresh( varMap, varPlayer, varQuest)
	local varMyQuest = x300573_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then	
		return 0
	end
		
	StartTalkTask(varMap)	
			
		
	AddQuestLogCustomText( varMap,
							"",						
							x300573_GetQuestName(varMap,varPlayer),        
							x300573_GetQuestTask(varMap,varPlayer),		
							x300573_GetReplyNpcId(varMap,varPlayer),			
							x300573_GetQuestMethod(varMap,varPlayer),               
							x300573_GetQuestText(varMap,varPlayer),	
							x300573_GetQuestHelp(varMap,varPlayer)					
							)

	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300573_var_RewardTable do
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

function x300573_GetQuestName(varMap,varPlayer)
	

	return x300573_var_QuestName;
end

function x300573_GetQuestTask(varMap,varPlayer)
	local varMyQuest = x300573_GetQuestId( varMap, varPlayer )

	

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local nNpcIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

	
		
	return "  用#G紫青宝剑#W找到紫青侠女的#G"..x300573_var_NpcList[nNpcIndex].varName;
end

function x300573_GetReplyNpcId(varMap,varPlayer)
	local varMyQuest = x300573_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local nNpcIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

	return x300573_var_NpcList[nNpcIndex].varName;
end

function x300573_GetQuestMethod(varMap,varPlayer)
	return "\t紫青宝剑会指引你前去找到紫青侠女的有缘人，您可以#G右键#W点击使用#G紫青宝剑#W，根据宝剑给出的提示，慢慢寻找。"
end

function x300573_GetQuestText(varMap,varPlayer)
	return "\t这些天来，紫青宝剑一直在低鸣，莫非......\n\t#Y@myname#W，带上这把宝剑，帮我找到它指引的人吧。"
end

function x300573_GetQuestHelp(varMap,varPlayer)
	return "\t右键点击使用紫青宝剑，它会带你去找到紫青侠女的有缘人。"
end



function x300573_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	x300573_QuestLogRefresh( varMap, varPlayer, varQuest );
end


function x300573_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	local varMyQuest = x300573_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then	
		return 0
	end
	
	local varMyQuest = x300573_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	
	local nNpcIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	
	
	
	
	
		
	if varTalkNpcGUID~=x300573_var_NpcList[nNpcIndex].varId then
		return
		
	end

	

	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
	TalkAppendButton(varMap, x300573_var_QuestId, x300573_var_QuestName1,7,30);
	
end


function x300573_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end


function x300573_GetDirText(varX,z,x1,z1)
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




function x300573_PositionUseItem( varMap, varPlayer, varBagIdx )
	

	local varMyQuest = x300573_GetQuestId( varMap, varPlayer )

	

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then	
		return 0
	end


	
	

	if(varMap~=0) then  
		x300573_ShowTips(varMap, varPlayer, "在大都某个方向很远的地方")
		return
	end


	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local nNpcIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
    local useCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, useCount + 1)

	local varX = x300573_var_NpcList[nNpcIndex].varX;
	local z = x300573_var_NpcList[nNpcIndex].z;

	

	local x1,z1 = GetWorldPos( varMap, varPlayer )

	local strDir = 	x300573_GetDirText(varX,z,x1,z1)

	strDir = "紫青宝剑低鸣着：在"..strDir.."方向,"
		
	
		
		

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
		str1 = "紫青宝剑发出响亮的鸣声：看来有缘人就在你身旁不远处，快去把紫青宝剑交给他吧"
		x300573_ShowTips(varMap, varPlayer, str1)
		return
	end

	x300573_ShowTips(varMap, varPlayer, strDir..str1)
	
end









