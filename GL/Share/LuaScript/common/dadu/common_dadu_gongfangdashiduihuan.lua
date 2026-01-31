x270106_var_FileId = 270106
x270106_var_ScriptName = "神水兑换"	

x270106_var_ScripText = "\t亲爱的玩家，快来试试您的手气，#G极速神水#W、#G免伤神水#W、#G命中神水#W、#G无敌神水#W等您来拿。\n \n\t#Y@myname，#W你确定要消耗一个神水奖券来抽取神水么？"

x270106_var_Item = {12030697}

function x270106_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap, x270106_var_FileId, x270106_var_ScriptName, 3)
end

function x270106_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
	local varExp = GetLevel( varMap, varPlayer)*7000
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x270106_var_ScriptName)
    TalkAppendString(varMap, x270106_var_ScripText)
    
    DeliverTalkInfo(varMap, varPlayer, varTalknpc, x270106_var_FileId, -1)
end


function x270106_CheckItem( varMap, varPlayer)

	for varI, item in x270106_var_Item do
		if HaveItemInBag( varMap, varPlayer, item ) <= 0 then
			return 0
		end
	end
	return 1
end

function x270106_ProcAcceptCheck( varMap, varPlayer, varTalknpc)

		if GetBagSpace(varMap, varPlayer) < 1 then
			local strText = "背包空间不足,兑换失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
		end

    if x270106_CheckItem( varMap, varPlayer) == 1 then
			for varI, item in x270106_var_Item do
				if DelItem( varMap, varPlayer, item, 1 ) ~= 1 then return 0 end
			end
			
			local varRand = random (1,100)
			if varRand <= 40 then
				StartItemTask( varMap )
				local Rand = random (1,4)
				if Rand <= 1 then
					ItemAppendBind( varMap, 12041091, 1 ) --极速神水
					message = "恭喜您获得了物品：#R极速神水"
				elseif Rand <= 2 then
					ItemAppendBind( varMap, 12041090, 1 ) --免伤神水
					message = "恭喜您获得了物品：#R免伤神水"
				elseif Rand <= 3 then
					ItemAppendBind( varMap, 12041093, 1 ) --命中神水
					message = "恭喜您获得了物品：#R命中神水"
				elseif Rand <= 4 then
					ItemAppendBind( varMap, 12041094, 1 ) --无敌神水
					message = "恭喜您获得了物品：#R无敌神水"
				end
			
				local varRet = StopItemTask( varMap, varPlayer )
				if varRet > 0 then
					DeliverItemListSendToPlayer(varMap,varPlayer)
					Msg2Player( varMap, varPlayer, message, 8, 2)
					Msg2Player( varMap, varPlayer, message, 8, 3)
				end
			else
				local message = "很遗憾，这次您没有抽到！"
				Msg2Player( varMap, varPlayer, message, 8, 2)
				Msg2Player( varMap, varPlayer, message, 8, 3)
			end
    else
        Msg2Player( varMap, varPlayer, "您身上没有神水奖券！", 8, 2)
        Msg2Player( varMap, varPlayer, "您身上没有神水奖券！", 8, 3)
		end
end
