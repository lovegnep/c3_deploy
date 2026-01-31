
--DECLARE_QUEST_INFO_START--

x570072_var_FileId = 570072




x570072_var_QuestName = "【锻造】冥炎洪荒铠甲"   
x570072_var_EXCName = "锻造冥炎洪荒铠甲"		
x570072_var_EXCItemName = "冥炎铠甲图谱"		
x570072_var_EXCItemName1 = "晕光精铁"		
x570072_var_ItemId = 11000852	
x570072_var_ItemId1 = 11000862	
x570072_var_ItemNum = 1		
x570072_var_ItemNum1 = 8		
x570072_var_minlevel = 1 
x570072_var_ItemBonus = {
						{varId=10239630,varNum=1},
						{varId=10239631,varNum=1},
						{varId=10239632,varNum=1},
						{varId=10239633,varNum=1},
						{varId=10239634,varNum=1},
						{varId=10239635,varNum=1},
						{varId=10239636,varNum=1},
						{varId=10239637,varNum=1},
						{varId=10239638,varNum=1},
						{varId=10239639,varNum=1},
						{varId=10239640,varNum=1},
						{varId=10239641,varNum=1},
					  }	
x570072_var_QuestInfo = format("\t您确定要#W%s吗？\n\t将需要#R%d张#W#G%s#W和#R%d颗#W#G%s#W，兑换出来的装备为绑定装备。",x570072_var_EXCName,x570072_var_ItemNum,x570072_var_EXCItemName,x570072_var_ItemNum1,x570072_var_EXCItemName1)	
x570072_var_QuestError = format("\t您没有%s或没有足够数量的%s，无法%s。",x570072_var_EXCItemName,x570072_var_EXCItemName1,x570072_var_EXCName)	

--DECLARE_QUEST_INFO_STOP--



function x570072_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	local zhiye = GetZhiye(varMap, varPlayer)
	local tupunum = GetItemCount(varMap, varPlayer, x570072_var_ItemId)
	local baoshinum = GetItemCount(varMap, varPlayer, x570072_var_ItemId1)
	local varText = format("\t您现在有#R%d张#W#G%s#W和#R%d颗#W#G%s#W！",tupunum,x570072_var_EXCItemName,baoshinum,x570072_var_EXCItemName1)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570072_var_QuestName)
			TalkAppendString(varMap,x570072_var_QuestInfo)
			TalkAppendString(varMap,varText)
			AddQuestItemBonus(varMap, x570072_var_ItemBonus[zhiye+1].varId,x570072_var_ItemBonus[1].varNum)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570072_var_FileId,-1)

end




function x570072_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x570072_var_FileId,x570072_var_QuestName,3);
	
end






function x570072_ProcAccept( varMap, varPlayer )

	local Level =GetLevel(varMap, varPlayer)
	if Level < x570072_var_minlevel then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end		
	
	local Num = GetItemCount( varMap, varPlayer, x570072_var_ItemId )
	local Num1 = GetItemCount( varMap, varPlayer, x570072_var_ItemId1 )
	if Num < x570072_var_ItemNum and Num1 < x570072_var_ItemNum1 then 
		StartTalkTask(varMap)
		TalkAppendString(varMap,x570072_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end
	
	if Num >= x570072_var_ItemNum and Num1 >= x570072_var_ItemNum1 then 
		local zhiye = GetZhiye(varMap, varPlayer)
		local weiyi = ItemIsUnique(varMap,varPlayer, x570072_var_ItemBonus[zhiye+1].varId)
		local have  = HaveItem( varMap,varPlayer,x570072_var_ItemBonus[zhiye+1].varId)
		
		if weiyi ~= 1  then
			StartItemTask(varMap)
			ItemAppend( varMap,x570072_var_ItemBonus[zhiye+1].varId,x570072_var_ItemBonus[1].varNum)
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				if DelItem(varMap,varPlayer,x570072_var_ItemId,x570072_var_ItemNum) ~= 1 then return 0 end
				if DelItem(varMap,varPlayer,x570072_var_ItemId1,x570072_var_ItemNum1) ~= 1 then return 0 end
			else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			end	
		elseif weiyi == 1 then
			if have < 1 then
				StartItemTask(varMap)
				ItemAppend( varMap,x570072_var_ItemBonus[zhiye+1].varId,x570072_var_ItemBonus[1].varNum)
				local varRet = StopItemTask(varMap,varPlayer)
				if varRet > 0 then
					DeliverItemListSendToPlayer(varMap,varPlayer)
					if DelItem(varMap,varPlayer,x570072_var_ItemId,x570072_var_ItemNum) ~= 1 then return 0 end
					if DelItem(varMap,varPlayer,x570072_var_ItemId1,x570072_var_ItemNum1) ~= 1 then return 0 end
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
		
function x570072_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x570072_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570072_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570072_CheckSubmit( varMap, varPlayer )

end




function x570072_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570072_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570072_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570072_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
