
x302504_g_ScriptId = 302504

--任务文本描述
x302504_g_MissionName="【网路情人节】活动说明"

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x302504_ProcEventEntry( sceneId, selfId, targetId )	--点击该任务后执行此脚本

		StartTalkTask(sceneId);
		local Readme_1 = "#Y【网路情人节】活动说明：#W#r #r"
		local Readme_2 = "\t5月20日网路情人节是资讯时代的爱情节日，“5201314我爱你一生一世”是经典的数字语录，这天的13点14分是你向所爱的人表白的最佳时期。"
		local Readme_3 = "#r\t在#R5月18日#W到#R5月20日#W之间，使用#G钟情一生#W和#G爱无止境#W有几率获得各种金币道具，更有可能获得#R比翼双飞#W情人节专属坐骑。"
		local Readme_4 = "#r\t恋爱以及没有恋爱的朋友们，抓紧这个不容错过的时机向你的爱人表白吧！"
		local Readme = Readme_1..Readme_2..Readme_3..Readme_4
		
		TalkAppendString(sceneId, Readme);
		StopTalkTask(sceneId);
		DeliverTalkMenu(sceneId,selfId,targetId);
		DeliverTalkInfoNM( sceneId, selfId, targetId, -1, -1,2 );
	
end

--**********************************
--列举事件
--**********************************
function x302504_ProcEnumEvent( sceneId, selfId, targetId, MissionId )
	local day =GetDayOfYear( sceneId, selfId)
	if  day < 138 or day > 140 then
		return 
	end	
	TalkAppendButton(sceneId,x302504_g_ScriptId,x302504_g_MissionName);
end


--********************
--检测接受条件
--**********************************
function x302504_ProcAcceptCheck( sceneId, selfId, NPCId )
		return 1
end

--**********************************
--接受
--**********************************
function x302504_ProcAccept( sceneId, selfId )

	
end

--**********************************
--放弃
--**********************************
function x302504_ProcQuestAbandon( sceneId, selfId, MissionId )

end

--**********************************
--继续
--**********************************
function x302504_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--检测是否可以提交
--**********************************
function x302504_CheckSubmit( sceneId, selfId )

end

--**********************************
--提交
--**********************************
function x302504_ProcQuestSubmit( sceneId, selfId, targetId,selectRadioId, MissionId )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x302504_ProcQuestObjectKilled( sceneId, selfId, objdataId, objId, MissionId )

end

--**********************************
--进入区域事件
--**********************************
function x302504_ProcAreaEntered( sceneId, selfId, zoneId, MissionId )
end

--**********************************
--道具改变
--**********************************
function x302504_ProcQuestItemChanged( sceneId, selfId, itemdataId, MissionId )
end
