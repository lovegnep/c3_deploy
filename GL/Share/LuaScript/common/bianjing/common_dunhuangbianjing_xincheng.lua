




--DECLARE_QUEST_INFO_START--


x300580_var_QuestId 				= 	9500                     
x300580_var_FileId 					= 	300580                  
x300580_var_QuestKind 				= 	1                       
x300580_var_LevelLess					= 	40                      


x300580_var_QuestName				= 	"【个人】心诚则灵"
x300580_var_QuestName1				= 	"你可听说过紫青侠女？"
x300580_var_QuestTarget				= 	"\t前往#G天云水晶#W处接受考验"
x300580_var_QuestInfo				= 	""
x300580_var_ContinueInfo				= 	""
x300580_var_QuestCompleted			= 	""
x300580_var_QuestHelp				=	""          


x300580_var_ExtTarget					=	{ {type=20,n=1,target="【个人】心诚则灵"}}



x300580_var_ExpBonus					= 	0;
x300580_var_BonusChoiceItem			={{item=11000203,n=6},{item=11000203,n=7},{item=11000203,n=8}}	

x300580_var_BonusMoney1               = 	0
x300580_var_BonusMoney2               =   0
x300580_var_BonusMoney3               =   0




--DECLARE_QUEST_INFO_STOP--

x300580_G_GAMESTEP					=	6
x300580_G_QUESTIONID				=	5
x300580_G_ACTIONFLAG				=	4
x300580_G_FRAME						=	3
x300580_G_ANWER_STEP				=	2

x300580_Min_Step					=	6
x300580_Max_Step					=	8

x300580_Round_wait					=	5 
x300580_var_Answer_Wait				=	1 

x300580_var_BuffId					=	7903
x300580_var_ItemId                    =   12030028

x300580_var_DayCountLimited			=	1

x300580_var_QuestCountList ={4,8,8,8,8,8,8,8}  
x300580_var_QuestList ={
						{ 
							{0},
							{1},
							{2},
							{3},
						},

						{ 
							{0,1},
							{1,2},
							{2,3},
							{3,2},
							{3,3},
							{2,2},
							{1,3},
							{0,3},
						},

						{ 
							{0,1,2},
							{0,1,3},
							{2,1,2},
							{3,1,2},
							{3,3,2},
							{1,1,2},
							{3,2,2},
							{1,1,3},
						},

						{ 
							{0,1,2,3},
							{3,1,3,3},
							{2,1,2,3},
							{0,1,3,2},
							{1,2,1,3},
							{3,3,2,1},
							{1,3,1,3},
							{2,1,2,0},
						},

						{ 
							{0,1,2,3,0},
							{2,1,2,2,0},
							{3,3,2,1,0},
							{1,1,2,1,3},
							{3,1,2,3,0},
							{0,2,2,1,3},
							{1,2,2,3,0},
							{0,3,2,1,2},
						},

						{ 
							{0,1,3,2,0,1},
							{2,1,2,1,1,3},
							{3,1,3,2,2,1},
							{0,3,1,2,3,1},
							{1,2,3,2,0,1},
							{1,3,2,3,3,1},
							{2,3,2,3,0,1},
							{3,1,0,3,0,1},
						},

						{ 
							{1,3,2,0,0,1,2},
							{1,2,3,3,2,0,1},
							{2,1,2,0,3,1,2},
							{3,1,2,1,0,3,2},
							{2,1,0,3,2,1,2},
							{3,2,2,1,0,3,2},
							{1,1,2,3,1,0,2},
							{0,1,3,1,2,2,3},
						},

						{ 
							{0,1,2,3,0,1,2,3},
							{0,1,3,3,0,1,1,3},
							{1,1,2,2,0,2,3,1},
							{3,1,3,3,0,3,2,1},
							{2,1,2,0,1,3,2,2},
							{1,1,2,3,1,0,2,2},
							{2,3,2,1,0,1,1,3},
							{1,1,2,3,0,2,3,2},
						},
					 }







x300580_var_GameId	= 1025

x300580_var_PlayNpcId  = 110102
x300580_var_ReplyNpcId = 110102


x300580_var_RewardTable       = {
                                { minLevel = 40, maxLevel = 60,  items = { { varId = 11000201, cnt = 8 }, { varId = 11050002, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030136, cnt = 1 } } }, 
                                { minLevel = 60, maxLevel = 80,  items = { { varId = 11000202, cnt = 8 }, { varId = 11050003, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030137, cnt = 1 } } }, 
                                { minLevel = 80, maxLevel = 100, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030138, cnt = 1 } } }, 
                                { minLevel = 100, maxLevel = 999, items = { { varId = 11000203, cnt = 8 }, { varId = 11050004, cnt = 8 }, { varId = 12030120, cnt = 1 }, { varId = 12030603, cnt = 1 }, { varId = 12030139, cnt = 1 } } }, 
}

function x300580_GetQuestId( varMap, varPlayer )
	return x300580_var_QuestId
end

function x300580_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x300580_var_LevelLess then
       return
    end

	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )
	
	
	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		
		TalkAppendButton(varMap, varMyQuest, x300580_var_QuestName,8,1);
	else
		

		
		

	end


	
end





function x300580_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExt )
	
	if varExt==nil then
		return
	end

	if GetGameOpenById(x300580_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300580_var_QuestId) == 0 then
		x300580_ShowTips(varMap, varPlayer, "此活动今天不开放，详情请到大都包打听处查询每日新鲜事")
		return
	end

	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )	
	
	
	
	
		
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		x300580_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varMyQuest, 0 )
	else
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	
		local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )
		local varCurrentStep = GetQuestParam( varMap, varPlayer, varQuestIdx, x300580_G_GAMESTEP )

		if varExt==7 then
			x300580_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varMyQuest )
		elseif varExt==10 then
			x300580_DispatchStartGame( varMap, varPlayer, varTalknpc,varMyQuest )

			x300580_StartPlayGame(varMap, varPlayer, 0)
		elseif varExt==11 then
			x300580_DispatchStartGame( varMap, varPlayer, varTalknpc,varMyQuest )

			x300580_StartPlayGame(varMap, varPlayer, 1)
		elseif varExt>=20 then
			x300580_DispatchDifficultLevel( varMap, varPlayer, varTalknpc,varMyQuest, varExt-20 )

			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
			x300580_ProcStartDifficultLevel(varMap, varPlayer)
			
		end
		
	end
end


function x300580_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	
	if varTalkNpcGUID ~= x300580_var_PlayNpcId and varTalkNpcGUID ~= x300580_var_ReplyNpcId then
		return
	end

	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		
		return 0;
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	
	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )
	local varCurrentStep = GetQuestParam( varMap, varPlayer, varQuestIdx, x300580_G_GAMESTEP )
	local nActionFlag = GetQuestParam( varMap, varPlayer, varQuestIdx, x300580_G_ACTIONFLAG )

	if varTalkNpcGUID == x300580_var_PlayNpcId then
		
			if varCurrentStep==0 then
				if nActionFlag==0 then
				TalkAppendButton(varMap, varMyQuest, "我来接受考验",2,10);
				end
			elseif varCurrentStep>=x300580_Min_Step  and varCurrentStep<=x300580_Max_Step then
				local nActionFlag = GetQuestParam( varMap, varPlayer, varQuestIdx, x300580_G_ACTIONFLAG )

				if nActionFlag==4 then
					TalkAppendButton(varMap, varMyQuest, format("开始第%d轮考验",varCurrentStep+1),2,(20+varCurrentStep+1-x300580_Min_Step));
				end
			
			end
			
			if varCurrentStep>0 then	
				if IsHaveSpecificImpact(varMap, varPlayer, x300580_var_BuffId)<=0 then
					if varCompleted<=0 then
						TalkAppendButton(varMap, varMyQuest, "重新挑战",2,11);
					end
					
				end
			else
				if IsHaveSpecificImpact(varMap, varPlayer, x300580_var_BuffId)<=0 then
					if nActionFlag>0 then
						
						if varCompleted<=0 then
							TalkAppendButton(varMap, varMyQuest, "重新挑战",2,11);
						end
						
					end
				end
			end
		
	end
	
	if varTalkNpcGUID == x300580_var_ReplyNpcId then
		if varCompleted>0 then
			local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varMyQuest);
			TalkAppendButton(varMap, varMyQuest, x300580_var_QuestName,varState,varState);
		end
	end

	
	
end

function x300580_StartPlayGame(varMap, varPlayer, varMode)

	if varMode==nil then
		return
	end

	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		
		return
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local varCurrentStep = GetQuestParam( varMap, varPlayer, varQuestIdx, x300580_G_GAMESTEP )

	if varMode ==0 then

		if IsHaveSpecificImpact(varMap, varPlayer, x300580_var_BuffId)<=0 then
			SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer, x300580_var_BuffId,0 )  
		
		end
		
		x300580_ProcOneRoundCompleted(varMap, varPlayer)
		
		

		
		
	elseif varMode==1 then
		x300580_ShowTips(varMap, varPlayer, format("%d秒后开始第一轮",x300580_Round_wait))
		x300580_Restart(varMap, varPlayer) 
	
	end

	

	
	
end



function x300580_StartChuTi(varMap, varPlayer, varStep)

	if varStep<=0 or varStep>8 then
		return
	end

	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		
		return
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	
	local varCount = x300580_var_QuestCountList[varStep]
	
	local varQuestion = random(1,varCount)

	

	
	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_QUESTIONID, varQuestion )	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_ACTIONFLAG, 1 )	

	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_FRAME, 0 )

	if IsHaveSpecificImpact(varMap, varPlayer, x300580_var_BuffId)<=0 then
		SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer, x300580_var_BuffId,0 )  
		
	end
end


function x300580_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest )
	
	if GetGameOpenById(x300580_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300580_var_QuestId) == 0 then
		return
	end
	return 1;

end

function x300580_CheckRequest(varMap, varPlayer)
	if GetGameOpenById(x300580_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300580_var_QuestId) == 0 then
		x300580_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return
	end
	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )

	if GetLevel(varMap, varPlayer) <x300580_var_LevelLess then
		x300580_ShowTips(varMap, varPlayer, "你等级不足")
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) > 0 then
		x300580_ShowTips(varMap, varPlayer, "你已经有这个任务，请先完成这个任务")
		return 0;
	end

    if GetPlayerGameData(varMap, varPlayer, MD_XCZL_DATE[1], MD_XCZL_DATE[2],MD_XCZL_DATE[3] ) == GetDayOfYear() then
        x300580_ShowTips(varMap, varPlayer, "很抱歉，您今天已经做过此任务，不能再次领取")
        return 0;
    end

    if GetPlayerGameData( varMap, varPlayer, MD_RICHANG_DAY[ 1], MD_RICHANG_DAY[ 2], MD_RICHANG_DAY[ 3] ) == GetDayOfYear() then
        if GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[ 1], MD_RICHANG_COUNT[ 2], MD_RICHANG_COUNT[ 3] ) >= 3 then
            Msg2Player( varMap, varPlayer, "你不能再领取今天的日常任务了", 8, 3)
            return 0
        end
    else
        SetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3], 0)
    end

	return 1;

end

function x300580_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
	
	
	if GetGameOpenById(x300580_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300580_var_QuestId) == 0 then
		x300580_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0
	end

	if x300580_CheckRequest(varMap, varPlayer)<=0 then
		
		return 0;
	end

	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )

	
	local varFullQuest = IsQuestFullNM(varMap,varPlayer)
	
	if varFullQuest>0 then
		x300580_ShowTips(varMap, varPlayer, "任务已满，无法接受任务")
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

	local varRet = AddQuest( varMap, varPlayer, varMyQuest, x300580_var_FileId, 0, 0, 0,1)
		
	if varRet > 0 then
		
		
		local varMyQuest = x300580_GetQuestId( varMap, varPlayer )
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

		

		local varStr = "您接受了任务："..x300580_var_QuestName;
		x300580_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)
		

	
		
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_GAMESTEP, 0 )

		
		GamePlayScriptLog(varMap, varPlayer, 1551)
		return 1
	else
		
		x300580_ShowTips(varMap, varPlayer, "接受任务错误")
	
	end


end



function x300580_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x300580_ProcQuestAbandon( varMap, varPlayer, varQuest )

	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

	if varRet>0 then
		CancelSpecificImpact( varMap, varPlayer, x300580_var_BuffId)

		local varStr = "您放弃了任务:"..x300580_var_QuestName;
	    x300580_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)

        local varToday = GetDayOfYear()
		SetPlayerGameData( varMap, varPlayer, MD_XCZL_DATE[1], MD_XCZL_DATE[2], MD_XCZL_DATE[3], varToday)
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
		x300580_ShowTips(varMap, varPlayer, "放弃任务失败")
	end

	
end



function x300580_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
	if GetGameOpenById(x300580_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300580_var_QuestId) == 0 then
		x300580_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0
	end

	

	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )
	
	if x300580_CheckSubmit(varMap, varPlayer )>0 then
		local varToday = GetDayOfYear()
        local varCount = GetPlayerGameData( varMap, varPlayer, MD_RICHANG_COUNT[1], MD_RICHANG_COUNT[2], MD_RICHANG_COUNT[3] )
        if varToday == GetPlayerGameData(varMap, varPlayer, MD_RICHANG_DAY[1], MD_RICHANG_DAY[2],MD_RICHANG_DAY[3] ) and varCount >= 3 then
            Msg2Player( varMap, varPlayer, "今天的日常任务已经不能再交了，请明天再来", 8, 3)
            return 0
        end

		local varRet = x300580_GiveReward(varMap,varPlayer,varButtonClick)

		if varRet<=0 then
			return
		end
		local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

		if varRet>0 then
			LuaCallNoclosure( 270300, "ProcSubquestFinished", varMap, varPlayer, x300580_var_QuestId)
			
			local varStr = "您完成了任务:"..x300580_var_QuestName;
			x300580_ShowTips(varMap, varPlayer, varStr)
			Msg2Player(varMap,varPlayer,varStr,8,2)

			GamePlayScriptLog(varMap, varPlayer, 1552)
            SetPlayerGameData( varMap, varPlayer, MD_XCZL_DATE[1], MD_XCZL_DATE[2], MD_XCZL_DATE[3], GetDayOfYear() )

			CancelSpecificImpact( varMap, varPlayer, x300580_var_BuffId)
			
		else
			x300580_ShowTips(varMap, varPlayer, "交任务失败")
		end
		
	end
end

function x300580_GiveReward( varMap, varPlayer, varRadioSelected)
	
	if GetGameOpenById(x300580_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300580_var_QuestId) == 0 then
		x300580_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0
	end

	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )

	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		return 0;
	end
	
    -- find item index
    local index = 0
    for i, item in x300580_var_RewardTable do
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
    for varI, item in x300580_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            varCount = item.items[ index].cnt
            varId = item.items[ index].varId
            break
        end
    end

    if varId == 0 or varCount == 0 then
        Msg2Player( varMap, varPlayer, "异常操作，不能获得奖励", 8, 3)
        DelQuest( varMap, varPlayer, x300580_var_QuestId)
        local strLog = format( "DayCommon: Error in 300580! Perhaps player %s use hack tools. ", GetName( varMap, varPlayer) )
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
	local varRet1 = StopItemTask(varMap,varPlayer)

	if varRet1 > 0 then
		
		DeliverItemListSendToPlayer(varMap,varPlayer)
		
		
		StartTalkTask(varMap)
			TalkAppendString(varMap,format("您获得了物品：@itemid_%d",varId))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest)
        local varCircle = GetQuestParam( varMap, varPlayer, varQuestIdx, x300580_G_ANWER_STEP)
        local varGiveReward = 0
        if varCircle == 7 then
            if random( 1, 100) <= 20 then
                varGiveReward = 1
            end
        elseif varCircle == 8 then
            varGiveReward = 1
        end
        if varGiveReward == 1 then
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
						Msg2Player( varMap, varPlayer, format( "你获得了物品:@item_%d", bai), 8, 3)
					else
						Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
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



function x300580_CheckSubmit(varMap, varPlayer )
	
	if GetGameOpenById(x300580_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300580_var_QuestId) == 0 then
		x300580_ShowTips(varMap, varPlayer, "此活动今天不开放")
		return 0
	end

	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )
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






function x300580_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest, varExt )

	
	
	StartTalkTask(varMap)

		
	
	TalkAppendString(varMap,"#Y"..x300580_var_QuestName)
	TalkAppendString(varMap,"\t这里流传着一个古老传说：海天遮日之时，会伴随巨大灾难，唯有破解水晶之谜，才能化解这一场浩劫。\n\t最近这几个月海面狂风肆虐，已经影响此地百姓的生活及我方部队的运输。同时北方海岸的古老水晶在沉寂数百年后再次不时发出四色光芒。\n\t#Y@myname#W，你是否愿意前去一探水晶的奥秘？")
	TalkAppendString( varMap,"#Y")
	TalkAppendString( varMap,"#Y任务目标：")	
	TalkAppendString( varMap,x300580_var_QuestTarget)
	TalkAppendString(varMap," ")

	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300580_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	
	
	
		
	
	
	
	
	    
	

	
	StopTalkTask()
	
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300580_var_FileId, varQuest,0);
end





function x300580_DispatchStartGame( varMap, varPlayer, varTalknpc,varQuest )

	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300580_var_QuestName)
		TalkAppendString(varMap,"\t请注意，考验已经开始")
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300580_var_FileId, varQuest,0);
	


end




function x300580_DispatchDifficultLevel( varMap, varPlayer, varTalknpc,varQuest, varExt )

	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end



	
	
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300580_var_QuestName)
		TalkAppendString(varMap,format("\t第%d轮考验马上开始",x300580_Min_Step+varExt))
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300580_var_FileId, varQuest,0);
	


end







function x300580_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300580_var_QuestName)
		TalkAppendString(varMap,"通过这次考验，你是否是百姓期待的人便可知晓！")
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300580_var_FileId, varQuest,0);
	


end










function x300580_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	
	local varCurrentStep = GetQuestParam( varMap, varPlayer, varQuestIdx, x300580_G_GAMESTEP )
	
	local varCount =0;

	
	if varCurrentStep >= x300580_Min_Step then
		varCount = varCurrentStep
	else
		return 0
	end
	
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300580_var_QuestName)
		TalkAppendString(varMap,"\t#Y@myname#W，感谢上天眷顾！在你破解了水晶之谜后，远方海面上的狂风减退，乌云也渐渐消散开来。\n\t收下这些礼物，这是百姓对你的敬意。")
	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300580_var_RewardTable do
        if varLevel >= item.minLevel and varLevel < item.maxLevel then
            for j, iter in item.items do
                AddQuestRadioItemBonus( varMap, iter.varId, iter.cnt)
            end
            break
        end
    end
	
	StopTalkTask()
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300580_var_FileId, varQuest);

end










function x300580_QuestLogRefresh( varMap, varPlayer, varQuest)
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end
		
	StartTalkTask(varMap)	
			
		
	AddQuestLogCustomText( varMap,
							"",						
							x300580_GetQuestName(varMap,varPlayer),        
							x300580_GetQuestTask(varMap,varPlayer),		
							x300580_GetReplyNpcId(varMap,varPlayer),			
							x300580_GetQuestMethod(varMap,varPlayer),               
							x300580_GetQuestText(varMap,varPlayer),	
							x300580_GetQuestHelp(varMap,varPlayer)					
							)

	
	local varLevel = GetLevel(varMap, varPlayer)
    for varI, item in x300580_var_RewardTable do
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

function x300580_GetQuestName(varMap,varPlayer)
	

	return x300580_var_QuestName;
end

function x300580_GetQuestTask(varMap,varPlayer)
	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )

	

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	
	local nValue = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )

	
		local varStr = "  #Y任务回复:@npc_110102"
	
		
	return varStr;
end

function x300580_GetReplyNpcId(varMap,varPlayer)
	
	return "@npc_"..x300580_var_ReplyNpcId
	
end

function x300580_GetQuestMethod(varMap,varPlayer)
	return "\t记住四个采集点上的#g水晶特效颜色#w，每次随机闪烁特效，记住#g闪烁的次数和顺序#w，在特效播放过后，按照原有播放顺序依次点击四块#g小水晶#w完成考验。"
end

function x300580_GetQuestText(varMap,varPlayer)
	return "\t这里流传着一个古老传说：海天遮日之时，会伴随巨大灾难，唯有破解水晶之谜，才能化解这一场浩劫。\n\t最近这几个月海面狂风肆虐，已经影响此地百姓的生活及我方部队的运输。同时北方海岸的古老水晶在沉寂数百年后再次不时发出四色光芒。\n\t#Y@myname#W，你是否愿意前去一探水晶的奥秘？"
end

function x300580_GetQuestHelp(varMap,varPlayer)
	return ""
end


function x300580_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	x300580_QuestLogRefresh( varMap, varPlayer, varQuest );
end





function x300580_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x300580_ProcClickBox( varMap, varPlayer, varIndex)

	if GetGameOpenById(x300580_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300580_var_QuestId) == 0 then
		return 0
	end
	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )

	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		x300580_ShowTips(varMap, varPlayer, "你没有心诚则灵任务")
		return 0;
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )
	local varCurrentStep = GetQuestParam( varMap, varPlayer, varQuestIdx, x300580_G_GAMESTEP )

	if varCompleted>0 then
		if varCurrentStep<8 then
			x300580_ShowTips(varMap, varPlayer, "恭喜你通过了考验，请去天云水晶处选择完成任务或挑战更高难度")
		else
			x300580_ShowTips(varMap, varPlayer, "恭喜你通过了考验，请去天云水晶处完成任务")
		end
		return
	end

	if IsHaveSpecificImpact(varMap, varPlayer, x300580_var_BuffId)<=0 then
		x300580_ShowTips(varMap, varPlayer, "请点击天云水晶开始考验")
		return
	end

	local varAcitionFlag = GetQuestParam( varMap, varPlayer, varQuestIdx, x300580_G_ACTIONFLAG )
	

	if varCurrentStep<=0 then
		x300580_ShowTips(varMap, varPlayer, "考验还未开始")
		return
	end

	if varAcitionFlag~=2 then
		x300580_ShowTips(varMap, varPlayer, "现在还不能点击水晶")
		return
	end

	local varQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, x300580_G_QUESTIONID )

	local nAnswerStep = GetQuestParam( varMap, varPlayer, varQuestIdx, x300580_G_ANWER_STEP )+1

	local varCurrentAnswer = x300580_var_QuestList[varCurrentStep][varQuestion][nAnswerStep]

	
	if varCurrentAnswer==varIndex then
		x300580_PlayGameEffect( varMap, varPlayer, varIndex)
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_ANWER_STEP, nAnswerStep )
		x300580_ShowTips(varMap, varPlayer, "正确！")

		if nAnswerStep>=varCurrentStep then
			x300580_ProcOneRoundCompleted(varMap, varPlayer)
		end
	else
		if (varCurrentStep-1)<x300580_Min_Step then
			x300580_ShowTips(varMap, varPlayer, "错误！")
		else
		x300580_ProcAnswerWrong(varMap, varPlayer)
	end
	end
	
end

function x300580_ProcAnswerWrong(varMap, varPlayer)  
	
	x300580_ShowTips(varMap, varPlayer, format("回答错误，%d秒后重新开始第一轮",x300580_Round_wait))
	x300580_Restart(varMap, varPlayer)
	
end


function x300580_Restart(varMap, varPlayer) 
	if GetGameOpenById(x300580_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300580_var_QuestId) == 0 then
		return 0
	end
	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )

	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		return 0;
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local varCurrentStep = GetQuestParam( varMap, varPlayer, varQuestIdx, x300580_G_GAMESTEP )
	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_GAMESTEP, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_ANWER_STEP, 0 )

	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_FRAME, 0 )

	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_ACTIONFLAG, 3 )	
	
	if IsHaveSpecificImpact(varMap, varPlayer, x300580_var_BuffId)<=0 then
		SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer, x300580_var_BuffId,0 )  
		
	end
end


function x300580_ProcOneRoundCompleted(varMap, varPlayer)  
	if GetGameOpenById(x300580_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300580_var_QuestId) == 0 then
		return 0
	end
	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )

	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		return 0;
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local varCurrentStep = GetQuestParam( varMap, varPlayer, varQuestIdx, x300580_G_GAMESTEP )
	
	
	

	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_FRAME, 0 )

	if varCurrentStep==0 then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_ACTIONFLAG, 3 )	
		x300580_ShowTips(varMap, varPlayer, format("%d秒后开始第一轮考验",x300580_Round_wait))
	elseif varCurrentStep<x300580_Min_Step then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_ACTIONFLAG, 3 )	
		x300580_ShowTips(varMap, varPlayer, format("恭喜你通过本轮考验，%d秒后开始下一轮",x300580_Round_wait))
	elseif varCurrentStep<x300580_Max_Step then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1 )

		SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_ACTIONFLAG, 4 )	
		x300580_ShowTips(varMap, varPlayer, format("恭喜你通过前%d轮考验，你可以选择现在领取奖励，或者继续挑战第%d轮考验获得更高的奖励。",varCurrentStep,varCurrentStep+1))
	else
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_ACTIONFLAG, 10 )	
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1 )

		x300580_ShowTips(varMap, varPlayer, "恭喜你，顺利通过了所有的考验！")
	end

	if IsHaveSpecificImpact(varMap, varPlayer, x300580_var_BuffId)<=0 then
		SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer, x300580_var_BuffId,0 )  
		
	end
end


function x300580_ProcStartDifficultLevel(varMap, varPlayer)  
	if GetGameOpenById(x300580_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300580_var_QuestId) == 0 then
		return 0
	end
	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )

	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		return 0;
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local varCurrentStep = GetQuestParam( varMap, varPlayer, varQuestIdx, x300580_G_GAMESTEP )
	
	
	

	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_FRAME, 0 )

	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_ACTIONFLAG, 3 )	
	x300580_ShowTips(varMap, varPlayer, format("%d秒后开始第%d轮考验",x300580_Round_wait,varCurrentStep+1))

	if IsHaveSpecificImpact(varMap, varPlayer, x300580_var_BuffId)<=0 then
		SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer, x300580_var_BuffId,0 )  
		
	end
end


function x300580_ProcPlayNextRound(varMap, varPlayer)
	if GetGameOpenById(x300580_var_GameId)<=0 and IsHaveQuestNM( varMap, varPlayer, x300580_var_QuestId) == 0 then
		return 0
	end
	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )

	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		return 0;
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local varCurrentStep = GetQuestParam( varMap, varPlayer, varQuestIdx, x300580_G_GAMESTEP )+1

	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_GAMESTEP, varCurrentStep )

	x300580_StartChuTi(varMap, varPlayer, varCurrentStep)
end

function x300580_PlayGameEffect( varMap, varPlayer, varIndex)
	LuaCallNoclosure(UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer, 25+varIndex )
end





function x300580_ProcIntervalOverEvent( varMap, varPlayer )

	
	
	local varMyQuest = x300580_GetQuestId( varMap, varPlayer )

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		
		return 0;
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )

	if varCompleted>0 then
		return
	end

	

	local varCurrentStep = GetQuestParam( varMap, varPlayer, varQuestIdx, x300580_G_GAMESTEP )

	if varCurrentStep<0 then
		return
	end

	local nActionFlag = GetQuestParam( varMap, varPlayer, varQuestIdx, x300580_G_ACTIONFLAG )
	local varQuestion = GetQuestParam( varMap, varPlayer, varQuestIdx, x300580_G_QUESTIONID )
	local nFrame = GetQuestParam( varMap, varPlayer, varQuestIdx, x300580_G_FRAME )+1  

	if nActionFlag==1 then 
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_FRAME, nFrame )
			
		if nFrame<=varCurrentStep then
			
			local varIndex = x300580_var_QuestList[varCurrentStep][varQuestion][nFrame]

			x300580_PlayGameEffect( varMap, varPlayer, varIndex)
		end

		if nFrame>=varCurrentStep+x300580_var_Answer_Wait then
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_FRAME, 0 )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_ANWER_STEP, 0 )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_ACTIONFLAG, 2 ) 
			x300580_ShowTips(varMap, varPlayer, "可以开始按照刚才发光的顺序点击小水晶了")	
		end
	elseif nActionFlag==3 then  
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300580_G_FRAME, nFrame )
		if nFrame>=x300580_Round_wait then
			x300580_ProcPlayNextRound(varMap, varPlayer)
		end
	end

	

	
	
end


function x300580_ProcActiveEvent( varMap, varPlayer )

end


function x300580_ProcFadeOutEvent( varMap, varPlayer )

	
end


















