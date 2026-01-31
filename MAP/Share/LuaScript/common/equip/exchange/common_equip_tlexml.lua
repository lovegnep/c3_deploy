
--DECLARE_QUEST_INFO_START--

x570050_var_FileId = 570050




x570050_var_QuestName = "【龙眼石】兑换冥之龙眼石"   
x570050_var_EXCName = "兑换冥之龙眼石"		
x570050_var_EXCItemName = "天之龙眼石"		
x570050_var_CostitemId = 11050004	
x570050_var_CostitemNum ={3,15,30,150,300} 				
x570050_var_ItemId = 11050005	
x570050_var_ItemNum = {1,5,10,50,100}				
x570050_var_QuestError = format("\t您没有足够数量的%s，无法%s。",x570050_var_EXCItemName,x570050_var_EXCName)	

--DECLARE_QUEST_INFO_STOP--



function x570050_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExt)	

	if varExt==nil then
		return
	end

	if varExt==0 then

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x570050_var_QuestName)
			TalkAppendString(varMap,"\t在我这里，你可以将天之龙眼石兑换为冥之龙眼石。3颗天之龙眼石可以兑换1颗冥之龙眼石。\n\t#R兑换的冥之龙眼石是绑定的！")
			
				TalkAppendButton(varMap, varQuest, "我要兑换1颗",3,1);
				TalkAppendButton(varMap, varQuest, "我要兑换5颗",3,2);
				TalkAppendButton(varMap, varQuest, "我要兑换10颗",3,3);
				TalkAppendButton(varMap, varQuest, "我要兑换50颗",3,4);
				TalkAppendButton(varMap, varQuest, "我要兑换100颗",3,5);

		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc, x570050_var_FileId, varQuest);


	end

	if varExt==1 or varExt==2 or varExt==3 or varExt==4 or varExt==5 then
		x570050_DispatchExchangeInfo( varMap, varPlayer, varTalknpc,varExt )
	end
end



function x570050_DispatchExchangeInfo( varMap, varPlayer, varTalknpc, varExt )
        
	
	if varExt==1 then
		StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y"..x570050_var_QuestName)
		TalkAppendString(varMap,format("\t你要用%d颗#G天之龙眼石#W换取%d颗#G冥之龙眼石#W吗？\n\t#R兑换的冥之龙眼石是绑定的！", 3,1))
		AddQuestItemBonus(varMap, x570050_var_ItemId,1)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570050_var_FileId, -1);
		x570050_SetSelected(varMap, varPlayer, varExt)
	elseif varExt==2 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x570050_var_QuestName)
		TalkAppendString(varMap,format("\t你要用%d颗#G天之龙眼石#W换取%d颗#G冥之龙眼石#W吗？\n\t#R兑换的冥之龙眼石是绑定的！", 15,5))
		AddQuestItemBonus(varMap, x570050_var_ItemId,5)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570050_var_FileId, -1);
	    x570050_SetSelected(varMap, varPlayer, varExt)
	elseif varExt==3 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x570050_var_QuestName)
		TalkAppendString(varMap,format("\t你要用%d颗#G天之龙眼石#W换取%d颗#G冥之龙眼石#W吗？\n\t#R兑换的冥之龙眼石是绑定的！", 30,10))
		AddQuestItemBonus(varMap, x570050_var_ItemId,10)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570050_var_FileId, -1);
	    x570050_SetSelected(varMap, varPlayer, varExt)
	elseif varExt==4 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x570050_var_QuestName)
		TalkAppendString(varMap,format("\t你要用%d颗#G天之龙眼石#W换取%d颗#G冥之龙眼石#W吗？\n\t#R兑换的冥之龙眼石是绑定的！", 150,50))
		AddQuestItemBonus(varMap, x570050_var_ItemId,50)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570050_var_FileId, -1);
	    x570050_SetSelected(varMap, varPlayer, varExt)
	elseif varExt==5 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x570050_var_QuestName)
		TalkAppendString(varMap,format("\t你要用%d颗#G天之龙眼石#W换取%d颗#G冥之龙眼石#W吗？\n\t#R兑换的冥之龙眼石是绑定的！", 300,100))
		AddQuestItemBonus(varMap, x570050_var_ItemId,100)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x570050_var_FileId, -1);
	    x570050_SetSelected(varMap, varPlayer, varExt)

	end	
end




function x570050_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x570050_var_FileId,x570050_var_QuestName,3);
	
end





function x570050_ProcAccept( varMap, varPlayer ,varExt)

	local varExt = x570050_GetSelected(varMap, varPlayer)
	if varExt==1 then
		varIndex = 1;
	elseif varExt==2 then
		varIndex = 2;
	elseif varExt==3 then
		varIndex = 3;
	elseif varExt==4 then
		varIndex = 4;
	elseif varExt==5 then
		varIndex = 5;

	else
		return
	end
	local Num = GetItemCount( varMap, varPlayer, x570050_var_CostitemId )
    local weiyi = ItemIsUnique(varMap,varPlayer, x570050_var_ItemId)
	local have  = HaveItem( varMap,varPlayer,x570050_var_ItemId)
 
	if Num < x570050_var_CostitemNum[varIndex] then 
		StartTalkTask(varMap)
			TalkAppendString(varMap,x570050_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end
	
	if Num >= x570050_var_CostitemNum[varIndex] then 
		
			StartItemTask(varMap)
			ItemAppendBind( varMap,x570050_var_ItemId,x570050_var_ItemNum[varIndex])
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				if DelItem(varMap,varPlayer,x570050_var_CostitemId,x570050_var_CostitemNum[varIndex]) ~= 1 then return 0 end
				StartTalkTask(varMap)
					TalkAppendString(varMap,"兑换完成！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
                
			else
				StartTalkTask(varMap)
					TalkAppendString(varMap,"物品栏已满，无法获得物品！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end	
		elseif weiyi == 1 then
			if have < 1 then
				StartItemTask(varMap)
				ItemAppendBind( varMap,x570050_var_ItemId,x570050_var_ItemNum[varIndex])
				local varRet = StopItemTask(varMap,varPlayer)
				if varRet > 0 then
					DeliverItemListSendToPlayer(varMap,varPlayer)
					if DelItem(varMap,varPlayer,x570050_var_CostitemId,x570050_var_CostitemNum[varIndex]) ~= 1 then return 0 end
				else
				StartTalkTask(varMap)
					TalkAppendString(varMap,"物品栏已满，无法获得物品！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				end	
			else
				StartTalkTask(varMap)
					TalkAppendString(varMap,"您无法兑换更多的冥之龙眼石！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end	
		end
	end
		
function x570050_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x570050_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x570050_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x570050_CheckSubmit( varMap, varPlayer )

end




function x570050_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x570050_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x570050_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x570050_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end



function x570050_GetSelected(varMap, varPlayer)
	return GetPlayerRuntimeData(varMap, varPlayer, RD_COMMON_NPCID )
end





function x570050_SetSelected(varMap, varPlayer, varFlag)
	SetPlayerRuntimeData(varMap, varPlayer, RD_COMMON_NPCID, varFlag)
end
