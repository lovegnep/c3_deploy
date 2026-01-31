

x300483_var_FileId = 300483
x300483_var_TransPos0	=	"jining2weihailoulan"
x300483_var_TransPos1	=	"jining2weihailaiyin"
x300483_var_TransPos2	=	"jining2weihaikunlun"
x300483_var_TransPos3	=	"jining2weihaidunhuang"
x300483_var_Notice = "您的等级还不足#R40级#Y，无法前往威海港！"



function x300483_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	
	if IsHaveSpecificImpact( varMap, varPlayer, 7610) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7607) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7608) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7605) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7616) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7613) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7614) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7611) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7622) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7619) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7620) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7617) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7628) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7625) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7626) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7623) == 1 then
		Msg2Player(varMap,varPlayer,"很抱歉，未完成铁人三项任务时无法通往其他场景！",8,2)
		return
	end
	
  	local nLevel = GetLevel(varMap, varPlayer)
			if nLevel < 40 then 
					Msg2Player(varMap,varPlayer,"#Y"..x300483_var_Notice.."#W",4,3)
					return
			end
	
	local selfType = GetObjType(varMap, varPlayer)
	
	if selfType == 9 then	
		local busType = GetBusType(varMap, varPlayer)
		if busType == 1 then 
			local memberCount = GetBusMemberCount(varMap, varPlayer)
			ReadyBusChangeScene(varMap, varMap - 1,varPlayer)
			for	varI = 0, memberCount - 1 do
				local varObj = GetBusMemberObjId(varMap, varPlayer, varI)
				x300483_TransToPosition(varMap, varObj)
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
				x300483_TransToPosition(varMap, varObj)
			end
			
			DeleteBus(varMap, busId,0)
			return
		end





	end
	
	x300483_TransToPosition(varMap, varPlayer)

end

function x300483_TransToPosition(varMap, varPlayer)

	local varCountry = GetCurCountry(varMap,varPlayer)

	if varMap == 2 and varCountry == 0 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x300483_var_TransPos0)
	elseif varMap == 2 and varCountry == 1 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x300483_var_TransPos1)
	elseif varMap == 2 and varCountry == 2 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x300483_var_TransPos2)
	elseif varMap == 2 and varCountry == 3 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x300483_var_TransPos3)
	else
		StartTalkTask(varMap)
			TalkAppendString(varMap,"一股神秘的力量将您拒之门外！您无法继续前行！")
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end
end


function x300483_ProcMapTimerTick( varMap, monsterobjid )

end


function x300483_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x300483_ProcEventEntry( varMap, monsterobjid )

end
