
--DECLARE_QUEST_INFO_START--

x561001_var_FileId = 561001




x561001_var_MainName="增加仓库扩展空间说明"
x561001_var_QuestName="增加仓库扩展空间"
x561001_var_Readme = "\t增加仓库扩展空间需要花费一定的金额，增加第一页扩展空间需要花费#G200两#W银子，增加第二页扩展空间需要花费#G2锭#W银子！"
x561001_var_Notice1 = "\t您确定要扩展第一页扩展仓库吗？需要花费#G200两#W银子！"
x561001_var_Notice2 = "\t您确定要扩展第二页扩展仓库吗？需要花费#G2锭#W银子！"
x561001_var_Notice3 = "\t您的扩展仓库已经全部开启！"
x561001_var_Notice4 = "\t您的银子不足！无法完成增加扩展仓库操作！"
x561001_var_Notice5 = "\t操作完成！已增加了仓库的扩展空间！"

x561001_var_NeedMoney1 = 200000			
x561001_var_NeedMoney2 = 2000000		
x561001_var_BasicSize = 36


--DECLARE_QUEST_INFO_STOP--



function x561001_ProcEventEntry( varMap, varPlayer, varTalknpc,varScript,extid )	

	if extid == 1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x561001_var_MainName)
			TalkAppendString(varMap,x561001_var_Readme);
			TalkAppendString(varMap,x561001_var_Notice1);
		StopTalkTask(varMap)	
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, varScript, -1)
	elseif extid == 2 then
		StartTalkTask(varMap)	
			TalkAppendString(varMap,"#Y"..x561001_var_MainName)
			TalkAppendString(varMap,x561001_var_Readme);
			TalkAppendString(varMap,x561001_var_Notice2);
		StopTalkTask(varMap)	
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, varScript, -1)
	elseif extid == 3 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x561001_var_MainName)
			TalkAppendString(varMap,x561001_var_Readme);
			TalkAppendString(varMap,x561001_var_Notice3);
		StopTalkTask(varMap)	
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, varScript, -1)
	end
	x561001_SetSelected(varMap, varPlayer,extid)
		
end




function x561001_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local storesize = GetBankSize(varMap,varPlayer)
	
	if storesize == x561001_var_BasicSize then
		TalkAppendButton(varMap, x561001_var_FileId, x561001_var_QuestName,3,1)
	elseif storesize == x561001_var_BasicSize*2 then
		TalkAppendButton(varMap, x561001_var_FileId, x561001_var_QuestName,3,2)
	elseif storesize == x561001_var_BasicSize*3 then
		TalkAppendButton(varMap, x561001_var_FileId, x561001_var_QuestName,3,3)
	else
		return
	end

end




function x561001_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end





function x561001_GetSelected(varMap, varPlayer)
	return GetPlayerRuntimeData(varMap,varPlayer,RD_CANGKU_EXT)
end




function x561001_SetSelected(varMap, varPlayer, varFlag)
	SetPlayerRuntimeData(varMap,varPlayer,RD_CANGKU_EXT,varFlag)
end




function x561001_ProcAccept( varMap, varPlayer )

	local varFlag = x561001_GetSelected(varMap,varPlayer)

	if varFlag == 1 then 
		if IsEnoughMoney( varMap, varPlayer, x561001_var_NeedMoney1 ) == 0  then
			StartTalkTask(varMap,varPlayer)
				TalkAppendString(varMap,x561001_var_Notice4)
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
		else 
			SpendMoney( varMap, varPlayer, x561001_var_NeedMoney1 )
			
			ExpandBankSize(varMap,varPlayer,36)
			StartTalkTask(varMap,varPlayer)
				TalkAppendString(varMap,x561001_var_Notice5)
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
		end
	elseif varFlag == 2 then 
		if IsEnoughMoney( varMap, varPlayer, x561001_var_NeedMoney2 ) == 0  then
			StartTalkTask(varMap,varPlayer)
				TalkAppendString(varMap,x561001_var_Notice4)
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
		else 
			SpendMoney( varMap,varPlayer,x561001_var_NeedMoney2 )
			ExpandBankSize(varMap,varPlayer,36)
			StartTalkTask(varMap,varPlayer)
				TalkAppendString(varMap,x561001_var_Notice5)
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
		end
	elseif varFlag == 3 then 
		return
	end


end




function x561001_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x561001_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x561001_CheckSubmit( varMap, varPlayer )

end




function x561001_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x561001_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x561001_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x561001_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
