-- 恢复最大体力
function x310403_ProcRestorePhysicalForce(varMap, varPlayer)

	local lastDay = GetPlayerGameData(varMap, varPlayer, MD_RESTORE_PHYSICALFORCE_DATE[1], MD_RESTORE_PHYSICALFORCE_DATE[2], MD_RESTORE_PHYSICALFORCE_DATE[3])
	local thisDay = GetDayOfYear()
	
	if thisDay ~= lastDay then
		-- 恢复体力值为最大
		SetPlayerPhysicalForce(varMap, varPlayer, GetPlayerMaxPhysicalForce(varMap, varPlayer))
		SetPlayerGameData(varMap, varPlayer, MD_RESTORE_PHYSICALFORCE_DATE[1], MD_RESTORE_PHYSICALFORCE_DATE[2], MD_RESTORE_PHYSICALFORCE_DATE[3], thisDay)
	end
end

-- 玩家登录时恢复最大体力
function x310403_ProcMapPlayerNewConnectEnter(varMap, varPlayer)

	x310403_ProcRestorePhysicalForce(varMap, varPlayer)	
	
end
