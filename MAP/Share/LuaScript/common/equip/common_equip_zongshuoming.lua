--装备锻造说明

--QuestHeadBegin
x800152_var_ScriptId = 800152
x800152_var_MissionName={}
x800152_var_MissionInfo={}
x800152_var_MissionName[1]="【装备打孔说明】"
x800152_var_MissionInfo[1]="\t装备打孔之后，可以在孔内镶嵌宝石，增加装备的属性。打孔需要消耗打孔钻。\n#Y操作说明#W：\n\t1.与#G装备镶嵌#W对话。\n\t2.选择#G装备打孔#W选项，打开装备打孔介面。\n\t3.将所要打孔的装备放入到装备打孔介面左上方格子内。\n\t4.点击介面下方打孔按钮。\n#Y注意事项#W：\n\t#G35级以上#W的玩家才能使用此项。"  --任务描述

x800152_var_MissionName[2]="【宝石镶嵌说明】"
x800152_var_MissionInfo[2]="\t在装备上镶嵌宝石，可以增加装备的属性。宝石镶嵌消耗宝石。\n#Y操作说明#W：\n\t1.与#G装备镶嵌#W对话。\n\t2.选择#G宝石镶嵌#W选项，打开宝石镶嵌介面。\n\t3.将装备放入到宝石镶嵌介面左上方格子内。\n\t4.将宝石放入到宝石镶嵌介面下方格子内。\n\t5.点击介面下方镶嵌按钮。\n#Y注意事项#W：\n\t1.#G35级以上#W的玩家才能使用此项。\n\t2.装备上必须有空余的孔，才能镶嵌宝石。"  --任务描述

x800152_var_MissionName[3]="【宝石升级说明】"
x800152_var_MissionInfo[3]="\t宝石升级可以提升宝石等级，增加宝石提升的属性值。宝石升级消耗银币及洗石剂。\n#Y操作说明#W：\n\t1.与王国#G装备镶嵌大师#W或大都#G装备镶嵌大师#W对话。\n\t2.选择#G宝石升级#W选项，打开宝石升级介面。\n\t3.将装备放入到宝石升级介面左上方格子内。\n\t4.点击介面下方升级按钮。\n#Y注意事项#W：\n\t可升级的宝石包括：#G龙晶石#W、#G玉髓石#W、#G变石#W、#G琥珀石#W、#G皓石#W、#G刚玉#W、#G琉璃#W、#G玛瑙#W、#G辉耀石#W、#G金光石#W。"   --任务描述

x800152_var_MissionName[4]="【洗石剂配制说明】"
x800152_var_MissionInfo[4]="\t洗石剂配制可以将5个低等级的洗石剂升级为1个高等级的洗石剂。洗石剂配制消耗银币。\n#Y操作说明#W：\n\t1.与王国#G装备镶嵌大师#W或大都#G装备镶嵌大师#W对话。\n\t2.选择#G洗石剂配制#W选项，打开洗石剂配制介面。\n\t3.将待合成的洗石剂放入到洗石剂配制介面左上方格子内。\n\t4.点击介面下方配制按钮。"  --任务描述

x800152_var_MissionName[5]="【宝石拆卸说明】"
x800152_var_MissionInfo[5]="\t宝石拆卸可以将已镶嵌到装备上的宝石拆卸下来。宝石拆卸消耗银币和离石剂。\n#Y操作说明#W：\n\t1.与#G装备镶嵌#W对话。\n\t2.选择#G宝石拆卸#W选项，打开宝石替换介面。\n\t3.将装备放入到宝石拆卸介面左上方格子内。\n\t4.滑鼠左键点选所要拆卸的宝石。\n\t5.点击介面下方拆卸按钮。\n#Y注意事项#W：\n\t1.#G离石剂#W在金币商城（快速键：J）材料区出售。\n\t2.一瓶离石剂只能拆掉一颗宝石。"  --任务描述

x800152_var_MissionName[6]="【宝石替换说明】"
x800152_var_MissionInfo[6]="\t宝石替换可以使用新宝石覆盖装备上已有的宝石。宝石替换消耗可镶嵌的宝石。\n#Y操作说明#W：\n\t1.与#G装备镶嵌#W对话。\n\t2.选择#G宝石替换#W选项，打开宝石替换介面。\n\t3.将装备放入到宝石替换介面左上方格子内。\n\t4.将宝石拖入到介面下方要替换掉的宝石所在格子内。\n\t5.点击介面下方替换按钮。\n#Y注意事项#W：\n\t宝石替换后，装备上原先镶嵌的宝石会消失掉。"  --任务描述


x800152_var_MissionNamesm="【装备宝石玩法说明】"
--**********************************

--任务入口函数

--**********************************

function x800152_ProcEventEntry(sceneId, selfId, targetId,scriptid,extid)	--点击该任务后执行此脚本
	--检测列出条件
	if extid == 1000 then
		StartTalkTask(sceneId)
			TalkAppendString(sceneId,"#Y"..x800152_var_MissionNamesm)
			TalkAppendButton(sceneId, x800152_var_ScriptId, x800152_var_MissionName[1],13,1)
			TalkAppendButton(sceneId, x800152_var_ScriptId, x800152_var_MissionName[2],13,2)
			TalkAppendButton(sceneId, x800152_var_ScriptId, x800152_var_MissionName[3],13,3)
			TalkAppendButton(sceneId, x800152_var_ScriptId, x800152_var_MissionName[4],13,4)
			TalkAppendButton(sceneId, x800152_var_ScriptId, x800152_var_MissionName[5],13,5)
			TalkAppendButton(sceneId, x800152_var_ScriptId, x800152_var_MissionName[6],13,6)	

		StopTalkTask()
		DeliverTalkMenu(sceneId, selfId,targetId)
	end
	for i =1 ,8 do
		if extid == i then
			StartTalkTask(sceneId)
			TalkAppendString(sceneId,"#Y"..x800152_var_MissionName[i])
			TalkAppendString(sceneId,x800152_var_MissionInfo[i])	
			TalkAppendButton(sceneId, x800152_var_ScriptId, "返回上一级",13,1000)
			StopTalkTask()
			DeliverTalkMenu(sceneId, selfId,targetId)

		end
	end

end



--**********************************

--列举事件

--**********************************

function x800152_ProcEnumEvent(sceneId, selfId, NPCId, MissionId)

	TalkAppendButton(sceneId, x800152_var_ScriptId, x800152_var_MissionNamesm,13,1000)

end



--**********************************

--检测接受条件

--**********************************

function x800152_ProcAcceptCheck(sceneId, selfId, NPCId)
		return 1
end


--**********************************

--检测查看条件

--**********************************

function x800152_CheckPushList(sceneId, selfId, NPCId)
	
end

--**********************************

--接受

--**********************************

function x800152_ProcAccept( sceneId, selfId )
	
end



--**********************************

--放弃

--**********************************

function x800152_ProcQuestAbandon(sceneId, selfId, MissionId)

end



--**********************************

--检测是否可以提交

--**********************************

function x800152_CheckSubmit( sceneId, selfId, NPCId)


end



--**********************************

--提交

--**********************************

function x800152_ProcQuestSubmit(sceneId, selfId, NPCId, selectRadioId, MissionId)

end



--**********************************

--杀死怪物或玩家

--**********************************

function x800152_ProcQuestObjectKilled(sceneId, selfId, objdataId, objId, MissionId)

end



--**********************************

--进入区域事件

--**********************************

function x800152_ProcAreaEntered(sceneId, selfId, zoneId, MissionId)
	

end

function x800152_ProcTiming(sceneId, selfId )
	 
		
end

function x800152_ProcAreaLeaved(sceneId, selfId, ScriptId, MissionId )
	
end



--**********************************

--道具改变

--**********************************

function x800152_ProcQuestItemChanged(sceneId, selfId, itemdataId, MissionId)
	
end
function x800152_ProcQuestAttach( sceneId, selfId, npcId, npcGuid, misIndex, MissionId )
	    CallLuaFunction( MISSION_SCRIPT, "ProcQuestAttach",sceneId, selfId, npcId, npcGuid, misIndex, MissionId)
end

function x800152_MissionComplate( sceneId, selfId, targetId, selectId, MissionId )
	return CallLuaFunction( MISSION_SCRIPT, "MissionComplate", sceneId, selfId, targetId, selectId, MissionId  )
end

function x800152_PositionUseItem( sceneId, selfId, BagIndex, impactId )
	return  CallLuaFunction( MISSION_SCRIPT, "PositionUseItem",sceneId, selfId, BagIndex, impactId)
end

function x800152_OnGpOpenItemBox( sceneId, selfId, targetId, gpType, needItemID )
	return CallLuaFunction( MISSION_SCRIPT, "OnGpOpenItemBox",sceneId, selfId, targetId, gpType, needItemID)
end

function x800152_OnGpRecycle( sceneId, selfId, targetId, gpType, needItemID )
	return CallLuaFunction( MISSION_SCRIPT, "OnGpRecycle",sceneId, selfId, targetId, gpType, needItemID)
end

function x800152_OnGpProcOver( sceneId, selfId, targetId )
	CallLuaFunction( MISSION_SCRIPT, "OnGpProcOver",sceneId, selfId, targetId)
end

function x800152_OpenCheck( sceneId, selfId, targetId )
	CallLuaFunction( MISSION_SCRIPT, "OpenCheck", sceneId, selfId, targetId )
end
