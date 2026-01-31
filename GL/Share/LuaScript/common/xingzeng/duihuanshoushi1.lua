--兑换天·红颜指环
--DECLARE_QUEST_INFO_START--

x588026_var_FileId = 588026




x588026_var_QuestName = "【永恒之心】兑换天·红颜指环"   
x588026_var_EXCName = "兑换天·红颜指环"		
x588026_var_EXCItemName = "永恒之心"		
x588026_var_ItemId = 11000331	
x588026_var_ItemNum = 10				
x588026_var_ItemBonus = {{varId=10287365,varNum=1},{varId=10287365,varNum=1},{varId=10287365,varNum=1},{varId=10287365,varNum=1},{varId=10287365,varNum=1},{varId=10287365,varNum=1},{varId=10287365,varNum=1},{varId=10287365,varNum=1},{varId=10287365,varNum=1},{varId=10287365,varNum=1},{varId=10287365,varNum=1},{varId=10287365,varNum=1}}		
x588026_var_QuestInfo = format("\t您确定要使用#G%s#W%s吗？\n\t将需要#R%d颗#W#G%s#W。",x588026_var_EXCItemName,x588026_var_EXCName,x588026_var_ItemNum,x588026_var_EXCItemName)	
x588026_var_QuestError = format("\t您没有足够数量的%s，无法%s。",x588026_var_EXCItemName,x588026_var_EXCName)	

--DECLARE_QUEST_INFO_STOP--

function x588026_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	local zhiye = GetZhiye(varMap, varPlayer)
	local longyannum = GetItemCount(varMap, varPlayer, x588026_var_ItemId)
	local varText = format("\t您现在有#R%d颗#W#G%s#W！",longyannum,x588026_var_EXCItemName)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x588026_var_QuestName)
			TalkAppendString(varMap,x588026_var_QuestInfo)
			TalkAppendString(varMap,varText)
			AddQuestItemBonus(varMap, x588026_var_ItemBonus[zhiye+1].varId,x588026_var_ItemBonus[1].varNum)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x588026_var_FileId,-1)

end


function x588026_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x588026_var_FileId,x588026_var_QuestName,3);
	
end




function x588026_ProcAccept( varMap, varPlayer )
	
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法兑换", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法兑换", 0, 3)
		return 0
	end
		
	local varNum = GetItemCount( varMap, varPlayer, x588026_var_ItemId )

	if varNum < x588026_var_ItemNum then 
		StartTalkTask(varMap)
			TalkAppendString(varMap,x588026_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end
	
	if varNum >= x588026_var_ItemNum then 

		local zhiye = GetZhiye(varMap, varPlayer)
		local weiyi = ItemIsUnique(varMap,varPlayer, x588026_var_ItemBonus[zhiye+1].varId)
		local have  = HaveItem( varMap,varPlayer,x588026_var_ItemBonus[zhiye+1].varId)
		
		if weiyi ~= 1  then
			StartItemTask(varMap)
				ItemAppend( varMap,x588026_var_ItemBonus[zhiye+1].varId,x588026_var_ItemBonus[1].varNum)
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				if DelItem(varMap,varPlayer,x588026_var_ItemId,x588026_var_ItemNum) ~= 1 then return 0 end
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
					ItemAppend( varMap,x588026_var_ItemBonus[zhiye+1].varId,x588026_var_ItemBonus[1].varNum)
				local varRet = StopItemTask(varMap,varPlayer)
				if varRet > 0 then
					if DelItem(varMap,varPlayer,x588026_var_ItemId,x588026_var_ItemNum) ~= 1 then return 0 end
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
		
function x588026_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end



function x588026_ProcQuestAbandon( varMap, varPlayer, varQuest )

end


function x588026_ProcContinue( varMap, varPlayer, varTalknpc )

end


function x588026_CheckSubmit( varMap, varPlayer )

end


function x588026_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end


function x588026_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end


function x588026_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end


function x588026_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
