x800094_var_ScriptId = 800094


--任务文本描述
x800094_var_QuestName="战绩奖章升级"

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x800094_ProcEventEntry( varMap, varPlayer, targetId )	--点击该任务后执行此脚本
end

--**********************************
--列举事件
--**********************************
function x800094_ProcEnumEvent( varMap, varPlayer, targetId, MissionId )
	TalkAppendButton(varMap,x800094_var_ScriptId,x800094_var_QuestName,3);
end


--********************
--检测接受条件
--**********************************
function x800094_ProcAcceptCheck( varMap, varPlayer, NPCId )
		return 1
end

--**********************************
--接受
--**********************************
function x800094_ProcAccept( varMap, varPlayer )

end

--**********************************
--放弃
--**********************************
function x800094_ProcQuestAbandon( varMap, varPlayer, MissionId )

end

--**********************************
--继续
--**********************************
function x800094_ProcContinue( varMap, varPlayer, targetId )

end

--**********************************
--检测是否可以提交
--**********************************
function x800094_CheckSubmit( varMap, varPlayer )

end

--**********************************
--提交
--**********************************
function x800094_ProcQuestSubmit( varMap, varPlayer, targetId,selectRadioId, MissionId )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x800094_ProcQuestObjectKilled( varMap, varPlayer, objdataId, objId, MissionId )

end

--**********************************
--进入区域事件
--**********************************
function x800094_ProcAreaEntered( varMap, varPlayer, zoneId, MissionId )
end

--**********************************
--道具改变
--**********************************
function x800094_ProcQuestItemChanged( varMap, varPlayer, itemdataId, MissionId )
end
