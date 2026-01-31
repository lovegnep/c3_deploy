




--DECLARE_QUEST_INFO_START--


x300577_var_QuestId 				= 	9333                     
x300577_var_FileId 					= 	300577                  
x300577_var_QuestKind 				= 	1                       
x300577_var_LevelLess					= 	40                      


x300577_var_QuestName				= 	"【个人】东海海图"
x300577_var_QuestName1				= 	"你听说过“东海海图”吗？"
x300577_var_QuestTarget				= 	"和扬武号的每个水手交谈，打听东海海图的下落。"
x300577_var_QuestInfo				= 	""
x300577_var_ContinueInfo				= 	""
x300577_var_QuestCompleted			= 	""
x300577_var_QuestHelp				=	"东海海图应该在扬武号的某个水手手中，但是他并不会把海图轻易交给你。"          


x300577_var_ExtTarget					=	{ {type=20,n=1,target="东海海图"}}



x300577_var_ExpBonus					= 	0;
x300577_var_BonusItem					=	{{item=11000202, n=8}}	

x300577_var_BonusMoney1               = 	0
x300577_var_BonusMoney2               =   0
x300577_var_BonusMoney3               =   0

x300577_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--


x300577_var_NpcList = {143099,143100,143101,143102,143103,143104,143105,143106}
x300577_var_ItemAcceptQuest  = 13810129   
x300577_var_ItemChain = {13810121,13810122,13810123,13810124,13810125,13810126,13810127}  
x300577_var_ItemSubmitQuest  = 13810120  


x300577_var_RandomCount =10
x300577_var_RandomList = {
							{1,2,3,4,5,6,7,8},
							{8,7,6,5,4,3,2,1},
							{1,3,5,7,2,4,6,8},
							{2,4,6,8,1,3,5,7},
							{6,8,4,1,5,3,7,2},
							{2,4,6,5,8,3,1,7},
							{4,5,6,7,1,8,2,3},
							{3,4,6,5,8,7,2,1},
							{4,7,8,5,6,3,2,1},
							{2,3,4,5,6,7,8,1}
						}


x300577_var_ReplyNpcId = 143146

x300577_var_PositionId = 85054

x300577_var_GameId	= 1014

x300577_var_BuffId    = 7714

x300577_var_ItemId    = 12030028

	

x300577_var_RewardTable       = {
                                { minLevel = 40, maxLevel = 60,  items = { { varId = 11000201, cnt = 8 }, { varId = 11050002, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030136, cnt = 1 } } }, 
                                { minLevel = 60, maxLevel = 80,  items = { { varId = 11000202, cnt = 8 }, { varId = 11050003, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030137, cnt = 1 } } }, 
                                { minLevel = 80, maxLevel = 100, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030138, cnt = 1 } } }, 
                                { minLevel = 100, maxLevel = 999, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030139, cnt = 1 } } }, 
}






function x300577_GetQuestId( varMap, varPlayer )
	return x300577_var_QuestId
end

function x300577_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	if varQuest==nil then
		return
	end

	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x300577_var_LevelLess then
       return
    end

	local varMyQuest = x300577_GetQuestId( varMap, varPlayer )
	
	if varQuest~=varMyQuest then
		return
	end
	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		
		TalkAppendButton(varMap, varMyQuest, x300577_var_QuestName,8,1);
	else
		local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varMyQuest);

		
		TalkAppendButton(varMap, varMyQuest, x300577_var_QuestName,varState,varState);

	end


	
end





function x300577_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExt )
	
	if GetGameOpenById(x300577_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300577_var_QuestId) == 0 then
		x300577_ShowTips(varMap, varPlayer, "此活动今天不开放，详情请到大都包打听处查询每日新鲜事")
		return
	end

	local varMyQuest = x300577_GetQuestId( varMap, varPlayer )	
	
	
	
	
	if varExt>10 then 
		if varExt>=20 then
			return
		end

		local iIndex = varExt-10

		if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
			return
		end

		x300577_DispatchNpcTalkInfo( varMap, varPlayer, varTalknpc,varMyQuest,iIndex )

	
	else
		
		if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
			x300577_DeliverTalkInfo( varMap, varPlayer, varTalknpc, varMyQuest, 0 )
		else
			if varExt==7 then 
				x300577_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varMyQuest )
				
				
			else
				
				x300577_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varMyQuest )
			end
		end
	end
end


function x300577_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest )
	
	if GetGameOpenById(x300577_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300577_var_QuestId) == 0 then
		
		return 0;
	end
	return 1;

end

function x300577_CheckRequest(varMap, varPlayer)
	if GetGameOpenById(x300577_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300577_var_QuestId) == 0 then
		x300577_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0
	end
	local varMyQuest = x300577_GetQuestId( varMap, varPlayer )

	if GetLevel(varMap, varPlayer) <x300577_var_LevelLess then
		x300577_ShowTips(varMap, varPlayer, "你等级不足")
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) > 0 then
		x300577_ShowTips(varMap, varPlayer, "你已经有这个任务，请先完成这个任务")
		return 0;
	end

    local day = GetDayOfYear()
    if GetPlayerGameData(varMap, varPlayer, MD_DHHT_DATE[1], MD_DHHT_DATE[2],MD_DHHT_DATE[3] ) == day then
        x300577_ShowTips(varMap, varPlayer, "很抱歉，您今天已经做过此任务，不能再次领取")
        return 0;
    end

    if GetPlayerGameData( varMap, varPlayer, MD_RICHANG_DAY[ 1], MD_RICHANG_DAY[ 2], MD_RICHANG_DAY[ 3] ) == day then
        if GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[ 1], MD_RICHANG_COUNT[ 2], MD_RICHANG_COUNT[ 3] ) >= 3 then
            Msg2Player( varMap, varPlayer, "你不能再领取今天的日常任务了", 8, 3)
            return 0
        end
    else
        SetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3], 0)
    end

	return 1;

end

function x300577_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
	
	
	if GetGameOpenById(x300577_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300577_var_QuestId) == 0 then
		x300577_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	

	if x300577_CheckRequest(varMap, varPlayer)<=0 then
		
		return 0;
	end

	local varMyQuest = x300577_GetQuestId( varMap, varPlayer )

	
	local varFullQuest = IsQuestFullNM(varMap,varPlayer)
	
	if varFullQuest>0 then
		x300577_ShowTips(varMap, varPlayer, "任务已满，无法接受任务")
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

	

	local varRet = AddQuest( varMap, varPlayer, varMyQuest, x300577_var_FileId, 0, 0, 0,1)
		
	if varRet > 0 then

		StartItemTask(varMap)
		ItemAppend( varMap, x300577_var_ItemAcceptQuest, 1 )
		
		local varRet = StopItemTask(varMap,varPlayer)
		if varRet > 0 then
			
			DeliverItemListSendToPlayer(varMap,varPlayer)
			
			
			
		else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"背包空间不足，无法领取本任务。")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)

			DelQuestNM( varMap, varPlayer, varMyQuest )

			return 0;	
		end


		local varStr = "您接受了任务："..x300577_var_QuestName;
		x300577_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)
		
		local varMyQuest = x300577_GetQuestId( varMap, varPlayer )
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
		
		
		local nRandomType = random(1,x300577_var_RandomCount)

		SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, x300577_var_BuffId, 0)

		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, nRandomType )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, 1 )
		GamePlayScriptLog(varMap, varPlayer, 841)
		return 1
	else
		
		x300577_ShowTips(varMap, varPlayer, "接受任务错误")
	
	end


end

function x300577_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x300577_ProcQuestAbandon( varMap, varPlayer, varQuest )

	local varMyQuest = x300577_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	

	local n = GetItemCount( varMap, varPlayer, x300577_var_ItemAcceptQuest );
	if n > 0 then
		if DelItem(varMap, varPlayer,x300577_var_ItemAcceptQuest,n) ~= 1 then return 0 end
		
	end

	n = GetItemCount( varMap, varPlayer, x300577_var_ItemSubmitQuest );
	if n > 0 then
		if DelItem(varMap, varPlayer,x300577_var_ItemSubmitQuest,n) ~= 1 then return 0 end
		
	end

	for varI,item in x300577_var_ItemChain do
		n = GetItemCount( varMap, varPlayer, item );
		if n > 0 then
			if DelItem(varMap, varPlayer,item,n) ~= 1 then return 0 end
			
		end
	end




	local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

	if varRet>0 then

		local varStr = "您放弃了任务："..x300577_var_QuestName;
	    x300577_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)

        local varToday = GetDayOfYear()
		SetPlayerGameData( varMap, varPlayer, MD_DHHT_DATE[1], MD_DHHT_DATE[2], MD_DHHT_DATE[3], varToday)
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
		x300577_ShowTips(varMap, varPlayer, "放弃任务失败")
	end

	
end



function x300577_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
	if GetGameOpenById(x300577_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300577_var_QuestId) == 0 then
		x300577_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	local varMyQuest = x300577_GetQuestId( varMap, varPlayer )
	
	if x300577_CheckSubmit(varMap, varPlayer )>0 then
		local varToday = GetDayOfYear()
        local varCount = GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3] )
        if varToday == GetPlayerGameData(varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2],MD_RICHANG_DAY[3] ) and varCount >= 3 then
            Msg2Player( varMap, varPlayer, "今天的日常任务已经不能再交了，请明天再来", 8, 3)
            return 0
        end

		local varRet = x300577_GiveReward(varMap,varPlayer,varButtonClick)

		if varRet<=0 then
			return
		end
		local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

		if varRet>0 then
            LuaCallNoclosure( 270300, "ProcSubquestFinished", varMap, varPlayer, x300577_var_QuestId)

			local varStr = "您完成了任务:"..x300577_var_QuestName;
			x300577_ShowTips(varMap, varPlayer, varStr)
			Msg2Player(varMap,varPlayer,varStr,8,2)

			local n = GetItemCount( varMap, varPlayer, x300577_var_ItemSubmitQuest );
			if n > 0 then
				if DelItem(varMap, varPlayer,x300577_var_ItemSubmitQuest,n) ~= 1 then return 0 end
				
			
			end

            SetPlayerGameData( varMap, varPlayer, MD_DHHT_DATE[1], MD_DHHT_DATE[2], MD_DHHT_DATE[3], GetDayOfYear() )

            
            
            
            
            
            
            
            
            if IsHaveSpecificImpact( varMap, varPlayer, x300577_var_BuffId) == 1 then
                CancelSpecificImpact( varMap, varPlayer, x300577_var_BuffId)
                if random( 1, 100) <= 20 then
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
                    LuaThisScenceM2Wrold( varMap, format( "%s实在了得，在非常短的时间内就找回了东海海图，特奖励一个@item_%d。", 
                        GetName( varMap, varPlayer), bai), 1, 1)
									else
										Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
									end            
            	end
						end

			GamePlayScriptLog(varMap, varPlayer, 842)
			
		else
			x300577_ShowTips(varMap, varPlayer, "交任务失败")
		end
		
	end
end

function x300577_GiveReward(varMap,varPlayer,varRadioSelected)
	
	if GetGameOpenById(x300577_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300577_var_QuestId) == 0 then
		x300577_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	
    -- find item index
    local index = 0
    for i, item in x300577_var_RewardTable do
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
    for varI, item in x300577_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            varCount = item.items[ index].cnt
            varId = item.items[ index].varId
            break
        end
    end

    if varId == 0 or varCount == 0 then
        Msg2Player( varMap, varPlayer, "异常操作，不能获得奖励", 8, 3)
        DelQuest( varMap, varPlayer, x300577_var_QuestId)
        local strLog = format( "DayCommon: Error in 300577! Perhaps player %s use hack tools. ", GetName( varMap, varPlayer) )
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



function x300577_CheckSubmit(varMap, varPlayer )
	
	if GetGameOpenById(x300577_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300577_var_QuestId) == 0 then
		x300577_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	local varMyQuest = x300577_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )
	

	if (varCompleted)<=0 then
		return 0
	end

	local n = GetItemCount( varMap, varPlayer, x300577_var_ItemSubmitQuest );
	if n > 0 then
		return 1;
		
	else
		x300577_ShowTips(varMap, varPlayer, "所需任务道具不足")
		return 0;
	end

	return 1;
end






function x300577_DeliverTalkInfo( varMap, varPlayer, varTalknpc, varQuest, varExt )

	
	
	StartTalkTask(varMap)

		
	
	TalkAppendString(varMap,"#Y"..x300577_var_QuestName)
	TalkAppendString(varMap,"\t我大元水师东征在即，马可波罗大人前日派遣他的副使携带#G东海海图#W前来威海港。\n\t不料，这位副使大人一时贪杯，不慎将这东海海图遗失。\n\t多方寻找之下，我们发现此图落入了扬武号某个水手的手中。你可否帮忙去将那海图取回？我给你准备了些东西，你可以用这个来和水手们打交道。")
	TalkAppendString( varMap,"#Y任务目标:")
			
	TalkAppendString( varMap,x300577_var_QuestTarget)
	TalkAppendString(varMap," ")

	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300577_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	
	
	
		
	

	
	
		
		
		
	

	StopTalkTask()
	
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300577_var_FileId, varQuest,0);
end





function x300577_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	local varMyQuest = x300577_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300577_var_QuestName)
		TalkAppendString(varMap,"\t此图事关重大，不仅东海沿岸的地形地貌，连很多无人知晓的小岛的标注都尽在其中。若是落入敌国之手，后果不堪设想啊。")
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300577_var_FileId, varQuest,0);
	


end










function x300577_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	local varMyQuest = x300577_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300577_var_QuestName)
		TalkAppendString(varMap,"\t你真的将这东海海图完好无损的带回来了？太好了！#Y@myname#W，这是你应得的奖励！")
	
	
	
	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300577_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	
	
	
		
	

	
		
		
		
	
		
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300577_var_FileId, varQuest);

end



function x300577_DispatchNpcTalkInfo( varMap, varPlayer, varTalknpc,varQuest,iIndex )
	local varMyQuest = x300577_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )


	local nRandomType = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )



	local varStep = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )

	
	
	
	
	local varCurrentStep = x300577_var_RandomList[nRandomType][varStep];


	local nPosInList =0
	for varI,item in x300577_var_RandomList[nRandomType] do
		nPosInList = nPosInList+1
		if item==iIndex then
			break;
		end
	end

	if iIndex==varCurrentStep then 

			
		
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 4, iIndex )  

		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 3, varTalknpc )  

		local item1=0;
		local item2=0
		if nPosInList==1 then
			item1 = x300577_var_ItemAcceptQuest
			item2 = x300577_var_ItemChain[1]
		elseif nPosInList==2 then
			item1 = x300577_var_ItemChain[1]
			item2 = x300577_var_ItemChain[2]
		elseif nPosInList==3 then
			item1 = x300577_var_ItemChain[2]
			item2 = x300577_var_ItemChain[3]
		elseif nPosInList==4 then
			item1 = x300577_var_ItemChain[3]
			item2 = x300577_var_ItemChain[4]
		elseif nPosInList==5 then
			item1 = x300577_var_ItemChain[4]
			item2 = x300577_var_ItemChain[5]
		elseif nPosInList==6 then
			item1 = x300577_var_ItemChain[5]
			item2 = x300577_var_ItemChain[6]
		elseif nPosInList==7 then
			item1 = x300577_var_ItemChain[6]
			item2 = x300577_var_ItemChain[7]
		elseif nPosInList==8 then
			item1 = x300577_var_ItemChain[7]
			item2 = x300577_var_ItemSubmitQuest
		else
			return
		end

		local varStr= "\t东海海图？唔......有那么点印象。\n\t不过，我现在很想要那@item_"..item1.."#w，我愿意用我的@item_"..item2.."#W来交换，或许能对你找那海图有点用处。"
		
		


		x300577_DispatchExchangeInfo( varMap, varPlayer, varTalknpc, varStr,item1,item2 )

		return
	end


	
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300577_var_QuestName)
		

		if iIndex==varCurrentStep then 

			

			return

			
		
		else
			if nPosInList==1 then
				TalkAppendString(varMap,"\t东海海图？唔......有那么点印象。\n\t不过，我现在很想要那@item_"..x300577_var_ItemAcceptQuest.."#w，我愿意用我的@item_"..x300577_var_ItemChain[1].."#W来交换，或许能对你找那海图有点用处。")
			elseif nPosInList==2 then
				TalkAppendString(varMap,"\t东海海图？唔......有那么点印象。\n\t不过，我现在很想要那@item_"..x300577_var_ItemChain[1].."#w，我愿意用我的@item_"..x300577_var_ItemChain[2].."#W来交换，或许能对你找那海图有点用处。")
			elseif nPosInList==3 then
				TalkAppendString(varMap,"\t东海海图？唔......有那么点印象。\n\t不过，我现在很想要那@item_"..x300577_var_ItemChain[2].."#w，我愿意用我的@item_"..x300577_var_ItemChain[3].."#W来交换，或许能对你找那海图有点用处。")
			elseif nPosInList==4 then
				TalkAppendString(varMap,"\t东海海图？唔......有那么点印象。\n\t不过，我现在很想要那@item_"..x300577_var_ItemChain[3].."#w，我愿意用我的@item_"..x300577_var_ItemChain[4].."#W来交换，或许能对你找那海图有点用处。")
			elseif nPosInList==5 then
				TalkAppendString(varMap,"\t东海海图？唔......有那么点印象。\n\t不过，我现在很想要那@item_"..x300577_var_ItemChain[4].."#w，我愿意用我的@item_"..x300577_var_ItemChain[5].."#W来交换，或许能对你找那海图有点用处。")
			elseif nPosInList==6 then
				TalkAppendString(varMap,"\t东海海图？唔......有那么点印象。\n\t不过，我现在很想要那@item_"..x300577_var_ItemChain[5].."#w，我愿意用我的@item_"..x300577_var_ItemChain[6].."#W来交换，或许能对你找那海图有点用处。")
			elseif nPosInList==7 then
				TalkAppendString(varMap,"\t东海海图？唔......有那么点印象。\n\t不过，我现在很想要那@item_"..x300577_var_ItemChain[6].."#w，我愿意用我的@item_"..x300577_var_ItemChain[7].."#W来交换，或许能对你找那海图有点用处。")
			elseif nPosInList==8 then
				TalkAppendString(varMap,"\t东海海图？这你可算是问对人了！\n\t不过，没有那@item_"..x300577_var_ItemChain[7].."#W，我是绝不会把@item_"..x300577_var_ItemSubmitQuest.."#W交给你的！")
			else
				return
			end
		end
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300577_var_FileId, varMyQuest,0);

	

end





function x300577_DispatchExchangeInfo( varMap, varPlayer, varTalknpc, varStr,item1,item2 )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x300577_var_QuestName)
		TalkAppendString(varMap,varStr)
		

		


	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300577_var_FileId, -1);
end






function x300577_ProcAccept( varMap, varPlayer )

	local varMyQuest = x300577_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )


	local nRandomType = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

	local iIndex = GetQuestParam( varMap, varPlayer, varQuestIdx, 4 )
	local varTalknpc = GetQuestParam( varMap, varPlayer, varQuestIdx, 3 )



	local varStep = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )

	
	
	local nPosInList =0
	for varI,item in x300577_var_RandomList[nRandomType] do
		nPosInList = nPosInList+1
		if item==iIndex then
			break;
		end
	end
	
	local varCurrentStep = x300577_var_RandomList[nRandomType][varStep];

	
	
	if iIndex~=varCurrentStep then
		return
	end

	

	local item1=0;
	local item2=0
	if nPosInList==1 then
		item1 = x300577_var_ItemAcceptQuest
		item2 = x300577_var_ItemChain[1]
	elseif nPosInList==2 then
		item1 = x300577_var_ItemChain[1]
		item2 = x300577_var_ItemChain[2]
	elseif nPosInList==3 then
		item1 = x300577_var_ItemChain[2]
		item2 = x300577_var_ItemChain[3]
	elseif nPosInList==4 then
		item1 = x300577_var_ItemChain[3]
		item2 = x300577_var_ItemChain[4]
	elseif nPosInList==5 then
		item1 = x300577_var_ItemChain[4]
		item2 = x300577_var_ItemChain[5]
	elseif nPosInList==6 then
		item1 = x300577_var_ItemChain[5]
		item2 = x300577_var_ItemChain[6]
	elseif nPosInList==7 then
		item1 = x300577_var_ItemChain[6]
		item2 = x300577_var_ItemChain[7]
	elseif nPosInList==8 then
		item1 = x300577_var_ItemChain[7]
		item2 = x300577_var_ItemSubmitQuest
	else
		return
	end
	
	

	
	
	local n = GetItemCount( varMap, varPlayer, item1 );
	if n > 0 then
		if DelItem(varMap, varPlayer,item1,n) ~= 1 then return 0 end
		
	else
		x300577_ShowTips(varMap,varPlayer, "#W你好像丢失了@item_"..item1.."#W，任务已失败请放弃。")
		return
	end

	

	StartItemTask(varMap)
	ItemAppend( varMap, item2, 1 )
	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		
		DeliverItemListSendToPlayer(varMap,varPlayer)
		
		
		
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap,"你的背包已满，请清理物品栏后再来。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

		DelQuestNM( varMap, varPlayer, varMyQuest )

		return 0;	
	end


	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, varStep+1 ) 

	if(varStep==8) then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1 )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
	end


	x300577_QuestLogRefresh( varMap, varPlayer, varMyQuest );


	
		

	x300577_ShowTips(varMap,varPlayer, "#W你用@item_"..item1.."#W换到了@item_"..item2)
	
		
end









function x300577_QuestLogRefresh( varMap, varPlayer, varQuest)
	
	
		
	StartTalkTask(varMap)	
			
		
	AddQuestLogCustomText( varMap,
							"",						
							x300577_GetQuestName(varMap,varPlayer),        
							x300577_GetQuestTask(varMap,varPlayer),		
							"@npc_"..x300577_GetReplyNpcId(varMap,varPlayer),			
							x300577_GetQuestMethod(varMap,varPlayer),               
							x300577_GetQuestText(varMap,varPlayer),	
							x300577_GetQuestHelp(varMap,varPlayer)					
							)

	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300577_var_RewardTable do
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

function x300577_GetQuestName(varMap,varPlayer)
	

	return x300577_var_QuestName;
end

function x300577_GetQuestTask(varMap,varPlayer)
	local varMyQuest = x300577_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	
	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
	local strTable = "  ";
	local str1 = strTable.."去@npc_85055和@npc_85056的扬武号的水手那里找回#g东海海图#w"..format("(%d/1)",value1)

	if value1>=1 then
		str1 = "#G"..str1
	else
		str1 = "#W"..str1
	end

	return str1
end

function x300577_GetReplyNpcId(varMap,varPlayer)
	return x300577_var_ReplyNpcId;
end

function x300577_GetQuestMethod(varMap,varPlayer)
	return "\t#G东海海图#W应该落在扬武号的某个水手手中，去问问他们吧。"
end

function x300577_GetQuestText(varMap,varPlayer)
	return "\t我大元水师东征在即，马可波罗大人前日派遣他的副使携带#G东海海图#W前来威海港。\n\t不料，这位副使大人一时贪杯，不慎将这东海海图遗失。\n\t多方寻找之下，我们发现此图落入了扬武号某个水手的手中。你可否帮忙去将那海图取回？"
end

function x300577_GetQuestHelp(varMap,varPlayer)
	return "\t扬武号的水手们可不是那么好打交道，他们不会白白告诉你海图的下落。"
end



function x300577_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	x300577_QuestLogRefresh( varMap, varPlayer, varQuest );
end


function x300577_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )

	
	local varMyQuest = x300577_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	

	
	
	
	local bFind =0;
	local iIndex=0
	for varI,item in x300577_var_NpcList do
		iIndex = iIndex+1;
		if varTalkNpcGUID==item then
			bFind=1;
			break;
		end
	end

	

	if bFind==0 then
		return
	end

	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )

	if varCompleted>0 then
		return
	end

	local nRandomType = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )



	local varStep = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )

	
	
	local nPosInList =0
	for varI,item in x300577_var_RandomList[nRandomType] do
		nPosInList = nPosInList+1
		if item==iIndex then
			break;
		end
	end
	
	

	if nPosInList>=varStep then 
	
	
		TalkAppendButton(varMap, x300577_var_QuestId, x300577_var_QuestName1,2,iIndex+10);
	end
	
	
	

	
end


function x300577_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end








