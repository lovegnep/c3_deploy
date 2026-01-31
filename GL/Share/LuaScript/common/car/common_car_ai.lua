


x911112_var_FileId = 911112
x911112_var_QuestName = "可被攻击/无敌 切换"









function x911112_ProcEventEntry(varMap, varPlayer, varTalknpc)	

	local IsDriver = IsBusLeader(varMap , varPlayer)
	
	if IsDriver == 1 then
		local BusObjID = GetBusId(varMap,varPlayer)
		local BusType  = GetBusType(varMap, BusObjID)
		local BusIndex = GetBusIndex(varMap, BusObjID)	
		
		if BusType == 1 and BusIndex == 2 then
			local AIStr = "你的战车处于可被攻击状态"
			if random(1,2) == 1 then
				SetBusAIType(varMap, BusObjID, 7)
				AIStr = "你的战车处于可被攻击状态"
			else
				SetBusAIType(varMap, BusObjID, 3)
				AIStr = "你的战车处于无敌状态"
			end
			StartTalkTask(varMap)
				TalkAppendString(varMap,"测试用，每次有一半的概率被设置为“无敌状态”，即不可被攻击；一半的概率被设置为“可被攻击状态”，即可受攻击被摧毁。#G目前"..AIStr.."#W。")
			StopTalkTask( )	
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			
			StartTalkTask(varMap)
			  TalkAppendString(varMap,AIStr);
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
		elseif BusIndex == 3 then
			StartTalkTask(varMap)
			  TalkAppendString(varMap,"镖车暂时不希望能够更改攻击状态");
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
		elseif BusIndex == 1 then
			StartTalkTask(varMap)
			  TalkAppendString(varMap,"系统BUS暂时不希望能够更改攻击状态");
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
		end
			
	end	
end







function x911112_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x911112_var_FileId, x911112_var_QuestName);
end

function x911112_ProcDie(varMap,BusId,idKiller)
end
