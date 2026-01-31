

x418387_var_FileId  = 418387

x418387_var_QuestID = 10273

x418387_var_bonus = {
{varItem = 12050055, count = 2 ,varName= "一级勇力丹*2", description = "2个一级勇力丹"},	--一级勇力丹
{varItem = 12050065, count = 2 ,varName= "一级追影丹*2", description = "2个一级追影丹"},	--一级追影丹
{varItem = 12050075, count = 2 ,varName= "一级心智丹*2", description = "2个一级心智丹"},	--一级心智丹
{varItem = 12050085, count = 2 ,varName= "一级强身丹*2", description = "2个一级强身丹"},	--一级强身丹
}

x418387_var_SelectButton ={}





function x418387_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418387_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418387_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418387_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418387_ProcDeplete( varMap, varPlayer )
	return 1;
end











function x418387_ProcActivateOnce( varMap, varPlayer, varImpact )
	

	StartTalkTask(varMap)
	TalkAppendString( varMap ,"\n经过激烈的排行榜角逐，您获得了最后的亚军，你可以选择以下一种奖励：")
	for i, j in x418387_var_bonus do
		TalkAppendButton(varMap,x418387_var_QuestID, j.varName, 3, i)
	end
	StopTalkTask( varMap)                         
	DeliverTalkMenu( varMap, varPlayer, varPlayer)
	
end









function x418387_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)

	x418387_var_SelectButton[GetGUID(varMap, varPlayer)] = extid 
	StartTalkTask( varMap)
	TalkAppendString( varMap , "\t您目前选择的是"..x418387_var_bonus[extid].varName.."#W，点击确定您将获得"..x418387_var_bonus[extid].description );
	AddQuestItemBonus( varMap, x418387_var_bonus[extid].varItem, x418387_var_bonus[extid].count);
	StopTalkTask();
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x418387_var_FileId, x418387_var_QuestID);
	
	
end




function x418387_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	local index = x418387_var_SelectButton[GetGUID(varMap, varPlayer)]
	StartItemTask(varMap);
	ItemAppendBind( varMap , x418387_var_bonus[index].varItem , x418387_var_bonus[index].count);
	local varRet = StopItemTask(varMap,varPlayer);
	
	if ( varRet > 0 ) then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			Msg2Player( varMap,varPlayer,format("打开礼包，获得了%d个@item_%d",x418387_var_bonus[index].count , x418387_var_bonus[index].varItem),8,3 );
			DeliverItemListSendToPlayer(varMap,varPlayer);
			GamePlayScriptLog( varMap, varPlayer, 2634)
		else
			Msg2Player( varMap,varPlayer,"使用物品异常",8,3 );
		end
	else
		Msg2Player( varMap,varPlayer,"背包空间不足，无法得到物品！" ,8,3);
	end

end











function x418387_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end




