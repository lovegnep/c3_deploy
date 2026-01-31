x270105_var_FileId = 270105
x270105_var_ScriptName = "战甲图谱·生命兑换"	

x270105_var_ScripText = "\t亲爱的玩家，快来试试您的手气，#G战甲图谱·生命#W等您来拿。\n \n\t#Y@myname，#W你确定要消耗一个战甲图谱·生命奖券来抽取战甲图谱·生命么？"

x270105_var_Item = {12030696}

function x270105_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap, x270105_var_FileId, x270105_var_ScriptName, 3)
end

function x270105_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
	local varExp = GetLevel( varMap, varPlayer)*7000
	StartTalkTask( varMap)
    TalkAppendString( varMap, "#Y"..x270105_var_ScriptName)
    TalkAppendString(varMap, x270105_var_ScripText)
    
    DeliverTalkInfo(varMap, varPlayer, varTalknpc, x270105_var_FileId, -1)
end


function x270105_CheckItem( varMap, varPlayer)

	for varI, item in x270105_var_Item do
		if HaveItemInBag( varMap, varPlayer, item ) <= 0 then
			return 0
		end
	end
	return 1
end

function x270105_ProcAcceptCheck( varMap, varPlayer, varTalknpc)

		if GetBagSpace(varMap, varPlayer) < 1 then
			local strText = "背包空间不足,兑换失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, strText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
		end

    if x270105_CheckItem( varMap, varPlayer) == 1 then
			for varI, item in x270105_var_Item do
				if DelItem( varMap, varPlayer, item, 1 ) ~= 1 then return 0 end
			end
			
			local varRand = random (1,100)
			if varRand <= 20 then
				local varItem = 11000840 --战甲图谱·生命
				StartItemTask( varMap )
				ItemAppendBind( varMap, varItem, 1 )
				StopItemTask( varMap, varPlayer )
				DeliverItemListSendToPlayer(varMap,varPlayer)
				local message = "恭喜您获得了物品：#R战甲图谱·生命"
				Msg2Player( varMap, varPlayer, message, 8, 2)
				Msg2Player( varMap, varPlayer, message, 8, 3)
				local message = GetName(varMap, varPlayer)
				message = message.."使用#R战甲图谱·生命奖券#cffcf00，幸运地获得了战甲图谱·生命"
				LuaAllScenceM2Wrold( varMap, message, 5, 1 )
			else
				local message = "很遗憾，这次您没有抽到！"
				Msg2Player( varMap, varPlayer, message, 8, 2)
				Msg2Player( varMap, varPlayer, message, 8, 3)
			end
    else
        Msg2Player( varMap, varPlayer, "您身上没有战甲图谱·生命奖券！", 8, 2)
        Msg2Player( varMap, varPlayer, "您身上没有战甲图谱·生命奖券！", 8, 3)
		end
end
