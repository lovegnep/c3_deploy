
--DECLARE_QUEST_INFO_START--

x588042_var_FileId = 588042




x588042_var_QuestName = "现金10两兑换现金1锭"   
x588042_var_EXCName = "兑换现金1锭"		
x588042_var_EXCItemName = "现金10两"		
x588042_var_ItemId = 12030098	
x588042_var_ItemNum = 100				
x588042_var_ItemBonus = {varId=12030100,varNum=1}		
x588042_var_QuestInfo = format("\t您可以在我这里兑换现金1锭。\n\t您确定要使用#G%s#W%s吗？\n\t将需要#R%d个#W#G%s#W。",x588042_var_EXCItemName,x588042_var_EXCName,x588042_var_ItemNum,x588042_var_EXCItemName)	
x588042_var_QuestError = format("\t您没有足够数量的%s，无法%s。",x588042_var_EXCItemName,x588042_var_EXCName)	

--DECLARE_QUEST_INFO_STOP--



function x588042_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	local zhiye = GetZhiye(varMap, varPlayer)
	local longyannum = GetItemCount(varMap, varPlayer, x588042_var_ItemId)
	local varText = format("\t您现在有#R%d个#W#G%s#W！",longyannum,x588042_var_EXCItemName)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x588042_var_QuestName)
			TalkAppendString(varMap,x588042_var_QuestInfo)
			TalkAppendString(varMap,varText)
			AddQuestItemBonus(varMap, x588042_var_ItemBonus.varId,x588042_var_ItemBonus.varNum)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588042_var_FileId,-1)

end




function x588042_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x588042_var_FileId,x588042_var_QuestName,3);
	
end






function x588042_ProcAccept( varMap, varPlayer )
	
	local Num = GetItemCount( varMap, varPlayer, x588042_var_ItemId )

	if Num < x588042_var_ItemNum then 
		StartTalkTask(varMap)
			TalkAppendString(varMap,x588042_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end
	
	if Num >= x588042_var_ItemNum then 

		
		
		
		
		
			StartItemTask(varMap)
				ItemAppendBind( varMap,x588042_var_ItemBonus.varId,x588042_var_ItemBonus.varNum)
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				if DelItem(varMap,varPlayer,x588042_var_ItemId,x588042_var_ItemNum) ~= 1 then return 0 end
			else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			end	
		
	end
end
		
function x588042_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x588042_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x588042_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x588042_CheckSubmit( varMap, varPlayer )

end




function x588042_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x588042_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x588042_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x588042_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
