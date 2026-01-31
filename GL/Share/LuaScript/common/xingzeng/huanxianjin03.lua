
--DECLARE_QUEST_INFO_START--

x588047_var_FileId = 588047




x588047_var_QuestName = "现金5两兑换现金500两"   
x588047_var_EXCName = "兑换现金500两"		
x588047_var_EXCItemName = "现金5两"		
x588047_var_ItemId = 12031056	
x588047_var_ItemNum = 100				
x588047_var_ItemBonus = {varId=12030099,varNum=1}		
x588047_var_QuestInfo = format("\t您可以在我这里兑换现金500两。\n\t您确定要使用#G%s#W%s吗？\n\t将需要#R%d个#W#G%s#W。",x588047_var_EXCItemName,x588047_var_EXCName,x588047_var_ItemNum,x588047_var_EXCItemName)	
x588047_var_QuestError = format("\t您没有足够数量的%s，无法%s。",x588047_var_EXCItemName,x588047_var_EXCName)	

--DECLARE_QUEST_INFO_STOP--



function x588047_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	local zhiye = GetZhiye(varMap, varPlayer)
	local longyannum = GetItemCount(varMap, varPlayer, x588047_var_ItemId)
	local varText = format("\t您现在有#R%d个#W#G%s#W！",longyannum,x588047_var_EXCItemName)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x588047_var_QuestName)
			TalkAppendString(varMap,x588047_var_QuestInfo)
			TalkAppendString(varMap,varText)
			AddQuestItemBonus(varMap, x588047_var_ItemBonus.varId,x588047_var_ItemBonus.varNum)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588047_var_FileId,-1)

end




function x588047_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x588047_var_FileId,x588047_var_QuestName,3);
	
end






function x588047_ProcAccept( varMap, varPlayer )
	
	local Num = GetItemCount( varMap, varPlayer, x588047_var_ItemId )

	if Num < x588047_var_ItemNum then 
		StartTalkTask(varMap)
			TalkAppendString(varMap,x588047_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end
	
	if Num >= x588047_var_ItemNum then 

		
		
		
		
		
			StartItemTask(varMap)
				ItemAppendBind( varMap,x588047_var_ItemBonus.varId,x588047_var_ItemBonus.varNum)
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				if DelItem(varMap,varPlayer,x588047_var_ItemId,x588047_var_ItemNum) ~= 1 then return 0 end
			else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			end	
		
	end
end
		
function x588047_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x588047_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x588047_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x588047_CheckSubmit( varMap, varPlayer )

end




function x588047_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x588047_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x588047_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x588047_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
