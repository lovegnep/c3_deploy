

x301008_var_GatherPointTypeId = 9 
x301008_var_ItemId = 13010082 
x301008_var_ItemId2 ={11960001,11960002,11960003,11960004,11960005,11960006,11960007,11960008,11960009,11960010}



function 	x301008_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301008_var_GatherPointTypeId, varMap, 0, x301008_var_ItemId)
end




function	 x301008_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return 0
end




function	 x301008_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	local itemlevel =0
	if GetLevel(varMap, varPlayer)<= 10 then
				itemlevel =1
	elseif GetLevel(varMap, varPlayer)<= 20 then
				itemlevel =2
	elseif GetLevel(varMap, varPlayer)<= 30 then
				itemlevel =3
	elseif GetLevel(varMap, varPlayer)<= 40 then
				itemlevel =4
	elseif GetLevel(varMap, varPlayer)<= 50 then
				itemlevel =5
	elseif GetLevel(varMap, varPlayer)<= 60 then
				itemlevel =6
	elseif GetLevel(varMap, varPlayer)<= 70 then
				itemlevel =7
	elseif GetLevel(varMap, varPlayer)<= 80 then
				itemlevel =8
	elseif GetLevel(varMap, varPlayer)<= 90 then
				itemlevel =8
	elseif GetLevel(varMap, varPlayer)<= 100 then
				itemlevel =8
	end
	local randombuff =0
	StartItemTask(varMap)
	ItemAppend( varMap, 13010082, 1 )
  local varRet = StopItemTask(varMap,varPlayer)
    if varRet <= 0 then
        randombuff =random(1,7)
    else
    		randombuff =random(1,8)
    end
    if randombuff < 8 then
    		StartItemTask(varMap)
				ItemAppend( varMap, x301008_var_ItemId2[itemlevel], 1 )
				StopItemTask(varMap,varPlayer)
    		DeliverItemListSendToPlayer(varMap,varPlayer)









    elseif randombuff == 8 then
    		DeliverItemListSendToPlayer(varMap,varPlayer)
    		StartTalkTask(varMap)
				TalkAppendString(varMap,"µÃµ½´ÌÉß±Þ")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
    end
    SetGrowPointIntervalContainer(varMap,x301008_var_GatherPointTypeId,-1)
		return 1
end





function	x301008_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x301008_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end

