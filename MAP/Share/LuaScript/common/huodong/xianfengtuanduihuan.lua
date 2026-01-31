x302512_var_FileId 		= 302512
x302512_var_Name          = "【活动】粉丝先锋团兑换#r"

x302512_var_ItemTable     = {
                            { varId = 11000300, sid = 11010020, varCount = 180, varName = "灵魂印" }, 
                            { varId = 12030031, sid = 11010020, varCount = 20,  varName = "神行符" }, 
                            { varId = 11000501, sid = 11010020, varCount = 8,  varName = "紫檀木炭" }, 
                            { varId = 12030258, sid = 11010020, varCount = 12,  varName = "全福月饼" }, 
                            { varId = 12030016, sid = 11010020, varCount = 8,  varName = "队伍召集令" }, 
                            { varId = 12030241, sid = 11010020, varCount = 180,  varName = "清一色(30天)礼包" }, 
                            { varId = 12030240, sid = 11010020, varCount = 80,  varName = "节日时装(14天)礼包" }, 

}

function x302512_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    TalkAppendButton( varMap, x302512_var_FileId, "【活动】粉丝先锋团兑换", 3, 99)
end

function x302512_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExtIdx)
    if varExtIdx == 99 then
		StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x302512_var_Name)
			TalkAppendButton( varMap, x302512_var_FileId, "先锋徽章兑换", 3, 100)
			TalkAppendButton( varMap, x302512_var_FileId, "黄金先锋徽章兑换", 3, 101)
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    elseif varExtIdx == 100 then
		StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y"..x302512_var_Name)
        for varI, iter in x302512_var_ItemTable do
            TalkAppendButton( varMap, x302512_var_FileId, format( "兑换%s", iter.varName), 3, varI)
        end
        TalkAppendButton( varMap, x302512_var_FileId, "兑换经验", 3, getn( x302512_var_ItemTable) + 1)
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    elseif varExtIdx == 101 then
		StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x302512_var_Name)
            local varCount = GetItemCountInBag( varMap, varPlayer, 11010021)
            TalkAppendString( varMap, format( "\t你一共有%d个黄金先锋徽章，可兑换#{_MONEY%d}金卡，你确认要兑换么？", varCount, varCount * 2000) )
        StopTalkTask()
        DeliverTalkInfo( varMap, varPlayer, varTalknpc, x302512_var_FileId, -1)
		SetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_KILL_LEADER, varExtIdx)
    else
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x302512_var_Name)
        if varExtIdx <= getn( x302512_var_ItemTable) then
            TalkAppendString( varMap, format( "\t兑换#G%s#W需要#G%s#W个先锋徽章，你确认要兑换么？", x302512_var_ItemTable[ varExtIdx].varName, x302512_var_ItemTable[ varExtIdx].varCount) )
        elseif varExtIdx == getn( x302512_var_ItemTable) + 1 then
            local varCount = GetItemCountInBag( varMap, varPlayer, 11010020)
            TalkAppendString( varMap, format( "\t你一共有%d个先锋徽章，可兑换%d经验，你确认要兑换么？", varCount, varCount * 180000) )
        end
        StopTalkTask()
        DeliverTalkInfo( varMap, varPlayer, varTalknpc, x302512_var_FileId, -1)
        SetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_KILL_LEADER, varExtIdx)
    end
end

function x302512_ProcAcceptCheck( varMap, varPlayer, varTalknpc)

    local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_KILL_LEADER)
    
	if varIndex == 101 then
		local varCount = GetItemCountInBag( varMap, varPlayer, 11010021)
		if varCount > 0 then
			AddMoney( varMap, varPlayer, 3, varCount * 2000 )
			
			if DelItem( varMap, varPlayer, 11010021, varCount) ~= 1 then return 0 end
		end
		return
	end
	
    if varIndex <= getn( x302512_var_ItemTable) then
		
		local varCount = GetItemCountInBag( varMap, varPlayer, x302512_var_ItemTable[ varIndex].sid)
		if varCount < x302512_var_ItemTable[ varIndex].varCount then
			Msg2Player( varMap, varPlayer,  "#Y你的#G先锋徽章#Y数量不足，无法兑换", 8, 3)
			Msg2Player( varMap, varPlayer,  "#Y你的#G先锋徽章#Y数量不足，无法兑换", 8, 2)
			return 0
		end

		StartItemTask( varMap)
		ItemAppendBind( varMap, x302512_var_ItemTable[ varIndex].varId, 1)
		local b = StopItemTask( varMap, varPlayer)
		if b == 0 then
			Msg2Player( varMap, varPlayer, "背包空间不足，无法兑换", 8, 3)
			return 0
		end
		
		DeliverItemListSendToPlayer( varMap, varPlayer)
		
		if DelItem( varMap, varPlayer, x302512_var_ItemTable[ varIndex].sid, x302512_var_ItemTable[ varIndex].varCount) ~= 1 then return 0 end
    elseif varIndex == getn( x302512_var_ItemTable) + 1 then
        local varCount = GetItemCountInBag( varMap, varPlayer, 11010020)
        if varCount > 0 then
			AddExp( varMap, varPlayer, varCount * 180000)
			
			if DelItem( varMap, varPlayer, 11010020, varCount) ~= 1 then return 0 end
		end
    end
end


