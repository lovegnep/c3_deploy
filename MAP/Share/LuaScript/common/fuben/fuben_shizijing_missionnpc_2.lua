

x700015_var_EnterDay					=	{0,1,2,3,4,5,6};



x700015_var_FileId = 700015
x700015_var_SceneNpcCount = 1
x700015_var_SceneNpcGuid = 137715



function x700015_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4,Param5 )

	if x700015_CheckDay(varMap)<=0 then
		return
	end

    if varMap == 50 or varMap == 150 or varMap == 250 or varMap == 350 then

        
        for varI=1,x700015_var_SceneNpcCount do

            local varObj = FindMonsterByGUID( varMap,x700015_var_SceneNpcGuid)
            
			if varObj>=0 then
				DeleteMonster( varMap,varObj )
			end

        end

		local strFmt = "探宝任务结束了"
		local varMsg = strFmt
		
		x700015_MsgToCountry(varMap, varMsg, 4, 1)
    end
end



function x700015_ProcMapTimerTick( varMap, varAct, varTime )

end


function x700015_CheckDay(varMap)
	local weekDay = GetWeek()
	for varI, item in x700015_var_EnterDay do
		if weekDay==item then
			
			
			return 1;
			
		end
	end

	return 0;
end


function x700015_MsgToCountry(varMap, varMsg, nParam1, nParam2)
	if varMap==50 then
		LuaAllScenceM2Country(varMap, varMsg, 0, nParam1, nParam2)
	elseif varMap==150 then
		LuaAllScenceM2Country(varMap, varMsg, 1, nParam1, nParam2)
	elseif varMap==250 then
		LuaAllScenceM2Country(varMap, varMsg, 2, nParam1, nParam2)
	elseif varMap==350 then
		LuaAllScenceM2Country(varMap, varMsg, 3, nParam1, nParam2)
	end

end
