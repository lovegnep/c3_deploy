

x301101_var_GatherPointTypeId = 337 

x301101_var_Target_FileId = 300580




function 	x301101_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301101_var_GatherPointTypeId, varMap, 0, -1)
end




function	 x301101_ProcGpOpen(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure(x301101_var_Target_FileId,"ProcClickBox", varMap,varPlayer,3)
	return 1
end




function	 x301101_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return 0;
end





function	x301101_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	return 0;
end


