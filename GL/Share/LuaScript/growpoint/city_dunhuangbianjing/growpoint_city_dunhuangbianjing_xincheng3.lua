

x301100_var_GatherPointTypeId = 336 

x301100_var_Target_FileId = 300580




function 	x301100_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301100_var_GatherPointTypeId, varMap, 0, -1)
end




function	 x301100_ProcGpOpen(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure(x301100_var_Target_FileId,"ProcClickBox", varMap,varPlayer,2)
	return 1
end




function	 x301100_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return 0;
end





function	x301100_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	return 0;
end


