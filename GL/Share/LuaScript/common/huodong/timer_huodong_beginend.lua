
x302500_var_FileId = 302500						
x302500_var_DayInfo1 = {
						{m = 12,d = 24},
						{m = 12,d = 25},
					}



function x302500_PlayEffect1(varMap,varPlayer )

    
    if varMap ~= 0 and varMap ~= 50 and varMap ~= 150 and varMap ~= 250 and varMap ~= 350 and varMap ~= 15  then 
	  return
	end

	
	local year,month,day = GetYearMonthDay()
	local find1 = 0
	for varI,item in x302500_var_DayInfo1 do
		if item.m == month and item.d == day then
			find1 = 1
			break
		end
	end

    
	if find1 == 1 then

		LuaCallNoclosure( 888894, "PlayClientCameraEffect", varMap, varPlayer,29,1)
	end

end




function x302500_StopEffect1(varMap)
    
	if varMap ~= 0 and varMap ~= 50 and varMap ~= 150 and varMap ~= 250 and varMap ~= 350 and varMap ~= 15  then 
	  return
	end
	local year,month,day = GetYearMonthDay()
	local find1 = 0
	for varI,item in x302500_var_DayInfo1 do
		if item.m == month and item.d == day then
			find1 = 1
			break
		end
	end

	if find1 == 0 then
		local humancount = GetScenePlayerCount(varMap);
		for	varI = 0, humancount - 1 do
			local humanId = GetScenePlayerObjId(varMap, varI);
			if IsPlayerStateNormal( varMap,humanId ) == 1 then
				LuaCallNoclosure( 888894, "PlayClientCameraEffect", varMap, humanId,29,0)
			end
		end
	end	
end




function x302500_PlayEffect(varMap,varPlayer )
	x302500_PlayEffect1(varMap,varPlayer )
end




function x302500_StopEffect(varMap)
	x302500_StopEffect1(varMap)
end





function x302500_PlayEffectBySceneId(varMap )
	
	
    if varMap ~= 0 and varMap ~= 50 and varMap ~= 150 and varMap ~= 250 and varMap ~= 350 and varMap ~= 15  then 
	  return 0
	end

	
	local year,month,day = GetYearMonthDay()
	local item = x302500_var_DayInfo1[1]
	if item.m ~= month or item.d ~= day then
		return 0
	end
	
	
	local md = GetMinOfDay()
	if md < 0 or md >= 10*60*1000 then
		return 0
	end
	
	local humancount = GetScenePlayerCount(varMap);
	for	varI = 0, humancount - 1 do
		local humanId = GetScenePlayerObjId(varMap, varI);
		if IsPlayerStateNormal( varMap,humanId ) == 1 then
			LuaCallNoclosure( 888894, "PlayClientCameraEffect", varMap, humanId,29,1)
		end
	end
	
	return 1
end




function x302500_StopEffectBySceneId(varMap)
	x302500_StopEffect1(varMap)
end




function x302500_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5 )

	
	if x302500_PlayEffectBySceneId( varMap) == 1 then
		return
	end

	
	x302500_StopEffectBySceneId(varMap)
	
end
