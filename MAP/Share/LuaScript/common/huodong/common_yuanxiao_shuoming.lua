
x310822_g_ScriptId = 310822

--任务文本描述
x310822_g_MissionName="【元宵节】活动说明"

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x310822_ProcEventEntry( sceneId, selfId, targetId )	--点击该任务后执行此脚本

		StartTalkTask(sceneId);
		local Readme_1 = "#Y【元宵节】活动说明：#W#r #r"
		local Readme_2 = "#Y活动时间：#W2月16日至2月18日。#r \n"
		local Readme_3 = "#Y1.元宵猜灯谜：\n#W#G\t12：00~13：00#W和#G20：00~21：00#W两个时间段，#G40级以上#W的玩家，可以在活动使者处每天猜#G100次#W灯谜，每次猜灯谜均会消耗#G10点#W活力，无论回答正确与否，均会获得一定的经验奖励，如果回答正确，有可能获得的元宵的材料：#G糯米面团#W。#G#r \n"
		local Readme_4 = "#Y2.正月吃元宵：\n#W\t每#G2个#W糯米面团，可以在活动使者处兑换#G1个#W元宵。吃下元宵后，会获得#G大量#W的经验奖励！"
		local Readme = Readme_1..Readme_2..Readme_3..Readme_4
		
		TalkAppendString(sceneId, Readme);
		StopTalkTask(sceneId);
		DeliverTalkMenu(sceneId,selfId,targetId);
		DeliverTalkInfoNM( sceneId, selfId, targetId, -1, -1,2 );
	
end

--**********************************
--列举事件
--**********************************
function x310822_ProcEnumEvent( sceneId, selfId, targetId, MissionId )
	local year, month, day = GetYearMonthDay();
	
	if month > 2 or day < 12 or day > 18 then
		return 
	end	
	
	TalkAppendButton(sceneId,x310822_g_ScriptId,x310822_g_MissionName);
end


--********************
--检测接受条件
--**********************************
function x310822_ProcAcceptCheck( sceneId, selfId, NPCId )
		return 1
end

--**********************************
--接受
--**********************************
function x310822_ProcAccept( sceneId, selfId )

	
end

--**********************************
--放弃
--**********************************
function x310822_ProcQuestAbandon( sceneId, selfId, MissionId )

end

--**********************************
--继续
--**********************************
function x310822_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--检测是否可以提交
--**********************************
function x310822_CheckSubmit( sceneId, selfId )

end

--**********************************
--提交
--**********************************
function x310822_ProcQuestSubmit( sceneId, selfId, targetId,selectRadioId, MissionId )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x310822_ProcQuestObjectKilled( sceneId, selfId, objdataId, objId, MissionId )

end

--**********************************
--进入区域事件
--**********************************
function x310822_ProcAreaEntered( sceneId, selfId, zoneId, MissionId )
end

--**********************************
--道具改变
--**********************************
function x310822_ProcQuestItemChanged( sceneId, selfId, itemdataId, MissionId )
end
