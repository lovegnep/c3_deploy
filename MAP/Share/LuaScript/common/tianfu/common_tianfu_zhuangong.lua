
x300985_var_FileId  = 300985

x300985_var_OpenID    = 1058




function x300985_ProcEventEntry( varMap, varPlayer, varTalknpc)	
    if GetInherenceLevel( varMap, varPlayer) < 50 then
        Msg2Player( varMap, varPlayer, "您的天赋等级小于50级，不能进行此操作", 8, 3)
        return
    end

    if GetGameOpenById( x300985_var_OpenID) <= 0 then
        return 0
    end

    StartGCDTask( varMap)
        GCDAppendInt( varMap, varTalknpc)
        DeliverGCDInfo( varMap, varPlayer, 108)
    StopGCDTask( varMap)
end




function x300985_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    if GetGameOpenById( x300985_var_OpenID) <= 0 then
        return 0
    end

    TalkAppendButton( varMap, x300985_var_FileId, "专精天赋专攻训练", 3, 1)
end





function x300985_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
end




function x300985_ProcAccept( varMap, varPlayer)
end

