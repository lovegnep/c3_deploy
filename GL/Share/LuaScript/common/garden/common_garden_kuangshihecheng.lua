
--DECLARE_QUEST_INFO_START--

x800204_var_FileId = 800204





x800204_var_QuestName = "#c910000黄铜矿#c030302熔炼#c910000耀铜矿"   
x800204_var_EXCName = "熔炼耀铜矿"		
x800204_var_EXCItemName = "黄铜矿"		
x800204_var_CostitemId = 12271409	
x800204_var_CostitemNum ={72,216,360}
x800204_var_ItemId = 12271410	
x800204_var_ItemNum = {1,3,5}			
x800204_var_QuestError = format("\t您没有足够数量的%s，无法%s。",x800204_var_EXCItemName,x800204_var_EXCName)	

--DECLARE_QUEST_INFO_STOP--



function x800204_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExt)	

	if varExt==nil then
		return
	end

	if varExt==0 then

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800204_var_QuestName)
			TalkAppendString(varMap,"\t72块黄铜矿才可以熔炼出1块耀铜矿，请准备好足够数量的黄铜矿。\n \n\t#R熔炼出的耀铜矿是绑定的！")
			
				TalkAppendButton(varMap, varQuest, "我要熔炼#R1#c030302块耀铜矿",3,1);
				TalkAppendButton(varMap, varQuest, "我要熔炼#R3#c030302块耀铜矿",3,2);
				TalkAppendButton(varMap, varQuest, "我要熔炼#R5#c030302块耀铜矿",3,3);

		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc, x800204_var_FileId, varQuest);


	end

	if varExt==1 or varExt==2 or varExt==3  then
		x800204_DispatchExchangeInfo( varMap, varPlayer, varTalknpc,varExt )
	end
end



function x800204_DispatchExchangeInfo( varMap, varPlayer, varTalknpc, varExt )
        
	
	if varExt==1 then
		StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y"..x800204_var_QuestName)
		TalkAppendString(varMap,format("\t你要用%d块#G黄铜矿#W熔炼%d块#G耀铜矿#W吗？\n\t#R熔炼出的耀铜矿是绑定的！", 72,1))
		AddQuestItemBonus(varMap, x800204_var_ItemId,1)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x800204_var_FileId, -1);
		x800204_SetSelected(varMap, varPlayer, varExt)
	elseif varExt==2 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x800204_var_QuestName)
		TalkAppendString(varMap,format("\t你要用%d块#G黄铜矿#W熔炼%d块#G耀铜矿#W吗？\n\t#R熔炼出的耀铜矿是绑定的！", 216,3))
		AddQuestItemBonus(varMap, x800204_var_ItemId,3)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x800204_var_FileId, -1);
	    x800204_SetSelected(varMap, varPlayer, varExt)
	elseif varExt==3 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x800204_var_QuestName)
		TalkAppendString(varMap,format("\t你要用%d块#G黄铜矿#W熔炼%d块#G耀铜矿#W吗？\n\t#R熔炼出的耀铜矿是绑定的！", 360,5))
		AddQuestItemBonus(varMap, x800204_var_ItemId,5)
		StopTalkTask()
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, x800204_var_FileId, -1);
	    x800204_SetSelected(varMap, varPlayer, varExt)


	end	
end




function x800204_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x800204_var_FileId,x800204_var_QuestName,3);
	
end





function x800204_ProcAccept( varMap, varPlayer ,varExt)

	local varExt = x800204_GetSelected(varMap, varPlayer)
	if varExt==1 then
		varIndex = 1;
	elseif varExt==2 then
		varIndex = 2;
	elseif varExt==3 then
		varIndex = 3;


	else
		return
	end
	local Num = GetItemCount( varMap, varPlayer, x800204_var_CostitemId )
    local weiyi = ItemIsUnique(varMap,varPlayer, x800204_var_ItemId)
	local have  = HaveItem( varMap,varPlayer,x800204_var_ItemId)
 
	if Num < x800204_var_CostitemNum[varIndex] then 
		StartTalkTask(varMap)
			TalkAppendString(varMap,x800204_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end
	
	if Num >= x800204_var_CostitemNum[varIndex] then 
		
			StartItemTask(varMap)
			ItemAppendBind( varMap,x800204_var_ItemId,x800204_var_ItemNum[varIndex])
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				if DelItem(varMap,varPlayer,x800204_var_CostitemId,x800204_var_CostitemNum[varIndex]) ~= 1 then return 0 end
				StartTalkTask(varMap)
					TalkAppendString(varMap,"熔炼完成！")
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
				ItemAppendBind( varMap,x800204_var_ItemId,x800204_var_ItemNum[varIndex])
				local varRet = StopItemTask(varMap,varPlayer)
				if varRet > 0 then
					DeliverItemListSendToPlayer(varMap,varPlayer)
					if DelItem(varMap,varPlayer,x800204_var_CostitemId,x800204_var_CostitemNum[varIndex]) ~= 1 then return 0 end
				else
				StartTalkTask(varMap)
					TalkAppendString(varMap,"物品栏已满，无法获得物品！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				end	
			else
				StartTalkTask(varMap)
					TalkAppendString(varMap,"您无法熔炼更多的耀铜矿！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end	
		end
	end
		
function x800204_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x800204_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800204_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800204_CheckSubmit( varMap, varPlayer )

end




function x800204_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800204_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800204_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800204_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end



function x800204_GetSelected(varMap, varPlayer)
	return GetPlayerRuntimeData(varMap, varPlayer, RD_COMMON_NPCID )
end





function x800204_SetSelected(varMap, varPlayer, varFlag)
	SetPlayerRuntimeData(varMap, varPlayer, RD_COMMON_NPCID, varFlag)
end
