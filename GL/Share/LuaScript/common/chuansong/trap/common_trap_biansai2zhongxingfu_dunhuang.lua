

x300232_var_FileId = 300232
x300232_var_TransPosloulan  ="bianjing2hexidunhuang"
x300232_var_TransPoslaiyin  ="bianjing2hexidunhuang"
x300232_var_TransPoskunlun  ="bianjing2hexidunhuang"
x300232_var_TransPosdunhuang="bianjing2hexidunhuang"
x300232_var_Notice = "您的等级还不足#R40级#Y，无法前往中兴府！"


function x300232_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	
	local selfType = GetObjType(varMap, varPlayer)
	
	if selfType == 1 then 
		
		if IsHaveSpecificImpact( varMap, varPlayer, 7606) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7612) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7618) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7624) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7609) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7615) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7621) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7627) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7607) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7613) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7619) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7625) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7610) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7616) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7622) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7628) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7605) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7611) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7617) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7623) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7608) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7614) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7620) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 7626) == 1  then
			Msg2Player(varMap,varPlayer,"很抱歉，未完成铁人三项任务时无法通往其他场景！",8,2)
			return
		end
		
		
	end
	  	local nLevel = GetLevel(varMap, varPlayer)
			if nLevel < 40 then 
					Msg2Player(varMap,varPlayer,"#Y"..x300232_var_Notice.."#W",4,3)
					return
			end
	if selfType == 9 then	
		local busType = GetBusType(varMap, varPlayer)
		if busType == 1 then 
			local memberCount = GetBusMemberCount(varMap, varPlayer)
			local daduSceneId = 0
			ReadyBusChangeScene(varMap, daduSceneId,varPlayer)
			for	varI = 0, memberCount - 1 do
				local varObj = GetBusMemberObjId(varMap, varPlayer, varI)
				x300232_TransToPosition(varMap, varObj)
			end
			
			DeleteBus(varMap, varPlayer,0)
			return
		end
	elseif selfType == 1 then	




	end
	
	local varText = ""
	local CanTrans = IsCashboxState(varMap,varPlayer)	
	if CanTrans == 1 then
		StartTalkTask(varMap)
			varText = "#Y运镖或者护送状态中，不允许传送"
			TalkAppendString(varMap,varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	local guo = GetCurCountry(varMap,varPlayer)
	
	x300232_TransToPosition(varMap, varPlayer)
	
end

function x300232_TransToPosition(varMap, varPlayer)

	local guo = GetCurCountry(varMap,varPlayer)
	
	if guo == 0 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x300232_var_TransPosloulan)
		
		elseif guo == 1 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x300232_var_TransPoslaiyin)
		
		elseif guo == 2 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x300232_var_TransPoskunlun)
		
		elseif guo == 3 then
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld",varMap,varPlayer,x300232_var_TransPosdunhuang)
	
	end
end


function x300232_ProcMapTimerTick( varMap, monsterobjid )

end


function x300232_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end


function x300232_ProcEventEntry( varMap, monsterobjid )

end
