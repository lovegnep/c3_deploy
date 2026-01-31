--双人战场说明
--ScriptID = 303107

x303107_g_ScriptId 					= 303107

x303107_g_MissionName				= "【跨服双人演习说明】"

x303107_g_Readme1						=	"\n#Y一、报名条件\n#W1、需要先通过游戏右上角地图附近#G报名双人跨服战场按钮#W进行报名。\n2、周一至周五#G9：00~16：00#W为跨服双人演习开放时间。\n3、双人演习每5分钟为一轮。周一至周五#G08:55~15:59#W随时可以报名参加。"
x303107_g_Readme2						=	"\n#Y二、演习奖励\n#W1、参加跨服双人演习#G只能获得#W相应的#G经验奖励#W。"

--**********************************
--点击NPC
--**********************************
function x303107_ProcEnumEvent( sceneId, selfId, targetId, MissionId )

	TalkAppendButton(sceneId,x303107_g_ScriptId,x303107_g_MissionName,0,1)
	
end
--**********************************
--执行默认事件
--**********************************
function x303107_ProcEventEntry( sceneId, selfId, targetId,state,index)

		StartTalkTask(sceneId)
			TalkAppendString(sceneId,"#Y"..x303107_g_MissionName)
			TalkAppendString(sceneId,x303107_g_Readme1)
			TalkAppendString(sceneId,x303107_g_Readme2)
			--TalkAppendString(sceneId,x303107_g_Readme3)
		StopTalkTask()
		DeliverTalkMenu(sceneId, selfId,targetId,x303107_g_ScriptId, x303107_g_MissionName)
		
end
--**********************************
--检测
--**********************************
function x303107_ProcAcceptCheck( sceneId, selfId, NPCId )

end

--**********************************
--接受
--**********************************
function x303107_ProcAccept( sceneId, selfId )
end

--**********************************
--放弃
--**********************************
function x303107_ProcQuestAbandon( sceneId, selfId, MissionId )

end

--**********************************
--继续
--**********************************
function x303107_OnContinue( sceneId, selfId, targetId )

end

--**********************************
--检测是否可以提交
--**********************************
function x303107_CheckSubmit( sceneId, selfId )

end

--**********************************
--提交
--**********************************
function x303107_ProcQuestSubmit( sceneId, selfId, targetId,selectRadioId, MissionId )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x303107_ProcQuestObjectKilled( sceneId, selfId, objdataId, objId, MissionId )

end

--**********************************
--进入区域事件
--**********************************
function x303107_ProcAreaEntered( sceneId, selfId, zoneId, MissionId )
end

--**********************************
--道具改变
--**********************************
function x303107_ProcQuestItemChanged( sceneId, selfId, itemdataId, MissionId )
end



