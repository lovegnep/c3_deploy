
--DECLARE_QUEST_INFO_START--

x570077_var_FileId = 570077




x570077_var_QuestName = "【锻造】冥炎洪荒主武器"   
x570077_var_EXCName = "锻造冥炎洪荒主武器"		
x570077_var_EXCItemName = "冥炎主手图谱"		
x570077_var_EXCItemName1 = "海蓝精铁"		
x570077_var_ItemId = 11000850	
x570077_var_ItemId1 = 11000860	
x570077_var_ItemNum = 1		
x570077_var_ItemNum1 = 10		
x570077_var_minlevel = 1 
x570077_var_ItemBonus = {
						{varId=10019855,varNum=1},
						{varId=10028855,varNum=1},
						{varId=10038855,varNum=1},
						{varId=10048855,varNum=1},
						{varId=10058855,varNum=1},
						{varId=10068855,varNum=1},
						{varId=10354202,varNum=1},
						{varId=10364202,varNum=1},
						{varId=10374202,varNum=1},
						{varId=10384202,varNum=1},
						{varId=10394202,varNum=1},
						{varId=10404202,varNum=1},
					  }	
x570077_var_QuestInfo = format("\t您确定要#W%s吗？\n\t将需要#R%d张#W#G%s#W和#R%d颗#W#G%s#W，兑换出来的装备为绑定装备。",x570077_var_EXCName,x570077_var_ItemNum,x570077_var_EXCItemName,x570077_var_ItemNum1,x570077_var_EXCItemName1)	
x570077_var_QuestError = format("\t您没有%s或没有足够数量的%s，无法%s。",x570077_var_EXCItemName,x570077_var_EXCItemName1,x570077_var_EXCName)	

--DECLARE_QUEST_INFO_STOP--



function x570077_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	local zhiye = GetZhiye(varMap, varPlayer)
	local tupunum = GetItemCount(varMap, varPlayer, x570077_var_ItemId)
	local baoshinum = GetItemCount(varMap, varPlayer, x570077_var_ItemId1)
	local varText = format("\t您现在有#R%d张#W#G%s#W和#R%d颗#W#G%s#W！",tupunum,x570077_var_EXCItemName,baoshinum,x570077_var_EXCItemName1)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570077_var_QuestName)
			TalkAppendString(varMap,x570077_var_QuestInfo)
			TalkAppendString(varMap,varText)
			AddQuestItemBonus(varMap, x570077_var_ItemBonus[zhiye+1].varId,x570077_var_ItemBonus[1].varNum)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570077_var_FileId,-1)

end




function x570077_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x570077_var_FileId,x570077_var_QuestName,3);
	
end






function x570077_ProcAccept( varMap, varPlayer )

	local Level =GetLevel(varMap, varPlayer)
	if Level < x570077_var_minlevel then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end		
	
	local Num = GetItemCount( varMap, varPlayer, x570077_var_ItemId )
	local Num1 = GetItemCount( varMap, varPlayer, x570077_var_ItemId1 )
	if Num < x570077_var_ItemNum and Num1 < x570077_var_ItemNum1 then 
		StartTalkTask(varMap)
		TalkAppendString(varMap,x570077_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end
	
	if Num >= x570077_var_ItemNum and Num1 >= x570077_var_ItemNum1 then 
		local zhiye = GetZhiye(varMap, varPlayer)
		local weiyi = ItemIsUnique(varMap,varPlayer, x570077_var_ItemBonus[zhiye+1].varId)
		local have  = HaveItem( varMap,varPlayer,x570077_var_ItemBonus[zhiye+1].varId)
		
		if weiyi ~= 1  then
			StartItemTask(varMap)
			ItemAppend( varMap,x570077_var_ItemBonus[zhiye+1].varId,x570077_var_ItemBonus[1].varNum)
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				if DelItem(varMap,varPlayer,x570077_var_ItemId,x570077_var_ItemNum) ~= 1 then return 0 end
				if DelItem(varMap,varPlayer,x570077_var_ItemId1,x570077_var_ItemNum1) ~= 1 then return 0 end
			else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			end	
		elseif weiyi == 1 then
			if have < 1 then
				StartItemTask(varMap)
				ItemAppend( varMap,x570077_var_ItemBonus[zhiye+1].varId,x570077_var_ItemBonus[1].varNum)
				local varRet = StopItemTask(varMap,varPlayer)
				if varRet > 0 then
					DeliverItemListSendToPlayer(varMap,varPlayer)
					if DelItem(varMap,varPlayer,x570077_var_ItemId,x570077_var_ItemNum) ~= 1 then return 0 end
					if DelItem(varMap,varPlayer,x570077_var_ItemId1,x570077_var_ItemNum1) ~= 1 then return 0 end
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
		
function x570077_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x570077_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570077_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570077_CheckSubmit( varMap, varPlayer )

end




function x570077_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570077_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570077_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570077_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
