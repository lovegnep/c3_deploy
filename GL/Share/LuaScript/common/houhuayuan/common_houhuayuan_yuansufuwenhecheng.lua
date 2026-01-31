x320036_var_FileId = 320036
x320036_var_ScriptName = "元素符文残片合成"	

x320036_var_ScripText = "\t元素符文一共有三部分组成，集齐这三部分我能帮你合成成完整的。\n \n\t#Y@myname#W，你集齐三种残片了么？\n \n#G(在仙人谷挂机，会有几率获得元素符文残片。)"

x320036_var_Item = {12030645, 12030646, 12030647}

function x320036_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap, x320036_var_FileId, x320036_var_ScriptName, 3)
end

function x320036_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
	local varExp = GetLevel( varMap, varPlayer)*7000
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x320036_var_ScriptName)
    TalkAppendString(varMap, x320036_var_ScripText)
    
    DeliverTalkInfo(varMap, varPlayer, varTalknpc, x320036_var_FileId, -1)
end


function x320036_CheckItem( varMap, varPlayer)

	for varI, item in x320036_var_Item do
		if HaveItemInBag( varMap, varPlayer, item ) <= 0 then
			return 0
		end
	end
	return 1
end

function x320036_ProcAcceptCheck( varMap, varPlayer, varTalknpc)

		if GetBagSpace(varMap, varPlayer) < 1 then
			local strText = "背包空间不足,兑换失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
		end

    if x320036_CheckItem( varMap, varPlayer) == 1 then
			for varI, item in x320036_var_Item do
				if DelItem( varMap, varPlayer, item, 1 ) ~= 1 then return 0 end
			end
			
			local varRand = random (1,100)
			if varRand <= 90 then
				local varItem = 12030648 --元素符文
				StartItemTask( varMap )
				ItemAppend( varMap, varItem, 1 )
				StopItemTask( varMap, varPlayer )
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("获得了物品：#R#{_ITEM%d}", varItem )
				Msg2Player( varMap, varPlayer, message, 8, 2)
				Msg2Player( varMap, varPlayer, message, 8, 3)
			else
				local varItem = 12030652 --金色元素符文
				StartItemTask( varMap )
				ItemAppend( varMap, varItem, 1 )
				StopItemTask( varMap, varPlayer )
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = format("恭喜获得了物品：#R#{_ITEM%d}", varItem )
				Msg2Player( varMap, varPlayer, message, 8, 2)
				Msg2Player( varMap, varPlayer, message, 8, 3)
			end
    else
        Msg2Player( varMap, varPlayer, "您身上没有全套的元素符文残片，合成失败", 8, 2)
        Msg2Player( varMap, varPlayer, "您身上没有全套的元素符文残片，合成失败", 8, 3)
		end
end
