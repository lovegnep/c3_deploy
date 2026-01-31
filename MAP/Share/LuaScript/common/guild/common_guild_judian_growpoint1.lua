

x300921_var_ItemIndex = -1


function x300921_ProcGpCreate(varMap,growPointType,varX,varY)
	
	local typeGrowPoint = LuaCallNoclosure(300918,"GetDoorA",varMap)
	
	local varBoxId = ItemBoxEnterScene(varX, varY, typeGrowPoint, varMap, 0, x300921_var_ItemIndex)
    SetGrowPointObjID(varMap,typeGrowPoint,varX,varY,varBoxId)
end




function x300921_ProcGpOpen(varMap,varPlayer,varTalknpc)
	
	local typeGrowPoint = LuaCallNoclosure(300918,"GetDoorA",varMap)
    return x300921_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, typeGrowPoint, x300921_var_ItemIndex)
end




function x300921_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	local typeGrowPoint = LuaCallNoclosure(300918,"GetDoorA",varMap)
	return x300921_ProcGuildRecycle( varMap, varPlayer, varTalknpc, typeGrowPoint, x300921_var_ItemIndex )
end





function x300921_ProcGpProcOver(varMap,varPlayer,varTalknpc)	
end



function x300921_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
end





function x300921_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure(300918,"ProcGpOpenDoorA_Check",varMap,varPlayer)
end


function x300921_ProcGuildRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )

	return LuaCallNoclosure(300918,"ProcGpOpenDoorA",varMap,varPlayer)
end



