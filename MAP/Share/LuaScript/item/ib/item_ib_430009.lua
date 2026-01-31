
x430009_var_ItemTable         = {
                                { varName = "神传龙吟戒指（武士）", varItem = 10284003 }, 
                                { varName = "神传碎玉戒指（剑侠）", varItem = 10284013 }, 
                                { varName = "神传逐日戒指（骑射）", varItem = 10284023 }, 
                                { varName = "神传虎跃戒指（火枪）", varItem = 10284033 }, 
                                { varName = "神传白虎戒指（先知）", varItem = 10284043 }, 
                                { varName = "神传师君戒指（萨满）", varItem = 10284053 }, 
                                { varName = "神传龙吟手镯（武士）", varItem = 10294003 }, 
                                { varName = "神传碎玉手镯（剑侠）", varItem = 10294013 }, 
                                { varName = "神传逐日手镯（骑射）", varItem = 10294023 }, 
                                { varName = "神传虎跃手镯（火枪）", varItem = 10294033 }, 
                                { varName = "神传白虎手镯（先知）", varItem = 10294043 }, 
                                { varName = "神传师君手镯（萨满）", varItem = 10294053 }, 
}

x430009_var_QuestId         = 9339
x430009_var_FileId          = 430009

x430009_var_VIPItem           = 12030385

function x430009_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
	StartTalkTask( varMap)
		TalkAppendString( varMap, "\t这只神秘的盒子中珍藏着各种神传首饰，您只能选择其中的一只。\n\t请珍惜这次机会，因为选择了这只首饰，这个首饰盒将立刻消失。" )
        for varI, item in x430009_var_ItemTable do
            TalkAppendButton( varMap, x430009_var_QuestId, item.varName, 3, varI)
        end
	StopTalkTask()                                                
    DeliverTalkMenu( varMap, varPlayer, varPlayer)
end

function x430009_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)
    StartTalkTask( varMap)
        TalkAppendString( varMap, format( "\t您确认要选择#y%s#w吗？\n\t您确认后将永久的获得，请谨慎挑选！", x430009_var_ItemTable[ extid].varName) )
        AddQuestRadioItemBonus( varMap, x430009_var_ItemTable[ extid].varItem, 1)
        SetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX, extid)
    StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varPlayer, x430009_var_FileId, x430009_var_QuestId)
end

function x430009_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)
    
    local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_VIP_BOX)
    StartItemTask( varMap)
    ItemAppend( varMap, x430009_var_ItemTable[ varIndex].varItem, 1)
    if StopItemTask( varMap, varPlayer) <= 0 then
        Msg2Player( varMap, varPlayer, "无法得到物品，请整理背包", 8, 3)
        return
    end
    
    if DelItem( varMap, varPlayer, x430009_var_VIPItem, 1) == 0 then
        Msg2Player( varMap, varPlayer, "神传首饰盒删除失败。", 8, 2)
        Msg2Player( varMap, varPlayer, "神传首饰盒删除失败。", 8, 3)
        return 0
    end
    
    DeliverItemListSendToPlayer( varMap, varPlayer)
end

