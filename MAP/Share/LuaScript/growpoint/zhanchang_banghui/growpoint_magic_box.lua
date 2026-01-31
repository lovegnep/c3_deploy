

x300669_var_GatherPointTypeId = 114 		
x300669_var_Percentum = {varNum1=20,varNum2=40,num3=60,num4=80,num5=100,}           
x300669_var_BufList = {buf1=7021,buf2=7022,buf3=1210,buf4=1210,}
x300669_var_ItemId = 12010001


function 	x300669_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x300669_var_GatherPointTypeId, varMap, 0, x300669_var_ItemId)
end




function	 x300669_ProcGpOpen(varMap,varPlayer,varTalknpc)
    return x300669_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, x300669_var_GatherPointTypeId, x300669_var_ItemId)
end




function	 x300669_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return   x300669_ProcGuildRecycle( varMap, varPlayer, varTalknpc, x300669_var_GatherPointTypeId, x300669_var_ItemId )
end





function	x300669_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x300669_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end





function x300669_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )

	local guild = GetGuildID(varMap, varPlayer)
	if guild == -1 then
		return 1
	end

	return 0
end


function x300669_ProcGuildRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )

    x300669_CancelBuffer(varMap,varPlayer)

	local varNum = random(1,40)

	if varNum<=x300669_var_Percentum.varNum1 then
     	SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer,x300669_var_BufList.buf1,0)
	elseif varNum<=x300669_var_Percentum.varNum2 then
     	SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer,x300669_var_BufList.buf2,0)






	end

	return 1

end

function x300669_CancelBuffer( varMap, varPlayer )

    local bHaveFlag = IsHaveSpecificImpact(varMap, varPlayer,x300669_var_BufList.buf1 )
    if bHaveFlag > 0 then
        CancelSpecificImpact(varMap,varPlayer,x300669_var_BufList.buf1 )
    end

    bHaveFlag = IsHaveSpecificImpact(varMap, varPlayer,x300669_var_BufList.buf2 )
    if bHaveFlag > 0 then
        CancelSpecificImpact(varMap,varPlayer,x300669_var_BufList.buf2 )
    end

    bHaveFlag = IsHaveSpecificImpact(varMap, varPlayer,x300669_var_BufList.buf3 )
    if bHaveFlag > 0 then
        CancelSpecificImpact(varMap,varPlayer,x300669_var_BufList.buf3 )
    end

    bHaveFlag = IsHaveSpecificImpact(varMap, varPlayer,x300669_var_BufList.buf4 )
    if bHaveFlag > 0 then
        CancelSpecificImpact(varMap,varPlayer,x300669_var_BufList.buf4 )
    end

end



