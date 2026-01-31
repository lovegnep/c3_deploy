x300685_var_FileId = 300685

x300685_var_QuestName1="【国家政令说明】"

x300685_var_QuestInfo = "\t水能载舟，亦能覆舟。国家的强盛跟每一位国家成员都息息相关，在我这里你能够查询国家政令相关内容。"

x300685_var_QuestName2  = "【介绍】国运令"
x300685_var_QuestName3  = "【介绍】出国令"
x300685_var_QuestName4  = "【介绍】弱国令"
x300685_var_QuestName5  = "【介绍】战车令"

	local Readme_1   = "#Y【介绍】国运令#W#r"
	local Readme_2   = "\t由本国#G国王#W和#G右相#W发布，发布后#G黑金押运任务、官府押运任务、守边任务#W所获的奖励翻倍，每天一次，持续时间为90分钟，在开启弱国激励的服务器，则弱国的持续时间会有相应的增加。"
	x300685_var_QuestContent = Readme_1..Readme_2


	local Readme1_1 = "#Y【介绍】出国令#r#W "			
	
	local Readme1_2 = "\t由本国#G国王#W和#G大将军#W发布，发布后#G出国任务#W所获的奖励翻倍，每天一次，持续时间为90分钟，在开启弱国激励的服务器，则弱国的持续时间会有相应的增加。"
	
	x300685_var_QuestContent1_1 = Readme1_1..Readme1_2


	local Readme2_1 = "#Y【介绍】弱国令#r#W "			
	
	local Readme2_2 = "\t由本国#G国王#W和#G左丞#W发布，发布后本国成员能在#G国家管理员#W处接到弱国令任务，每天一次，持续时间为90分钟（如果国家在国家强弱榜分数过低，弱国令持续时间会有相应的增加）。只有当该国为#G弱国#W的时候才能开启弱国令。#r"
		
	x300685_var_QuestContent2_1 = Readme2_1..Readme2_2

	
	local Readme3_1 = "#Y【介绍】战车令：#W#r "
	
	local Readme3_2 = "\t由本国#G国王#W和#G右相#W发布，发布后在后花园的战车任务：#G争夺机甲，千里杀敌（同盟是与子同袍），军旗军魂#W所获得的奖励为平时三倍，每天一次，持续时间为90分钟，在开启弱国激励的服务器，则弱国的持续时间会有相应的增加。"
		
	x300685_var_QuestContent3_1 = Readme3_1..Readme3_2


function x300685_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
    if GetMergeDBToggle() == 1 then
        return
    end
    
    
		local UpdateDBflag = GetUpdateDBBeforeToggle()
		if UpdateDBflag==1 then
			return
		end
    
    
    
    
    

    
    if GetBattleSceneToggle( BATTLESCENE_TYPE_KINGBATTLE ) == 0 then
        return
    end

	TalkAppendButton(varMap,x300685_var_FileId,x300685_var_QuestName1,0,1)
end


function x300685_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)

	
    if GetMergeDBToggle() == 1 then
        return
    end
    
    
		local UpdateDBflag = GetUpdateDBBeforeToggle()
		if UpdateDBflag==1 then
			return
		end
    

    if GetBattleSceneToggle( BATTLESCENE_TYPE_KINGBATTLE ) == 0 then
        return
    end

	if varIndex == 1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x300685_var_QuestName1)
			TalkAppendString(varMap,x300685_var_QuestInfo)
			TalkAppendButton(varMap, x300685_var_FileId, x300685_var_QuestName2,13,2)
			TalkAppendButton(varMap, x300685_var_FileId, x300685_var_QuestName3,13,3)
			TalkAppendButton(varMap, x300685_var_FileId, x300685_var_QuestName4,13,4)
			TalkAppendButton(varMap, x300685_var_FileId, x300685_var_QuestName5,13,5)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc)
	elseif varIndex == 2 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x300685_var_QuestContent)
			--TalkAppendString(varMap,x300685_var_QuestContent_1)
			TalkAppendButton(varMap, x300685_var_FileId, "返回上层",13,1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc)	
	elseif varIndex == 3 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x300685_var_QuestContent1_1)
			--TalkAppendString(varMap,x300685_var_QuestContent1_2)
			TalkAppendButton(varMap, x300685_var_FileId, "返回上层",13,1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc)
	elseif varIndex == 4 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x300685_var_QuestContent2_1)
			--TalkAppendString(varMap,x300685_var_QuestContent2_2)
			TalkAppendButton(varMap, x300685_var_FileId, "返回上层",13,1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc)
	elseif varIndex == 5 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x300685_var_QuestContent3_1)
			--TalkAppendString(varMap,x300685_var_QuestContent3_2)
			TalkAppendButton(varMap, x300685_var_FileId, "返回上层",13,1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc)						
	end
end


function x300685_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end







function x300685_ProcAccept( varMap, varPlayer )
end




function x300685_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300685_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300685_CheckSubmit( varMap, varPlayer )

end




function x300685_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300685_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300685_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )

end




function x300685_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )

end



