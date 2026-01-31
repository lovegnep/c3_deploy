
--DECLARE_QUEST_INFO_START--

x570100_var_FileId = 570100   


-- 兑换目标道具名称
x570100_var_ExcObjName = "地中海原岩"
-- 兑换目标道具ID
x570100_var_ExcObjID = 11000951
-- 兑换道具名称
x570100_var_ExcItemName = "征服点数"
-- 兑换道具ID
--x570100_var_ExcItemID = 11000947
-- 兑换道具需要数量
x570100_var_ExcItemNum = 5

x570100_var_QuestName = format("【兑换】兑换%s",x570100_var_ExcObjName)
x570100_var_QuestInfo = format("\t您确定要使用#G%s兑换#W%s吗？\n\t每个%s将需要#R%d点#W#G%s#W。",x570100_var_ExcItemName,x570100_var_ExcObjName,x570100_var_ExcObjName,x570100_var_ExcItemNum,x570100_var_ExcItemName)
x570100_var_QuestError = format("\t您没有足够数量的%s，无法兑换%s。",x570100_var_ExcItemName, x570100_var_ExcObjName)


--DECLARE_QUEST_INFO_STOP--



function x570100_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	if seleteId >= 888 and seleteId <= 890 then
		x570100_Accept( varMap, varPlayer,seleteId )
	end
	local varMeiLi = GetHotValue( varMap, varPlayer)
	local varText = format("\t您现在有#R%d点#W#G%s#W！", varMeiLi, x570100_var_ExcItemName)
	local varOnetext ="兑换1个地中海原岩"
	local varFivetext ="兑换5个地中海原岩"
	local varAlltext =format("全部兑换地中海原岩[%d个]", floor(varMeiLi/5))
	if varMeiLi < 25 then
		 varFivetext ="#d兑换5个地中海原岩"
	end
	if varMeiLi < 5 then
		 varOnetext ="#d兑换1个地中海原岩"
		 varAlltext =format("#d全部兑换地中海原岩[%d个]", floor(varMeiLi/5))
	end		 
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570100_var_QuestName)
			TalkAppendString(varMap,x570100_var_QuestInfo)
			TalkAppendString(varMap,varText)
			TalkAppendButton( varMap, x570100_var_FileId, varOnetext, 1, 888 )
			TalkAppendButton( varMap, x570100_var_FileId, varFivetext, 1, 889 )
			TalkAppendButton( varMap, x570100_var_FileId, varAlltext, 1, 890 )
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)

end


function x570100_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x570100_var_FileId,x570100_var_QuestName,3);
	
end

function x570100_ProcAccept( varMap, varPlayer )
end

function x570100_Accept( varMap, varPlayer, varSeleteId )

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	
--判断魅力值是否足够 --判断兑换数量
	local varMeiLi = GetHotValue( varMap, varPlayer)
	local varNum =0
	if varSeleteId == 888 then
		if varMeiLi < 5 then
				Msg2Player(varMap, varPlayer,"征服点数不足，不能进行兑换",8,3)
				return 0
		else
				varNum =1			
		end		
	elseif varSeleteId == 889 then
		if varMeiLi < 25 then
				Msg2Player(varMap, varPlayer,"征服点数不足，不能进行兑换",8,3)		
				return 0
		else
				varNum =5						
		end			
	elseif varSeleteId == 890 then
		if varMeiLi < 5 then
				Msg2Player(varMap, varPlayer,"征服点数不足，不能进行兑换",8,3)		
				return 0
		else
				varNum =floor(varMeiLi/5)
		end			
	else 
		return 0
	end		





		
		StartItemTask(varMap)
		

			ItemAppend( varMap, x570100_var_ExcObjID, varNum)

		local varRet = StopItemTask(varMap,varPlayer)
		
		if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				SetHotValue(varMap, varPlayer,varMeiLi-varNum*5)
				local varTextok = format("兑换完成获得%d个#s", varNum, x570100_var_ExcObjName)
				Msg2Player(varMap, varPlayer,"兑换完成",8,3)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end

end
		
function x570100_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x570100_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570100_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570100_CheckSubmit( varMap, varPlayer )

end




function x570100_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570100_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570100_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570100_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
