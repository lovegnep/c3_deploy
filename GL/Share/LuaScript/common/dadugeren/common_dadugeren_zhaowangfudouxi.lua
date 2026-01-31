




--DECLARE_QUEST_INFO_START--


x300563_var_QuestId 				= 	9301                     
x300563_var_FileId 					= 	300563                  
x300563_var_QuestKind 				= 	1                       
x300563_var_LevelLess					= 	40                      


x300563_var_QuestName				= 	"【个人】赵王府斗戏"
x300563_var_QuestName1				= 	"斗戏要开始了！"
x300563_var_QuestTarget				= 	"找到@npc_139114"
x300563_var_QuestInfo				= 	""
x300563_var_ContinueInfo				= 	""
x300563_var_QuestCompleted			= 	""
x300563_var_QuestHelp				=	""          


x300563_var_ExtTarget					=	{ {type=20,n=1,target="赵王府斗戏"}}



x300563_var_ExpBonus					= 	0;
x300563_var_BonusItem					=	{{item=11000201,n=8}}	

x300563_var_BonusMoney1               = 	0
x300563_var_BonusMoney2               =   0
x300563_var_BonusMoney3               =   0

x300563_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--

x300563_var_NpcList = {141501,141502,141503,141504,141505}
x300563_var_ReplyNpcId = 139114

x300563_var_GameId	= 1002

x300563_var_BuffId    = 7713

x300563_var_ItemId    = 12030028
												
x300563_var_NpcTalkCount1 = 3
x300563_var_NpcTalkList1={"我虽是见宰相，似文王施礼；一头地离明妃，早宋玉悲秋。啊呀！戏要开演？老夫这就前往。","今日之事，宜相开譬。刘备负国，是非未决，羽亦何敢重欲干命！啊呀！戏要开演？老夫这就前往。","国家区区本以土地借卿家者，卿家军败远来，无以为资故也。今已得益州，既无奉还之意，但求三郡，又不从命。啊呀！戏要开演？老夫这就前往。"}	
	
x300563_var_NpcTalkCount2 = 3
x300563_var_NpcTalkList2={"十年不识君王面，始信婵娟解误人。戏要开演？小生知晓了。","老夫人事已休，将恩变为仇，着小生半途喜变作忧。红娘你且先行，教小姐权时落后。 戏要开演？小生知晓了。","满腹闲愁，数年禁受，天知否？天若是知我情由，怕不待和天瘦。戏要开演？小生知晓了。"}	

x300563_var_NpcTalkCount3 = 3
x300563_var_NpcTalkList3={"月色溶溶夜，花阴寂寂春；如何临皓魄，不见月中人？ 奴家这就去戏台~","待不寻思，怎奈心肠软，告天，天不应，奈何天。奴家这就去戏台~","晚妆残，乌云彩掸，轻匀了粉脸，乱挽起云鬟。将简贴儿拈，把妆盒儿按，开折封皮孜孜看，颠来倒去不害心烦。奴家这就去戏台~"}	

x300563_var_NpcTalkCount4 = 3
x300563_var_NpcTalkList4={"乌林之役，左将军身在行间，寝不脱介，戮力破魏，岂得徒劳，无一块壤，而足下来欲收地邪？勿需多言，关某自知前往。","夫土地者，惟德所在耳，何常之有！勿需多言，关某自知前往。","过五关斩六将，土鸡瓦狗也敢当道？勿需多言，关某自知前往。"}	

x300563_var_NpcTalkCount5 = 3
x300563_var_NpcTalkList5={"快行动些，误了时辰也。\n我已听那锣鼓声，洒家这就前去。","这等三伏天道，你便有冲天的怨气，也召不得一片雪来，可不胡说！我已听那锣鼓声，洒家这就前去。","这死罪必有冤枉，早两桩儿应验了，不知亢旱三年的说话，准也不准？且看后来如何。左右，也不必等待雪晴，便与我抬他尸首，还了那蔡婆婆去罢。我已听那锣鼓声，洒家这就前去。"}	
		



x300563_var_RewardTable       = {
                                { minLevel = 40, maxLevel = 60,  items = { { varId = 11000201, cnt = 8 }, { varId = 11050002, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030136, cnt = 1 } } }, 
                                { minLevel = 60, maxLevel = 80,  items = { { varId = 11000202, cnt = 8 }, { varId = 11050003, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030137, cnt = 1 } } }, 
                                { minLevel = 80, maxLevel = 100, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030138, cnt = 1 } } }, 
                                { minLevel = 100, maxLevel = 999, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030139, cnt = 1 } } }, 
}



function x300563_GetQuestId( varMap, varPlayer )
	return x300563_var_QuestId
end

function x300563_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x300563_var_LevelLess then
       return
    end

	local varMyQuest = x300563_GetQuestId( varMap, varPlayer )
	
	
	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		
		TalkAppendButton(varMap, varMyQuest, x300563_var_QuestName,8,1);
	else
		

		
		

	end


	
end





function x300563_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExt )
	
	if GetGameOpenById(x300563_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300563_var_QuestId) == 0 then
		x300563_ShowTips(varMap, varPlayer, "此活动今天不开放，详情请到大都包打听处查询每日新鲜事")
		return
	end

	local varMyQuest = x300563_GetQuestId( varMap, varPlayer )	
	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest )>0 then
		if varExt==30 then
			x300563_GiveQuestion(varMap, varPlayer, varTalknpc, varQuest,2)
			return
		end
	end

	
	
	if varExt>10 then 
		if varExt>=20 then
			return
		end

		local iIndex = varExt-10

		if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
			return
		end

		x300563_DispatchNpcTalkInfo( varMap, varPlayer, varTalknpc,varMyQuest,iIndex )

	
	else
		
		if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
			x300563_DeliverTalkInfo( varMap, varPlayer, varTalknpc, varMyQuest, 0 )
		else
			if varExt==7 then 
				x300563_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varMyQuest )
				
				
			else
				
				x300563_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varMyQuest )				
			end
		end
	end
	    	
end


function x300563_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest )
	
	if GetGameOpenById(x300563_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300563_var_QuestId) == 0 then
		
		return 0;
	end
	return 1;

end

function x300563_CheckRequest(varMap, varPlayer)
	if GetGameOpenById(x300563_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300563_var_QuestId) == 0 then
		x300563_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0
	end
	local varMyQuest = x300563_GetQuestId( varMap, varPlayer )

	if GetLevel(varMap, varPlayer) <x300563_var_LevelLess then
		x300563_ShowTips(varMap, varPlayer, "你等级不足")
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) > 0 then
		x300563_ShowTips(varMap, varPlayer, "你已经有这个任务，请先完成这个任务")
		return 0;
	end

    local day = GetDayOfYear()
    if day == GetPlayerGameData( varMap, varPlayer, MD_ZDOUXI_DATE[1], MD_ZDOUXI_DATE[2],MD_ZDOUXI_DATE[3] ) then
        Msg2Player( varMap, varPlayer, "很抱歉，您今天已经做过此任务，不能再次领取", 8, 3)
        return 0
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

function x300563_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
	
	
	if GetGameOpenById(x300563_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300563_var_QuestId) == 0 then
		x300563_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	if x300563_CheckRequest(varMap, varPlayer)<=0 then
		
		return 0;
	end

	local varMyQuest = x300563_GetQuestId( varMap, varPlayer )

	
	local varFullQuest = IsQuestFullNM(varMap,varPlayer)
	
	if varFullQuest>0 then
		x300563_ShowTips(varMap, varPlayer, "任务已满，无法接受任务")
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

    if GetPlayerGameData( varMap, varPlayer, MD_RICHANG_DAY[ 1], MD_RICHANG_DAY[ 2], MD_RICHANG_DAY[ 3] ) == GetDayOfYear() then
        if GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[ 1], MD_RICHANG_COUNT[ 2], MD_RICHANG_COUNT[ 3] ) >= 3 then
            Msg2Player( varMap, varPlayer, "你不能再领取今天的日常任务了", 8, 3)
            return 0
        end
    end

	local varRet = AddQuest( varMap, varPlayer, varMyQuest, x300563_var_FileId, 0, 0, 0,1)
		
	if varRet > 0 then
		local varStr = "您接受了任务："..x300563_var_QuestName;
		x300563_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)
		
		local varMyQuest = x300563_GetQuestId( varMap, varPlayer )
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, 0 )
        SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, x300563_var_BuffId, 0)
		GamePlayScriptLog(varMap, varPlayer, 911)
		return 1
	else
		
		x300563_ShowTips(varMap, varPlayer, "接受任务错误")
	
	end


end

function x300563_GiveQuestion(varMap, varPlayer, varTalknpc, varQuest, varExt)
	
	if GetGameOpenById(x300563_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300563_var_QuestId) == 0 then
		x300563_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end
	local varMyQuest = x300563_GetQuestId( varMap, varPlayer )

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, 1 )  
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 3, 0 )

	x300563_ShowQuestion( varMap, varPlayer, varTalknpc,varQuest )

	x300563_QuestLogRefresh( varMap, varPlayer, varMyQuest );
end

function x300563_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x300563_ProcQuestAbandon( varMap, varPlayer, varQuest )

	local varMyQuest = x300563_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

	if varRet>0 then

		local varStr = "您放弃了任务："..x300563_var_QuestName;
	    x300563_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)

        local varToday = GetDayOfYear()
		SetPlayerGameData( varMap, varPlayer, MD_ZDOUXI_DATE[1], MD_ZDOUXI_DATE[2], MD_ZDOUXI_DATE[3], varToday)
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
		x300563_ShowTips(varMap, varPlayer, "放弃任务失败")
	end

	
end



function x300563_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
	if GetGameOpenById(x300563_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300563_var_QuestId) == 0 then
		x300563_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	local varMyQuest = x300563_GetQuestId( varMap, varPlayer )
	
	if x300563_CheckSubmit(varMap, varPlayer )>0 then
		local varToday = GetDayOfYear()
        local varCount = GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3] )
        if varToday == GetPlayerGameData(varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2],MD_RICHANG_DAY[3] ) and varCount >= 3 then
            Msg2Player( varMap, varPlayer, "今天的日常任务已经不能再交了，请明天再来", 8, 3)
            return 0
        end

		local varRet,nRet2 = x300563_GiveRewardTest(varMap,varPlayer)

		if varRet<=0 then
			return
		end
        x300563_GiveReward(varMap,varPlayer,varRet, nRet2,varButtonClick)

		local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

		if varRet>0 then
            LuaCallNoclosure( 270300, "ProcSubquestFinished", varMap, varPlayer, x300563_var_QuestId)

			local varStr = "您完成了任务："..x300563_var_QuestName;
			x300563_ShowTips(varMap, varPlayer, varStr)
			Msg2Player(varMap,varPlayer,varStr,8,2)

            SetPlayerGameData( varMap, varPlayer, MD_ZDOUXI_DATE[1], MD_ZDOUXI_DATE[2], MD_ZDOUXI_DATE[3], GetDayOfYear() )

            if IsHaveSpecificImpact( varMap, varPlayer, x300563_var_BuffId) == 1 then
                CancelSpecificImpact( varMap, varPlayer, x300563_var_BuffId)
                if random( 1, 100) <= 20 then
                 
									local bai40 = 12030028
									local bai60 = 12030143
									local bai80 = 12030144
									local bai = 0
									local varLevel = GetLevel( varMap, varPlayer)
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
										LuaThisScenceM2Wrold( varMap, format( "%s实在了得，赵王府斗戏开始前非常及时地找到了各位戏子，特奖励一个@item_%d。", 
				                            GetName( varMap, varPlayer), bai), 1, 1)	
									else
										Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理背包", 8, 3)
									end            
	    					end
            end
        local varLevel =GetLevel(varMap,varPlayer)
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


			GamePlayScriptLog(varMap, varPlayer, 912)
			
		else
			x300563_ShowTips(varMap, varPlayer, "交任务失败")
		end
		
	end
end

function x300563_GiveRewardTest(varMap,varPlayer)
	if GetGameOpenById(x300563_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300563_var_QuestId) == 0 then
		x300563_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	
	
	
	local bGetRandom = 0;
	
	local nItemTypeCount = 2;
	local itemlist = {  11000201,11000201}
	local iIndex = 0
	
	StartItemTask(varMap)
		ItemAppend( varMap, 11000201, 8 )
		if random(1,100)<=1 then  
			iIndex = random(1,nItemTypeCount);
			ItemAppend( varMap, itemlist[iIndex], 15 )
			bGetRandom = 1
			
		end
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		
		
		if bGetRandom>0 then

			return 2,iIndex ;
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

function x300563_GiveReward(varMap,varPlayer, varExt, nExt2, varRadioSelected)
	
	if GetGameOpenById(x300563_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300563_var_QuestId) == 0 then
		x300563_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

    -- find item index
    local index = 0
    for i, item in x300563_var_RewardTable do
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
    for varI, item in x300563_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            varCount = item.items[ index].cnt
            varId = item.items[ index].varId
            break
        end
    end

    if varId == 0 or varCount == 0 then
        Msg2Player( varMap, varPlayer, "异常操作，不能获得奖励", 8, 3)
        DelQuest( varMap, varPlayer, x300563_var_QuestId)
        local strLog = format( "DayCommon: Error in 300563! Perhaps player %s use hack tools. ", GetName( varMap, varPlayer) )
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

		return 1;
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap,"背包空间不足，无法获得任务奖励物品，交任务失败")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0;	
	end
end



function x300563_CheckSubmit(varMap, varPlayer )
	
	if GetGameOpenById(x300563_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300563_var_QuestId) == 0 then
		x300563_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0;
	end

	local varMyQuest = x300563_GetQuestId( varMap, varPlayer )
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






function x300563_DeliverTalkInfo( varMap, varPlayer, varTalknpc, varQuest, varExt )

	
	
	StartTalkTask(varMap)

		
	
	TalkAppendString(varMap,"#Y"..x300563_var_QuestName)
	TalkAppendString(varMap,"\t赵王寿诞一天天临近，这事儿也就一天天多起来。赵王府的上上下下都忙的不可开交。\n\t我看你相貌端正，谈吐不俗，有没有兴趣来帮忙？放心，赵王府绝不会亏待你的。")
	TalkAppendString( varMap,"#Y任务目标:")
			
	TalkAppendString( varMap,x300563_var_QuestTarget)
	TalkAppendString(varMap," ")

	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300563_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	
	
	
		
	

	
		
	

	StopTalkTask()
	
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300563_var_FileId, varQuest,0);
end





function x300563_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	local varMyQuest = x300563_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300563_var_QuestName)
		TalkAppendString(varMap,"你还没有找回这几个戏子吗？可真是急死我了。")
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300563_var_FileId, varQuest,0);
	


end










function x300563_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	local varMyQuest = x300563_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300563_var_QuestName)
		TalkAppendString(varMap,"\t#Y@myname#W真是神速，偌大的大都，竟这么快就将这五个戏子找齐了，果然是英雄少年啊。\n\t这是一点小小的心意，还请您笑纳。")
	
	
	
	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300563_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	
	
	
		
	

	
		
	
		
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300563_var_FileId, varQuest);
	 LuaCallNoclosure( 256225, "Finishdouxi", varMap, varPlayer)

end





function x300563_ShowQuestion( varMap, varPlayer, varTalknpc,varQuest )


	
	local varMyQuest = x300563_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	

	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300563_var_QuestName)
		TalkAppendString(varMap,"\t你来的正好！眼看这大戏就要开演了，这些戏子名角们，还在大都内游逛，可真是急煞我也！\n\t你快去找到那些戏子，让他们速速回来准备登台。\n\t#G(五位戏子都在大都内北部游逛，去通知他们回来准备登台。)")
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300563_var_FileId, varQuest,0);
	


end


function x300563_DispatchNpcTalkInfo( varMap, varPlayer, varTalknpc,varQuest,iIndex )
	local varMyQuest = x300563_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	SetQuestByIndex( varMap, varPlayer, varQuestIdx, iIndex-1, 1 )
	

	local strTalkText = ""
  if iIndex==1 then
  	strTalkText = x300563_var_NpcTalkList1[random(1,x300563_var_NpcTalkCount1)]
  elseif iIndex==2 then
  	strTalkText = x300563_var_NpcTalkList2[random(1,x300563_var_NpcTalkCount2)]
  elseif iIndex==3 then
  	strTalkText = x300563_var_NpcTalkList3[random(1,x300563_var_NpcTalkCount3)]
  elseif iIndex==4 then
  	strTalkText = x300563_var_NpcTalkList4[random(1,x300563_var_NpcTalkCount4)]
  elseif iIndex==5 then
  	strTalkText = x300563_var_NpcTalkList5[random(1,x300563_var_NpcTalkCount5)]
  end
	
	
	
	NpcTalk(varMap, varTalknpc, strTalkText, varPlayer)

	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )
	local value3 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2 )
	local value4 = GetQuestParam( varMap, varPlayer, varQuestIdx, 3 )
	local value5 = GetQuestParam( varMap, varPlayer, varQuestIdx, 4 )

	if value1*value2*value3*value4*value5>0 then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, 2 ) 
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
	end
	
	x300563_QuestLogRefresh( varMap, varPlayer, varMyQuest );

	
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300563_var_QuestName)
		
		if iIndex==1 then
			TalkAppendString(varMap,"\t我虽是见宰相，似文王施礼；一头地离明妃，早宋玉悲秋。\n\t啊呀！戏要开演？老夫这就前往。")
		elseif iIndex==2 then
			TalkAppendString(varMap,"\t满腹闲愁，数年禁受，天知否？天若是知我情由，怕不待和天瘦。\n\t戏要开演？小生知晓了。")
		elseif iIndex==3 then
			TalkAppendString(varMap,"\t月色溶溶夜，花阴寂寂春；如何临皓魄，不见月中人？\n\t奴家知晓了，这就前往。")
		elseif iIndex==4 then
			TalkAppendString(varMap,"\t乌林之役，左将军身在行间，寝不脱介，戮力破魏，岂得徒劳，无一块壤，而足下来欲收地邪？\n\t勿需多言，关某自知前往。")
		elseif iIndex==5 then
			TalkAppendString(varMap,"\t这等三伏天道，你便有冲天的怨气，也召不得一片雪来，可不胡说！\n\t我已听那锣鼓声，洒家这就前去。")
		end
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300563_var_FileId, varMyQuest,0);

	

end








function x300563_QuestLogRefresh( varMap, varPlayer, varQuest)
	
	
		
	StartTalkTask(varMap)	
			
		
	AddQuestLogCustomText( varMap,
							"",						
							x300563_GetQuestName(varMap,varPlayer),        
							x300563_GetQuestTask(varMap,varPlayer),		
							"@npc_"..x300563_GetReplyNpcId(varMap,varPlayer),			
							x300563_GetQuestMethod(varMap,varPlayer),               
							x300563_GetQuestText(varMap,varPlayer),	
							x300563_GetQuestHelp(varMap,varPlayer)					
							)

	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300563_var_RewardTable do
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

function x300563_GetQuestName(varMap,varPlayer)
	

	return x300563_var_QuestName;
end

function x300563_GetQuestTask(varMap,varPlayer)
	local varMyQuest = x300563_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local varStep = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )

	if varStep==0 then
		
		return "  #Y任务回复:@npc_"..x300563_var_ReplyNpcId;
	end
	

	
	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )
	local value3 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2 )
	local value4 = GetQuestParam( varMap, varPlayer, varQuestIdx, 3 )
	local value5 = GetQuestParam( varMap, varPlayer, varQuestIdx, 4 )

	local strTable = "  ";
	local str1 = strTable.."找到#G“铜锤”#W"..format("(%d/1)",value1)
	local str2 = "\n"..strTable.."找到#G“小生”#W"..format("(%d/1)",value2)
	local str3 = "\n"..strTable.."找到#G“花旦”#W"..format("(%d/1)",value3)
	local str4 = "\n"..strTable.."找到#G“关公”#W"..format("(%d/1)",value4)
	local str5 = "\n"..strTable.."找到#G“武丑”#W"..format("(%d/1)",value5)

	if value1>=1 then
		str1 = "#G"..str1
	else
		str1 = "#W"..str1
	end
	if value2>=1 then
		str2 = "#G"..str2
	else
		str2 = "#W"..str2
	end
	if value3>=1 then
		str3 = "#G"..str3
	else
		str3 = "#W"..str3
	end
	if value4>=1 then
		str4 = "#G"..str4
	else
		str4 = "#W"..str4
	end

	if value5>=1 then
		str5 = "#G"..str5
	else
		str5 = "#W"..str5
	end

	return str1..str2..str3..str4..str5
end

function x300563_GetReplyNpcId(varMap,varPlayer)
	return x300563_var_ReplyNpcId;
end

function x300563_GetQuestMethod(varMap,varPlayer)
	return "\t找到五位戏子“#G小生#W”，“#G花旦#W”，“#G武丑#W”，“#G关公#W”，“#G铜锤#W”。他们应该在#G大都内北方赵王府闲逛。"
end

function x300563_GetQuestText(varMap,varPlayer)
	return "\t这可急死我了，你来的正好！这些戏子们，正在大都内北部游逛，眼看这大戏就要开演了，你快去找到那些戏子，让他们速速回来准备登台。"
end

function x300563_GetQuestHelp(varMap,varPlayer)
	return "\t五位戏子一直都在大都内北部赵王府走动，要仔细寻找。\n\t#W“#G铜锤#W”跟王府客卿只天明关系颇近，估计他会去西院葡萄藤处找只天明闲聊。（赵王府西）\n\t“#G小生#W”心情忽然惆怅，或许在王府花园处散步。（赵王府西北）\n\t“#G关公#W”酷爱武术，应该在赵府南院耍大刀。（赵王府南）\n\t“#G武丑#W”刚刚和大相国寺的武僧切磋过武艺，此时应在水边歇息。（赵王府西南）\n\t“#G花旦#W”遗失了一个发簪，可能在王府东院找发簪。（赵王府东）"
end



function x300563_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	x300563_QuestLogRefresh( varMap, varPlayer, varQuest );
end


function x300563_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	
	local varMyQuest = x300563_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	

	
	
	if varTalkNpcGUID == x300563_var_ReplyNpcId then
		local varStep = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )

		if varStep==0 then
			TalkAppendButton(varMap, x300563_var_QuestId, x300563_var_QuestName,2,30);
		elseif varStep>0 then
			local varState = GetQuestStateNM(varMap, varPlayer, varTalkNpcGUID, varMyQuest);

		
			TalkAppendButton(varMap, varMyQuest, x300563_var_QuestName,varState,varState);
		end
	
	else
		local bFind =0;
		local iIndex=0
		for varI,item in x300563_var_NpcList do
			iIndex = iIndex+1;
			if varTalkNpcGUID==item then
				bFind=1;
				break;
			end
		end

		

		if bFind==0 then
			return
		end

		local varStep = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )

		if varStep~=1 then
			return
		end



		
		local value = GetQuestParam( varMap, varPlayer, varQuestIdx, iIndex-1)

		if value==0 then


			TalkAppendButton(varMap, x300563_var_QuestId, x300563_var_QuestName1,2,iIndex+10);
		end
	end
	

	
end


function x300563_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end








