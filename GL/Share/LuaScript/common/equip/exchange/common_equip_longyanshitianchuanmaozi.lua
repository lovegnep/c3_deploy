--兑换天传帽子
--DECLARE_QUEST_INFO_START--

x570029_var_FileId = 570029




x570029_var_QuestName = "【龙眼石】兑换天传帽子"   
x570029_var_EXCName = "兑换天传帽子"		
x570029_var_EXCItemName = "天之龙眼石"		
x570029_var_ItemId = 11050004	
x570029_var_ItemNum = 350				
x570029_var_ItemBonus = {{varId=10204004,varNum=1},{varId=10204014,varNum=1},{varId=10204024,varNum=1},{varId=10204034,varNum=1},{varId=10204044,varNum=1},{varId=10204054,varNum=1},{varId=10204064,varNum=1},{varId=10204074,varNum=1},{varId=10204084,varNum=1},{varId=10204094,varNum=1},{varId=10204104,varNum=1},{varId=10204114,varNum=1}}		
x570029_var_QuestInfo = format("\t您确定要使用#G%s#W%s吗？\n\t将需要#R%d颗#W#G%s#W。",x570029_var_EXCItemName,x570029_var_EXCName,x570029_var_ItemNum,x570029_var_EXCItemName)	
x570029_var_QuestError = format("\t您没有足够数量的%s，无法%s。",x570029_var_EXCItemName,x570029_var_EXCName)	

--DECLARE_QUEST_INFO_STOP--

function x570029_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	local zhiye = GetZhiye(varMap, varPlayer)
	local longyannum = GetItemCount(varMap, varPlayer, x570029_var_ItemId)
	local varText = format("\t您现在有#R%d颗#W#G%s#W！",longyannum,x570029_var_EXCItemName)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570029_var_QuestName)
			TalkAppendString(varMap,x570029_var_QuestInfo)
			TalkAppendString(varMap,varText)
			AddQuestItemBonus(varMap, x570029_var_ItemBonus[zhiye+1].varId,x570029_var_ItemBonus[1].varNum)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570029_var_FileId,-1)

end


function x570029_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x570029_var_FileId,x570029_var_QuestName,3);
	
end




function x570029_ProcAccept( varMap, varPlayer )
	
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法兑换", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法兑换", 0, 3)
		return 0
	end
		
	local varNum = GetItemCount( varMap, varPlayer, x570029_var_ItemId )

	if varNum < x570029_var_ItemNum then 
		StartTalkTask(varMap)
			TalkAppendString(varMap,x570029_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end
	
	if varNum >= x570029_var_ItemNum then 

		local zhiye = GetZhiye(varMap, varPlayer)
		local weiyi = ItemIsUnique(varMap,varPlayer, x570029_var_ItemBonus[zhiye+1].varId)
		local have  = HaveItem( varMap,varPlayer,x570029_var_ItemBonus[zhiye+1].varId)
		
		if weiyi ~= 1  then
			StartItemTask(varMap)
				ItemAppend( varMap,x570029_var_ItemBonus[zhiye+1].varId,x570029_var_ItemBonus[1].varNum)
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				if DelItem(varMap,varPlayer,x570029_var_ItemId,x570029_var_ItemNum) ~= 1 then return 0 end
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
					ItemAppend( varMap,x570029_var_ItemBonus[zhiye+1].varId,x570029_var_ItemBonus[1].varNum)
				local varRet = StopItemTask(varMap,varPlayer)
				if varRet > 0 then
					if DelItem(varMap,varPlayer,x570029_var_ItemId,x570029_var_ItemNum) ~= 1 then return 0 end
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
		
function x570029_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end



function x570029_ProcQuestAbandon( varMap, varPlayer, varQuest )

end


function x570029_ProcContinue( varMap, varPlayer, varTalknpc )

end


function x570029_CheckSubmit( varMap, varPlayer )

end


function x570029_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end


function x570029_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end


function x570029_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end


function x570029_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
