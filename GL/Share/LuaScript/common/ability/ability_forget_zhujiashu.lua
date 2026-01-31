
x540014_var_FileId = 540014

x540014_var_AbilityName = "罗马铸甲术"
x540014_var_QuestName = "遗忘"..x540014_var_AbilityName
x540014_var_ContinueInfo="\t制造系生活技能分为六种：中原草药术、印度珠宝术、蒙古驯马术、突厥锻造术、罗马铸甲术、波斯工艺术。\n\t你最多学习其中三种制造系生活技能。如果你已经学满三种制造技能，又希望学习新的制造技能，可以到我这里遗忘"..x540014_var_AbilityName.."。\n\t遗忘技能后本生活技能相应称号也会消失，你希望遗忘"..x540014_var_AbilityName.."吗？"
x540014_var_TitleId = 85


x540014_var_Title_Quest_FileId = 3614

function x540014_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )
	
	TalkAppendButton(varMap, x540014_var_FileId, x540014_var_QuestName, 3)
		
end

function x540014_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varIndex )
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x540014_var_QuestName)
		TalkAppendString(varMap,x540014_var_ContinueInfo)
	StopTalkTask()
	
	DeliverTalkInfo(varMap,varPlayer,-1,x540014_var_FileId,-1)
	SetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID,0)
	return
end




function x540014_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end

function x540014_ProcAccept( varMap, varPlayer )
	
	local varStep = GetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID)
	
	if 0 == varStep then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"遗忘后技能等级无法恢复,您确定要遗忘罗马铸甲术吗?")
		StopTalkTask()
		SetPlayerRuntimeData(varMap,varPlayer,RD_COMMON_NPCID,1)
		DeliverTalkInfo(varMap,varPlayer,-1,x540014_var_FileId,-1)
	elseif 1 == varStep then
		local varLifeSkillLevel = QueryPlayerAbility( varMap, varPlayer, 3 )
		if varLifeSkillLevel >0 then
			
			local varRet = DelAbility( varMap,varPlayer, 3 )
			if varRet == 1 then
				DeleteTitle(varMap, varPlayer, x540014_var_TitleId)
				StartTalkTask(varMap)
				TalkAppendString(varMap, "您遗忘了"..x540014_var_AbilityName)
				DeliverTalkTips(varMap, varPlayer)
				StopTalkTask(varMap)
				Msg2Player(varMap,varPlayer,"您遗忘了"..x540014_var_AbilityName,8,2)
				
	
				
				if IsHaveQuestNM( varMap, varPlayer, x540014_var_Title_Quest_FileId) > 0 then
					DelQuest( varMap, varPlayer, x540014_var_Title_Quest_FileId)
				end
			end
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap, "您还未学习"..x540014_var_AbilityName)
			DeliverTalkTips(varMap, varPlayer)
			StopTalkTask(varMap)
			
		end
	end
end
