x570056_var_FileId = 570056


x570056_var_SaveMaxMinute     = 600


x570056_var_BuffId          = 9015

function x570056_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
	

	local nTime = GetPlayerGameData( varMap, varPlayer, MD_TIANFU_DONGSHUANG[1], MD_TIANFU_DONGSHUANG[2], MD_TIANFU_DONGSHUANG[3])
	
    TalkAppendButton( varMap, x570056_var_FileId, "冻结天赋丹时间", 3, 1)

	if nTime > 0 then
		TalkAppendButton( varMap, x570056_var_FileId, "解冻天赋丹时间#G("..x570056_GetTimeString(nTime)..")", 3, 2)
	else
		TalkAppendButton( varMap, x570056_var_FileId, "解冻天赋丹时间", 3, 2)
	end

end

function x570056_ProcEventEntry( varMap, varPlayer, varTalknpc, idScript, idExt)
    if idExt == 1 then
        x570056_ShowSaveInfo( varMap, varPlayer, varTalknpc)
    elseif idExt == 2 then
        x570056_ShowLoadInfo( varMap, varPlayer, varTalknpc)
    elseif idExt == 3 then
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y冻结天赋丹时间" )
            TalkAppendString( varMap, "\t你要冻结天赋丹时间吗？冻结可以使你的天赋丹不再随时间流逝。\n\t如果你希望重新获得这些冻结的天赋丹时间，可以使用#G解冻模块#W。\n\t注意，天赋丹时间最多可以冻结#R10小时#W！" )
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    end             
end

function x570056_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    return 1
end

function x570056_ProcAccept( varMap, varPlayer)
    local runtimeData = GetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE)
    if runtimeData == 1 then
        x570056_SaveBuff( varMap, varPlayer )
    elseif runtimeData == 2 then
        x570056_LoadBuff( varMap, varPlayer )
    end
end


function x570056_GetTimeString( minute)
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


function x570056_SaveBuff( varMap, varPlayer)
    
    local amountTime = GetImpactContinuanceByDataIndex(varMap, varPlayer, x570056_var_BuffId)
    if amountTime > 0 then
        
        local remainTime = ( amountTime - GetImpactContinuanceElapsed( varMap, varPlayer, x570056_var_BuffId) ) / 60000
        
        local savedTime = GetPlayerGameData( varMap, varPlayer, MD_TIANFU_DONGSHUANG[1], MD_TIANFU_DONGSHUANG[2], MD_TIANFU_DONGSHUANG[3] )
        local newTime = savedTime + remainTime
        if newTime > x570056_var_SaveMaxMinute then
            
            SetPlayerGameData( varMap, varPlayer, MD_TIANFU_DONGSHUANG[1], MD_TIANFU_DONGSHUANG[2], MD_TIANFU_DONGSHUANG[3], x570056_var_SaveMaxMinute)
            
           
            
            SetImpactContinuanceByDataIndex( varMap, varPlayer, x570056_var_BuffId, ( newTime - x570056_var_SaveMaxMinute) * 60000)
            ResetImpactContinuanceElapsed( varMap, varPlayer, x570056_var_BuffId)
            RefreshImpactByDataIndex( varMap, varPlayer,x570056_var_BuffId)
            Msg2Player( varMap, varPlayer, "你已经存满10小时，不能再多存了", 8, 3)
        else
            
            SetPlayerGameData( varMap, varPlayer, MD_TIANFU_DONGSHUANG[1], MD_TIANFU_DONGSHUANG[2], MD_TIANFU_DONGSHUANG[3], newTime)
            
            
            CancelSpecificImpact( varMap, varPlayer, x570056_var_BuffId)
        end
    else
        Msg2Player( varMap, varPlayer, "你身上已经没有可冻结的天赋丹时间了", 8, 3)
    end
end


function x570056_LoadBuff( varMap, varPlayer)

    local savedTime = GetPlayerGameData( varMap, varPlayer, MD_TIANFU_DONGSHUANG[1], MD_TIANFU_DONGSHUANG[2], MD_TIANFU_DONGSHUANG[3] )
    if savedTime == 0 then
        Msg2Player( varMap, varPlayer, "你没有可以解冻的天赋丹时间", 8, 3)
        return
    end
    
    
    local amountTime = GetImpactContinuanceByDataIndex( varMap, varPlayer, x570056_var_BuffId)
    
    local remainTime = ( amountTime - GetImpactContinuanceElapsed( varMap, varPlayer, x570056_var_BuffId) ) / 60000
    local newTime = remainTime + savedTime
    	if 2147483647 < newTime * 60000 then
					newTime = 2147483647/60000
			end		 
    if newTime > x570056_var_SaveMaxMinute then
    
        if remainTime == 0 then
            SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, x570056_var_BuffId, 0)
        end
        
        SetImpactContinuanceByDataIndex( varMap, varPlayer, x570056_var_BuffId, newTime * 60000)
        ResetImpactContinuanceElapsed( varMap, varPlayer, x570056_var_BuffId)
        RefreshImpactByDataIndex( varMap, varPlayer, x570056_var_BuffId)
        
        SetPlayerGameData( varMap, varPlayer, MD_TIANFU_DONGSHUANG[1], MD_TIANFU_DONGSHUANG[2], MD_TIANFU_DONGSHUANG[3], 0)
        
        Msg2Player( varMap, varPlayer, format( "顺利领取", x570056_GetTimeString( x570056_var_SaveMaxMinute) ), 8, 3)
    else
        if remainTime == 0 then
            SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, x570056_var_BuffId, 0)
        end
        
        SetImpactContinuanceByDataIndex( varMap, varPlayer, x570056_var_BuffId, newTime * 60000)
        ResetImpactContinuanceElapsed( varMap, varPlayer, x570056_var_BuffId)
        RefreshImpactByDataIndex( varMap, varPlayer, x570056_var_BuffId)
        
        
        SetPlayerGameData( varMap, varPlayer, MD_TIANFU_DONGSHUANG[1], MD_TIANFU_DONGSHUANG[2], MD_TIANFU_DONGSHUANG[3], 0)
        Msg2Player( varMap, varPlayer, "你解冻了所有冻结的天赋丹时间", 8, 2)
    end
end


function x570056_ShowSaveInfo( varMap, varPlayer, varTalknpc)
    StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y冻结天赋丹时间" )
        TalkAppendString( varMap, "\t你要冻结天赋丹时间吗？冻结可以使你的天赋丹不再随时间流逝。\n\t如果你希望重新获得这些冻结的天赋丹时间，可以使用#G解冻模块#W。\n\t注意，天赋丹时间最多可以冻结#R10小时#W！" )
    StopTalkTask()
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, 1)
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x570056_var_FileId, -1)
end


function x570056_ShowLoadInfo( varMap, varPlayer, varTalknpc)
    
	local nTime = GetPlayerGameData( varMap, varPlayer, MD_TIANFU_DONGSHUANG[1], MD_TIANFU_DONGSHUANG[2], MD_TIANFU_DONGSHUANG[3])
	StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y解冻天赋丹时间" )
        TalkAppendString( varMap, "\t你是否要解冻天赋丹时间？你现在冻结的天赋丹时间为：#G("..x570056_GetTimeString(nTime)..")")
    StopTalkTask()


    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, 2)
	DeliverTalkInfo( varMap, varPlayer, varTalknpc, x570056_var_FileId, -1)
end


