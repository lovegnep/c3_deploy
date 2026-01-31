x320035_var_FileId = 320035
x320035_var_ScriptName = "金色黑戾符文残片合成"	

x320035_var_ScripText = "\t金色黑戾符文一共有三部分组成，集齐这三部分我能帮你合成成完整的。\n \n\t#Y@myname#W，你集齐三种残片了么？\n \n#G(在地下粮仓挂机，会有几率获得金色黑戾符文残片。)"

x320035_var_Item = {12030641, 12030642, 12030643}

function x320035_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap, x320035_var_FileId, x320035_var_ScriptName, 3)
end

function x320035_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
	local varExp = GetLevel( varMap, varPlayer)*7000
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x320035_var_ScriptName)
    TalkAppendString(varMap, x320035_var_ScripText)
    
    DeliverTalkInfo(varMap, varPlayer, varTalknpc, x320035_var_FileId, -1)
end


function x320035_CheckItem( varMap, varPlayer)

	for varI, item in x320035_var_Item do
		if HaveItemInBag( varMap, varPlayer, item ) <= 0 then
			return 0
		end
	end
	return 1
end

function x320035_ProcAcceptCheck( varMap, varPlayer, varTalknpc)

		if GetBagSpace(varMap, varPlayer) < 1 then
			local strText = "背包空间不足,兑换失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
		end

    if x320035_CheckItem( varMap, varPlayer) == 1 then
			for varI, item in x320035_var_Item do
				if DelItem( varMap, varPlayer, item, 1 ) ~= 1 then return 0 end
			end
			
			local varItem = 12030644 --金色黑戾符文
			StartItemTask( varMap )
			ItemAppend( varMap, varItem, 1 )
			StopItemTask( varMap, varPlayer )
			DeliverItemListSendToPlayer(varMap,varPlayer)
			local message = format("获得了物品：#R#{_ITEM%d}", varItem )
			Msg2Player( varMap, varPlayer, message, 8, 2)
			Msg2Player( varMap, varPlayer, message, 8, 3)
    else
        Msg2Player( varMap, varPlayer, "您身上没有全套的金色黑戾符文残片，合成失败", 8, 2)
        Msg2Player( varMap, varPlayer, "您身上没有全套的金色黑戾符文残片，合成失败", 8, 3)
		end
end
