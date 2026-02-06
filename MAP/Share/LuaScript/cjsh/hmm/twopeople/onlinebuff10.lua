
x930211_var_FileId	= 930211
x930211_var_add = 1



function x930211_FixedBuf(varMap,varPlayer,bufId)


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



function x930211_ProcIntervalOverEvent( varMap, varPlayer )
    local day, week = GetWeek()
    x930211_AddBonus(varMap, varPlayer)



end


function x930211_ProcActiveEvent( varMap, varPlayer )

end


function x930211_ProcFadeOutEvent( varMap, varPlayer )

end

function x930211_ProcEventEntry()
end




function x930211_CheckPlayerInArea(varMap, varPlayer)
    --if varMap ==94 then
    --    return 1;
    --end

    return 1;
end





function x930211_AddBonus(varMap, varPlayer)

    LuaCallNoclosure( 930127, "CheckAndAddjy", varMap, varPlayer)
end


function x930211_ProcessQuestFail(varMap, varPlayer, varQuest)
end




function x930211_GetDayCount(varMap, varPlayer)

end

