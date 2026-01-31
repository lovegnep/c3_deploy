


x911116_var_FileId = 911116
x911116_var_QuestName = "镖车/BUS 切换"









function x911116_ProcEventEntry(varMap, varPlayer, varTalknpc)	
	local IsDriver = IsBusLeader(varMap , varPlayer)
	
	if IsDriver == 1 then
		local BusObjID = GetBusId(varMap,varPlayer)
		local BusType = GetBusType(varMap, BusObjID)
		local BusIndex = GetBusIndex(varMap, BusObjID)	
		
		if BusType == 1 and BusIndex == 2 then	
			local AIStr = "你的镖车转变为BUS"
			if BusType == 1 then
				BusChangeState(varMap, BusObjID)
				AIStr = "你的镖车转变为BUS"
				local CarName = GetName( varMap, varPlayer ).." 的BUS"
				SetBusTitle(varMap , BusObjID, CarName)
			elseif BusType == 0 then 
				BusChangeState(varMap, BusObjID)
				AIStr = "你的BUS转变为镖车"
				local CarName = GetName( varMap, varPlayer ).." 的镖车"
				SetBusTitle(varMap , BusObjID, CarName)
			end
			StartTalkTask(varMap)
				TalkAppendString(varMap,"测试用，设置你控制的车在镖车和BUS之间切换”。#G目前"..AIStr.."#W。")
			StopTalkTask( )	
			DeliverTalkMenu(varMap,varPlayer,varTalknpc)
			
			StartTalkTask(varMap)
			  TalkAppendString(varMap,AIStr);
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
		end
	end	
end







function x911116_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x911116_var_FileId, x911116_var_QuestName);
end


function x911116_ProcDie(varMap,BusId,idKiller)
end
