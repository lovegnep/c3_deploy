

x570054_var_FileId = 570054
x570054_var_QuestName = "战场积分兑换海蓝强化石"
x570054_var_ItemId_target  = 11000545
x570054_var_Exchange_Rate = 1700 




function x570054_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    TalkAppendButton( varMap, x570054_var_FileId, x570054_var_QuestName, 3, 1)
end
	




function x570054_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)	
	StartTalkTask( varMap)
	    TalkAppendString( varMap, "#Y"..x570054_var_QuestName )
        TalkAppendString( varMap, format( "\n\t你所取得的成就有目共睹！#G战场积分#W是你对战场贡献的最好证明。您可以在这里用#R%d点#G战场积分#W兑换#R1个#G@item_%d#W。\n \n\t您现在有#R%d点#G战场积分#W。",x570054_var_Exchange_Rate,x570054_var_ItemId_target,GetPVP2V2Mark( varMap, varPlayer)))
        TalkAppendString( varMap, format("\n\t你确定要用#G战场积分#W兑换#G@item_%d#W么？",x570054_var_ItemId_target) )
    StopTalkTask()
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x570054_var_FileId, -1)
end





function x570054_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    return 1
end




function x570054_ProcAccept( varMap, varPlayer)

    local score = GetPVP2V2Mark( varMap, varPlayer)
    if score < x570054_var_Exchange_Rate then
        Msg2Player( varMap, varPlayer, format("你的战场积分不足%d点，无法兑换@item_%d",x570054_var_Exchange_Rate,x570054_var_ItemId_target), 8, 3)
        return
    end

	

	StartItemTask(varMap)
			ItemAppend( varMap, x570054_var_ItemId_target, 1 )
	varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
		SubPVP2V2Mark( varMap, varPlayer, x570054_var_Exchange_Rate)
		StartTalkTask(varMap)
			TalkAppendString(varMap,format("#cffcf00恭喜您，兑换了1个@item_%d",x570054_var_ItemId_target))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)			
	else					
		StartTalkTask(varMap)
			TalkAppendString(varMap,format("#cffcf00抱歉，兑换@item_%d失败",x570054_var_ItemId_target))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)					
	end
end



