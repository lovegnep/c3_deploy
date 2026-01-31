

x550506_var_FileId = 550506
x550506_var_TransPos0	=	"loulanwangcheng2wenquancun"  
x550506_var_TransPos1	=	"laiyinwangcheng2wenquancun"  
x550506_var_TransPos2	=	"kunlunwangcheng2wenquancun"  
x550506_var_TransPos3	=	"dunhuangwangcheng2wenquancun"



function x550506_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	
	
	
	
	
	

	local selfType = GetObjType(varMap, varPlayer)
	
	if selfType == 9 then	
		local busType = GetBusType(varMap, varPlayer)
		if busType == 1 then 
			local memberCount = GetBusMemberCount(varMap, varPlayer)
			ReadyBusChangeScene(varMap, varMap - 1,varPlayer)
			for	varI = 0, memberCount - 1 do
				local varObj = GetBusMemberObjId(varMap, varPlayer, varI)
				x550506_TransToPosition(varMap, varObj)
			end
			
			DeleteBus(varMap, varPlayer,0)
			return
		end
	elseif selfType == 1 then	
			
		local busId = GetBusId(varMap, varPlayer)
		if busId ~= -1 then
			local busType = GetBusType(varMap, busId)
			if busType == 3 then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "很抱歉，护送目标感到危险，拒绝进入该场景！");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return	
			end

			if busType == 0 or busType == 2 then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "很抱歉，护送目标感到危险，拒绝进入该场景！");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return	
			end
			
			local IsInDist = 0
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
				x550506_TransToPosition(varMap, varObj)
			end
			
			DeleteBus(varMap, busId,0)
			return
		end





	end
	
	x550506_TransToPosition(varMap, varPlayer)

end

function x550506_TransToPosition(varMap, varPlayer)

	local varCountry = GetCurCountry(varMap,varPlayer)

	if varMap == 0 and varCountry == 0 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550506_var_TransPos0)
	elseif varMap == 0 and varCountry == 1 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550506_var_TransPos1)
	elseif varMap == 0 and varCountry == 2 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550506_var_TransPos2)
	elseif varMap == 0 and varCountry == 3 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x550506_var_TransPos3)
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap,"一股神秘的力量将您拒之门外！您无法继续前行！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end
end


function x550506_ProcMapTimerTick( varMap, monsterobjid )

end


function x550506_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x550506_ProcEventEntry( varMap, monsterobjid )

end
