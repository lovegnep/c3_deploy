
--DECLARE_QUEST_INFO_START--

x570046_var_FileId = 570046




x570046_var_QuestName = "【龙眼石】兑换冥传帽子"
x570046_var_EXCName = "兑换冥传帽子"		
x570046_var_EXCItemName = "冥之龙眼石"		
x570046_var_ItemId = 11050005           
x570046_var_ItemNum = 410                 
x570046_var_ItemBonus = {{varId=10209500,varNum=1},{varId=10209501,varNum=1},{varId=10209502,varNum=1},{varId=10209503,varNum=1},{varId=10209504,varNum=1},{varId=10209505,varNum=1},{varId=10209506,varNum=1},{varId=10209507,varNum=1},{varId=10209508,varNum=1},{varId=10209509,varNum=1},{varId=10209510,varNum=1},{varId=10209511,varNum=1}}
x570046_var_QuestInfo = format("\t您确定要使用#G%s#W%s吗？\n\t将需要#R%d颗#W#G%s#W。",x570046_var_EXCItemName,x570046_var_EXCName,x570046_var_ItemNum,x570046_var_EXCItemName)	
x570046_var_QuestError = format("\t您没有足够数量的%s，无法%s。",x570046_var_EXCItemName,x570046_var_EXCName)	

--DECLARE_QUEST_INFO_STOP--



function x570046_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	local zhiye = GetZhiye(varMap, varPlayer)
	local longyannum = GetItemCount(varMap, varPlayer, x570046_var_ItemId)
	local varText = format("\t您现在有#R%d颗#W#G%s#W！",longyannum,x570046_var_EXCItemName)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570046_var_QuestName)
			TalkAppendString(varMap,x570046_var_QuestInfo)
			TalkAppendString(varMap,varText)
			AddQuestItemBonus(varMap, x570046_var_ItemBonus[zhiye+1].varId,x570046_var_ItemBonus[1].varNum)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570046_var_FileId,-1)

end




function x570046_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x570046_var_FileId,x570046_var_QuestName,3);
	
end






function x570046_ProcAccept( varMap, varPlayer )
	
	local Num = GetItemCount( varMap, varPlayer, x570046_var_ItemId )

	if Num < x570046_var_ItemNum then 
		StartTalkTask(varMap)
			TalkAppendString(varMap,x570046_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end
	
	if Num >= x570046_var_ItemNum then 

		local zhiye = GetZhiye(varMap, varPlayer)
		local weiyi = ItemIsUnique(varMap,varPlayer, x570046_var_ItemBonus[zhiye+1].varId)
		local have  = HaveItem( varMap,varPlayer,x570046_var_ItemBonus[zhiye+1].varId)
		
		if weiyi ~= 1  then
			StartItemTask(varMap)
				ItemAppend( varMap,x570046_var_ItemBonus[zhiye+1].varId,x570046_var_ItemBonus[1].varNum)
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				if DelItem(varMap,varPlayer,x570046_var_ItemId,x570046_var_ItemNum) ~= 1 then return 0 end
			else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			end	
		elseif weiyi == 1 then
			if have < 1 then
				StartItemTask(varMap)
					ItemAppend( varMap,x570046_var_ItemBonus[zhiye+1].varId,x570046_var_ItemBonus[1].varNum)
				local varRet = StopItemTask(varMap,varPlayer)
				if varRet > 0 then
					DeliverItemListSendToPlayer(varMap,varPlayer)
					if DelItem(varMap,varPlayer,x570046_var_ItemId,x570046_var_ItemNum) ~= 1 then return 0 end
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
		
function x570046_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x570046_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570046_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570046_CheckSubmit( varMap, varPlayer )

end




function x570046_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570046_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570046_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570046_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
