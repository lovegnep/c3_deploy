
x300100_var_QuestCommentId			= 1101

x300100_var_LevelLess            = 25




x300100_var_FileId = 300100

x300100_var_QuestId = 6500

x300100_var_QuestName = "【个人】征税权"

x300100_var_QuestCommentMessage	= "\t本任务为#g25级#w以上的玩家开放，每天可以完成#g10次#w，#r前5次将获得多倍奖励#w。\n\t点选任务按钮后你将获得向指定商人征税的权力，前往三名指定商人征税后回来向我报道，即可获得你应得的奖励。\n\t当然，并不是每个商人都在附近，也有可能是云游在外的行商，但您最好#g不要放弃任务#w，否则将会受到惩罚。当你每日完成5次任务时，本国还将#g增长1两的国库金钱储备#w，以及你将获得一些#g额外奖励#w，感谢你对国家的贡献！"

x300100_var_strInPunishTime       = "你放弃任务不足5分钟，不能接受本任务"

x300100_var_QuestInfoTable      = {
                                    "\t@npc_%d、@npc_%d和@npc_%d长期以各种理由拖欠税资，我觉得以你的才干一定能够胜任这份工作，去帮我收回他拖欠的税款，我会给你相应的报酬。", 
                                    "\t@npc_%d、@npc_%d和@npc_%d长期偷税漏税，我们的税差去了几次都没有收到税金，大家都说你对付这一类人很有一套，看来这次要拜托你了。", 
                                    "\t最近我的几个手下都病倒了，很多人的税金都没有及时收缴上来，我想请你帮我征收@npc_%d、@npc_%d和@npc_%d的税金"
}

x300100_var_QuestInfo           = "\t@npc_%d、@npc_%d和@npc_%d长期偷税漏税、违法经营，拜托你代我去收回欠税吧，我不会忘记给你好处的！"

x300100_var_QuestReply          = "@npc_138523"
x300100_var_QuestReplyGuid      = 138523

x300100_var_strFinish             = "\t交给你的事情都办完了？"

x300100_var_QuestTarget			=	"  向@npc_%d征税(%d/1)"

x300100_var_QuestHelp           = "#G每天的前5次任务，可以获得多倍奖励"

x300100_var_MaxLevel              = 80

x300100_var_HighCofficient        = 75

x300100_var_TargetCount           = 3

x300100_var_LowCofficient         = 15
x300100_var_FinishOne             = "你已完成向@npc_%s的征税（%d/3）"

x300100_var_HasTaxCoff            = 100

x300100_var_HasTaxValue           = 10000000

x300100_var_Complete              = 7

x300100_var_ButtonNPC             = 0

x300100_var_QuestDescription    = "\t国家税收关乎国计民生，是头等的大事。虽然本官日夜奔忙，各地的偷税漏税情况却依旧严重，看来人手是实在不足了。\n\t阁下是否想为国效力，帮助我向各地的商人征税？如果你能完成任务，我也会给你一定的奖赏。"

x300100_var_strNPCTax             = {
                                    "\t好吧，没想到征税官竟然找你来征税，王子都不敢怠慢你，何况是我们这些普通百姓。", 
                                    "\t啊，你就是大家都在议论的#y@myname#w？真没想到征税官竟然请到了你，看来我那套上有八十老母下有待哺小儿的话也没有什么用了。好，我交！",
                                    "\t啊？！来了新的税官啊，我还以为可以不用交了呢！这是税款……"
}

x300100_var_TaxTargetList         = {
                                    { varTalknpc = 	138538	}, 
                                    { varTalknpc = 	138539	}, 
                                    { varTalknpc = 	138540	}, 
                                    { varTalknpc = 	138541	}, 
                                    { varTalknpc = 	138594	}, 
                                    { varTalknpc = 	138545	}, 
                                    { varTalknpc = 	138563	}, 
                                    { varTalknpc = 	138584	}, 
                                    { varTalknpc = 	138556	}, 
                                    { varTalknpc = 	138500	}, 
                                    { varTalknpc = 	138550	}, 
                                    { varTalknpc = 	138504	}, 
                                    { varTalknpc = 	138505	}, 
                                    { varTalknpc = 	138506	}, 
                                    { varTalknpc = 	138551	}, 
                                    { varTalknpc = 	138552	}, 
                                    { varTalknpc = 	138553	}, 
                                    { varTalknpc = 	138554	}, 
                                    { varTalknpc = 	138555	}, 
                                    { varTalknpc = 	138557	}
}

x300100_var_ItemAwardCertain	= {
					{levelMin=20, levelMax=30, varNum=1, varId={12110201}},
					{levelMin=30, levelMax=40, varNum=1, varId={12110202}},
					{levelMin=40, levelMax=50, varNum=1, varId={12110203}},
					{levelMin=50, levelMax=60, varNum=1, varId={12110204}},
					{levelMin=60, levelMax=70, varNum=1, varId={12110205}},
					{levelMin=70, levelMax=80, varNum=1, varId={12110206}},
					{levelMin=80, levelMax=90, varNum=1, varId={12110207}},
					{levelMin=90, levelMax=100, varNum=1, varId={12110208}},
					{levelMin=100, levelMax=110, varNum=1, varId={12110209}},
					{levelMin=110, levelMax=9999, varNum=1, varId={12110210}},
}
x300100_var_MaxTimes                  = 10
x300100_var_strOverMaxTimes           = "很抱歉，您本日征税次数已经达到上限，请明日再来领取任务。"

function x300100_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300100_var_QuestId)
    local mFinished = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)
    local F1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
    if F1 > x300100_var_HasTaxValue then
        F1 = 1
    else
        F1 = 0
    end
    local F2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2)
    if F2 > x300100_var_HasTaxValue then
        F2 = 1
    else
        F2 = 0
    end
    local F3 = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)
    if F3 > x300100_var_HasTaxValue then
        F3 = 1
    else
        F3 = 0
    end
    local round = x300100_GetCircle( varMap, varPlayer) + 1
    if round > 5 then
        round = round - 5
    end
    local varNpc1, varNpc2, varNpc3 = x300100_GetNPCID( varMap, varPlayer)
    local strQuestInfo = ""

    if mFinished == 0 then
    		if F1 > 0 then
    			strQuestInfo = strQuestInfo.."#G";
    		else
    			strQuestInfo = strQuestInfo.."#W";
    		end
    		strQuestInfo = strQuestInfo..format(x300100_var_QuestTarget, varNpc1, F1);
    		strQuestInfo = strQuestInfo.."\n"
    		
    		if F2 > 0 then
    			strQuestInfo = strQuestInfo.."#G";
    		else
    			strQuestInfo = strQuestInfo.."#W";
    		end
    		strQuestInfo = strQuestInfo..format(x300100_var_QuestTarget, varNpc2, F2);
    		strQuestInfo = strQuestInfo.."\n"
    		
    		if F3 > 0 then
    			strQuestInfo = strQuestInfo.."#G";
    		else
    			strQuestInfo = strQuestInfo.."#W";
    		end
    		strQuestInfo = strQuestInfo..format(x300100_var_QuestTarget, varNpc3, F3);
    else
        strQuestInfo = "任务已经完成，请回去向@npc_138523汇报！"
    end

    StartTalkTask( varMap)
        AddQuestLogCustomText( varMap,
                               format( "【个人】征税权(%d/5)", round),                             
                               format( "【个人】征税权(%d/5)", round),          
                               strQuestInfo,     
                               x300100_var_QuestReply,         
                               "找到欠税的人，让他们知道偷税漏税的害处",
                               format( x300100_var_QuestInfo, varNpc1, varNpc2, varNpc3),   
                               x300100_var_QuestHelp)          

        local money = x300100_GetQuestMoney( varMap, varPlayer)
       
        if x300100_GetHighReward( varMap, varPlayer) ~= 4 then
			 AddQuestMoneyBonus( varMap, money)
	    else
            AddQuestMoneyBonus1( varMap, money*3)
        end
    StopTalkTask()
    DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end

function x300100_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    
    
    if GetLevel( varMap, varPlayer) >= x300100_var_LevelLess then
        TalkAppendButtonNM(varMap, varPlayer, varTalknpc, x300100_var_QuestCommentId, 13, -1)

        local varState = GetQuestStateNM( varMap, varPlayer, varTalknpc, x300100_var_QuestId)
        TalkAppendButton( varMap, x300100_var_QuestId, x300100_var_QuestName, varState)
    end
end


function x300100_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, switchId)
    
    
	if varQuest == x300100_var_QuestCommentId then
		QuestCom(varMap, varPlayer, x300100_var_QuestCommentId)
		local contentStr = x300100_var_QuestCommentMessage
		StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x300100_var_QuestName)
			TalkAppendString( varMap, contentStr)
		StopTalkTask( varMap)

		DeliverTalkMenu( varMap, varPlayer, varTalknpc)
		return
	end

    if GetLevel( varMap, varPlayer) < x300100_var_LevelLess then
		return
    end

    
    if varQuest == x300100_var_QuestId then
        
        if x300100_IsPunishTime( varMap, varPlayer) == 1 then
    		StartTalkTask( varMap)
                TalkAppendString( varMap, "#Y"..x300100_var_QuestName)
    			TalkAppendString( varMap, x300100_var_strInPunishTime)
    		StopTalkTask( varMap)
            DeliverTalkMenu( varMap, varPlayer, varTalknpc)
            return
        end
        if IsHaveQuestNM( varMap, varPlayer, x300100_var_QuestId) == 0 then
            
            x300100_DisplayQuestInfo( varMap, varPlayer, varTalknpc)
        else
            
            local varTalkNpcGUID = GetMonsterGUID( varMap, varTalknpc)
            if varTalkNpcGUID == x300100_var_QuestReplyGuid then
                
                local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300100_var_QuestId)
                local isFinish = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)
                StartTalkTask( varMap)
                TalkAppendString( varMap, "#Y"..x300100_var_QuestName)
                TalkAppendString( varMap, x300100_var_strFinish)
                if isFinish == 0 then
                    StopTalkTask( varMap)
                    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
                else
                    
                    local money = x300100_GetQuestMoney( varMap, varPlayer)
                    TalkAppendString( varMap, " " )
                    TalkAppendString( varMap, "#Y奖励内容：" )
                    TalkAppendString( varMap, format("银卡：#{_MONEY%d}#Y",money) )
                    TalkAppendString( varMap, " " )
                    if x300100_GetHighReward( varMap, varPlayer) == 4 then
                        TalkAppendString( varMap, "#Y额外奖励：" )
                        TalkAppendString( varMap, format( "银卡：#{_MONEY%d}#Y", money*2) )
                        TalkAppendString( varMap, " " )
                    end
                    StopTalkTask( varMap)
                    
                    DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300100_var_FileId, x300100_var_QuestId)
                end
            else
                
                local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300100_var_QuestId)
                local varNpc1, varNpc2, varNpc3 = x300100_GetNPCID( varMap, varPlayer)
                local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 6)
                StartTalkTask( varMap)
                local varRand = random( 1, getn( x300100_var_strNPCTax) )
                TalkAppendString( varMap, "#Y"..x300100_var_QuestName)
                TalkAppendString( varMap, x300100_var_strNPCTax[ varRand] )
                StopTalkTask( varMap)
                DeliverTalkMenu( varMap, varPlayer, varTalknpc)
                
                if varTalkNpcGUID == varNpc1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 1) < x300100_var_HasTaxValue then
                    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, varNpc1 * x300100_var_HasTaxCoff)
                    varCount = varCount + 1
                end
                if varTalkNpcGUID == varNpc2 and GetQuestParam( varMap, varPlayer, varQuestIdx, 2) < x300100_var_HasTaxValue then
                    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, varNpc2 * x300100_var_HasTaxCoff)
                    varCount = varCount + 1
                end
                if varTalkNpcGUID == varNpc3 and GetQuestParam( varMap, varPlayer, varQuestIdx, 3) < x300100_var_HasTaxValue then
                    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 3, varNpc3 * x300100_var_HasTaxCoff)
                    varCount = varCount + 1
                end
                local varTip = format( x300100_var_FinishOne, varTalkNpcGUID, varCount)
                StartTalkTask( varMap)
                TalkAppendString( varMap, varTip)
                StopTalkTask( varMap)
                DeliverTalkTips( varMap, varPlayer)
                if varCount >= x300100_var_TargetCount then
                    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300100_var_Complete, 1)
                    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300100_var_ButtonNPC, 1)
                    Msg2Player( varMap, varPlayer, "任务已经完成，快点回去汇报吧！", 8, 2)
                    Msg2Player( varMap, varPlayer, "任务已经完成，快点回去汇报吧！", 8, 3)
                end
                
                SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, varCount)
                
                x300100_ProcQuestLogRefresh( varMap, varPlayer, x300100_var_QuestId)
            end
        end
    end
end


function x300100_GetNPCID( varMap, varPlayer)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300100_var_QuestId)
    local F1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
    local F2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2)
    local F3 = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)
    local varNpc1 = F1
    local varNpc2 = F2
    local varNpc3 = F3
    if varNpc1 > x300100_var_HasTaxValue then
        varNpc1 = varNpc1 / x300100_var_HasTaxCoff
    end
    if varNpc2 > x300100_var_HasTaxValue then
        varNpc2 = varNpc2 / x300100_var_HasTaxCoff
    end
    if varNpc3 > x300100_var_HasTaxValue then
        varNpc3 = varNpc3 / x300100_var_HasTaxCoff
    end

    return varNpc1, varNpc2, varNpc3
end


function x300100_GetQuestMoney( varMap, varPlayer)
    local varLevel = GetLevel( varMap, varPlayer)
    if varLevel >= x300100_var_MaxLevel then
        varLevel = x300100_var_MaxLevel
    end

    local money = 0
    if x300100_GetHighReward( varMap, varPlayer) < 5 or GetDayOfYear() ~= x300100_GetDayofYear( varMap, varPlayer) then
        
        money = varLevel * x300100_var_HighCofficient
    else
        money = varLevel * x300100_var_LowCofficient
    end

    return money
end


function x300100_IsPunishTime( varMap, varPlayer)
    local curTime = GetMinOfDay()
    local varToday = GetDayOfYear()
    local lastTime = x300100_GetAbandonTime( varMap, varPlayer)
    if varToday == x300100_GetAbandonDate( varMap, varPlayer) then
        if abs( curTime - lastTime) <= 5 then
            return 1
        end
    else
        if curTime + 1440 - lastTime <= 5 then
            return 1
        end
    end

    return 0
end


function x300100_DisplayQuestInfo( varMap, varPlayer, varTalknpc)
    StartTalkTask( varMap)
        
        TalkAppendString( varMap, "#Y"..x300100_var_QuestName)
        TalkAppendString( varMap, x300100_var_QuestDescription)
        local money = 0
        
        local varLevel = GetLevel( varMap, varPlayer)
        if varLevel >= x300100_var_MaxLevel then
            varLevel = x300100_var_MaxLevel
        end
        
        local varToday = GetDayOfYear()
        local varLastday = x300100_GetDayofYear( varMap, varPlayer)
        if varToday ~= varLastday then
            
            x300100_SetHighReward( varMap, varPlayer, 0)
        end
        if x300100_GetHighReward( varMap, varPlayer) < 5 then
            
            money = varLevel * x300100_var_HighCofficient
        else
            money = varLevel * x300100_var_LowCofficient
        end

        TalkAppendString( varMap, "#Y奖励内容：" )
        TalkAppendString( varMap, format( "银卡：#{_MONEY%d}#Y", money) )
        TalkAppendString( varMap, " " )

        if x300100_GetHighReward( varMap, varPlayer) == 4 then
            TalkAppendString( varMap, "#Y额外奖励：" )
            TalkAppendString( varMap, format( "银卡：#{_MONEY%d}#Y", money*2) )
            TalkAppendString( varMap, " " )
        end
    StopTalkTask( varMap)
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300100_var_QuestId, x300100_var_QuestId)
end


function x300100_DisplayAndAccept( varMap, varPlayer, varTalknpc)
    if GetLevel( varMap, varPlayer) < x300100_var_LevelLess then
		return
    end

    local varToday = GetDayOfYear()
    if varToday == x300100_GetDayofYear( varMap, varPlayer) then
        if x300100_GetTimes( varMap, varPlayer) >= x300100_var_MaxTimes then
            Msg2Player( varMap, varPlayer, x300100_var_strOverMaxTimes, 8, 3)
            Msg2Player( varMap, varPlayer, x300100_var_strOverMaxTimes, 8, 2)
            return 0
        end
    else
        x300100_SetDayofYear( varMap, varPlayer, varToday)
        x300100_SetTimes( varMap, varPlayer, 0)
    end
    
    local varRet	= AddQuest( varMap, varPlayer, x300100_var_QuestId, x300100_var_FileId, 1, 0, 0, 1) 
    if( varRet == 0) then
        StartTalkTask( varMap)
        TalkAppendString( varMap, "任务已满，任务接受失败！" )
        StopTalkTask( varMap)
        DeliverTalkTips( varMap, varPlayer)
        return 0
    end

	StartTalkTask( varMap)
        
        TalkAppendString( varMap, "#Y"..x300100_var_QuestName)

        
        local size = floor( getn( x300100_var_TaxTargetList) / x300100_var_TargetCount)
        local npcList = {}
        for varI = 1, x300100_var_TargetCount do
            local varRand = random( ( varI - 1) * size + 1, varI * size)
            npcList[ varI] = x300100_var_TaxTargetList[ varRand].varTalknpc
        end
        TalkAppendString( varMap, "\n#Y任务目标：" )
        
        local varRand = random( 1, getn( x300100_var_QuestInfoTable) )
        TalkAppendString( varMap, format( x300100_var_QuestInfoTable[ varRand], npcList[ 1], npcList[ 2], npcList[ 3] ) )
        TalkAppendString( varMap, " " )

        
        TalkAppendString( varMap, "#Y任务回复：" )
        TalkAppendString( varMap, x300100_var_QuestReply)
        TalkAppendString( varMap, " " )

        TalkAppendString( varMap, "#Y小提示：" )
        TalkAppendString( varMap, x300100_var_QuestHelp)
        TalkAppendString( varMap, " " )

        
        local money = 0
        
        local varLevel = GetLevel( varMap, varPlayer)
        if varLevel >= x300100_var_MaxLevel then
            varLevel = x300100_var_MaxLevel
        end
        local highReward = x300100_GetHighReward( varMap, varPlayer)
        if highReward < 5 then
            
            money = varLevel * x300100_var_HighCofficient
            
            GamePlayScriptLog( varMap, varPlayer, ( highReward + 1) * 10 + 651)
        else
            money = varLevel * x300100_var_LowCofficient
        end

        TalkAppendString( varMap, "#Y奖励内容：" )
		TalkAppendString( varMap, format( "银卡：#{_MONEY%d}#Y", money) )
        TalkAppendString( varMap, " " )
        if x300100_GetHighReward( varMap, varPlayer) == 4 then
            TalkAppendString( varMap, "#Y额外奖励：" )
            TalkAppendString( varMap, format( "银卡：#{_MONEY%d}#Y", money*2) )
            TalkAppendString( varMap, " " )
        end

    StopTalkTask( varMap)
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)

    
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300100_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, npcList[ 1] )
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, npcList[ 2] )
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 3, npcList[ 3] )
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, 0)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0)

    
    Msg2Player( varMap, varPlayer, "你接受了任务："..x300100_var_QuestName, 8, 2)
    Msg2Player( varMap, varPlayer, "你接受了任务："..x300100_var_QuestName, 8, 3)
end


function x300100_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
								
end



function x300100_ProcQuestAbandon( varMap, varPlayer, varQuest)
    
    Msg2Player( varMap, varPlayer, "你放弃了任务："..x300100_var_QuestName, 8, 2)
    Msg2Player( varMap, varPlayer, "你放弃了任务："..x300100_var_QuestName, 8, 3)

    
    DelQuest( varMap, varPlayer, x300100_var_QuestId)
    
    x300100_SetAbandonTime( varMap, varPlayer, GetMinOfDay() )
    
    x300100_SetCircle( varMap, varPlayer, 0)
    
    x300100_SetHighReward( varMap, varPlayer, 6)
    
    x300100_SetAbandonDate( varMap, varPlayer, GetDayOfYear() )
    x300100_SetDayofYear( varMap, varPlayer, GetDayOfYear() )
    local times = x300100_GetTimes( varMap, varPlayer)
    if times < 5 then
        x300100_SetTimes( varMap, varPlayer, 5)
    else
        x300100_SetTimes( varMap, varPlayer, times + 1)
    end
end


function x300100_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
    if GetLevel( varMap, varPlayer) < x300100_var_LevelLess then
		return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300100_var_QuestId)
    local varNpc1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
    if varNpc1 > x300100_var_HasTaxValue then
        varNpc1 = varNpc1 / x300100_var_HasTaxCoff
    end
    local varNpc2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2)
    if varNpc2 > x300100_var_HasTaxValue then
        varNpc2 = varNpc2 / x300100_var_HasTaxCoff
    end
    local varNpc3 = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)
    if varNpc3 > x300100_var_HasTaxValue then
        varNpc3 = varNpc3 / x300100_var_HasTaxCoff
    end
    if varTalkNpcGUID == varNpc1 then
        local isFinish = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
        if isFinish < x300100_var_HasTaxValue then
            TalkAppendButton( varMap, x300100_var_QuestId, x300100_var_QuestName, 13)
        end
        return
    end
    if varTalkNpcGUID == varNpc2 then
        local isFinish = GetQuestParam( varMap, varPlayer, varQuestIdx, 2)
        if isFinish < x300100_var_HasTaxValue then
            TalkAppendButton( varMap, x300100_var_QuestId, x300100_var_QuestName, 13)
        end
        return
    end
    if varTalkNpcGUID == varNpc3 then
        local isFinish = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)
        if isFinish < x300100_var_HasTaxValue then
            TalkAppendButton( varMap, x300100_var_QuestId, x300100_var_QuestName, 13)
        end
        return
    end
end


function x300100_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
end


function x300100_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end

function x300100_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end


function x300100_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )
end


function x300100_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
end


function x300100_SetHighReward( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_ZHENGSHUI_HIGHREWARD[ 1], MD_ZHENGSHUI_HIGHREWARD[ 2], MD_ZHENGSHUI_HIGHREWARD[ 3], value)
end


function x300100_GetHighReward( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_ZHENGSHUI_HIGHREWARD[ 1], MD_ZHENGSHUI_HIGHREWARD[ 2], MD_ZHENGSHUI_HIGHREWARD[ 3] )
end


function x300100_GetCircle( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_ZHENGSHUI_ROUND[ 1], MD_ZHENGSHUI_ROUND[ 2], MD_ZHENGSHUI_ROUND[ 3] )
end


function x300100_SetCircle( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_ZHENGSHUI_ROUND[ 1], MD_ZHENGSHUI_ROUND[ 2], MD_ZHENGSHUI_ROUND[ 3], value)
end

function x300100_GetDayofYear( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_ZHENGSHUI_DATE[ 1], MD_ZHENGSHUI_DATE[ 2], MD_ZHENGSHUI_DATE[ 3] )
end

function x300100_SetDayofYear( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_ZHENGSHUI_DATE[ 1], MD_ZHENGSHUI_DATE[ 2], MD_ZHENGSHUI_DATE[ 3], value)
end

function x300100_GetTimes( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_ZHENGSHUI_TIMES[ 1], MD_ZHENGSHUI_TIMES[ 2], MD_ZHENGSHUI_TIMES[ 3] )
end

function x300100_SetTimes( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_ZHENGSHUI_TIMES[ 1], MD_ZHENGSHUI_TIMES[ 2], MD_ZHENGSHUI_TIMES[ 3], value)
end


function x300100_GetAbandonTime( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_ZHENGSHUI_ABANDON[ 1], MD_ZHENGSHUI_ABANDON[ 2], MD_ZHENGSHUI_ABANDON[ 3] )
end


function x300100_SetAbandonTime( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_ZHENGSHUI_ABANDON[ 1], MD_ZHENGSHUI_ABANDON[ 2], MD_ZHENGSHUI_ABANDON[ 3], value)
end


function x300100_GetAbandonDate( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_ZHENGSHUI_ABANDONDATE[ 1], MD_ZHENGSHUI_ABANDONDATE[ 2], MD_ZHENGSHUI_ABANDONDATE[ 3] )
end


function x300100_SetAbandonDate( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_ZHENGSHUI_ABANDONDATE[ 1], MD_ZHENGSHUI_ABANDONDATE[ 2], MD_ZHENGSHUI_ABANDONDATE[ 3], value)
end

function x300100_ProcAccept( varMap, varPlayer)
    
end

function x300100_ProcAcceptCheck( varMap, varPlayer)
    
end

function x300100_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)
    if GetLevel( varMap, varPlayer) < x300100_var_LevelLess then
		return
    end

    
    local getQuest = x300100_GetDayofYear( varMap, varPlayer)
    local varToday = GetDayOfYear()
    local reward = x300100_GetHighReward( varMap, varPlayer)
    if IsHaveQuestNM( varMap, varPlayer, x300100_var_QuestId) > 0 then 
    	
    	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300100_var_QuestId)
        local isFinish = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)
        
        
        if isFinish ~= 1 then
        	return
        end
    	
        
        local money = x300100_GetQuestMoney( varMap, varPlayer)
        AddMoney( varMap, varPlayer, 1, money)
        DelQuest( varMap, varPlayer, x300100_var_QuestId)

        local round = x300100_GetCircle( varMap, varPlayer) + 1
        StartTalkTask( varMap)
            if getQuest ~= varToday then 
                reward = 0
                x300100_SetHighReward( varMap, varPlayer, 1)
            end
            reward = reward + 1
            if round > 5 then
                round = round - 5
            end
            if reward < 6 then
                TalkAppendString( varMap, format( "环数：%d/5    本日高奖环数  %d/5", round, reward) )
                if reward == 5 then
                    x300100_SetHighReward( varMap, varPlayer, 6)
                end
            else
                TalkAppendString( varMap, "环数："..round.."/5" )
            end
        StopTalkTask( varMap)
        DeliverTalkTips( varMap, varPlayer)

        StartTalkTask( varMap)
        TalkAppendString( varMap, "你完成了任务："..x300100_var_QuestName )
        StopTalkTask( varMap)
        DeliverTalkTips( varMap, varPlayer)
        Msg2Player( varMap, varPlayer, "你完成了任务："..x300100_var_QuestName, 8, 2)

        local str_money = format( "获得#R银卡#{_MONEY%d}#cffcf00的奖励。", money)
        Msg2Player(varMap, varPlayer, str_money, 8, 2)

        if getQuest == varToday then 
            if round > 5 then
                round = 0
            end
            if reward < 6 then
                if reward == 5 then
                    x300100_GetItemAwardDirectly( varMap, varPlayer)
                    x300100_AdditionalReward( varMap, varPlayer)
                    AddCountryResource( varMap, varPlayer, 2, 1000, 1)
                end
                
                x300100_SetHighReward( varMap, varPlayer, reward)
                
                GamePlayScriptLog( varMap, varPlayer, reward * 10 + 651 + 1)
            end
        else    
            
            x300100_SetDayofYear( varMap, varPlayer, varToday)
            
            x300100_SetTimes( varMap, varPlayer, 0)
        end
        
        if round == 5 then
            LuaCallNoclosure( 256216, "FinishTax", varMap, varPlayer)
        end

        
        x300100_SetCircle( varMap, varPlayer, round)
        
        x300100_SetTimes( varMap, varPlayer, x300100_GetTimes( varMap, varPlayer) + 1)
    else 
        x300100_DisplayAndAccept( varMap, varPlayer, varTalknpc)
    end
end


function x300100_AdditionalReward( varMap, varPlayer)
    local varLevel = GetLevel( varMap, varPlayer)
    if varLevel > 80 then
        varLevel = 80
    end

    local money = x300100_var_HighCofficient * varLevel * 2
    AddMoney( varMap, varPlayer, 1, money)
    local str_money = format( "获得#R银卡#{_MONEY%d}#cffcf00的额外奖励。", money)
    Msg2Player(varMap, varPlayer, str_money, 8, 2)
end


function x300100_GetItemAwardDirectly(varMap, varPlayer)

	
	
	
	
		

			
			
				
			
				
				
			
			
			
			
				
			
			
			
			
			
		
	
	

end


