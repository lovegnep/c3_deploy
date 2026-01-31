


x911113_var_FileId = 911113
x911113_var_QuestName = "可乘人数 切换"









function x911113_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local IsDriver = IsBusLeader(varMap , varPlayer)
	
	if IsDriver == 1 then
		local BusObjID = GetBusId(varMap,varPlayer)
		local Size = GetBusSize(varMap, BusObjID)
		local MemCount = GetBusMemberCount(varMap, BusObjID)
		local BusType  = GetBusType(varMap, BusObjID)
		local BusIndex = GetBusIndex(varMap, BusObjID)	
		
		if BusType == 1 and BusIndex == 2 then	
			Size = Size + 1
			if Size > 10 then
				Size = MemCount
				if Size == 0 then
					Size = 1
				end
			end
			SetBusMemberNum(varMap, BusObjID, Size)
			local AIStr = "你的BUS可以乘坐"..Size.."人"
			
			StartTalkTask(varMap)
				TalkAppendString(varMap,"测试用，每次你的BUS可以乘坐的人数会#R＋1#W，当超过10人时，会返回到你当前BUS内的人数，重新计数。#G目前"..AIStr.."#W。")
			StopTalkTask()	
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			
			StartTalkTask(varMap)
			  TalkAppendString(varMap,AIStr);
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
		elseif BusIndex == 3 then	
			StartTalkTask(varMap)
			  TalkAppendString(varMap,"镖车是很专一的，可没有改变人数一说，所以……");
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
		elseif BusIndex == 1 then	
			StartTalkTask(varMap)
			  TalkAppendString(varMap,"系统BUS不准超载行驶");
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
		end
	end
end







function x911113_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x911113_var_FileId, x911113_var_QuestName);
end

function x911113_ProcDie(varMap,BusId,idKiller)
end
