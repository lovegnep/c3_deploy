

x301099_var_GatherPointTypeId = 335 

x301099_var_Target_FileId = 300580




function 	x301099_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301099_var_GatherPointTypeId, varMap, 0, -1)
end




function	 x301099_ProcGpOpen(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure(x301099_var_Target_FileId,"ProcClickBox", varMap,varPlayer,1)
	return 1
end




function	 x301099_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return 0;
end





function	x301099_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	return 0;
end


