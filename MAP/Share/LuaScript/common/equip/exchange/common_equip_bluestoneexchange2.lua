

x570055_var_FileId = 570055
x570055_var_QuestName = "威望加声望兑换水火强化石"
x570055_var_ItemId_target  = 11000546
x570055_var_Exchange_Need_WeiWang = 5000 
x570055_var_Exchange_Need_ShengWang = 5000



function x570055_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    TalkAppendButton( varMap, x570055_var_FileId, x570055_var_QuestName, 3, 1)
end
	



function x570055_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)	
	StartTalkTask( varMap)
	    TalkAppendString( varMap, "#Y"..x570055_var_QuestName )
        TalkAppendString( varMap, format( "\n\t您可以在这里用#R%d点#G威望加#R%d点#G声望#W兑换#R1个#G@item_%d#W。\n \n\t您现在有#R%d点#G威望和#R%d点#G声望#W。",x570055_var_Exchange_Need_WeiWang,x570055_var_Exchange_Need_ShengWang,x570055_var_ItemId_target,GetPlayerGoodBadValue(varMap, varPlayer),GetShengWang(varMap, varPlayer)))
        TalkAppendString( varMap, format("\n\t你确定要用#G威望加声望#W兑换#G@item_%d#W么？",x570055_var_ItemId_target) )
    StopTalkTask()
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x570055_var_FileId, -1)
end





function x570055_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    return 1
end




function x570055_ProcAccept( varMap, varPlayer)

    local CurrentWeiWang = GetPlayerGoodBadValue( varMap, varPlayer)
    if CurrentWeiWang < x570055_var_Exchange_Need_WeiWang then
        Msg2Player( varMap, varPlayer, format("你的威望不足%d点，无法兑换@item_%d",x570055_var_Exchange_Need_WeiWang,x570055_var_ItemId_target), 8, 3)
        return
    end

	local CurrentShengWang = GetShengWang( varMap, varPlayer)
    if CurrentShengWang < x570055_var_Exchange_Need_ShengWang then
        Msg2Player( varMap, varPlayer, format("你的声望不足%d点，无法兑换@item_%d",x570055_var_Exchange_Need_ShengWang,x570055_var_ItemId_target), 8, 3)
        return
    end
		  
	StartItemTask(varMap)
		ItemAppend( varMap, x570055_var_ItemId_target, 1 )
	varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
		SetPlayerGoodBadValue( varMap, varPlayer, CurrentWeiWang - x570055_var_Exchange_Need_WeiWang )
		SetShengWang( varMap, varPlayer, CurrentShengWang - x570055_var_Exchange_Need_ShengWang )			
		StartTalkTask(varMap)
			TalkAppendString(varMap,format("#cffcf00恭喜您，兑换了1个@item_%d",x570055_var_ItemId_target))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)			
	else					
		StartTalkTask(varMap)
			TalkAppendString(varMap,format("#cffcf00抱歉，兑换@item_%d失败",x570055_var_ItemId_target))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)					
	end
end
