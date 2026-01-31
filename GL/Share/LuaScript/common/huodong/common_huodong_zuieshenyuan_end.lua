
x310966_var_FileId 		= 310966


function x310966_ProcTimerDoingStart( varMap, varAct,varParam1, varParam2, varParam3 )

	SetSystemTimerTick( varMap, x310966_var_FileId, "ProcTimerTick", varAct, 1000)
	local hour,minute,sec =GetHourMinSec()
	local x = random (0 , 2)
	local end0 = 0
	local end1 = 0
	if hour == 23 and minute >= 45 then
		end0 = 1
	end
	if hour == 0 and minute <= 14 then
		end1 = 1
	end
	if end0 == 1 or end1 == 1 then
		local varHumanCount = GetScenePlayerCount( varMap)
	    if varHumanCount > 0 then
	        for varI = 0, varHumanCount do
	            local varObj = GetScenePlayerObjId( varMap,varI)
	            if varObj >= 0 then
					NewWorld(varMap, varObj,0, 245+x,313+x,310966)--返回大都
	            end
	        end
	    end
    end
end


function x310966_ProcTimerTick(varMap, varAct, varTime)

	
	SetSystemTimerTick( varMap, x310966_var_FileId, "ProcTimerTick", varAct, 1000)
	local hour,minute,sec =GetHourMinSec()
	local x = random (0 , 2)
	local end0 = 0
	local end1 = 0
	if hour == 23 and minute >= 45 then
		end0 = 1
	end
	if hour == 0 and minute <= 14 then
		end1 = 1
	end
	if end0 == 1 or end1 == 1 then
		local varHumanCount = GetScenePlayerCount( varMap)
	    if varHumanCount > 0 then
	        for varI = 0, varHumanCount do
	            local varObj = GetScenePlayerObjId( varMap,varI)
	            if varObj >= 0 then
					NewWorld(varMap, varObj,0, 245+x,313+x,310966)--返回大都
	            end
	        end
	    end
    end
	-- if end0 ~= 1 or end1 ~= 1 then
		-- local varHumanCount = GetScenePlayerCount( varMap)
	    -- if varHumanCount > 0 then
	        -- for varI = 0, varHumanCount do
	            -- local varObj = GetScenePlayerObjId( varMap,varI)
				-- local value = GetPlayerGameData(varMap, varObj, MD_ZUIESHENYUAN_DATE[1], MD_ZUIESHENYUAN_DATE[2], MD_ZUIESHENYUAN_DATE[3])
				-- if value == varToday  then
	           -- if varObj >= 0 then
					-- NewWorld(varMap, varObj,0, 245+x,313+x,310966)--返回大都
	            -- end
	        -- end
	    -- end
    -- end
end