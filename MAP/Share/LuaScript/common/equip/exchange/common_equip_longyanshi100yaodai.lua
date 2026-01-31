
--DECLARE_QUEST_INFO_START--

x570048_var_FileId = 570048




x570048_var_QuestName="【龙眼石】兑换冥传腰带"
x570048_var_EXCName = "兑换冥传腰带"		
x570048_var_EXCItemName = "冥之龙眼石"		
x570048_var_ItemId = 11050005           
x570048_var_ItemNum = 310                 
x570048_var_ItemBonus	=	{{varId=10269500,varNum=1},{varId=10269501,varNum=1},{varId=10269502,varNum=1},{varId=10269503,varNum=1},{varId=10269504,varNum=1},{varId=10269505,varNum=1},{varId=10269506,varNum=1},{varId=10269507,varNum=1},{varId=10269508,varNum=1},{varId=10269509,varNum=1},{varId=10269510,varNum=1},{varId=10269511,varNum=1}}
x570048_var_QuestInfo = format("\t您确定要使用#G%s#W%s吗？\n\t将需要#R%d颗#W#G%s#W。",x570048_var_EXCItemName,x570048_var_EXCName,x570048_var_ItemNum,x570048_var_EXCItemName)	
x570048_var_QuestError = format("\t您没有足够数量的%s，无法%s。",x570048_var_EXCItemName,x570048_var_EXCName)	

--DECLARE_QUEST_INFO_STOP--



function x570048_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	local zhiye = GetZhiye(varMap, varPlayer)
	local longyannum = GetItemCount(varMap, varPlayer, x570048_var_ItemId)
	local varText = format("\t您现在有#R%d颗#W#G%s#W！",longyannum,x570048_var_EXCItemName)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570048_var_QuestName)
			TalkAppendString(varMap,x570048_var_QuestInfo)
			TalkAppendString(varMap,varText)
			AddQuestItemBonus(varMap, x570048_var_ItemBonus[zhiye+1].varId,x570048_var_ItemBonus[1].varNum)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570048_var_FileId,-1)

end




function x570048_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x570048_var_FileId,x570048_var_QuestName,3);
	
end






function x570048_ProcAccept( varMap, varPlayer )
	
	local Num = GetItemCount( varMap, varPlayer, x570048_var_ItemId )

	if Num < x570048_var_ItemNum then 
		StartTalkTask(varMap)
			TalkAppendString(varMap,x570048_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end
	
	if Num >= x570048_var_ItemNum then 

		local zhiye = GetZhiye(varMap, varPlayer)
		local weiyi = ItemIsUnique(varMap,varPlayer, x570048_var_ItemBonus[zhiye+1].varId)
		local have  = HaveItem( varMap,varPlayer,x570048_var_ItemBonus[zhiye+1].varId)
		
		if weiyi ~= 1  then
			StartItemTask(varMap)
				ItemAppend( varMap,x570048_var_ItemBonus[zhiye+1].varId,x570048_var_ItemBonus[1].varNum)
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				if DelItem(varMap,varPlayer,x570048_var_ItemId,x570048_var_ItemNum) ~= 1 then return 0 end
			else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			end	
		elseif weiyi == 1 then
			if have < 1 then
				StartItemTask(varMap)
					ItemAppend( varMap,x570048_var_ItemBonus[zhiye+1].varId,x570048_var_ItemBonus[1].varNum)
				local varRet = StopItemTask(varMap,varPlayer)
				if varRet > 0 then
					DeliverItemListSendToPlayer(varMap,varPlayer)
					if DelItem(varMap,varPlayer,x570048_var_ItemId,x570048_var_ItemNum) ~= 1 then return 0 end
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
		
function x570048_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x570048_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570048_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570048_CheckSubmit( varMap, varPlayer )

end




function x570048_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570048_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570048_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570048_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
