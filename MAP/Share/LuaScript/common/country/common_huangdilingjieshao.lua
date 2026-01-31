x300686_var_FileId = 300686

x300686_var_QuestName1="【皇帝政令说明】"

x300686_var_QuestInfo = "\t水能载舟，亦能覆舟。帝国的强盛跟每一位帝国成员都息息相关，在我这里你能够查询皇帝政令相关内容。"

x300686_var_QuestName2  = "【介绍】双倍令"
x300686_var_QuestName3  = "【介绍】魔军令"
x300686_var_QuestName4  = "【介绍】战神令"

	local Readme_1   = "#Y【介绍】双倍令#W#r"
	local Readme_2   = "\t由#G皇帝#W和#G柱国亲王#W发布，发布后全服所有人#G杀怪经验翻倍#W，每周一次，持续时间为60分钟。"
	x300686_var_QuestContent = Readme_1..Readme_2


	local Readme1_1 = "#Y【介绍】魔军令#r#W "			
	
	local Readme1_2 = "\t由#G皇帝#W发布，发布后沙城会刷新#G魔君BOSS#W，击杀后会有丰厚奖励，每周一次，持续时间为60分钟。"
	
	x300686_var_QuestContent1_1 = Readme1_1..Readme1_2


	local Readme2_1 = "#Y【介绍】战神令#r#W "			
	
	local Readme2_2 = "\t由#G皇帝#W和#G太师#W发布，发布后皇帝国成员可以去沙城皇帝管理员处领一个#G增益BUFF：战神加护#W，效果是#G减免3%#W所有伤害，并有神秘#G幸运效果#W。持续时间为从开启之时到当天24点。#r"		
	x300686_var_QuestContent2_1 = Readme2_1..Readme2_2

	



function x300686_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
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

	TalkAppendButton(varMap,x300686_var_FileId,x300686_var_QuestName1,0,1)
end


function x300686_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)

	
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
			TalkAppendString(varMap,"#Y"..x300686_var_QuestName1)
			TalkAppendString(varMap,x300686_var_QuestInfo)
			TalkAppendButton(varMap, x300686_var_FileId, x300686_var_QuestName2,13,2)
			TalkAppendButton(varMap, x300686_var_FileId, x300686_var_QuestName3,13,3)
			TalkAppendButton(varMap, x300686_var_FileId, x300686_var_QuestName4,13,4)
			--TalkAppendButton(varMap, x300686_var_FileId, x300686_var_QuestName5,13,5)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc)
	elseif varIndex == 2 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x300686_var_QuestContent)
			--TalkAppendString(varMap,x300686_var_QuestContent_1)
			TalkAppendButton(varMap, x300686_var_FileId, "返回上层",13,1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc)	
	elseif varIndex == 3 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x300686_var_QuestContent1_1)
			--TalkAppendString(varMap,x300686_var_QuestContent1_2)
			TalkAppendButton(varMap, x300686_var_FileId, "返回上层",13,1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc)
	elseif varIndex == 4 then
		StartTalkTask(varMap)
			TalkAppendString(varMap,x300686_var_QuestContent2_1)
			--TalkAppendString(varMap,x300686_var_QuestContent2_2)
			TalkAppendButton(varMap, x300686_var_FileId, "返回上层",13,1)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer,varTalknpc)
	
	end
end


function x300686_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end







function x300686_ProcAccept( varMap, varPlayer )
end




function x300686_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300686_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300686_CheckSubmit( varMap, varPlayer )

end




function x300686_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300686_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300686_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )

end




function x300686_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )

end



