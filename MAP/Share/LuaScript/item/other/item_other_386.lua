

x418386_var_FileId  = 418386

x418386_var_QuestID = 10272

x418386_var_bonus = {
{varItem = 12050055, count = 5 ,varName= "一级勇力丹*5", description = "5个一级勇力丹"},	--一级勇力丹
{varItem = 12050065, count = 5 ,varName= "一级追影丹*5", description = "5个一级追影丹"},	--一级追影丹
{varItem = 12050075, count = 5 ,varName= "一级心智丹*5", description = "5个一级心智丹"},	--一级心智丹
{varItem = 12050085, count = 5 ,varName= "一级强身丹*5", description = "5个一级强身丹"},	--一级强身丹
}

x418386_var_SelectButton ={}





function x418386_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418386_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418386_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418386_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418386_ProcDeplete( varMap, varPlayer )
	return 1;
end











function x418386_ProcActivateOnce( varMap, varPlayer, varImpact )
	

	StartTalkTask(varMap)
	TalkAppendString( varMap ,"\n经过激烈的排行榜角逐，您获得了最后的冠军，你可以选择以下一种奖励：")
	for i, j in x418386_var_bonus do
		TalkAppendButton(varMap,x418386_var_QuestID, j.varName, 3, i)
	end
	StopTalkTask( varMap)                         
	DeliverTalkMenu( varMap, varPlayer, varPlayer)
	
end









function x418386_ProcEventEntry( varMap, varPlayer, varTalknpc, varScript, extid)

	x418386_var_SelectButton[GetGUID(varMap, varPlayer)] = extid 
	StartTalkTask( varMap)
	TalkAppendString( varMap , "\t您目前选择的是"..x418386_var_bonus[extid].varName.."#W，点击确定您将获得"..x418386_var_bonus[extid].description );
	AddQuestItemBonus( varMap, x418386_var_bonus[extid].varItem, x418386_var_bonus[extid].count);
	StopTalkTask();
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x418386_var_FileId, x418386_var_QuestID);
	
	
end




function x418386_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	local index = x418386_var_SelectButton[GetGUID(varMap, varPlayer)]
	StartItemTask(varMap);
	ItemAppendBind( varMap , x418386_var_bonus[index].varItem , x418386_var_bonus[index].count);
	local varRet = StopItemTask(varMap,varPlayer);
	
	if ( varRet > 0 ) then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			Msg2Player( varMap,varPlayer,format("打开礼包，获得了%d个@item_%d",x418386_var_bonus[index].count , x418386_var_bonus[index].varItem),8,3 );
			DeliverItemListSendToPlayer(varMap,varPlayer);
			GamePlayScriptLog( varMap, varPlayer, 2634)
		else
			Msg2Player( varMap,varPlayer,"使用物品异常",8,3 );
		end
	else
		Msg2Player( varMap,varPlayer,"背包空间不足，无法得到物品！" ,8,3);
	end

end











function x418386_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end




