x800124_var_ScriptId = 800124


--任务文本描述
x800124_var_MissionName="冥装剪切"

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x800124_ProcEventEntry( varMap, varPlayer, targetId )	--点击该任务后执行此脚本
end

--**********************************
--列举事件
--**********************************
function x800124_ProcEnumEvent( varMap, varPlayer, targetId, MissionId )
	TalkAppendButton(varMap,x800124_var_ScriptId,x800124_var_MissionName,3);
end


--********************
--检测接受条件
--**********************************
function x800124_ProcAcceptCheck( varMap, varPlayer, NPCId )
		return 1
end

--**********************************
--接受
--**********************************
function x800124_ProcAccept( varMap, varPlayer )

end

--**********************************
--放弃
--**********************************
function x800124_ProcQuestAbandon( varMap, varPlayer, MissionId )

end

--**********************************
--继续
--**********************************
function x800124_ProcContinue( varMap, varPlayer, targetId )

end

--**********************************
--检测是否可以提交
--**********************************
function x800124_CheckSubmit( varMap, varPlayer )

end

--**********************************
--提交
--**********************************
function x800124_ProcQuestSubmit( varMap, varPlayer, targetId,selectRadioId, MissionId )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x800124_ProcQuestObjectKilled( varMap, varPlayer, objdataId, objId, MissionId )

end

--**********************************
--进入区域事件
--**********************************
function x800124_ProcAreaEntered( varMap, varPlayer, zoneId, MissionId )
end

--**********************************
--道具改变
--**********************************
function x800124_ProcQuestItemChanged( varMap, varPlayer, itemdataId, MissionId )
end
