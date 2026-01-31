x303011_var_GrowPointType	= 542




function 	x303011_ProcGpCreate(varMap,growPointType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x303011_var_GrowPointType, varMap, 0, -1)
	SetGrowPointObjID(varMap,x303011_var_GrowPointType,varX,varY,varBoxId)
end




function x303011_ProcGpOpen(varMap,varPlayer,varTalknpc)
    return 0
end




function x303011_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure(PVP6V6_BATTLE_SCRIPT,"ProcGrowpointEvent_CB",varMap,varPlayer,x303011_var_GrowPointType)
	return 1
end




function x303011_ProcGpProcOver(varMap,varPlayer,varTalknpc)
end




function x303011_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
end




function x303011_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return 0
end
