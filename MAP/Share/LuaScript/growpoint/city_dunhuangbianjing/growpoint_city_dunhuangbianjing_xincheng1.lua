

x301098_var_GatherPointTypeId = 334 

x301098_var_Target_FileId = 300580




function 	x301098_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301098_var_GatherPointTypeId, varMap, 0, -1)
end




function	 x301098_ProcGpOpen(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure(x301098_var_Target_FileId,"ProcClickBox", varMap,varPlayer,0)
	return 1
end




function	 x301098_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return 0;
end





function	x301098_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	return 0;
end


