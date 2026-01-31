--装备锻造说明

--QuestHeadBegin
x800154_var_ScriptId = 800154
x800154_var_MissionName={}
x800154_var_MissionInfo={}

x800154_var_MissionName[1]="【宝石抛光说明】"
x800154_var_MissionInfo[1]="\t宝石抛光可以将宗师级，传说级和神话级的宝石附加一个额外属性并且可以进行雕琢。宝石抛光需要消耗钻砂，矽砂和晶砂\n#Y操作说明#W：\n\t1.与#G地中海宝石大师#W对话。\n\t2.选择#G宝石抛光#W选项，打开宝石抛光介面。\n\t3.将装备放入到宝石抛光介面左上方格子内。\n\t4.点击介面下方抛光按钮。\n#Y注意事项#W：\n\t宝石抛光只能为宗师级，传说级和神话级的：#G龙晶石#W、#G玉髓石#W、#G变石#W、#G琥珀石#W、#G皓石#W、#G刚玉#W、#G琉璃#W、#G玛瑙#W、#G辉耀石#W、#G金光石#W。进行抛光。"  --任务描述

x800154_var_MissionName[2]="【宝石雕琢说明】"
x800154_var_MissionInfo[2]="\t宝石雕琢是将抛光后的宝石进行雕琢并重新生成一个属性。宝石抛光消耗一个硬质溶剂\n#Y操作说明#W：\n\t1.与#G地中海宝石大师#W对话。\n\t2.选择#G宝石雕琢#W选项，打开宝石雕琢介面。\n\t3.将宝石放入到宝石雕琢介面左上方格子内。\n\t4.点击介面下方雕琢按钮。\n#Y注意事项#W：\n\t宝石雕琢只能为抛光后的宝石进行雕琢。宝石雕琢完成后，宝石的原抛光属性消失并获得一个新的抛光属性"  --任务描述

x800154_var_MissionName[3]="【宝石镂刻说明】"
x800154_var_MissionInfo[3]="\t宝石镂刻是将抛光后的宝石进行镂刻并随机新增一到三个属性。宝石镂刻每次消耗一个普通地中海尖凿或优质地中海尖凿或精品地中海尖凿。\n#Y操作说明#W：\n\t1.与#G地中海宝石大师#W对话。\n\t2.选择#G宝石镂刻#W选项，打开宝石镂刻介面。\n\t3.将宝石放入到宝石雕琢介面左上方格子内。\n\t4.选择相应地中海尖凿。\n\t5.点击介面下方确定按钮。\n#Y注意事项#W：\n\t宝石镂刻可以多次重复镂刻，每次镂刻原属性消失并获得新的一个到三个新的抛光属性"  --任务描述

x800154_var_MissionNamesm="【宝石玩法说明】"
x800154_var_Missioninfo = "\t\n地中海拥有先进的宝石加工技术，经我们地中海工艺加工过的宝石绝对是品质一流。"
--**********************************

--任务入口函数

--**********************************

function x800154_ProcEventEntry(sceneId, selfId, targetId,scriptid,extid)	--点击该任务后执行此脚本
	--检测列出条件
	if extid == 1000 then
		StartTalkTask(sceneId)
			TalkAppendString(sceneId,"#Y"..x800154_var_MissionNamesm)
			TalkAppendString(sceneId,x800154_var_Missioninfo)
			TalkAppendButton(sceneId, x800154_var_ScriptId, x800154_var_MissionName[1],13,1)
			TalkAppendButton(sceneId, x800154_var_ScriptId, x800154_var_MissionName[2],13,2)
			TalkAppendButton(sceneId, x800154_var_ScriptId, x800154_var_MissionName[3],13,3)
		StopTalkTask()
		DeliverTalkMenu(sceneId, selfId,targetId)
	end
	for i =1 ,8 do
		if extid == i then
			StartTalkTask(sceneId)
			TalkAppendString(sceneId,"#Y"..x800154_var_MissionName[i])
			TalkAppendString(sceneId,x800154_var_MissionInfo[i])	
			TalkAppendButton(sceneId, x800154_var_ScriptId, "返回上一级",13,1000)
			StopTalkTask()
			DeliverTalkMenu(sceneId, selfId,targetId)

		end
	end

end



--**********************************

--列举事件

--**********************************

function x800154_ProcEnumEvent(sceneId, selfId, NPCId, MissionId)
	print(432)
	TalkAppendButton(sceneId, x800154_var_ScriptId, x800154_var_MissionNamesm,13,1000)

end



--**********************************

--检测接受条件

--**********************************

function x800154_ProcAcceptCheck(sceneId, selfId, NPCId)
		return 1
end


--**********************************

--检测查看条件

--**********************************

function x800154_CheckPushList(sceneId, selfId, NPCId)
	
end

--**********************************

--接受

--**********************************

function x800154_ProcAccept( sceneId, selfId )
	
end



--**********************************

--放弃

--**********************************

function x800154_ProcQuestAbandon(sceneId, selfId, MissionId)

end



--**********************************

--检测是否可以提交

--**********************************

function x800154_CheckSubmit( sceneId, selfId, NPCId)


end



--**********************************

--提交

--**********************************

function x800154_ProcQuestSubmit(sceneId, selfId, NPCId, selectRadioId, MissionId)

end



--**********************************

--杀死怪物或玩家

--**********************************

function x800154_ProcQuestObjectKilled(sceneId, selfId, objdataId, objId, MissionId)

end



--**********************************

--进入区域事件

--**********************************

function x800154_ProcAreaEntered(sceneId, selfId, zoneId, MissionId)
	

end

function x800154_ProcTiming(sceneId, selfId )
	 
		
end

function x800154_ProcAreaLeaved(sceneId, selfId, ScriptId, MissionId )
	
end



--**********************************

--道具改变

--**********************************

function x800154_ProcQuestItemChanged(sceneId, selfId, itemdataId, MissionId)
	
end
function x800154_ProcQuestAttach( sceneId, selfId, npcId, npcGuid, misIndex, MissionId )
	    CallLuaFunction( MISSION_SCRIPT, "ProcQuestAttach",sceneId, selfId, npcId, npcGuid, misIndex, MissionId)
end

function x800154_MissionComplate( sceneId, selfId, targetId, selectId, MissionId )
	return CallLuaFunction( MISSION_SCRIPT, "MissionComplate", sceneId, selfId, targetId, selectId, MissionId  )
end

function x800154_PositionUseItem( sceneId, selfId, BagIndex, impactId )
	return  CallLuaFunction( MISSION_SCRIPT, "PositionUseItem",sceneId, selfId, BagIndex, impactId)
end

function x800154_OnGpOpenItemBox( sceneId, selfId, targetId, gpType, needItemID )
	return CallLuaFunction( MISSION_SCRIPT, "OnGpOpenItemBox",sceneId, selfId, targetId, gpType, needItemID)
end

function x800154_OnGpRecycle( sceneId, selfId, targetId, gpType, needItemID )
	return CallLuaFunction( MISSION_SCRIPT, "OnGpRecycle",sceneId, selfId, targetId, gpType, needItemID)
end

function x800154_OnGpProcOver( sceneId, selfId, targetId )
	CallLuaFunction( MISSION_SCRIPT, "OnGpProcOver",sceneId, selfId, targetId)
end

function x800154_OpenCheck( sceneId, selfId, targetId )
	CallLuaFunction( MISSION_SCRIPT, "OpenCheck", sceneId, selfId, targetId )
end
