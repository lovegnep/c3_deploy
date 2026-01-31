
--DECLARE_QUEST_INFO_START--

x414028_var_FileId = 414028




x414028_var_QuestName = "五番令兑换藏宝令"   
x414028_var_EXCName = "五番令兑换藏宝令"		
x414028_var_EXCItemName = "五番令"		
x414028_var_ItemId = 11990012	
x414028_var_ItemNum = 1				
x414028_var_ItemBonus = {{varId=11990015,varNum=4},{varId=11990015,varNum=4},{varId=11990015,varNum=4},{varId=11990015,varNum=4},{varId=11990015,varNum=4},{varId=11990015,varNum=4},{varId=11990015,varNum=4},{varId=11990015,varNum=4},{varId=11990015,varNum=4},{varId=11990015,varNum=4},{varId=11990015,varNum=4},{varId=11990015,varNum=4}}		
x414028_var_QuestInfo = format("\n\t您那里有多余的#G五番令#W吗？在我这里可以将#R%d个#W#G五番令#W兑换为#R4个#W#G藏宝令#W。",x414028_var_ItemNum)	
x414028_var_QuestError = format("\t您没有%s，无法用%s。",x414028_var_EXCItemName,x414028_var_EXCName)	

--DECLARE_QUEST_INFO_STOP--



function x414028_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	local zhiye = GetZhiye(varMap, varPlayer)
	local longyannum = GetItemCount(varMap, varPlayer, x414028_var_ItemId)
	local varText = format("\n\t您确定要使用#G五番令#W兑换#G藏宝令#W吗？")
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x414028_var_QuestName)
			TalkAppendString(varMap,x414028_var_QuestInfo)
			TalkAppendString(varMap,varText)
			AddQuestItemBonus(varMap, x414028_var_ItemBonus[zhiye+1].varId,x414028_var_ItemBonus[1].varNum)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x414028_var_FileId,-1)

end




function x414028_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x414028_var_FileId,x414028_var_QuestName,3);
	
end






function x414028_ProcAccept( varMap, varPlayer )
	
	local Num = GetItemCount( varMap, varPlayer, x414028_var_ItemId )

	if Num < x414028_var_ItemNum then 
		StartTalkTask(varMap)
			TalkAppendString(varMap,x414028_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end
	
	if Num >= x414028_var_ItemNum then 

		local zhiye = GetZhiye(varMap, varPlayer)
		local weiyi = ItemIsUnique(varMap,varPlayer, x414028_var_ItemBonus[zhiye+1].varId)
		local have  = HaveItem( varMap,varPlayer,x414028_var_ItemBonus[zhiye+1].varId)
		
		if weiyi ~= 1  then
			StartItemTask(varMap)
				ItemAppend( varMap,x414028_var_ItemBonus[zhiye+1].varId,x414028_var_ItemBonus[1].varNum)
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				if DelItem(varMap,varPlayer,x414028_var_ItemId,x414028_var_ItemNum) ~= 1 then return 0 end
			else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			end	
		elseif weiyi == 1 then
			if have < 1 then
				StartItemTask(varMap)
					ItemAppend( varMap,x414028_var_ItemBonus[zhiye+1].varId,x414028_var_ItemBonus[1].varNum)
				local varRet = StopItemTask(varMap,varPlayer)
				if varRet > 0 then
					DeliverItemListSendToPlayer(varMap,varPlayer)
					if DelItem(varMap,varPlayer,x414028_var_ItemId,x414028_var_ItemNum) ~= 1 then return 0 end
				else
				StartTalkTask(varMap)
					TalkAppendString(varMap,"物品栏已满，无法获得物品！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				end	
			else
				StartTalkTask(varMap)
					TalkAppendString(varMap,"您无法兑换更多的藏宝令！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end	
		end
	end
end
		
function x414028_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x414028_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x414028_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x414028_CheckSubmit( varMap, varPlayer )

end




function x414028_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x414028_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x414028_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x414028_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
