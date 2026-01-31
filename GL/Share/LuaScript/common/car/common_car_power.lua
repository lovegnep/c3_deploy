


x911115_var_FileId = 911115
x911115_var_QuestName = "系统控制"









function x911115_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local IsDriver = IsBusLeader(varMap , varPlayer)
		
	if IsDriver == 1 then
		local BusObjID = GetBusId(varMap,varPlayer)
		local BusType  = GetBusType(varMap, BusObjID)
		local BusIndex = GetBusIndex(varMap, BusObjID)	
	
		if BusType == 1 and BusIndex == 2 then			
				SetBusSysControl(varMap, BusObjID, 1)
				local AIStr = "系统控制"

			StartTalkTask(varMap)
				TalkAppendString(varMap,"测试用，每次有一半的概率被设置为“进入BUS需要司机确认”，一半的概率被设置为“进入BUS不需要司机确认”。#G目前"..AIStr.."#W。")
			StopTalkTask( )	
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			
			StartTalkTask(varMap)
			  TalkAppendString(varMap,AIStr);
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
		elseif BusIndex == 3 then	
			StartTalkTask(varMap)
			  TalkAppendString(varMap,"镖车本来就是跟随你的了哦");
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
		elseif BusIndex == 1 then	
			StartTalkTask(varMap)
			  TalkAppendString(varMap,"系统BUS还要系统控制？不要玩我啊");
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
		end
	end	
end







function x911115_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x911115_var_FileId, x911115_var_QuestName);
end

function x911115_ProcDie(varMap,BusId,idKiller)
end
