
--DECLARE_QUEST_INFO_START--

x570102_var_FileId = 570102   

x570102_var_ExcObjName0="圣徒级大师级龙晶"
-- 兑换目标道具名称
x570102_var_ExcObjName =  {"不绑定的圣徒级红龙晶","不绑定的圣徒级红龙晶","不绑定的圣徒级绿龙晶","不绑定的圣徒级绿龙晶","不绑定的圣徒级黄龙晶","不绑定的圣徒级黄龙晶","不绑定的圣徒级蓝龙晶","不绑定的圣徒级蓝龙晶"}
-- 兑换目标道具ID
x570102_var_ExcObjID = {14010017,14010018,14020017,14020018,14030017,14030018,14040017,14040018}
-- 兑换道具名称
x570102_var_ExcItemName = {"圣徒级红龙晶","大师级红龙晶","圣徒级绿龙晶","大师级绿龙晶","圣徒级黄龙晶","大师级黄龙晶","圣徒级蓝龙晶","大师级蓝龙晶"}

-- 兑换道具ID
x570102_var_ExcItemID = {14010017,14010018,14020017,14020018,14030017,14030018,14040017,14040018}
-- 兑换道具需要数量
x570102_var_ExcItemNum = 1

x570102_var_QuestName = format("【兑换】%s",x570102_var_ExcObjName0)



--DECLARE_QUEST_INFO_STOP--



function x570102_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	if seleteId <= 8 then
		x570102_Accept( varMap, varPlayer,seleteId )
	end
	
	if seleteId == 100 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570102_var_QuestName)
			TalkAppendString(varMap,"\t您背包中如果有绑定的#G"..x570102_var_ExcItemName[1].."#W或绑定的#G"..x570102_var_ExcItemName[2].."#W或绑定的#G"..x570102_var_ExcItemName[3].."#W或绑定的#G"..x570102_var_ExcItemName[4].."#W或绑定的#G"..x570102_var_ExcItemName[5].."#W或绑定的#G"..x570102_var_ExcItemName[6].."#W或绑定的#G"..x570102_var_ExcItemName[7].."#W或绑定的#G"..x570102_var_ExcItemName[8].."#W可以在这里进行兑换解绑。\n \n\t您要兑换解绑哪种宝石？")
			TalkAppendButton( varMap, x570102_var_FileId, "兑换圣徒级宝石", 1, 50 )
			TalkAppendButton( varMap, x570102_var_FileId, "兑换大师级宝石", 1, 51 )
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end


	if seleteId == 50 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570102_var_QuestName)
			TalkAppendString(varMap,"\t您背包中如果有绑定的#G"..x570102_var_ExcItemName[1].."#W或绑定的#G"..x570102_var_ExcItemName[2].."#W或绑定的#G"..x570102_var_ExcItemName[3].."#W或绑定的#G"..x570102_var_ExcItemName[4].."#W或绑定的#G"..x570102_var_ExcItemName[5].."#W或绑定的#G"..x570102_var_ExcItemName[6].."#W或绑定的#G"..x570102_var_ExcItemName[7].."#W或绑定的#G"..x570102_var_ExcItemName[8].."#W可以在这里进行兑换解绑。\n \n\t您要兑换解绑哪种宝石？")
			TalkAppendButton( varMap, x570102_var_FileId, "兑换"..x570102_var_ExcItemName[1], 1, 1 )
			TalkAppendButton( varMap, x570102_var_FileId, "兑换"..x570102_var_ExcItemName[3], 1, 3 )
			TalkAppendButton( varMap, x570102_var_FileId, "兑换"..x570102_var_ExcItemName[5], 1, 5 )
			TalkAppendButton( varMap, x570102_var_FileId, "兑换"..x570102_var_ExcItemName[7], 1, 7 )
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	elseif seleteId == 51 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570102_var_QuestName)
			TalkAppendString(varMap,"\t您背包中如果有绑定的#G"..x570102_var_ExcItemName[1].."#W或绑定的#G"..x570102_var_ExcItemName[2].."#W或绑定的#G"..x570102_var_ExcItemName[3].."#W或绑定的#G"..x570102_var_ExcItemName[4].."#W或绑定的#G"..x570102_var_ExcItemName[5].."#W或绑定的#G"..x570102_var_ExcItemName[6].."#W或绑定的#G"..x570102_var_ExcItemName[7].."#W或绑定的#G"..x570102_var_ExcItemName[8].."#W可以在这里进行兑换解绑。\n \n\t您要兑换解绑哪种宝石？")
			TalkAppendButton( varMap, x570102_var_FileId, "兑换"..x570102_var_ExcItemName[2], 1, 2 )
			TalkAppendButton( varMap, x570102_var_FileId, "兑换"..x570102_var_ExcItemName[4], 1, 4 )
			TalkAppendButton( varMap, x570102_var_FileId, "兑换"..x570102_var_ExcItemName[6], 1, 6 )
			TalkAppendButton( varMap, x570102_var_FileId, "兑换"..x570102_var_ExcItemName[8], 1, 8 )
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end


end


function x570102_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x570102_var_FileId,x570102_var_QuestName,3,100);
	
end

function x570102_ProcAccept( varMap, varPlayer )
end

function x570102_Accept( varMap, varPlayer, seleteId )

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	
	local Num = GetItemCount( varMap, varPlayer, x570102_var_ExcItemID[seleteId] )
	if Num < x570102_var_ExcItemNum then -- 道具数量不足
		local str = format("\t您没有%s，无法进行兑换",x570102_var_ExcItemName[seleteId])
		StartTalkTask(varMap)
		TalkAppendString(varMap,str)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		return
	end
	
	local num = 0	
	for i =0, 96 do 
		local ItemId =GetItemIDByIndexInBag(varMap, varPlayer, i)
		if ItemId >= 0 then
			if (IsItemBind(varMap, varPlayer, i) == 1) and (ItemId == x570102_var_ExcItemID[seleteId]) then
				 if EraseItem(varMap,varPlayer,i) ~= 1 then
				  return
				 end
				 num = num + 1
				 StartItemTask(varMap)
				 ItemAppend( varMap, x570102_var_ExcObjID[seleteId], 1)
				 local varRet = StopItemTask(varMap,varPlayer)
				 if varRet > 0 then
					DeliverItemListSendToPlayer(varMap,varPlayer)
				 else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"物品栏已满，无法获得物品！")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
				 end
			end
		end
	end 
	if num > 0 then
		local str = format("完成兑换#R"..num.."#cffcf00个@item_"..x570102_var_ExcItemID[seleteId])
		Msg2Player(varMap, varPlayer,str,8,3) 
	else
		Msg2Player(varMap, varPlayer,"您没有绑定的"..x570102_var_ExcItemName[seleteId].."，无法进行兑换",8,3)  
	end                                          

end
		
function x570102_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x570102_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570102_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570102_CheckSubmit( varMap, varPlayer )

end




function x570102_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570102_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570102_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570102_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
