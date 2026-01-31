
x300172_var_FileId = 300172
x300172_var_FarScriptId = 300160


x300172_var_XPBuffId          = 7647

x300172_var_DoubleXPBuffId    = 7648

x300172_var_CreditBuffId      = 7649

x300172_var_DoubleCreditBuffId= 7650

x300172_var_Mana8             = 7645

x300172_var_SaveMaxMinute     = 600

x300172_var_10H8XP            = 7667

x300172_var_10H8Credit        = 7666

x300172_var_10H8Mana          = 7665

x300172_var_10H4XP            = 7668

x300172_var_10H4Credit        = 7669


function x300172_GetExp2( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_WUTING_EXP_2[ 1], MD_WUTING_EXP_2[ 2], MD_WUTING_EXP_2[ 3] )
end

function x300172_SetExp2( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_WUTING_EXP_2[ 1], MD_WUTING_EXP_2[ 2], MD_WUTING_EXP_2[ 3], value)
end

function x300172_GetExp4( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_WUTING_EXP_4[ 1], MD_WUTING_EXP_4[ 2], MD_WUTING_EXP_4[ 3] )
end

function x300172_SetExp4( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_WUTING_EXP_4[ 1], MD_WUTING_EXP_4[ 2], MD_WUTING_EXP_4[ 3], value)
end

function x300172_GetCredit4( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_WUTING_CREDIT_4[ 1], MD_WUTING_CREDIT_4[ 2], MD_WUTING_CREDIT_4[ 3] )
end

function x300172_SetCredit4( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_WUTING_CREDIT_4[ 1], MD_WUTING_CREDIT_4[ 2], MD_WUTING_CREDIT_4[ 3], value)
end

function x300172_GetCredit8( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_WUTING_CREDIT_8[ 1], MD_WUTING_CREDIT_8[ 2], MD_WUTING_CREDIT_8[ 3] )
end

function x300172_SetCredit8( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_WUTING_CREDIT_8[ 1], MD_WUTING_CREDIT_8[ 2], MD_WUTING_CREDIT_8[ 3], value)
end

function x300172_GetMana8( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_DANCERY_8MANA[ 1], MD_DANCERY_8MANA[ 2], MD_DANCERY_8MANA[ 3] )
end

function x300172_SetMana8( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_DANCERY_8MANA[ 1], MD_DANCERY_8MANA[ 2], MD_DANCERY_8MANA[ 3], value)
end

function x300172_GetXP8X10( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_DANCERY_XP8X10[ 1], MD_DANCERY_XP8X10[ 2], MD_DANCERY_XP8X10[ 3] )
end

function x300172_SetXP8X10( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_DANCERY_XP8X10[ 1], MD_DANCERY_XP8X10[ 2], MD_DANCERY_XP8X10[ 3], value)
end

function x300172_GetXP4X10( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_DANCERY_XP4X10[ 1], MD_DANCERY_XP4X10[ 2], MD_DANCERY_XP4X10[ 3] )
end

function x300172_SetXP4X10( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_DANCERY_XP4X10[ 1], MD_DANCERY_XP4X10[ 2], MD_DANCERY_XP4X10[ 3], value)
end

function x300172_GetCredit8X10( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_DANCERY_CREDIT8X10[ 1], MD_DANCERY_CREDIT8X10[ 2], MD_DANCERY_CREDIT8X10[ 3] )
end

function x300172_SetCredit8X10( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_DANCERY_CREDIT8X10[ 1], MD_DANCERY_CREDIT8X10[ 2], MD_DANCERY_CREDIT8X10[ 3], value)
end

function x300172_GetCredit4X10( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_DANCERY_CREDIT4X10[ 1], MD_DANCERY_CREDIT4X10[ 2], MD_DANCERY_CREDIT4X10[ 3] )
end

function x300172_SetCredit4X10( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_DANCERY_CREDIT4X10[ 1], MD_DANCERY_CREDIT4X10[ 2], MD_DANCERY_CREDIT4X10[ 3], value)
end

function x300172_GetMana8X10( varMap, varPlayer)
    return GetPlayerGameData( varMap, varPlayer, MD_DANCERY_MANA8X10[ 1], MD_DANCERY_MANA8X10[ 2], MD_DANCERY_MANA8X10[ 3] )
end

function x300172_SetMana8X10( varMap, varPlayer, value)
    SetPlayerGameData( varMap, varPlayer, MD_DANCERY_MANA8X10[ 1], MD_DANCERY_MANA8X10[ 2], MD_DANCERY_MANA8X10[ 3], value)
end


x300172_var_BuffTable         = {
                                { buffId = 7647, varName = "杰克丹尼",     Get = x300172_GetExp2,       Set = x300172_SetExp2 }, 
                                { buffId = 7648, varName = "芝华士",       Get = x300172_GetExp4,       Set = x300172_SetExp4 }, 
                                { buffId = 7649, varName = "路易十三",     Get = x300172_GetCredit4,    Set = x300172_SetCredit4 }, 
                                { buffId = 7650, varName = "轩尼诗理查",   Get = x300172_GetCredit8,    Set = x300172_SetCredit8 }, 
                                { buffId = 7645, varName = "哈瓦那雪茄",   Get = x300172_GetMana8,      Set = x300172_SetMana8 }, 
                                { buffId = 7667, varName = "精品芝华士",   Get = x300172_GetXP8X10,     Set = x300172_SetXP8X10 }, 
                                { buffId = 7666, varName = "精品轩尼诗理查",   Get = x300172_GetCredit8X10, Set = x300172_SetCredit8X10 }, 
                                { buffId = 7665, varName = "精品哈瓦那雪茄",   Get = x300172_GetMana8X10,   Set = x300172_SetMana8X10 }, 
                                { buffId = 7668, varName = "精品杰克丹尼",   Get = x300172_GetXP4X10,     Set = x300172_SetXP4X10 }, 
                                { buffId = 7669, varName = "精品路易十三",   Get = x300172_GetCredit4X10, Set = x300172_SetCredit4X10 }, 
}

x300172_var_MutexTable        = {
                                { buffId = 7647, check = { { buffId = 7648, varName = "芝华士" },     { buffId = 7667, varName = "精品芝华士" }, { buffId = 7668, varName = "精品杰克丹尼" } } },
                                { buffId = 7648, check = { { buffId = 7647, varName = "杰克丹尼" },   { buffId = 7667, varName = "精品芝华士" }, { buffId = 7668, varName = "精品杰克丹尼" } } },
                                { buffId = 7649, check = { { buffId = 7650, varName = "轩尼诗理查" }, { buffId = 7666, varName = "精品轩尼诗理查" }, { buffId = 7669, varName = "精品路易十三" } } },
                                { buffId = 7650, check = { { buffId = 7649, varName = "路易十三" },   { buffId = 7666, varName = "精品轩尼诗理查" }, { buffId = 7669, varName = "精品路易十三" } } },
                                { buffId = 7645, check = { { buffId = 7665, varName = "精品哈瓦那雪茄" } } },
                                { buffId = 7667, check = { { buffId = 7648, varName = "芝华士" },     { buffId = 7647, varName = "杰克丹尼" }, { buffId = 7668, varName = "精品杰克丹尼" } } },
                                { buffId = 7666, check = { { buffId = 7650, varName = "轩尼诗理查" }, { buffId = 7649, varName = "路易十三" }, { buffId = 7669, varName = "精品路易十三" } } },
                                { buffId = 7665, check = { { buffId = 7645, varName = "哈瓦那雪茄" } } },
                                { buffId = 7668, check = { { buffId = 7648, varName = "芝华士" },     { buffId = 7647, varName = "杰克丹尼" }, { buffId = 7667, varName = "精品芝华士" } } },
                                { buffId = 7669, check = { { buffId = 7650, varName = "轩尼诗理查" }, { buffId = 7649, varName = "路易十三" }, { buffId = 7666, varName = "精品轩尼诗理查" } } },
}

function x300172_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    TalkAppendButton( varMap, x300172_var_FileId, "【美丽会】存储", 3, 1)
    TalkAppendButton( varMap, x300172_var_FileId, "【美丽会】取出", 3, 2)
    TalkAppendButton( varMap, x300172_var_FileId, "【美丽会】存（取）说明", 13, 3)
end

function x300172_ProcEventEntry( varMap, varPlayer, varTalknpc, idScript, idExt)
    
    if idExt == 1 then
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y【美】大都美丽会" )
            TalkAppendString( varMap, "\t4倍酒包括#G杰克丹尼#W、#G路易十三#W、#G精品杰克丹尼#W、#G精品路易十三#W。" )
            TalkAppendString( varMap, "\t8倍酒包括#G芝华士#W、#G轩尼诗理查#W、#G哈瓦那雪茄#W、#G精品芝华士#W、#G精品轩尼诗理查#W、#G精品哈瓦那雪茄#W。" )
            TalkAppendString( varMap, "\t您要储存哪种状态？" )
            TalkAppendButton( varMap, x300172_var_FileId, "【存储】4倍酒", 3, 24)
            TalkAppendButton( varMap, x300172_var_FileId, "【存储】8倍酒", 3, 25)
 
 
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    elseif idExt == 2 then
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y【美】大都美丽会" )
            TalkAppendString( varMap, "\t4倍酒包括#G杰克丹尼#W、#G路易十三#W、#G精品杰克丹尼#W、#G精品路易十三#W。" )
            TalkAppendString( varMap, "\t8倍酒包括#G芝华士#W、#G轩尼诗理查#W、#G哈瓦那雪茄#W、#G精品芝华士#W、#G精品轩尼诗理查#W、#G精品哈瓦那雪茄#W。" )
            TalkAppendString( varMap, "\t您要取回哪种状态？" )
            TalkAppendButton( varMap, x300172_var_FileId, "【取出】4倍酒", 3, 26)
            TalkAppendButton( varMap, x300172_var_FileId, "【取出】8倍酒", 3, 27)
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
	elseif idExt == 24 then
       StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y【美】大都美丽会" )
            TalkAppendString( varMap, "\t您要储存哪种状态？" )
			TalkAppendButton( varMap, x300172_var_FileId, "杰克丹尼", 3, 4)		
			TalkAppendButton( varMap, x300172_var_FileId, "路易十三", 3, 6)
			TalkAppendButton( varMap, x300172_var_FileId, "精品杰克丹尼", 3, 20)
			TalkAppendButton( varMap, x300172_var_FileId, "精品路易十三", 3, 21)
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
	elseif idExt == 25 then
       StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y【美】大都美丽会" )
            TalkAppendString( varMap, "\t您要储存哪种状态？" )
			TalkAppendButton( varMap, x300172_var_FileId, "芝华士", 3, 5)
			TalkAppendButton( varMap, x300172_var_FileId, "轩尼诗理查", 3, 7)
			TalkAppendButton( varMap, x300172_var_FileId, "哈瓦那雪茄", 3, 13)
			TalkAppendButton( varMap, x300172_var_FileId, "精品芝华士", 3, 14)
			TalkAppendButton( varMap, x300172_var_FileId, "精品轩尼诗理查", 3, 15)
			TalkAppendButton( varMap, x300172_var_FileId, "精品哈瓦那雪茄", 3, 16)	
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
	elseif idExt == 26 then
       StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y【美】大都美丽会" )
            TalkAppendString( varMap, "\t您要取回哪种状态？" )
			local remainTime = x300172_GetExp2( varMap, varPlayer)
			TalkAppendButton( varMap, x300172_var_FileId, format( "杰克丹尼#R（%s）", x300172_GetTimeString( remainTime) ), 3, 8)	
	        local remainTime = x300172_GetCredit4( varMap, varPlayer)
	        TalkAppendButton( varMap, x300172_var_FileId, format( "路易十三#R（%s）", x300172_GetTimeString( remainTime) ), 3, 10)
			local remainTime = x300172_GetXP4X10( varMap, varPlayer)
			TalkAppendButton( varMap, x300172_var_FileId, format( "精品杰克丹尼#R（%s）", x300172_GetTimeString( remainTime) ), 3, 22)
			local remainTime = x300172_GetCredit4X10( varMap, varPlayer)
			TalkAppendButton( varMap, x300172_var_FileId, format( "精品路易十三#R（%s）", x300172_GetTimeString( remainTime) ), 3, 23)
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
	elseif idExt == 27 then
       StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y【美】大都美丽会" )
            TalkAppendString( varMap, "\t您要取回哪种状态？" )
			local remainTime = x300172_GetExp4( varMap, varPlayer)
			TalkAppendButton( varMap, x300172_var_FileId, format( "芝华士#R（%s）", x300172_GetTimeString( remainTime) ), 3, 9) 
			local remainTime = x300172_GetCredit8( varMap, varPlayer)
			TalkAppendButton( varMap, x300172_var_FileId, format( "轩尼诗理查#R（%s）", x300172_GetTimeString( remainTime) ), 3, 11)
			local remainTime = x300172_GetMana8( varMap, varPlayer)
			TalkAppendButton( varMap, x300172_var_FileId, format( "哈瓦那雪茄#R（%s）", x300172_GetTimeString( remainTime) ), 3, 12)
			local remainTime = x300172_GetXP8X10( varMap, varPlayer)
			TalkAppendButton( varMap, x300172_var_FileId, format( "精品芝华士#R（%s）", x300172_GetTimeString( remainTime) ), 3, 17)
			local remainTime = x300172_GetCredit8X10( varMap, varPlayer)
			TalkAppendButton( varMap, x300172_var_FileId, format( "精品轩尼诗理查#R（%s）", x300172_GetTimeString( remainTime) ), 3, 18)
			local remainTime = x300172_GetMana8X10( varMap, varPlayer)
			TalkAppendButton( varMap, x300172_var_FileId, format( "精品哈瓦那雪茄#R（%s）", x300172_GetTimeString( remainTime) ), 3, 19)
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    elseif idExt == 3 then
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y【美】大都美丽会" )
            TalkAppendString( varMap, "\t假如您想离开美丽会，又担心自己的酒（雪茄）浪费掉，您可以通过我来储存，但是每种物品我只能帮您储存最多10个小时哦！" )
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    elseif idExt == 4 then
        x300172_ShowSaveInfo( varMap, varPlayer, varTalknpc, x300172_var_XPBuffId)
    elseif idExt == 5 then
        x300172_ShowSaveInfo( varMap, varPlayer, varTalknpc, x300172_var_DoubleXPBuffId)
    elseif idExt == 6 then
        x300172_ShowSaveInfo( varMap, varPlayer, varTalknpc, x300172_var_CreditBuffId)
    elseif idExt == 7 then
        x300172_ShowSaveInfo( varMap, varPlayer, varTalknpc, x300172_var_DoubleCreditBuffId)
    elseif idExt == 13 then
        x300172_ShowSaveInfo( varMap, varPlayer, varTalknpc, x300172_var_Mana8)
    elseif idExt == 14 then
        x300172_ShowSaveInfo( varMap, varPlayer, varTalknpc, x300172_var_10H8XP)
    elseif idExt == 15 then
        x300172_ShowSaveInfo( varMap, varPlayer, varTalknpc, x300172_var_10H8Credit)
    elseif idExt == 16 then
        x300172_ShowSaveInfo( varMap, varPlayer, varTalknpc, x300172_var_10H8Mana)
    elseif idExt == 20 then
        x300172_ShowSaveInfo( varMap, varPlayer, varTalknpc, x300172_var_10H4XP)
    elseif idExt == 21 then
        x300172_ShowSaveInfo( varMap, varPlayer, varTalknpc, x300172_var_10H4Credit)
    elseif idExt == 8 then
        x300172_ShowLoadInfo( varMap, varPlayer, varTalknpc, x300172_var_XPBuffId)
    elseif idExt == 9 then
        x300172_ShowLoadInfo( varMap, varPlayer, varTalknpc, x300172_var_DoubleXPBuffId)
    elseif idExt == 10 then
        x300172_ShowLoadInfo( varMap, varPlayer, varTalknpc, x300172_var_CreditBuffId)
    elseif idExt == 11 then
        x300172_ShowLoadInfo( varMap, varPlayer, varTalknpc, x300172_var_DoubleCreditBuffId)
    elseif idExt == 12 then
        x300172_ShowLoadInfo( varMap, varPlayer, varTalknpc, x300172_var_Mana8)
    elseif idExt == 17 then
        x300172_ShowLoadInfo( varMap, varPlayer, varTalknpc, x300172_var_10H8XP)
    elseif idExt == 18 then
        x300172_ShowLoadInfo( varMap, varPlayer, varTalknpc, x300172_var_10H8Credit)
    elseif idExt == 19 then
        x300172_ShowLoadInfo( varMap, varPlayer, varTalknpc, x300172_var_10H8Mana)
    elseif idExt == 22 then
        x300172_ShowLoadInfo( varMap, varPlayer, varTalknpc, x300172_var_10H4XP)
    elseif idExt == 23 then
        x300172_ShowLoadInfo( varMap, varPlayer, varTalknpc, x300172_var_10H4Credit)	
    end             
end

function x300172_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    return 1
end

function x300172_ProcAccept( varMap, varPlayer)
    local runtimeData = GetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE)
    if mod( runtimeData, 10) == 0 then
        x300172_SaveBuff( varMap, varPlayer, runtimeData / 10)
    else
        x300172_LoadBuff( varMap, varPlayer, floor( runtimeData / 10) )
    end
end


function x300172_GetTimeString( minute)
    local strResult = ""

    if minute >= 60 then
        local h = floor( minute / 60)
        local m = mod( minute, 60)
        if m == 0 then
            strResult = format( "%d小时", h)
        else
            strResult = format( "%d小时%d分", h, m)
        end
    else
        strResult = format( "%d分钟", minute)
    end

    return strResult
end


function x300172_SaveBuff( varMap, varPlayer, buffId)
    local saveItem = nil
    for varI, item in x300172_var_BuffTable do
        if item.buffId == buffId then
            saveItem = item
            break
        end
    end
    
    local amountTime = GetImpactContinuanceByDataIndex( varMap, varPlayer, buffId)
    if amountTime > 0 then
        
        local remainTime = ( amountTime - GetImpactContinuanceElapsed( varMap, varPlayer, buffId) ) / 60000
        
        local savedTime = saveItem.Get( varMap, varPlayer)
        local newTime = savedTime + remainTime
        if newTime > x300172_var_SaveMaxMinute then
            
            saveItem.Set( varMap, varPlayer, x300172_var_SaveMaxMinute)
            
            SetImpactContinuanceByDataIndex( varMap, varPlayer, buffId, ( newTime - x300172_var_SaveMaxMinute) * 60000)
            ResetImpactContinuanceElapsed( varMap, varPlayer, buffId)
            RefreshImpactByDataIndex( varMap, varPlayer,buffId)
            Msg2Player( varMap, varPlayer, "你已经存满10小时，不能再多存了", 8, 3)
        else
            
            saveItem.Set( varMap, varPlayer, newTime)
            
            CancelSpecificImpact( varMap, varPlayer, buffId)
        end
    else
        Msg2Player( varMap, varPlayer, format( "你身上已经没有%s了", saveItem.varName), 8, 3)
    end
end


function x300172_LoadBuff( varMap, varPlayer, buffId)
    local loadItem = nil
    for varI, item in x300172_var_BuffTable do
        if item.buffId == buffId then
            loadItem = item
            break
        end
    end

    
    for varI, item in x300172_var_MutexTable do
        if buffId == item.buffId then
            for j, iter in item.check do
                if IsHaveSpecificImpact( varMap, varPlayer, iter.buffId) == 1 then
                    Msg2Player( varMap, varPlayer, format( "你身上已有#G%s#cffcc00不能取出#G%s", iter.varName, loadItem.varName), 8, 3)
                    return
                end
            end
        end
    end

    local savedTime = loadItem.Get( varMap, varPlayer)
    if savedTime == 0 then
        Msg2Player( varMap, varPlayer, format( "你没有%s", loadItem.varName), 8, 3)
        return
    end
    
    local amountTime = GetImpactContinuanceByDataIndex( varMap, varPlayer, buffId)
    
    local remainTime = ( amountTime - GetImpactContinuanceElapsed( varMap, varPlayer, buffId) ) / 60000
    local newTime = remainTime + savedTime
    if newTime > x300172_var_SaveMaxMinute then
        if remainTime == 0 then
            SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, buffId, 0)
        end
        
        SetImpactContinuanceByDataIndex( varMap, varPlayer, buffId, x300172_var_SaveMaxMinute * 60000)
        ResetImpactContinuanceElapsed( varMap, varPlayer, buffId)
        RefreshImpactByDataIndex( varMap, varPlayer, buffId)
        
        loadItem.Set( varMap, varPlayer, newTime - x300172_var_SaveMaxMinute)
        Msg2Player( varMap, varPlayer, format( "你身上的%s已达最大值，还剩余存储#G%s", loadItem.varName, x300172_GetTimeString( newTime - x300172_var_SaveMaxMinute) ), 8, 3)
    else
        if remainTime == 0 then
            SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, buffId, 0)
        end
        
        SetImpactContinuanceByDataIndex( varMap, varPlayer, buffId, newTime * 60000)
        ResetImpactContinuanceElapsed( varMap, varPlayer, buffId)
        RefreshImpactByDataIndex( varMap, varPlayer, buffId)
        
        loadItem.Set( varMap, varPlayer, 0)
        Msg2Player( varMap, varPlayer, format( "你取回了所有的%s", loadItem.varName), 8, 2)
    end
end


function x300172_ShowSaveInfo( varMap, varPlayer, varTalknpc, buffId)
    StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y【美】大都美丽会" )
        if buffId == x300172_var_XPBuffId then
            TalkAppendString( varMap, "你是否要储存杰克丹尼？" )
        elseif buffId == x300172_var_DoubleXPBuffId then
            TalkAppendString( varMap, "你是否要储存芝华士？" )
        elseif buffId == x300172_var_CreditBuffId then
            TalkAppendString( varMap, "你是否要储存路易十三？" )
        elseif buffId == x300172_var_DoubleCreditBuffId then
            TalkAppendString( varMap, "你是否要储存轩尼诗理查？" )
        elseif buffId == x300172_var_Mana8 then
            TalkAppendString( varMap, "你是否要储存哈瓦那雪茄？" )
        elseif buffId == x300172_var_10H8XP then
            TalkAppendString( varMap, "你是否要储存精品芝华士？" )
        elseif buffId == x300172_var_10H4XP then
            TalkAppendString( varMap, "你是否要储存精品杰克丹尼？" )
        elseif buffId == x300172_var_10H8Credit then
            TalkAppendString( varMap, "你是否要储存精品轩尼诗理查？" )
        elseif buffId == x300172_var_10H4Credit then
            TalkAppendString( varMap, "你是否要储存精品路易十三？" )
        elseif buffId == x300172_var_10H8Mana then
            TalkAppendString( varMap, "你是否要储存精品哈瓦那雪茄？" )
        end
    StopTalkTask()
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, buffId * 10)
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300172_var_FileId, -1)
end


function x300172_ShowLoadInfo( varMap, varPlayer, varTalknpc, buffId)
    StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y【美】大都美丽会" )
        if buffId == x300172_var_XPBuffId then
            TalkAppendString( varMap, "你是否要取回杰克丹尼？" )
        elseif buffId == x300172_var_DoubleXPBuffId then
            TalkAppendString( varMap, "你是否要取回芝华士？" )
        elseif buffId == x300172_var_CreditBuffId then
            TalkAppendString( varMap, "你是否要取回路易十三？" )
        elseif buffId == x300172_var_DoubleCreditBuffId then
            TalkAppendString( varMap, "你是否要取回轩尼诗理查？" )
        elseif buffId == x300172_var_Mana8 then
            TalkAppendString( varMap, "你是否要取回哈瓦那雪茄？" )
        elseif buffId == x300172_var_10H8XP then
            TalkAppendString( varMap, "你是否要取回精品芝华士？" )
        elseif buffId == x300172_var_10H4XP then
            TalkAppendString( varMap, "你是否要取回精品杰克丹尼？" )
        elseif buffId == x300172_var_10H8Credit then
            TalkAppendString( varMap, "你是否要取回精品轩尼诗理查？" )
        elseif buffId == x300172_var_10H4Credit then
            TalkAppendString( varMap, "你是否要取回精品路易十三？" )
        elseif buffId == x300172_var_10H8Mana then
            TalkAppendString( varMap, "你是否要取回精品哈瓦那雪茄？" )
        end
    StopTalkTask()
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, buffId * 10 + 1)
	DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300172_var_FileId, -1)
end


