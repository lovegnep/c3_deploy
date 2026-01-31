

x300644_var_ItemIndex = -1
x300644_var_GrowPointType = 114


function x300644_ProcGpCreate(varMap,growPointType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x300644_var_GrowPointType, varMap, 0, x300644_var_ItemIndex)
    SetGrowPointObjID(varMap,x300644_var_GrowPointType,varX,varY,varBoxId)
end




function x300644_ProcGpOpen(varMap,varPlayer,varTalknpc)
    return x300644_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, x300644_var_GrowPointType, x300644_var_ItemIndex)
end




function x300644_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return x300644_ProcGuildRecycle( varMap, varPlayer, varTalknpc, x300644_var_GrowPointType, x300644_var_ItemIndex )
end





function x300644_ProcGpProcOver(varMap,varPlayer,varTalknpc)	
end



function x300644_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
end





function x300644_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure(300643,"ProcRecyleConvoyGrowPoint_Check",varMap,varPlayer)
end


function x300644_ProcGuildRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )

	return LuaCallNoclosure(300643,"ProcRecyleConvoyGrowPoint",varMap,varPlayer)
end



