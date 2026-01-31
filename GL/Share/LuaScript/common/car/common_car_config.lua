


x911114_var_FileId = 911114
x911114_var_QuestName = "进入BUS是否需要司机确认 切换"









function x911114_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local IsDriver = IsBusLeader(varMap , varPlayer)
	
	if IsDriver == 1 then
		local BusObjID = GetBusId(varMap,varPlayer)
		local BusType  = GetBusType(varMap, BusObjID)
		local BusIndex = GetBusIndex(varMap, BusObjID)	
		
		if BusType == 1 and BusIndex == 2 then	
			local AIStr = "进入你的BUS不需要通过你确认"
			if random(1,2) == 1 then
				SetBusLeaderFiatMode(varMap, BusObjID, 0)
				AIStr = "进入你的BUS不需要通过你确认"
			else
				SetBusLeaderFiatMode(varMap, BusObjID, 1)
				AIStr = "进入你的BUS需要通过你确认"
			end
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
			  TalkAppendString(varMap,"镖车是很专一的，不会随便让别人上来坐的，所以……");
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
		elseif BusIndex == 1 then	
			StartTalkTask(varMap)
			  TalkAppendString(varMap,"系统bus都没司机，你让我怎么换，所以……");
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
		end
	end	
end







function x911114_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x911114_var_FileId, x911114_var_QuestName);
end


function x911114_ProcDie(varMap,BusId,idKiller)
end
