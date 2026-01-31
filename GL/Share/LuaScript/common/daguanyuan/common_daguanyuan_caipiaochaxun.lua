
x310361_var_FileId                  = 310361

x310361_var_QuestName               = "乐透大奖"

function x310361_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    TalkAppendButton( varMap, x310361_var_FileId, "乐透大奖查询", 3, 1)
end

function x310361_ProcEventEntry( varMap, varPlayer, varTalknpc, idScript, idExt)
    local day, week = GetWeek()
    if idExt == 1 then
        if day ~= 0 and day ~= 6 then
            Msg2Player( varMap, varPlayer, "周六、日才能查询", 8, 3)
            return
        end
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x310361_var_QuestName)

            local value = GetCountryParam( varMap, 1, CD_DAGUANYUAN_CAIPIAO1)
            if value ~= -1 then
                local a, b = x310361_GetLuckyNumber( value)
                TalkAppendString( varMap, format( "\t#G10：30#W开出的幸运号码是：#R%d #B%d#W。", a, b) )
            else
                TalkAppendString( varMap, format( "\t#G10：30#W的幸运号码尚未开出。" ) )
            end

            local value = GetCountryParam( varMap, 2, CD_DAGUANYUAN_CAIPIAO1)
            if value ~= -1 then
                local a, b = x310361_GetLuckyNumber( value)
                TalkAppendString( varMap, format( "\t#G12：30#W开出的幸运号码是：#R%d #B%d#W。", a, b) )
            else
                TalkAppendString( varMap, format( "\t#G12：30#W的幸运号码尚未开出。" ) )
            end

            local value = GetCountryParam( varMap, 3, CD_DAGUANYUAN_CAIPIAO1)
            if value ~= -1 then
                local a, b = x310361_GetLuckyNumber( value)
                TalkAppendString( varMap, format( "\t#G14：30#W开出的幸运号码是：#R%d #B%d#W。", a, b) )
            else
                TalkAppendString( varMap, format( "\t#G14：30#W的幸运号码尚未开出。" ) )
            end

            local value = GetCountryParam( varMap, 0, CD_DAGUANYUAN_CAIPIAO2)
            if value ~= -1 then
                local a, b = x310361_GetLuckyNumber( value)
                TalkAppendString( varMap, format( "\t#G16：30#W开出的幸运号码是：#R%d #B%d#W。", a, b) )
            else
                TalkAppendString( varMap, format( "\t#G16：30#W的幸运号码尚未开出。" ) )
            end

            local value = GetCountryParam( varMap, 1, CD_DAGUANYUAN_CAIPIAO2)
            if value ~= -1 then
                local a, b = x310361_GetLuckyNumber( value)
                TalkAppendString( varMap, format( "\t#G18：30#W开出的幸运号码是：#R%d #B%d#W。", a, b) )
            else
                TalkAppendString( varMap, format( "\t#G18：30#W的幸运号码尚未开出。" ) )
            end

            local value = GetCountryParam( varMap, 2, CD_DAGUANYUAN_CAIPIAO2)
            if value ~= -1 then
                local a, b = x310361_GetLuckyNumber( value)
                TalkAppendString( varMap, format( "\t#G20：30#W开出的幸运号码是：#R%d #B%d#W。", a, b) )
            else
                TalkAppendString( varMap, format( "\t#G20：30#W的幸运号码尚未开出。" ) )
            end

            local value = GetCountryParam( varMap, 3, CD_DAGUANYUAN_CAIPIAO2)
            if value ~= -1 then
                local a, b = x310361_GetLuckyNumber( value)
                TalkAppendString( varMap, format( "\t#G22：30#W开出的幸运号码是：#R%d #B%d#W。", a, b) )
            else
                TalkAppendString( varMap, format( "\t#G22：30#W的幸运号码尚未开出。" ) )
            end
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    end
end

function x310361_GetLuckyNumber( value)
    local first = floor( value / 80)
    local second = mod( value, 80)
    return first, second
end

