

x700080_var_GrowpointId = 500 
x700080_var_ItemIndex = -1 

x700080_var_FileId = 700080
x700080_Fuben_FileId = 700021
x700080_CSP_B_GROWPOINT_OVER = 239




function 	x700080_ProcGpCreate(varMap,growPointType,varX,varY)
	

	local bOver = GetFubenData_Param(varMap, x700080_CSP_B_GROWPOINT_OVER);

	if bOver>0 then
		return
	end

	local varBoxId = ItemBoxEnterScene(varX, varY, x700080_var_GrowpointId, varMap, 0, x700080_var_ItemIndex)
	SetGrowPointObjID(varMap, x700080_var_GrowpointId, varX, varY, varBoxId)
end




function	 x700080_ProcGpOpen(varMap,varPlayer,varTalknpc)
	
	
	return 0
	
end




function	 x700080_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle", varMap, varPlayer, varTalknpc, x700080_var_GrowpointId, x700080_var_ItemIndex )
end





function	x700080_ProcGpProcOver(varMap,varPlayer,varTalknpc)

	
	local varScriptFileId = GetFubenData_Param(varMap, 1);

	LuaCallNoclosure( varScriptFileId, "ProcGrowPoint", varMap, varPlayer ) ;
	
	

	

	
end




function	x700080_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end
