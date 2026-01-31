
--DECLARE_QUEST_INFO_START--

x570075_var_FileId = 570075




x570075_var_QuestName = "【锻造】冥炎洪荒战靴"   
x570075_var_EXCName = "锻造冥炎洪荒战靴"		
x570075_var_EXCItemName = "冥炎战靴图谱"		
x570075_var_EXCItemName1 = "炫彩精铁"		
x570075_var_ItemId = 11000856	
x570075_var_ItemId1 = 11000863	
x570075_var_ItemNum = 1		
x570075_var_ItemNum1 = 7		
x570075_var_minlevel = 1 
x570075_var_ItemBonus = {
						{varId=10279630,varNum=1},
						{varId=10279631,varNum=1},
						{varId=10279632,varNum=1},
						{varId=10279633,varNum=1},
						{varId=10279634,varNum=1},
						{varId=10279635,varNum=1},
						{varId=10279636,varNum=1},
						{varId=10279637,varNum=1},
						{varId=10279638,varNum=1},
						{varId=10279639,varNum=1},
						{varId=10279640,varNum=1},
						{varId=10279641,varNum=1},
					  }	
x570075_var_QuestInfo = format("\t您确定要#W%s吗？\n\t将需要#R%d张#W#G%s#W和#R%d颗#W#G%s#W，兑换出来的装备为绑定装备。",x570075_var_EXCName,x570075_var_ItemNum,x570075_var_EXCItemName,x570075_var_ItemNum1,x570075_var_EXCItemName1)	
x570075_var_QuestError = format("\t您没有%s或没有足够数量的%s，无法%s。",x570075_var_EXCItemName,x570075_var_EXCItemName1,x570075_var_EXCName)	

--DECLARE_QUEST_INFO_STOP--



function x570075_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	local zhiye = GetZhiye(varMap, varPlayer)
	local tupunum = GetItemCount(varMap, varPlayer, x570075_var_ItemId)
	local baoshinum = GetItemCount(varMap, varPlayer, x570075_var_ItemId1)
	local varText = format("\t您现在有#R%d张#W#G%s#W和#R%d颗#W#G%s#W！",tupunum,x570075_var_EXCItemName,baoshinum,x570075_var_EXCItemName1)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570075_var_QuestName)
			TalkAppendString(varMap,x570075_var_QuestInfo)
			TalkAppendString(varMap,varText)
			AddQuestItemBonus(varMap, x570075_var_ItemBonus[zhiye+1].varId,x570075_var_ItemBonus[1].varNum)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570075_var_FileId,-1)

end




function x570075_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x570075_var_FileId,x570075_var_QuestName,3);
	
end






function x570075_ProcAccept( varMap, varPlayer )

	local Level =GetLevel(varMap, varPlayer)
	if Level < x570075_var_minlevel then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end		
	
	local Num = GetItemCount( varMap, varPlayer, x570075_var_ItemId )
	local Num1 = GetItemCount( varMap, varPlayer, x570075_var_ItemId1 )
	if Num < x570075_var_ItemNum and Num1 < x570075_var_ItemNum1 then 
		StartTalkTask(varMap)
		TalkAppendString(varMap,x570075_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end
	
	if Num >= x570075_var_ItemNum and Num1 >= x570075_var_ItemNum1 then 
		local zhiye = GetZhiye(varMap, varPlayer)
		local weiyi = ItemIsUnique(varMap,varPlayer, x570075_var_ItemBonus[zhiye+1].varId)
		local have  = HaveItem( varMap,varPlayer,x570075_var_ItemBonus[zhiye+1].varId)
		
		if weiyi ~= 1  then
			StartItemTask(varMap)
			ItemAppend( varMap,x570075_var_ItemBonus[zhiye+1].varId,x570075_var_ItemBonus[1].varNum)
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				if DelItem(varMap,varPlayer,x570075_var_ItemId,x570075_var_ItemNum) ~= 1 then return 0 end
				if DelItem(varMap,varPlayer,x570075_var_ItemId1,x570075_var_ItemNum1) ~= 1 then return 0 end
			else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			end	
		elseif weiyi == 1 then
			if have < 1 then
				StartItemTask(varMap)
				ItemAppend( varMap,x570075_var_ItemBonus[zhiye+1].varId,x570075_var_ItemBonus[1].varNum)
				local varRet = StopItemTask(varMap,varPlayer)
				if varRet > 0 then
					DeliverItemListSendToPlayer(varMap,varPlayer)
					if DelItem(varMap,varPlayer,x570075_var_ItemId,x570075_var_ItemNum) ~= 1 then return 0 end
					if DelItem(varMap,varPlayer,x570075_var_ItemId1,x570075_var_ItemNum1) ~= 1 then return 0 end
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
		
function x570075_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x570075_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570075_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570075_CheckSubmit( varMap, varPlayer )

end




function x570075_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570075_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570075_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570075_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
