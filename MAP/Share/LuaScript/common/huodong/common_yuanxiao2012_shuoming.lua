--2012元宵节活动说明




x310839_g_ScriptId = 310839

--任务文本描述
x310839_g_MissionName="【元宵节】活动说明"

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x310839_ProcEventEntry( sceneId, selfId, targetId )	--点击该任务后执行此脚本

		StartTalkTask(sceneId);
		local Readme_1 = "#Y【元宵节】活动说明：#W#r #r"
		local Readme_2 = "#Y活动时间：#W2月6日至2月9日。#r \n"
		local Readme_3 = "#Y1.元宵猜灯谜：\n\t#W每天#G19：30~24：00#W，#G40级以上#W的玩家，可以在灯谜使者处接取任务。之后找到四位灯谜侍女猜灯谜，每天猜#G4次#W。无论回答正确与否，均可以获得的元宵的材料：#G元宵皮#W或#G元宵馅#W。#G#r猜对灯谜会获得更多的材料奖励！ \n \n"
		local Readme_4 = "#Y2.正月吃元宵：\n#W\t每#G1个#W元宵皮和#G1个#W元宵馅可以在大都谢师傅或其助手处兑随机换#G1个#W元宵。吃下元宵后，会获得#G大量#W的经验奖励！\n \n"
		local Readme_5 = "#Y特别提示：\n\t#W1.活动期间使用嘉年华娱乐币完成大都灯谜会#R不会获得任何元宵材料#W。\n\t2.兑换元宵时间:2月6日至2月13日。\n\t3.元宵食用期限:2月6日至3月31日。"
		local Readme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
		
		TalkAppendString(sceneId, Readme);
		StopTalkTask(sceneId);
		DeliverTalkMenu(sceneId,selfId,targetId);
		DeliverTalkInfoNM( sceneId, selfId, targetId, -1, -1,2 );
	
end

--**********************************
--列举事件
--**********************************
function x310839_ProcEnumEvent( sceneId, selfId, targetId, MissionId )
	local year, month, day = GetYearMonthDay();
	
	if month > 2 or day < 6 or day > 9 then
		return 
	end	
	
	TalkAppendButton(sceneId,x310839_g_ScriptId,x310839_g_MissionName);
end


--********************
--检测接受条件
--**********************************
function x310839_ProcAcceptCheck( sceneId, selfId, NPCId )
		return 1
end

--**********************************
--接受
--**********************************
function x310839_ProcAccept( sceneId, selfId )

	
end

--**********************************
--放弃
--**********************************
function x310839_ProcQuestAbandon( sceneId, selfId, MissionId )

end

--**********************************
--继续
--**********************************
function x310839_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--检测是否可以提交
--**********************************
function x310839_CheckSubmit( sceneId, selfId )

end

--**********************************
--提交
--**********************************
function x310839_ProcQuestSubmit( sceneId, selfId, targetId,selectRadioId, MissionId )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x310839_ProcQuestObjectKilled( sceneId, selfId, objdataId, objId, MissionId )

end

--**********************************
--进入区域事件
--**********************************
function x310839_ProcAreaEntered( sceneId, selfId, zoneId, MissionId )
end

--**********************************
--道具改变
--**********************************
function x310839_ProcQuestItemChanged( sceneId, selfId, itemdataId, MissionId )
end
