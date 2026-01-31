--兑换天传腰带
--DECLARE_QUEST_INFO_START--

x570031_var_FileId = 570031




x570031_var_QuestName="【龙眼石】兑换天传腰带"
x570031_var_EXCName = "兑换天传腰带"		
x570031_var_EXCItemName = "天之龙眼石"		
x570031_var_ItemId = 11050004        
x570031_var_ItemNum = 250              
x570031_var_ItemBonus	=	{{varId=10264004,varNum=1},{varId=10264014,varNum=1},{varId=10264024,varNum=1},{varId=10264034,varNum=1},{varId=10264044,varNum=1},{varId=10264054,varNum=1},{varId=10269221,varNum=1},{varId=10269225,varNum=1},{varId=10269229,varNum=1},{varId=10269233,varNum=1},{varId=10269237,varNum=1},{varId=10269241,varNum=1}}
x570031_var_QuestInfo = format("\t您确定要使用#G%s#W%s吗？\n\t将需要#R%d颗#W#G%s#W。",x570031_var_EXCItemName,x570031_var_EXCName,x570031_var_ItemNum,x570031_var_EXCItemName)	
x570031_var_QuestError = format("\t您没有足够数量的%s，无法%s。",x570031_var_EXCItemName,x570031_var_EXCName)	

--DECLARE_QUEST_INFO_STOP--

function x570031_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	local zhiye = GetZhiye(varMap, varPlayer)
	local longyannum = GetItemCount(varMap, varPlayer, x570031_var_ItemId)
	local varText = format("\t您现在有#R%d颗#W#G%s#W！",longyannum,x570031_var_EXCItemName)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570031_var_QuestName)
			TalkAppendString(varMap,x570031_var_QuestInfo)
			TalkAppendString(varMap,varText)
			AddQuestItemBonus(varMap, x570031_var_ItemBonus[zhiye+1].varId,x570031_var_ItemBonus[1].varNum)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570031_var_FileId,-1)

end


function x570031_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x570031_var_FileId,x570031_var_QuestName,3);
	
end




function x570031_ProcAccept( varMap, varPlayer )
	
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法兑换", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法兑换", 0, 3)
		return 0
	end
		
	local varNum = GetItemCount( varMap, varPlayer, x570031_var_ItemId )

	if varNum < x570031_var_ItemNum then 
		StartTalkTask(varMap)
			TalkAppendString(varMap,x570031_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end
	
	if varNum >= x570031_var_ItemNum then 

		local zhiye = GetZhiye(varMap, varPlayer)
		local weiyi = ItemIsUnique(varMap,varPlayer, x570031_var_ItemBonus[zhiye+1].varId)
		local have  = HaveItem( varMap,varPlayer,x570031_var_ItemBonus[zhiye+1].varId)
		
		if weiyi ~= 1  then
			StartItemTask(varMap)
				ItemAppend( varMap,x570031_var_ItemBonus[zhiye+1].varId,x570031_var_ItemBonus[1].varNum)
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				if DelItem(varMap,varPlayer,x570031_var_ItemId,x570031_var_ItemNum) ~= 1 then return 0 end
				DeliverItemListSendToPlayer(varMap,varPlayer)
			else
			StartTalkTask(varMap)
				TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			end	
		elseif weiyi == 1 then
			if have < 1 then
				StartItemTask(varMap)
					ItemAppend( varMap,x570031_var_ItemBonus[zhiye+1].varId,x570031_var_ItemBonus[1].varNum)
				local varRet = StopItemTask(varMap,varPlayer)
				if varRet > 0 then
					if DelItem(varMap,varPlayer,x570031_var_ItemId,x570031_var_ItemNum) ~= 1 then return 0 end
					DeliverItemListSendToPlayer(varMap,varPlayer)
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
		
function x570031_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end



function x570031_ProcQuestAbandon( varMap, varPlayer, varQuest )

end


function x570031_ProcContinue( varMap, varPlayer, varTalknpc )

end


function x570031_CheckSubmit( varMap, varPlayer )

end


function x570031_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end


function x570031_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end


function x570031_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end


function x570031_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
