
x930210_var_FileId	= 930210
x930210_var_add = 1



function x930210_FixedBuf(varMap,varPlayer,bufId)


    local nImpactCount = GetImpactListCount(varMap,varPlayer)
    if nImpactCount <=0 then
        return
    end


    local nCollectCount = 0
    for varI=0,nImpactCount-1 do

        if GetImpactDataIndex(varMap,varPlayer,varI) == bufId then
            nCollectCount = nCollectCount + 1
        end
    end


    if nCollectCount > 1 then

        nCollectCount = nCollectCount -1

        for varI = 1,nCollectCount do
            CancelSpecificImpact(varMap,varPlayer,bufId)
        end

        WriteLog(1,format("BUFERROR:varMap=%d,GUID=%X,varLevel=%d,BufTotalCount=%d,BufCount=%d,BufId=%d",GetPlayerGUID(varMap,varPlayer),varMap,GetLevel(varMap,varPlayer),nImpactCount,nCollectCount,bufId))
    end
end



function x930210_ProcIntervalOverEvent( varMap, varPlayer )
    local day, week = GetWeek()
    x930210_AddBonus(varMap, varPlayer)



end


function x930210_ProcActiveEvent( varMap, varPlayer )

end


function x930210_ProcFadeOutEvent( varMap, varPlayer )

end

function x930210_ProcEventEntry()
end




function x930210_CheckPlayerInArea(varMap, varPlayer)
    --if varMap ==94 then
    --    return 1;
    --end

    return 1;
end





function x930210_AddBonus(varMap, varPlayer)

    local jf = GetPlayerGameData(varMap,varPlayer,MD_SHANXIN_TIME2[1],MD_SHANXIN_TIME2[2],MD_SHANXIN_TIME2[3])
    if jf == nil or jf <= 0 then
        jf = 0
    end

    SetPlayerGameData(varMap,varPlayer,MD_SHANXIN_TIME2[1],MD_SHANXIN_TIME2[2],MD_SHANXIN_TIME2[3], jf+x930210_var_add)

    Msg2Player(varMap,varPlayer,format("游戏在线获得肝帝活跃点数%d", x930210_var_add),8,2)

end


function x930210_ProcessQuestFail(varMap, varPlayer, varQuest)
end




function x930210_GetDayCount(varMap, varPlayer)

end

