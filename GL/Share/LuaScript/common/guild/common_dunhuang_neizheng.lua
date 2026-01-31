--DECLARE_QUEST_INFO_START-- 
x300928_var_FileId 					= 300928
x300928_var_QuestId 				= 1372
x300928_var_QuestName				= "【帮会】帮会贡品"
x300928_var_QuestInfo				= "任务资讯"
x300928_var_QuestTarget				= "  收集@item_%d#W(%d/1)"
x300928_var_QuestDescription        = "\t帮会贡品任务，分为#G寻物#W和#G送信#W两种，您只需要按照帮会任务发布人的要求完成任务，就可以获得#G经验#W和#G帮贡#W的奖励。"
x300928_var_QuestTips               = "如果想要了解本任务的细节，请点击帮会贡品任务说明按钮。"
x300928_var_QuestBook               = "上交指定的物品就能完成此任务，如果没有可以考虑向别的玩家收购。"
--DECLARE_QUEST_INFO_STOP--

x300928_var_strFinishAll              = "你今天不能再领取【帮会】帮会贡品任务了"
x300928_var_strTip                    = "#c00FF00小提示:"
x300928_var_strQuestTip             = "#c00FF00如果想要了解本任务的细节，请点击帮会任务说明按钮。"
x300928_var_strAddQuestFail         = "你接受的任务太多了，添加新任务失败"
x300928_var_strQuestComplete        = "\t太好了，你果然做的干净利索。"
x300928_var_strQuestFinished        = "完成【帮会】帮会贡品(%d/10)"
x300928_var_strCommitItemFail         = "提交物品失败，交任务失败"
x300928_var_strObtainXP               = "获得#R%d#cffcc00点经验。"
x300928_var_strObtainGP               = "获得#R%d#cffcc00点帮贡。"
x300928_var_QuestTarget1			= "  找到@npc_%d\n  找到@npc_%d\n  找到@npc_%d"
x300928_var_QuestContinue			= "\t请尽快完成交给你的事情。"


x300928_var_MinLevel                  = 20

x300928_var_MaxCircle                 = 10
x300928_MP_INDEX1			        = 1         
x300928_MP_INDEX2					= 2         
x300928_MP_INDEX3					= 3         
x300928_MP_INDEX4					= 4         
x300928_MP_INDEX5					= 5         
x300928_MP_INDEX6					= 6         
x300928_MP_FINISH                   = 7         
x300928_MP_ISCOMPLETE				= 0	        

x300928_var_QuestNPC                = 132020

x300928_var_LookforItemTable          = {
                                        { minLevel = 20, maxLevel = 40, 
                                            item = { 
                                                     11000200, 
                                                     11020001, 
                                                     11020002, 
                                                     11030001, 
                                                     12010001, 
                                                     12010100, 
                                                     12010001, 
                                                     12010300, 
                                                     11990201, 
                                                     11050001, 
                                                    }, 
                                            targets = {
                                                    { varTalknpc = 132156, Dialog = "\t这点小事情也要来找我……\n\t好吧!一会我就带人去看看。"	}, 
                                                    { varTalknpc = 132161, Dialog = "\t没有问题，我的朋友，很高兴能帮上你们的忙。"	}, 
                                                    { varTalknpc = 132006, Dialog = "\t这个……最近我已经忙的焦头烂额了。\n\t这样吧，我处理完这事就过去。"	}, 
                                                    { varTalknpc = 132036, Dialog = "\t我很乐意帮忙~不过，请稍等，小女子梳妆完毕，自会前往。"	}, 
                                                    { varTalknpc = 132160, Dialog = "\t你们要大采购么？要不要我带上货单？"	}, 
                                                    { varTalknpc = 132025, Dialog = "\t有什么需要我帮助的吗？好吧，我这就动身"	}, 
                                                    { varTalknpc = 132023, Dialog = "\t我会去的……不过，要等我的徒弟回来的时候。"	}, 
                                                },
                                        }, 
                                        { minLevel = 40, maxLevel = 60, 
                                            item = { 
                                                     11000200, 
                                                     11020001, 
                                                     11020002, 
                                                     11030001, 
                                                     12010001, 
                                                     12010100, 
                                                     12010001, 
                                                     12010300, 
                                                     11990202, 
                                                     11050001, 
                                                    }, 
                                            targets = {
                                                    { varTalknpc = 132066, Dialog = "\t郝令让你来的？好吧，我正想去找他，上次他从我这里订购的货物，到现在帐也没付清！"	}, 
                                                    { varTalknpc = 132076, Dialog = "\t哦，找我么？难道有淘汰下来的装备？！好我这就过去。"	}, 
                                                    { varTalknpc = 132063, Dialog = "\t押运官的职责让我不能轻易离开，不过我可以让那些来押运的家伙帮点小忙……"	}, 
                                                    { varTalknpc = 132031, Dialog = "\t帮忙？有报酬么？一会我派个伙计去看看，没有赚头的生意我从来不做！"	}, 
                                                    { varTalknpc = 132072, Dialog = "\t啊？为什么要来找我？"	}, 
                                                    { varTalknpc = 132074, Dialog = "\t这事情……我要先和我妻子说一下，不过我相信她一定会同意的。"	}, 
                                                    { varTalknpc = 132035, Dialog = "\t好，你们帮的人都是我的老顾客，我一定准时到。"	}, 
                                                },
                                        }, 
                                        { minLevel = 60, maxLevel = 160, 
                                            item = { 
                                                     11000201, 
                                                     11020001, 
                                                     11020002, 
                                                     11030001, 
                                                     12010001, 
                                                     12010100, 
                                                     12010001, 
                                                     12010300, 
                                                     11990203, 
                                                     11050001, 
                                                    }, 
                                            targets = {
                                                    { varTalknpc = 132029, Dialog = "\t好的好的，等我把手头上这几件装备铭刻了就过去。"	}, 
                                                    { varTalknpc = 132032, Dialog = "\t很高兴能为贵帮帮忙，我准备一下马上就到。"	}, 
                                                    { varTalknpc = 132080, Dialog = "\t需要我的帮助？没问题！我可是出了名的好说话。"	}, 
                                                    { varTalknpc = 132073, Dialog = "\t很高兴能为贵帮进些微薄之力，我准备一下马上就到。"	}, 
                                                    { varTalknpc = 132065, Dialog = "\t我从不问江湖事，不过你们帮主的面子我还是要给的。\n\t好吧，你先回去，我随后就到。"	}, 
                                                    { varTalknpc = 132030, Dialog = "\t有人找帮忙？等我收拾一下，一会就去。"	}
                                                },
                                        }, 
}

x300928_var_xpCoefficient             = {
                                         41,
                                         81,
                                        123,
                                        164,
                                        204,
                                        246,
                                        287,
                                        327,
                                        369,
                                        410,
}

function x300928_ProcEnumEvent( varMap, varPlayer, varTalknpc)
    local varLevel = GetLevel( varMap, varPlayer)

    if varLevel < x300928_var_MinLevel then
        return
    end

    if GetGuildID( varMap, varPlayer) < 0 then
        return
    end

    local varState = GetQuestStateNM( varMap, varPlayer, varTalknpc, x300928_var_QuestId)
    TalkAppendButton( varMap, x300928_var_QuestId, x300928_var_QuestName, varState, 1)
end

function x300928_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, iClickIndex)
	
	local varLevel = GetLevel( varMap, varPlayer)

    if varLevel < x300928_var_MinLevel then
        return
    end

    local guildId = GetGuildID( varMap, varPlayer)
    if guildId < 0 then
        Msg2Player( varMap, varPlayer, "你尚未加入任何帮会，不能领取【帮会】帮会贡品", 8, 3)
        return
    end

    if IsHaveQuest( varMap, varPlayer, x300928_var_QuestId) == 0 then
        
        local curDay = GetDayOfYear()

		if x300928_GetMD( varMap, varPlayer, MD_BANGHUI_CIRCLE) == 0 then
			x300928_SetMD( varMap, varPlayer, MD_BANGHUI_CIRCLE, 1)
		end
		
        if x300928_GetMD( varMap, varPlayer, MD_BANGHUI_CIRCLE) > x300928_var_MaxCircle then
            if curDay == x300928_GetMD( varMap, varPlayer, MD_BANGHUI_LASTDAY) then
                if x300928_GetMD( varMap, varPlayer, MD_BANGHUI_TIMES) >= x300928_var_MaxCircle then
                    Msg2Player( varMap, varPlayer, x300928_var_strFinishAll, 8, 3)
                    return
                else
                    x300928_SetMD( varMap, varPlayer, MD_BANGHUI_CIRCLE, 1)
                    x300928_DispatchQuestInfo( varMap, varPlayer, varTalknpc)
                end
            else
                x300928_SetMD( varMap, varPlayer, MD_BANGHUI_LASTDAY, curDay)
                x300928_SetMD( varMap, varPlayer, MD_BANGHUI_CIRCLE, 1)
                x300928_SetMD( varMap, varPlayer, MD_BANGHUI_TIMES, 0)
                x300928_DispatchQuestInfo( varMap, varPlayer, varTalknpc)
            end
        else
            if x300928_GetMD( varMap, varPlayer, MD_BANGHUI_TIMES) >= x300928_var_MaxCircle then
				if curDay == x300928_GetMD( varMap, varPlayer, MD_BANGHUI_LASTDAY) then
					if x300928_GetMD( varMap, varPlayer, MD_BANGHUI_TIMES) >= x300928_var_MaxCircle then
						Msg2Player( varMap, varPlayer, x300928_var_strFinishAll, 8, 3)
						return
					else
						x300928_SetMD( varMap, varPlayer, MD_BANGHUI_CIRCLE, 1)
						x300928_DispatchQuestInfo( varMap, varPlayer, varTalknpc)
					end
				else
					x300928_SetMD( varMap, varPlayer, MD_BANGHUI_LASTDAY, curDay)
					x300928_SetMD( varMap, varPlayer, MD_BANGHUI_CIRCLE, 1)
					x300928_SetMD( varMap, varPlayer, MD_BANGHUI_TIMES, 0)
					x300928_DispatchQuestInfo( varMap, varPlayer, varTalknpc)
				end
            else
                x300928_DispatchQuestInfo( varMap, varPlayer, varTalknpc)
            end
        end
    else
        
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300928_var_QuestId)
        local mp0 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_ISCOMPLETE)
        local mp7 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_FINISH)
        if mp0 == 1 and mp7 == 1 then
            x300928_DispatchQuestComplete( varMap, varPlayer, varTalknpc)
        else
            x300928_DispatchQuestContinue( varMap, varPlayer, varTalknpc)
        end
    end
end


function x300928_DispatchQuestInfo( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)
		
		TalkAppendString( varMap, "#Y"..x300928_var_QuestName)
		TalkAppendString( varMap, x300928_var_QuestDescription)
		TalkAppendString( varMap, " " )

		
        local varLevel = GetLevel( varMap, varPlayer)
        local varCircle = x300928_GetMD( varMap, varPlayer, MD_BANGHUI_CIRCLE)
        local xp = varLevel * x300928_var_xpCoefficient[ varCircle]
        
        if( xp > 0) then
            AddQuestExpBonus( varMap, xp)
        end
        AddQuestMoneyBonus8( varMap, varCircle)
		
        TalkAppendString( varMap, x300928_var_strTip)
        TalkAppendString( varMap, x300928_var_strQuestTip)
	StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300928_var_FileId, x300928_var_QuestId)
end

function x300928_DispatchQuestContinue( varMap, varPlayer, varTalknpc)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300928_var_QuestId)
    local mp1 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX1)
    local mp2 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX2)
    local mp3 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX3)
    local mp4 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX4)
    local mp5 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX5)
    local mp6 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX6)
    local found = mp4 + mp5 + mp6
    local varTalkNpcGUID = GetMonsterGUID( varMap, varTalknpc)
    local varLevel = GetLevel( varMap, varPlayer)
    local array = {}
    local strDialog = ""

    if varTalkNpcGUID == x300928_var_QuestNPC then
        strDialog = x300928_var_QuestContinue
    else
        
        for varI, item in x300928_var_LookforItemTable do
            
                if mp2 ~= 0 then
                	local bupdate = 0
                    array = item.targets

                    if varTalkNpcGUID == mp1 then
                        for varI, item in array do
                            if varTalkNpcGUID == item.varTalknpc then
                                strDialog = item.Dialog
                                mp4 = 1
                                SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX4, mp4)
                                Msg2Player( varMap, varPlayer, format( "你已经找到了@npc_%d(%d/3)", varTalkNpcGUID, found + 1), 8, 3)
                                bupdate = 1
                                break
                            end
                        end
                    end
                    if varTalkNpcGUID == mp2 then
                        for varI, item in array do
                            if varTalkNpcGUID == item.varTalknpc then
                                strDialog = item.Dialog
                                mp5 = 1
                                SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX5, mp5)
                                Msg2Player( varMap, varPlayer, format( "你已经找到了@npc_%d(%d/3)", varTalkNpcGUID, found + 1), 8, 3)
                                bupdate = 1
                                break
                            end
                        end
                    end
                    if varTalkNpcGUID == mp3 then
                        for varI, item in array do
                            if varTalkNpcGUID == item.varTalknpc then
                                strDialog = item.Dialog
                                mp6 = 1
                                SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX6, mp6)
                                Msg2Player( varMap, varPlayer, format( "你已经找到了@npc_%d(%d/3)", varTalkNpcGUID, found + 1), 8, 3)
                                bupdate = 1
                                break
                            end
                        end
                    end
                    if mp4 == 1 and mp5 == 1 and mp6 == 1 then
                        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
                        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
                        Msg2Player( varMap, varPlayer, "你完成了【帮会】帮会贡品", 8, 3)
                        bupdate = 1
                    end
                    if bupdate == 1 then
                    	x300928_ProcQuestLogRefresh( varMap, varPlayer, x300928_var_QuestId)
                    	break
                    end
                else
                    
                    strDialog = format( x300928_var_QuestTarget, mp1, GetQuestParam( varMap, varPlayer, varQuestIdx, 0))
                end
                
            
        end
    end

    StartTalkTask( varMap)
        
        TalkAppendString( varMap, "#Y"..x300928_var_QuestName)
        TalkAppendString( varMap, strDialog)
    StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
end

function x300928_DispatchQuestComplete( varMap, varPlayer, varTalknpc)
	StartTalkTask( varMap)
		
		TalkAppendString( varMap, "#Y"..x300928_var_QuestName)
		
		
		TalkAppendString( varMap, x300928_var_strQuestComplete)

        local varLevel = GetLevel( varMap, varPlayer)
        local varCircle = x300928_GetMD( varMap, varPlayer, MD_BANGHUI_CIRCLE)
        local xp = varLevel * x300928_var_xpCoefficient[ varCircle]
        if( xp > 0) then
            AddQuestExpBonus( varMap, xp)
        end
        AddQuestMoneyBonus8( varMap, varCircle)
	StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300928_var_FileId, x300928_var_QuestId)
end

function x300928_ProcQuestAccept( varMap, varPlayer, varTalknpc)
	
	local varLevel = GetLevel( varMap, varPlayer)

    if varLevel < x300928_var_MinLevel then
        return
    end
	
    local guildId = GetGuildID( varMap, varPlayer)
    if guildId < 0 then
        Msg2Player( varMap, varPlayer, "你尚未加入任何帮会，不能领取【帮会】帮会贡品", 8, 3)
        return
    end

    if IsHaveQuest( varMap, varPlayer, x300928_var_QuestId) == 0 then
        if AddQuest( varMap, varPlayer, x300928_var_QuestId, x300928_var_FileId, 0, 0, 1, 1) == 0 then
            Msg2Player( varMap, varPlayer, x300928_var_strAddQuestFail, 8, 3)
            Msg2Player( varMap, varPlayer, x300928_var_strAddQuestFail.."。", 8, 2)
            return
        end

        local questType = random( 1, 2)
        local varLevel = GetLevel( varMap, varPlayer)
        local varId = 0
        for varI, item in x300928_var_LookforItemTable do
            if varLevel >= item.minLevel and varLevel < item.maxLevel then
                if questType == 1 then
                    
                    varId = item.item[ random( 1, getn( item.item) ) ]

                    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300928_var_QuestId)
                    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX1, varId)
                    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX6, questType)

					local varItemCount = GetItemCountInBag( varMap, varPlayer, varId)
                    StartTalkTask( varMap)
                        
                        TalkAppendString( varMap, "#Y"..x300928_var_QuestName)
                        TalkAppendString( varMap, x300928_var_QuestDescription)
                        TalkAppendString( varMap, "#r" )
                        TalkAppendString( varMap, "#Y任务目标：" )
                        TalkAppendString( varMap, format( x300928_var_QuestTarget, varId, varItemCount >= 1 and 1 or 0) )
                    StopTalkTask()

                    
                    if varItemCount >= 1 then
                        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
                        SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
                    end
                else
                    
                    local targets = {}
                    targets[ 1] = random( 1, getn( item.targets) )
                    local rndm = random( 1, getn( item.targets) )
                    while rndm == targets[ 1] do
                        rndm = random( 1, getn( item.targets) )
                    end
                    targets[ 2] = rndm
                    rndm = random( 1, getn( item.targets) )
                    while rndm == targets[ 1] or rndm == targets[ 2] do
                        rndm = random( 1, getn( item.targets) )
                    end
                    targets[ 3] = rndm

                    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300928_var_QuestId)
                    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX1, item.targets[ targets[ 1] ].varTalknpc)
                    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX2, item.targets[ targets[ 2] ].varTalknpc)
                    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX3, item.targets[ targets[ 3] ].varTalknpc)

                    StartTalkTask( varMap)
                        
                        TalkAppendString( varMap, "#Y"..x300928_var_QuestName)
                        TalkAppendString( varMap, x300928_var_QuestDescription)
                        TalkAppendString( varMap, "#r" )
                        TalkAppendString( varMap, "#Y任务目标：" )
                        TalkAppendString( varMap, format( x300928_var_QuestTarget1, 
                            item.targets[ targets[ 1] ].varTalknpc, 
                            item.targets[ targets[ 2] ].varTalknpc, 
                            item.targets[ targets[ 3] ].varTalknpc ) )
                    StopTalkTask()
                end
                break
            end
        end
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
        Msg2Player( varMap, varPlayer, "你接受了任务【帮会】帮会贡品", 8, 3)
        Msg2Player( varMap, varPlayer, "你接受了任务【帮会】帮会贡品。", 8, 2)
    else
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300928_var_QuestId)
        local mp1 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX1)
        local mp2 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX2)
        local mp3 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX3)
        local mp0 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_ISCOMPLETE)
        local mp7 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_FINISH)
        if mp0 ~= 1 or mp7 ~= 1 then
        	return
        end
        
        local varCircle = x300928_GetMD( varMap, varPlayer, MD_BANGHUI_CIRCLE)
        local varLevel = GetLevel( varMap, varPlayer)

        if mp2 == 0 then
            if DelItem( varMap, varPlayer, mp1, 1) == 0 then
                Msg2Player( varMap, varPlayer, x300928_var_strCommitItemFail, 8, 3)
                return
            end
        end
        DelQuest( varMap, varPlayer, x300928_var_QuestId)
		LuaCallNoclosure(802005,"AddActivityQuest",varMap, varPlayer, 0,3)
		LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,3)
        local curDay = GetDayOfYear()
        x300928_SetMD( varMap, varPlayer, MD_BANGHUI_CIRCLE, varCircle + 1)
        if curDay ~= x300928_GetMD( varMap, varPlayer, MD_BANGHUI_LASTDAY) then
            x300928_SetMD( varMap, varPlayer, MD_BANGHUI_TIMES, 1)
        else
            x300928_SetMD( varMap, varPlayer, MD_BANGHUI_TIMES, x300928_GetMD( varMap, varPlayer, MD_BANGHUI_TIMES) + 1)
        end

        local xp = varLevel * x300928_var_xpCoefficient[ varCircle]
        AddExp( varMap, varPlayer, xp)
        Msg2Player( varMap, varPlayer, format( x300928_var_strObtainXP, xp), 8, 2)
        Msg2Player( varMap, varPlayer, format( x300928_var_strObtainGP, varCircle), 8, 2)
        AddGuildUserPoint( varMap, varPlayer, varCircle)
        Msg2Player( varMap, varPlayer, format( x300928_var_strQuestFinished, varCircle), 8, 3)
        x300928_SetMD( varMap, varPlayer, MD_BANGHUI_LASTDAY, curDay)
    end
end

function x300928_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
    if IsHaveQuest( varMap, varPlayer, x300928_var_QuestId) == 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300928_var_QuestId)
    local mp1 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX1)
    local mp2 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX2)
    local mp3 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX3)
    local mp4 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX4)
    local mp5 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX5)
    local mp6 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX6)

    if varTalkNpcGUID == mp1 and mp4 == 0 then
        TalkAppendButton( varMap, x300928_var_QuestId, x300928_var_QuestName, 6)
    end

    if varTalkNpcGUID == mp2 and mp5 == 0 then
        TalkAppendButton( varMap, x300928_var_QuestId, x300928_var_QuestName, 6)
    end

    if varTalkNpcGUID == mp3 and mp6 == 0 then
        TalkAppendButton( varMap, x300928_var_QuestId, x300928_var_QuestName, 6)
    end
end

function x300928_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300928_var_QuestId)
    local mp1 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX1)
    local mp2 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX2)
    local mp3 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX3)
    local mp4 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX4)
    local mp5 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX5)
    local mp6 = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX6)
    local varLevel = GetLevel( varMap, varPlayer)
    local varCircle = x300928_GetMD( varMap, varPlayer, MD_BANGHUI_CIRCLE)
    local xp = varLevel * x300928_var_xpCoefficient[ varCircle]

	StartTalkTask( varMap)
    if mp2 == 0 then
        AddQuestLogCustomText( varMap,
                                "",                             
                                x300928_var_QuestName..format( "(%d/%d)", x300928_GetMD( varMap, varPlayer, MD_BANGHUI_CIRCLE), x300928_var_MaxCircle), 
                                format( x300928_var_QuestTarget, mp1, GetQuestParam( varMap, varPlayer, varQuestIdx, 0)),
                                "",                             
                                x300928_var_QuestBook,          
                                x300928_var_QuestDescription,
                                x300928_var_QuestTips)
        if( xp > 0) then
            AddQuestExpBonus( varMap, xp)
        end
        AddQuestMoneyBonus8( varMap, varCircle)
    else
        local strTarget = ""
        if mp4 == 1 then
            strTarget = strTarget.."#G"..format( "  找到@npc_%d(1/1)\n", mp1)
        else
            strTarget = strTarget.."#W"..format( "  找到@npc_%d(0/1)\n", mp1)
        end
        if mp5 == 1 then
            strTarget = strTarget.."#G"..format( "  找到@npc_%d(1/1)\n", mp2)
        else
            strTarget = strTarget.."#W"..format( "  找到@npc_%d(0/1)\n", mp2)
        end
        if mp6 == 1 then
            strTarget = strTarget.."#G"..format( "  找到@npc_%d(1/1)", mp3)
        else
            strTarget = strTarget.."#W"..format( "  找到@npc_%d(0/1)", mp3)
        end
        AddQuestLogCustomText( varMap,
                                "",                             
                                x300928_var_QuestName..format( "(%d/%d)", x300928_GetMD( varMap, varPlayer, MD_BANGHUI_CIRCLE), x300928_var_MaxCircle), 
                                strTarget,
                                "",                             
                                format( x300928_var_QuestTarget1, mp1, mp2, mp3),          
                                x300928_var_QuestDescription,
                                x300928_var_QuestTips)
        if( xp > 0) then
            AddQuestExpBonus( varMap, xp)
        end
        AddQuestMoneyBonus8( varMap, varCircle)
    end
	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end

function x300928_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest)
    if IsHaveQuest( varMap, varPlayer, x300928_var_QuestId) == 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300928_var_QuestId)




    
    local varId = GetQuestParam( varMap, varPlayer, varQuestIdx, x300928_MP_INDEX1)
    if varId == varItemData then
    	local Num = GetItemCount( varMap, varPlayer, varItemData )
			if Num < 1 then
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, Num )
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
				x300928_ProcQuestLogRefresh( varMap, varPlayer, x300928_var_QuestId)
			else    
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300928_MP_FINISH, 1)
        SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300928_MP_ISCOMPLETE, 1)
        Msg2Player( varMap, varPlayer, "你完成了【帮会】帮会贡品", 8, 3)
      end  
    end
end

function x300928_ProcQuestAbandon( varMap, varPlayer, varQuest)
    if IsHaveQuest( varMap, varPlayer, x300928_var_QuestId) == 0 then
        return
    end

    DelQuest( varMap, varPlayer, x300928_var_QuestId)
    x300928_SetMD( varMap, varPlayer, MD_BANGHUI_LASTDAY, GetDayOfYear() )
    x300928_SetMD( varMap, varPlayer, MD_BANGHUI_CIRCLE, 1)
    x300928_SetMD( varMap, varPlayer, MD_BANGHUI_TIMES, x300928_var_MaxCircle)
    Msg2Player( varMap, varPlayer, "你放弃了任务【帮会】帮会贡品", 8, 3)
end

function x300928_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x300928_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end

