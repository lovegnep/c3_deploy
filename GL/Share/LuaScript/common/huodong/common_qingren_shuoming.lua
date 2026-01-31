
x310821_g_ScriptId = 310821

--任务文本描述
x310821_g_MissionName="【情人节】活动说明"

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x310821_ProcEventEntry( sceneId, selfId, targetId )	--点击该任务后执行此脚本

		StartTalkTask(sceneId);
		local Readme_1 = "#Y【情人节】活动说明：#W#r #r"
		local Readme_2 = "\t在情人节期间，从#G2月14日#W至#G2月21日#W晚上的#G20：00-20：30#W，每位玩家都可以找到大都的活动使者“灵宝”领取神秘情人节礼物。#r"
		local Readme_3 = "\t打开神秘情人节礼物，将有可能获得各种#G精美的巧克力#W（吃下后获得大量经验奖励），玫瑰，以及神秘的拥有无比强大属性的戒指！#r"
		local Readme_4 = "\t同时在这段时期内，打开游戏中的#G百宝囊#W，#G藏宝盒#W，#G干坤袋#W，有可能获得神秘情人节礼物！#r"
		local Readme = Readme_1..Readme_2..Readme_3..Readme_4
		
		TalkAppendString(sceneId, Readme);
		StopTalkTask(sceneId);
		DeliverTalkMenu(sceneId,selfId,targetId);
		DeliverTalkInfoNM( sceneId, selfId, targetId, -1, -1,2 );
	
end

--**********************************
--列举事件
--**********************************
function x310821_ProcEnumEvent( sceneId, selfId, targetId, MissionId )
	local year, month, day = GetYearMonthDay();
	
	if month > 2 or day > 21 or day < 14 then
		return 
	end	
	TalkAppendButton(sceneId,x310821_g_ScriptId,x310821_g_MissionName);
end


--********************
--检测接受条件
--**********************************
function x310821_ProcAcceptCheck( sceneId, selfId, NPCId )
		return 1
end

--**********************************
--接受
--**********************************
function x310821_ProcAccept( sceneId, selfId )

	
end

--**********************************
--放弃
--**********************************
function x310821_ProcQuestAbandon( sceneId, selfId, MissionId )

end

--**********************************
--继续
--**********************************
function x310821_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--检测是否可以提交
--**********************************
function x310821_CheckSubmit( sceneId, selfId )

end

--**********************************
--提交
--**********************************
function x310821_ProcQuestSubmit( sceneId, selfId, targetId,selectRadioId, MissionId )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x310821_ProcQuestObjectKilled( sceneId, selfId, objdataId, objId, MissionId )

end

--**********************************
--进入区域事件
--**********************************
function x310821_ProcAreaEntered( sceneId, selfId, zoneId, MissionId )
end

--**********************************
--道具改变
--**********************************
function x310821_ProcQuestItemChanged( sceneId, selfId, itemdataId, MissionId )
end
