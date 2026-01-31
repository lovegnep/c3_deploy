--老道具体力丹（ID：12035234）回收

--DECLARE_QUEST_INFO_START--
x330008_var_FileId          			= 330008
x330008_var_QuestName       			= "旧版体力丹回收"
x330008_var_QuestInfo					= "\t旧版的体力丹在更新之后已经不能使用，如果您的库存仍有多余的体力丹可以在我这里将多余的体力丹回收为金卡。\n\t每个旧版体力丹可以换取金卡5两，你确定要将兑换所有的旧版体力丹么？\n\t你目前拥有旧版体力丹#R%d#W个，可以兑换金卡#R%d#W两"
x330008_var_QuestCommentCountOver  		= "你没有旧版体力丹，无法使用此功能"
x330008_var_ItemId =12035234  --体力丹ID

--DECLARE_QUEST_INFO_STOP--
function x330008_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	TalkAppendButton(varMap,x330008_var_FileId,x330008_var_QuestName,3);

end


function x330008_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)

	StartTalkTask(varMap)
		--任务信息
		local Count = GetItemCount(varMap, varPlayer, x330008_var_ItemId)
		TalkAppendString(varMap,"#Y"..x330008_var_QuestName)
		TalkAppendString(varMap,format(x330008_var_QuestInfo,Count,Count*5))
		TalkAppendString(varMap," ")
	StopTalkTask(varMap)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x330008_var_FileId, -1)

end



function x330008_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	if GetItemCount(varMap, varPlayer, x330008_var_ItemId) <= 0 then
	  StartTalkTask(varMap)
    TalkAppendString(varMap,x330008_var_QuestCommentCountOver);  --没有体力丹，无法兑换
    StopTalkTask(varMap) 
    DeliverTalkTips(varMap,varPlayer)
		return
	end
	local Count = GetItemCount(varMap, varPlayer, x330008_var_ItemId)
	if DelItem(varMap,varPlayer,x330008_var_ItemId,Count) ~= 1 then 
	  StartTalkTask(varMap)
    TalkAppendString(varMap,"物品扣除异常！");  
    StopTalkTask(varMap) 
    DeliverTalkTips(varMap,varPlayer)
		return 0 
	else
		local money =Count * 5000 --返还金卡数量
		AddMoney(varMap,varPlayer,3,money,x330008_var_FileId)  --返还金卡
		StartTalkTask(varMap)
    TalkAppendString(varMap,format("回收完成，获得#R金卡#{_MONEY%d}#o的奖励", money) );  --没有体力丹，无法兑换
    StopTalkTask(varMap) 
    DeliverTalkTips(varMap,varPlayer)
		GamePlayScriptLog(varMap,varPlayer,3061)
	end
	
	
end


