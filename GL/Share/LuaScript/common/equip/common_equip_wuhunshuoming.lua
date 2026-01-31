--装备锻造说明

--QuestHeadBegin
x800301_var_ScriptId = 800301
x800301_var_MissionName={}
x800301_var_MissionInfo={}

x800301_var_MissionName[1]="【将星卡合成说明】"
x800301_var_MissionInfo[1]="\t将星卡合成是将5张低阶颜色#R将星卡#W进行合成，获得高阶颜色#R将星卡#W的功能，每次合成消耗5张同颜色的将星卡.\n#Y操作说明#W：\n\t1.与#G将星大师#W对话。\n\t2.选择#G将星卡合成#W选项，打开合成介面。\n\t3.将星卡列将显示玩家所拥有的所有将星卡。\n\t4.右键点击卡牌，将需要合成的将星卡牌放入右侧合成框内。\n\t5.点击介面下方开始合成按钮。\n#Y注意事项#W：\n\t将星卡合成只能在同颜色类的将星卡中进行，合成后随机生成一张高阶颜色的一星将星卡"  --任务描述

x800301_var_MissionName[2]="【将星卡升级说明】"
x800301_var_MissionInfo[2]="\t将星卡升级是将1张低星#R将星卡#W升级成高一星级#R将星卡#W的功能，每次升级消耗4张与主卡同颜色的将星卡.\n#Y操作说明#W：\n\t1.与#G将星大师#W对话。\n\t2.选择#G将星卡升级#W选项，打开升级介面。\n\t3.将星卡列将显示玩家所拥有的所有将星卡。\n\t4.右键点击卡牌，将需要升级的将星卡放入右侧合成框正中主卡位置，再次选择4张用于升级的副卡，放入主卡四周的副卡位置。\n\t5.可选择勾选消耗金卡进行对主卡的保护，或者取消勾选。\n\t6.点击介面下方开始升级按钮。\n#Y注意事项#W：\n\t勾选保险金卡，升级失败后只会消耗副卡，否则主副卡全部消失，副卡星级越高，达成概率越高，卡牌升级只能在同颜色类的卡牌中进行，主卡星级不能为5星，升级完成后主卡星级+1"  --任务描述

x800301_var_MissionName[3]="【将星卡降星回收说明】"
x800301_var_MissionInfo[3]="\t将星卡降星回收是将1张高星#R将星卡#W降星成低一星级#R将星卡#W的功能.\n#Y操作说明#W：\n\t1.与#G将星大师#W对话。\n\t2.选择#G将星卡降星回收#W选项，打开回收介面。\n\t3.点击介面下方回收按钮。\n#Y注意事项#W：\n\t星级为1星的将星卡不能进行降星回收操作，回收完成后将星卡星级-1"  --任务描述


x800301_var_MissionName[4]="【将星铭刻说明】"
x800301_var_MissionInfo[4]="\t将星铭刻是将#R将星卡#W铭刻到装备上，使装备附加将星卡携带的属性,将星铭刻每次消耗一张将星卡.\n#Y操作说明#W：\n\t1.与#G将星大师#W对话。\n\t2.选择#G将星铭刻#W选项，打开将星介面。\n\t3.将装备放到将星铭刻介面左上方格子内。\n\t4.选择所要铭刻的将星卡。\n\t5.点击介面下方确定按钮。\n#Y注意事项#W：\n\t将星铭刻可以多次重复铭刻，每次铭刻原属性消失并获得新的将星卡属性"  --任务描述

x800301_var_MissionNamesm="【将星玩法说明】"
x800301_var_Missioninfo = "\t\n将星玩法包括将星卡合成，将星卡升级，将星铭刻,将星卡回收降星等，通过将星玩法功能，可以使你的装备属性获得大量的提升。"
--**********************************

--任务入口函数

--**********************************

function x800301_ProcEventEntry(sceneId, selfId, targetId,scriptid,extid)	--点击该任务后执行此脚本
	--检测列出条件
	if extid == 1000 then
		StartTalkTask(sceneId)
			TalkAppendString(sceneId,"#Y"..x800301_var_MissionNamesm)
			TalkAppendString(sceneId,x800301_var_Missioninfo)
			TalkAppendButton(sceneId, x800301_var_ScriptId, x800301_var_MissionName[1],13,1)
			TalkAppendButton(sceneId, x800301_var_ScriptId, x800301_var_MissionName[2],13,2)
			TalkAppendButton(sceneId, x800301_var_ScriptId, x800301_var_MissionName[3],13,3)
			TalkAppendButton(sceneId, x800301_var_ScriptId, x800301_var_MissionName[4],13,4)
		StopTalkTask()
		DeliverTalkMenu(sceneId, selfId,targetId)
	end
	for i =1 ,8 do
		if extid == i then
			StartTalkTask(sceneId)
			TalkAppendString(sceneId,"#Y"..x800301_var_MissionName[i])
			TalkAppendString(sceneId,x800301_var_MissionInfo[i])	
			TalkAppendButton(sceneId, x800301_var_ScriptId, "返回上一级",13,1000)
			StopTalkTask()
			DeliverTalkMenu(sceneId, selfId,targetId)

		end
	end

end



--**********************************

--列举事件

--**********************************

function x800301_ProcEnumEvent(sceneId, selfId, NPCId, MissionId)
	print(432)
	TalkAppendButton(sceneId, x800301_var_ScriptId, x800301_var_MissionNamesm,13,1000)

end



--**********************************

--检测接受条件

--**********************************

function x800301_ProcAcceptCheck(sceneId, selfId, NPCId)
		return 1
end


--**********************************

--检测查看条件

--**********************************

function x800301_CheckPushList(sceneId, selfId, NPCId)
	
end

--**********************************

--接受

--**********************************

function x800301_ProcAccept( sceneId, selfId )
	
end



--**********************************

--放弃

--**********************************

function x800301_ProcQuestAbandon(sceneId, selfId, MissionId)

end



--**********************************

--检测是否可以提交

--**********************************

function x800301_CheckSubmit( sceneId, selfId, NPCId)


end



--**********************************

--提交

--**********************************

function x800301_ProcQuestSubmit(sceneId, selfId, NPCId, selectRadioId, MissionId)

end



--**********************************

--杀死怪物或玩家

--**********************************

function x800301_ProcQuestObjectKilled(sceneId, selfId, objdataId, objId, MissionId)

end



--**********************************

--进入区域事件

--**********************************

function x800301_ProcAreaEntered(sceneId, selfId, zoneId, MissionId)
	

end

function x800301_ProcTiming(sceneId, selfId )
	 
		
end

function x800301_ProcAreaLeaved(sceneId, selfId, ScriptId, MissionId )
	
end



--**********************************

--道具改变

--**********************************

function x800301_ProcQuestItemChanged(sceneId, selfId, itemdataId, MissionId)
	
end
function x800301_ProcQuestAttach( sceneId, selfId, npcId, npcGuid, misIndex, MissionId )
	    CallLuaFunction( MISSION_SCRIPT, "ProcQuestAttach",sceneId, selfId, npcId, npcGuid, misIndex, MissionId)
end

function x800301_MissionComplate( sceneId, selfId, targetId, selectId, MissionId )
	return CallLuaFunction( MISSION_SCRIPT, "MissionComplate", sceneId, selfId, targetId, selectId, MissionId  )
end

function x800301_PositionUseItem( sceneId, selfId, BagIndex, impactId )
	return  CallLuaFunction( MISSION_SCRIPT, "PositionUseItem",sceneId, selfId, BagIndex, impactId)
end

function x800301_OnGpOpenItemBox( sceneId, selfId, targetId, gpType, needItemID )
	return CallLuaFunction( MISSION_SCRIPT, "OnGpOpenItemBox",sceneId, selfId, targetId, gpType, needItemID)
end

function x800301_OnGpRecycle( sceneId, selfId, targetId, gpType, needItemID )
	return CallLuaFunction( MISSION_SCRIPT, "OnGpRecycle",sceneId, selfId, targetId, gpType, needItemID)
end

function x800301_OnGpProcOver( sceneId, selfId, targetId )
	CallLuaFunction( MISSION_SCRIPT, "OnGpProcOver",sceneId, selfId, targetId)
end

function x800301_OpenCheck( sceneId, selfId, targetId )
	CallLuaFunction( MISSION_SCRIPT, "OpenCheck", sceneId, selfId, targetId )
end
