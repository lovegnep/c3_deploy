
--DECLARE_QUEST_INFO_START--

x570047_var_FileId = 570047




x570047_var_QuestName = "【龙眼石】兑换冥传项链"
x570047_var_EXCName = "兑换冥传项链"		
x570047_var_EXCItemName = "冥之龙眼石"		
x570047_var_ItemId = 11050005           
x570047_var_ItemNum = 280                 
x570047_var_ItemBonus =	{{varId=10249500,varNum=1},{varId=10249501,varNum=1},{varId=10249502,varNum=1},{varId=10249503,varNum=1},{varId=10249504,varNum=1},{varId=10249505,varNum=1},{varId=10249506,varNum=1},{varId=10249507,varNum=1},{varId=10249508,varNum=1},{varId=10249509,varNum=1},{varId=10249510,varNum=1},{varId=10249511,varNum=1}}
x570047_var_QuestInfo = format("\t您确定要使用#G%s#W%s吗？\n\t将需要#R%d颗#W#G%s#W。",x570047_var_EXCItemName,x570047_var_EXCName,x570047_var_ItemNum,x570047_var_EXCItemName)	
x570047_var_QuestError = format("\t您没有足够数量的%s，无法%s。",x570047_var_EXCItemName,x570047_var_EXCName)	

--DECLARE_QUEST_INFO_STOP--



function x570047_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	local zhiye = GetZhiye(varMap, varPlayer)
	local longyannum = GetItemCount(varMap, varPlayer, x570047_var_ItemId)
	local varText = format("\t您现在有#R%d颗#W#G%s#W！",longyannum,x570047_var_EXCItemName)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570047_var_QuestName)
			TalkAppendString(varMap,x570047_var_QuestInfo)
			TalkAppendString(varMap,varText)
			AddQuestItemBonus(varMap, x570047_var_ItemBonus[zhiye+1].varId,x570047_var_ItemBonus[1].varNum)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570047_var_FileId,-1)

end




function x570047_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x570047_var_FileId,x570047_var_QuestName,3);
	
end






function x570047_ProcAccept( varMap, varPlayer )
	
	local Num = GetItemCount( varMap, varPlayer, x570047_var_ItemId )

	if Num < x570047_var_ItemNum then 
		StartTalkTask(varMap)
			TalkAppendString(varMap,x570047_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end
	
	if Num >= x570047_var_ItemNum then 

		local zhiye = GetZhiye(varMap, varPlayer)
		local weiyi = ItemIsUnique(varMap,varPlayer, x570047_var_ItemBonus[zhiye+1].varId)
		local have  = HaveItem( varMap,varPlayer,x570047_var_ItemBonus[zhiye+1].varId)
		
		if weiyi ~= 1  then
			StartItemTask(varMap)
				ItemAppend( varMap,x570047_var_ItemBonus[zhiye+1].varId,x570047_var_ItemBonus[1].varNum)
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				if DelItem(varMap,varPlayer,x570047_var_ItemId,x570047_var_ItemNum) ~= 1 then return 0 end
			else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			end	
		elseif weiyi == 1 then
			if have < 1 then
				StartItemTask(varMap)
					ItemAppend( varMap,x570047_var_ItemBonus[zhiye+1].varId,x570047_var_ItemBonus[1].varNum)
				local varRet = StopItemTask(varMap,varPlayer)
				if varRet > 0 then
					DeliverItemListSendToPlayer(varMap,varPlayer)
					if DelItem(varMap,varPlayer,x570047_var_ItemId,x570047_var_ItemNum) ~= 1 then return 0 end
				else
				StartTalkTask(varMap)
					TalkAppendString(varMap,"物品栏已满，无法获得物品！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				end	
			else
				StartTalkTask(varMap)
					TalkAppendString(varMap,"您无法兑换更多的装备！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end	
		end
	end
end
		
function x570047_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x570047_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570047_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570047_CheckSubmit( varMap, varPlayer )

end




function x570047_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570047_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570047_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570047_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
