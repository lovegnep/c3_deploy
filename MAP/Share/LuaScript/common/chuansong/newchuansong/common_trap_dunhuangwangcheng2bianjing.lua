

x550100_var_FileId = 550100
x550100_var_TransPosLou="loulanwangcheng2bianjing"
x550100_var_TransPosLai="laiyinwangcheng2bianjing"
x550100_var_TransPosKun="kunlunwangcheng2bianjing"
x550100_var_TransPosDun="dunhuangwangcheng2bianjing"
x550100_var_Notice = "您的等级还不足#R20级#Y，无法前往王国边塞！"



function x550100_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	
	local selfType = GetObjType(varMap, varPlayer)
	
	if selfType == 1 then 
			
			if IsHaveQuestNM( varMap, varPlayer, 7537) ~= 0 or  IsHaveQuestNM( varMap, varPlayer, 7538) ~= 0 or IsHaveQuestNM( varMap, varPlayer, 7539) ~= 0 then
				Msg2Player(varMap,varPlayer,"很抱歉，未完成铁人三项任务时无法通往其他场景！",8,2)
				return
			end
			
			
			
			local nLevel = GetLevel(varMap, varPlayer)
			if nLevel < 20 then 
					Msg2Player(varMap,varPlayer,"#Y"..x550100_var_Notice.."#W",4,3)
					return
			end
	end

	if selfType == 9 then	
		
		local busType = GetBusType(varMap, varPlayer)
		if busType == 1 then 
			local memberCount = GetBusMemberCount(varMap, varPlayer)
			ReadyBusChangeScene(varMap, varMap + 1, varPlayer)
			for	varI = 0, memberCount - 1 do
				local varObj = GetBusMemberObjId(varMap, varPlayer, varI)
				x550100_TransToPosition(varMap, varObj)
			end
			
			DeleteBus(varMap, varPlayer,0)
			return
		end
	elseif selfType == 1 then	
		local busId = GetBusId(varMap, varPlayer)
		if busId ~= -1 then
			local busType = GetObjType(varMap, busId)
			if busType == 3 then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "很抱歉，护送目标感到危险，拒绝进入该场景！");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return	
			end

			local IsInDist = 0
			local busType = GetBusType(varMap, busId)
			if busType == 0 then		
				
				IsInDist = IsValidMyselfBus(varMap,varPlayer)
			elseif busType == 2 then	
				IsInDist = IsValidGuildBus(varMap,varPlayer)		
			elseif busType == 3 then	
				StartTalkTask(varMap)
				TalkAppendString(varMap, "你正在护送，不能这么做！");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return			
			end
			
			if IsInDist == 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "你的护送目标离你太远了，不能这么做！");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return
			end
				
			local memberCount = GetBusMemberCount(varMap, busId)
			ReadyBusChangeScene(varMap, varMap + 1, busId)
			for	varI = 0, memberCount - 1 do
				local varObj = GetBusMemberObjId(varMap, busId, varI)
				x550100_TransToPosition(varMap, varObj)
			end
			
			DeleteBus(varMap, busId,0)
			return
		end
		




	end
	
	x550100_TransToPosition(varMap, varPlayer)
end

function x550100_TransToPosition(varMap, varPlayer)
	if varMap == 50 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550100_var_TransPosLou)
	elseif varMap == 150 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550100_var_TransPosLai)
	elseif varMap == 250 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550100_var_TransPosKun)
	elseif varMap == 350 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550100_var_TransPosDun)
	end
end


function x550100_ProcMapTimerTick( varMap, monsterobjid )

end


function x550100_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550100_ProcEventEntry( varMap, monsterobjid )

end

