

x800122_var_FileId 									= 800122

x800122_var_Leader_Index 							= 5

x800122_var_QuestName								="神兽技能研究"


x800122_var_TestTip										= "请选择研究的方式"

x800122_var_Skill_Study								= 1
x800122_var_Skill_Study_UseMoney			= 10
x800122_var_Skill_Study_UseGuildExp	  = 11




function x800122_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
 	TalkAppendButton(varMap, x800122_var_FileId,x800122_var_QuestName, 3, x800122_var_Skill_Study)
end




function x800122_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)
	
	
	
	
	local nGuildID= GetGuildID( varMap, varPlayer)
	if nGuildID == -1 then
		StartTalkTask(varMap)
			TalkAppendString(varMap, "您还没有帮会,请加入帮会后再来")
		StopTalkTask()
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return
	else
		local pos = GetGuildOfficial(varMap, varPlayer)
		if pos ~= x800122_var_Leader_Index then			
			StartTalkTask(varMap)
			TalkAppendString(varMap, "抱歉，您不是帮主，没有权利研究帮会神兽技能!");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap, varPlayer)
			return
		end
	 end

	if idExt == x800122_var_Skill_Study then
		local varState = IsCashboxState(varMap,varPlayer)
    if varState == 1 then
    		Msg2Player(varMap,varPlayer,"处于运镖状态，不能学习神兽技能",8, 2)
        return 0;
    end
		OpenGuildBusSkillStudyUI(varMap, varPlayer, 2)
 	end
	
	return 0
end
