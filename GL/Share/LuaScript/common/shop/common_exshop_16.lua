--功能：骑乘炼化金币商店

x561516_g_ScriptId = 561516
x561516_g_MissionName="神秘商店"
x561516_g_EXShopList={21}
--**********************************

--任务入口函数

--**********************************

function x561516_ProcEventEntry(sceneId, selfId, targetId)	--点击该任务后执行此脚本
		DeliverDynamicShopItem(sceneId, selfId, targetId, x561516_g_EXShopList[1])
end



--**********************************

--列举事件

--**********************************

function x561516_ProcEnumEvent(sceneId, selfId, targetId, MissionId)	

	local nLevel = GetLevel(sceneId,selfId)
	if nLevel >= 40 then
		TalkAppendButton(sceneId, x561516_g_ScriptId, x561516_g_MissionName,10)
	else
		return
	end
	
end



--**********************************

--检测接受条件

--**********************************

function x561516_ProcAcceptCheck(sceneId, selfId, targetId)

end

--**********************************

--接受

--**********************************

function x561516_ProcAccept(sceneId, selfId)
                                                                   
	     
end



--**********************************

--放弃

--**********************************

function x561516_ProcQuestAbandon(sceneId, selfId, MissionId)

end



--**********************************

--检测是否可以提交

--**********************************

function x561516_CheckSubmit( sceneId, selfId, targetId)

end



--**********************************

--提交

--**********************************

function x561516_ProcQuestSubmit(sceneId, selfId, targetId, selectRadioId, MissionId)
	
end



--**********************************

--杀死怪物或玩家

--**********************************

function x561516_ProcQuestObjectKilled(sceneId, selfId, objdataId, objId, MissionId)

end



--**********************************

--进入区域事件

--**********************************

function x561516_ProcAreaEntered(sceneId, selfId, zoneId, MissionId)

end



--**********************************

--道具改变

--**********************************

function x561516_ProcQuestItemChanged(sceneId, selfId, itemdataId, MissionId)

end
