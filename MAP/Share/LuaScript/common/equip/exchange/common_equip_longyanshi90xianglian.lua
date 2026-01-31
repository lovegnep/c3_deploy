--兑换90级项链
--DECLARE_QUEST_INFO_START--

x570008_var_FileId = 570008




x570008_var_QuestName = "【龙眼石】兑换神传项链"
x570008_var_EXCName = "兑换神传项链"		
x570008_var_EXCItemName = "高级龙眼石"		
x570008_var_ItemId = 11050003           
x570008_var_ItemNum = 140                   
x570008_var_ItemBonus =	{{varId=10244003,varNum=1},{varId=10244013,varNum=1},{varId=10244023,varNum=1},{varId=10244033,varNum=1},{varId=10244043,varNum=1},{varId=10244053,varNum=1},{varId=10249220,varNum=1},{varId=10249224,varNum=1},{varId=10249228,varNum=1},{varId=10249232,varNum=1},{varId=10249236,varNum=1},{varId=10249240,varNum=1}}
x570008_var_QuestInfo = format("\t您确定要使用#G%s#W%s吗？\n\t将需要#R%d颗#W#G%s#W。",x570008_var_EXCItemName,x570008_var_EXCName,x570008_var_ItemNum,x570008_var_EXCItemName)	
x570008_var_QuestError = format("\t您没有足够数量的%s，无法%s。",x570008_var_EXCItemName,x570008_var_EXCName)	

--DECLARE_QUEST_INFO_STOP--

function x570008_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	local zhiye = GetZhiye(varMap, varPlayer)
	local longyannum = GetItemCount(varMap, varPlayer, x570008_var_ItemId)
	local varText = format("\t您现在有#R%d颗#W#G%s#W！",longyannum,x570008_var_EXCItemName)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570008_var_QuestName)
			TalkAppendString(varMap,x570008_var_QuestInfo)
			TalkAppendString(varMap,varText)
			AddQuestItemBonus(varMap, x570008_var_ItemBonus[zhiye+1].varId,x570008_var_ItemBonus[1].varNum)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570008_var_FileId,-1)

end


function x570008_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x570008_var_FileId,x570008_var_QuestName,3);
	
end




function x570008_ProcAccept( varMap, varPlayer )
	
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法兑换", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法兑换", 0, 3)
		return 0
	end
		
	local varNum = GetItemCount( varMap, varPlayer, x570008_var_ItemId )

	if varNum < x570008_var_ItemNum then 
		StartTalkTask(varMap)
			TalkAppendString(varMap,x570008_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end
	
	if varNum >= x570008_var_ItemNum then 

		local zhiye = GetZhiye(varMap, varPlayer)
		local weiyi = ItemIsUnique(varMap,varPlayer, x570008_var_ItemBonus[zhiye+1].varId)
		local have  = HaveItem( varMap,varPlayer,x570008_var_ItemBonus[zhiye+1].varId)
		
		if weiyi ~= 1  then
			StartItemTask(varMap)
				ItemAppend( varMap,x570008_var_ItemBonus[zhiye+1].varId,x570008_var_ItemBonus[1].varNum)
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				if DelItem(varMap,varPlayer,x570008_var_ItemId,x570008_var_ItemNum) ~= 1 then return 0 end
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
					ItemAppend( varMap,x570008_var_ItemBonus[zhiye+1].varId,x570008_var_ItemBonus[1].varNum)
				local varRet = StopItemTask(varMap,varPlayer)
				if varRet > 0 then
					if DelItem(varMap,varPlayer,x570008_var_ItemId,x570008_var_ItemNum) ~= 1 then return 0 end
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
		
function x570008_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end



function x570008_ProcQuestAbandon( varMap, varPlayer, varQuest )

end


function x570008_ProcContinue( varMap, varPlayer, varTalknpc )

end


function x570008_CheckSubmit( varMap, varPlayer )

end


function x570008_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end


function x570008_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end


function x570008_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end


function x570008_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
