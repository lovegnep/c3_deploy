

x300922_var_ItemIndex = -1


function x300922_ProcGpCreate(varMap,growPointType,varX,varY)
	
	local typeGrowPoint = LuaCallNoclosure(300918,"GetDoorB",varMap)
	
	local varBoxId = ItemBoxEnterScene(varX, varY, typeGrowPoint, varMap, 0, x300922_var_ItemIndex)
    SetGrowPointObjID(varMap,typeGrowPoint,varX,varY,varBoxId)
end




function x300922_ProcGpOpen(varMap,varPlayer,varTalknpc)
	
	local typeGrowPoint = LuaCallNoclosure(300918,"GetDoorB",varMap)
    return x300922_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, typeGrowPoint, x300922_var_ItemIndex)
end




function x300922_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	local typeGrowPoint = LuaCallNoclosure(300918,"GetDoorB",varMap)
	return x300922_ProcGuildRecycle( varMap, varPlayer, varTalknpc, typeGrowPoint, x300922_var_ItemIndex )
end





function x300922_ProcGpProcOver(varMap,varPlayer,varTalknpc)	
end



function x300922_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
end





function x300922_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure(300918,"ProcGpOpenDoorB_Check",varMap,varPlayer)
end


function x300922_ProcGuildRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )

	return LuaCallNoclosure(300918,"ProcGpOpenDoorB",varMap,varPlayer)
end



