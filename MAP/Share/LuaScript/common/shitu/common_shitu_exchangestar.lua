
--DECLARE_QUEST_INFO_START--

x300359_var_FileId = 300359




x300359_var_QuestName = "威望之星兑换三番令"   
x300359_var_EXCName = "兑换三番令"		
x300359_var_EXCItemName = "威望之星"		
x300359_var_ItemId = 12030210	
x300359_var_ItemNum = 1				
x300359_var_ItemBonus = {varId=11990011,varNum=1}		
x300359_var_QuestInfo = format("\t如果您有从成吉思汗1中保留而来的威望之星，您可以在我这里将其兑换成三番令。\n\t您确定要使用#G%s#W%s吗？\n\t将需要#R%d颗#W#G%s#W。",x300359_var_EXCItemName,x300359_var_EXCName,x300359_var_ItemNum,x300359_var_EXCItemName)	
x300359_var_QuestError = format("\t您没有足够数量的%s，无法%s。",x300359_var_EXCItemName,x300359_var_EXCName)	

--DECLARE_QUEST_INFO_STOP--



function x300359_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	local zhiye = GetZhiye(varMap, varPlayer)
	local longyannum = GetItemCount(varMap, varPlayer, x300359_var_ItemId)
	local varText = format("\t您现在有#R%d个#W#G%s#W！",longyannum,x300359_var_EXCItemName)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x300359_var_QuestName)
			TalkAppendString(varMap,x300359_var_QuestInfo)
			TalkAppendString(varMap,varText)
			AddQuestItemBonus(varMap, x300359_var_ItemBonus.varId,x300359_var_ItemBonus.varNum)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300359_var_FileId,-1)

end




function x300359_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x300359_var_FileId,x300359_var_QuestName,3);
	
end






function x300359_ProcAccept( varMap, varPlayer )
	
	local Num = GetItemCount( varMap, varPlayer, x300359_var_ItemId )

	if Num < x300359_var_ItemNum then 
		StartTalkTask(varMap)
			TalkAppendString(varMap,x300359_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end
	
	if Num >= x300359_var_ItemNum then 

		
		
		
		
		
			StartItemTask(varMap)
				ItemAppendBind( varMap,x300359_var_ItemBonus.varId,x300359_var_ItemBonus.varNum)
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				if DelItem(varMap,varPlayer,x300359_var_ItemId,x300359_var_ItemNum) ~= 1 then return 0 end
			else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			end	
		
	end
end
		
function x300359_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x300359_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300359_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300359_CheckSubmit( varMap, varPlayer )

end




function x300359_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300359_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300359_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300359_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
