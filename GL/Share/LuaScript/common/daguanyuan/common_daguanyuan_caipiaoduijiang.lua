
x310360_var_FileId              = 310360

x310360_var_Item                  = 12035040

function x310360_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    TalkAppendButton( varMap, x310360_var_FileId, "领取乐透奖励", 3, 1)
end

function x310360_ProcEventEntry( varMap, varPlayer, varTalknpc, idScript, idExt)
    local wday, week = GetWeek()
    if wday ~= 0 and wday ~= 6 then
        Msg2Player( varMap, varPlayer, "周六、周日22:50分前才能领奖", 8, 3)
        return
    end
		local curTime = GetMinOfDay()		
		if curTime < 540 or curTime>= 1370 then
			Msg2Player( varMap, varPlayer, "非正常时间无法领奖", 8, 3)
        return
    end

    if idExt == 1 then
        
        local varBagIdx = FindFirstBagIndexOfItem( varMap, varPlayer, x310360_var_Item)
        if varBagIdx < 0 then
            Msg2Player( varMap, varPlayer, format( "没有@item_%d#cffcc00不能领奖", x310360_var_Item), 8, 3)
            return
        end

        local day = GetItemParam( varMap, varPlayer, varBagIdx, 4, 2)
        if day ~= GetDayOfYear() then
            Msg2Player( varMap, varPlayer, "很遗憾，这张幸运卷的领奖日期已过", 8, 3)
            return
        end
        local a = GetItemParam( varMap, varPlayer, varBagIdx, 8, 1)
        local b = GetItemParam( varMap, varPlayer, varBagIdx, 10, 1)
        local r = a * 80 + b
        if r == GetCountryParam( varMap, 1, CD_DAGUANYUAN_CAIPIAO1) or
                r == GetCountryParam( varMap, 2, CD_DAGUANYUAN_CAIPIAO1) or
                r == GetCountryParam( varMap, 3, CD_DAGUANYUAN_CAIPIAO1) or
                r == GetCountryParam( varMap, 0, CD_DAGUANYUAN_CAIPIAO2) or
                r == GetCountryParam( varMap, 1, CD_DAGUANYUAN_CAIPIAO2) or
                r == GetCountryParam( varMap, 2, CD_DAGUANYUAN_CAIPIAO2) or
                r == GetCountryParam( varMap, 3, CD_DAGUANYUAN_CAIPIAO2) then
            StartTalkTask( varMap)
                TalkAppendString( varMap, "#Y乐透彩票" )
                TalkAppendString( varMap, "#Y恭喜您获得本日乐透彩票大奖#W，是否领取奖励？" )
                AddQuestMoneyBonus1( varMap, GetCountryParam( varMap, 0, CD_DAGUANYUAN_CAIPIAO1) * 1000)
            StopTalkTask()
            DeliverTalkInfo( varMap, varPlayer, varTalknpc, x310360_var_FileId, -1)
        else
            Msg2Player( varMap, varPlayer, "很遗憾，你的幸运卷号码没有中奖", 8, 3)
            return
        end
    end
end

function x310360_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    local varBagIdx = FindFirstBagIndexOfItem( varMap, varPlayer, x310360_var_Item)
    if varBagIdx < 0 then
        Msg2Player( varMap, varPlayer, format( "没有@item_%d#cffcc00不能领奖", x310360_var_Item), 8, 3)
        return 0
    end

    local day = GetItemParam( varMap, varPlayer, varBagIdx, 4, 2)
    if day ~= GetDayOfYear() then
        Msg2Player( varMap, varPlayer, "很遗憾，这张幸运卷的领奖日期已过", 8, 3)
        return 0
    end

    if DelItem( varMap, varPlayer, x310360_var_Item, 1) ~= 1 then return 0 end
    GamePlayScriptLog(varMap, varPlayer, 1652)
    
    local reward = GetCountryParam( varMap, 0, CD_DAGUANYUAN_CAIPIAO1) * 1000
    AddMoney( varMap, varPlayer, 1, reward)
    Msg2Player( varMap, varPlayer, format( "恭喜您获得本日乐透彩票大奖，获得奖金#R#{_MONEY%d}#cffcc00银卡。", reward), 8, 2)
    Msg2Player( varMap, varPlayer, format( "恭喜您获得本日乐透彩票大奖，获得奖金#R#{_MONEY%d}#cffcc00银卡", reward), 8, 3)

    return 1
end

function x310360_ProcAccept( varMap, varPlayer, varTalknpc)
end
