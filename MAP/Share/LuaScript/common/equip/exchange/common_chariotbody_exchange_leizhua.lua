
--DECLARE_QUEST_INFO_START--

x570084_var_FileId = 570084   


-- 兑换目标道具名称
x570084_var_ExcObjName = "外装·黄金藏宝图"
-- 兑换目标道具ID
x570084_var_ExcObjID = 12035043
-- 兑换道具名称
x570084_var_ExcItemName = "黄金藏宝图碎片"
-- 兑换道具ID
x570084_var_ExcItemID = 12035017
-- 兑换道具需要数量
x570084_var_ExcItemNum = 1
x570084_var_MaxCount = 100

x570084_var_QuestName = format("【兑换】兑换%s",x570084_var_ExcObjName)
x570084_var_QuestInfo = format("\t您确定要使用#G%s兑换#W%s吗？\n\t将需要#R%d个#W#G%s#W。",x570084_var_ExcItemName,x570084_var_ExcObjName,x570084_var_ExcItemNum,x570084_var_ExcItemName)
x570084_var_QuestError = format("\t您没有足够数量的%s，无法兑换%s。",x570084_var_ExcItemName, x570084_var_ExcObjName)


--DECLARE_QUEST_INFO_STOP--



function x570084_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

	if seleteId == 888 then
		x570084_Accept( varMap, varPlayer )
	end
    if seleteId == 889 then
        for i=1 , 100  do
            x570084_Accept( varMap, varPlayer )
        end

    end

	local varItemNum = GetItemCount(varMap, varPlayer, x570084_var_ExcItemID)
	local varText = format("\t您现在有#R%d个#W#G%s#W！", varItemNum, x570084_var_ExcItemName)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570084_var_QuestName)
			TalkAppendString(varMap,x570084_var_QuestInfo)
			TalkAppendString(varMap,varText)
			TalkAppendString(varMap,format("每天限制兑换:%d次",x570084_var_MaxCount))
			TalkAppendButton( varMap, x570084_var_FileId, "确定", 1, 888 )
			TalkAppendButton( varMap, x570084_var_FileId, "兑换100次", 1, 889 )
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)

end


function x570084_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		TalkAppendButton(varMap,x570084_var_FileId,x570084_var_QuestName,3);
	
end

function x570084_ProcAccept( varMap, varPlayer )
end

function x570084_Accept( varMap, varPlayer )

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	local bind = 0
	
	local Num = GetItemCount( varMap, varPlayer, x570084_var_ExcItemID )

	if Num < x570084_var_ExcItemNum then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,x570084_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
		
		return 0
	end 
	
	----判断兑换次数-----------------------------------------------------------------
	local varDaycount = 0
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_DUIHUAN_WAIZHUANG_DAY[1], MD_DUIHUAN_WAIZHUANG_DAY[2], MD_DUIHUAN_WAIZHUANG_DAY[3])
	if varLastday == varToday then
		varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_DUIHUAN_WAIZHUANG_DAYCOUNT[1], MD_DUIHUAN_WAIZHUANG_DAYCOUNT[2], MD_DUIHUAN_WAIZHUANG_DAYCOUNT[3])
	end
	--********************************************************************	
	if varDaycount < x570084_var_MaxCount then 
	
		local Num = x570084_var_ExcItemNum
			for i=1 , Num  do 
				local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x570084_var_ExcItemID)
				 if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
				 	bind = 1
				 end
			if DelItem(varMap,varPlayer,x570084_var_ExcItemID,1) ~= 1 then return end
		end
		
		StartItemTask(varMap)
		
		if bind == 1 then
			ItemAppendBind( varMap, x570084_var_ExcObjID, 1)
		elseif bind == 0 then
			ItemAppendBind( varMap, x570084_var_ExcObjID, 1)
		end
		local varRet = StopItemTask(varMap,varPlayer)
		
		if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				Msg2Player(varMap, varPlayer,format("兑换完成,今日兑换次数:%d/%d",varDaycount+1,x570084_var_MaxCount),8,3)
				--设置兑换次数
				if varLastday ~= varToday then
					SetPlayerGameData(varMap, varPlayer, MD_DUIHUAN_WAIZHUANG_DAY[1], MD_DUIHUAN_WAIZHUANG_DAY[2], MD_DUIHUAN_WAIZHUANG_DAY[3], varToday)
					SetPlayerGameData(varMap, varPlayer, MD_DUIHUAN_WAIZHUANG_DAYCOUNT[1], MD_DUIHUAN_WAIZHUANG_DAYCOUNT[2], MD_DUIHUAN_WAIZHUANG_DAYCOUNT[3], 1)
				else
					SetPlayerGameData(varMap, varPlayer, MD_DUIHUAN_WAIZHUANG_DAYCOUNT[1], MD_DUIHUAN_WAIZHUANG_DAYCOUNT[2], MD_DUIHUAN_WAIZHUANG_DAYCOUNT[3], varDaycount+1)
				end					
				
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	else
		Msg2Player( varMap, varPlayer, format("你今天已经兑换过%d次了，请明天再来",x570084_var_MaxCount), 8, 3)
	end	
end
		
function x570084_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x570084_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570084_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570084_CheckSubmit( varMap, varPlayer )

end




function x570084_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570084_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570084_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570084_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
