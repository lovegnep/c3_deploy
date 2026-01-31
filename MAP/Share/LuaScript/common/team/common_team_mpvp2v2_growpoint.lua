




x303104_var_GrowPonitTypeAry 			= 
{
{type = 840, bufid = 30070}, 
{type = 841, bufid = 30071},
{type = 842, bufid = 30072}, 
{type = 843, bufid = 30073},
{type = 844, bufid = 30074}, 
{type = 845, bufid = 30075},
{type = 846, bufid = 30070}, 
{type = 847, bufid = 30071},
{type = 848, bufid = 30072}, 
{type = 849, bufid = 30073},
{type = 850, bufid = 30074}, 
{type = 851, bufid = 30075},
{type = 852, bufid = 30070}, 
{type = 853, bufid = 30071},
{type = 854, bufid = 30072}, 
{type = 855, bufid = 30073},
{type = 856, bufid = 30074}, 
{type = 857, bufid = 30075},
}											

x303104_var_curGrowPonitInfoTbl 		= {}

x303104_var_curExistAllGrowPonitTbl 	= {}	

x303104_var_curSceneInit	 			= {}		

x303104_var_GrowPonitBufName			= {}




function x303104_ProcInit(varMap)
	
	
	for varI, item in x303104_var_GrowPonitTypeAry do
		RecycleGrowPointByType(varMap, item.type, -1)
	end

	
	x303104_var_GrowPonitBufName[30070] = "加速"
	x303104_var_GrowPonitBufName[30071] = "回复"
	x303104_var_GrowPonitBufName[30072] = "暴击伤害增加"
	x303104_var_GrowPonitBufName[30073] = "补给"
	x303104_var_GrowPonitBufName[30074] = "伤害减免"
	x303104_var_GrowPonitBufName[30075] = "忽视减免"	
	
	x303104_var_curGrowPonitInfoTbl[varMap] =
	 {
		 {type = 0, exist = 0, tmp = 0, varX = 90,varY = 	140	}, 
		 {type = 0, exist = 0, tmp = 0, varX =	86,varY = 	140	}, 
		 {type = 0, exist = 0, tmp = 0, varX =	88,varY = 	141	}, 
		 {type = 0, exist = 0, tmp = 0, varX =	87,varY = 	113	}, 
		 {type = 0, exist = 0, tmp = 0, varX =	84,varY = 	111	}, 
		 {type = 0, exist = 0, tmp = 0, varX =	79,varY = 	112	}, 
		 {type = 0, exist = 0, tmp = 0, varX =	167,varY =	140	}, 
		 {type = 0, exist = 0, tmp = 0, varX =	170,varY =	136	}, 
		 {type = 0, exist = 0, tmp = 0, varX =	174,varY =	140	}, 
		 {type = 0, exist = 0, tmp = 0, varX =	167,varY =	116	}, 
		 {type = 0, exist = 0, tmp = 0, varX =171,varY =	112	}, 
		 {type = 0, exist = 0, tmp = 0, varX =174,varY =	114	}, 
		 {type = 0, exist = 0, tmp = 0, varX =127,varY =	142	}, 
		 {type = 0, exist = 0, tmp = 0, varX =125,varY =	151	}, 
		 {type = 0, exist = 0, tmp = 0, varX =130,varY =	151	}, 
		 {type = 0, exist = 0, tmp = 0, varX =125,varY =	105	}, 
		 {type = 0, exist = 0, tmp = 0, varX =128,varY =	113	}, 
		 {type = 0, exist = 0, tmp = 0, varX =130,varY =	105	}, 

	 }
	 
	 
	 x303104_var_curSceneInit[varMap] = 1
end




function x303104_RecyclePlayerAllBuf(varMap, varPlayer)

	for varI, item in x303104_var_GrowPonitTypeAry do
        DispelSpecificImpact(varMap, varPlayer, item.bufid, 1)
    end
end





function x303104_ProcTimeMakeGrowPoint(varMap)

	
	if x303104_var_curSceneInit[varMap] == nil then
		return
	end
	
	
	local nTypeNum = getn(x303104_var_GrowPonitTypeAry)
	if nTypeNum == 0 then
		return
	end

	local tblOkPoint = {}
	local tblOkType = {}
	local nOkPointIdx = 0
	local nOkTypeIdx = 0
	local nExistNum = 0
	local nPosNum = getn(x303104_var_curGrowPonitInfoTbl[varMap])

	
	for varI, item1 in x303104_var_GrowPonitTypeAry do
		
		local nExist = 0
		for j, item2 in x303104_var_curGrowPonitInfoTbl[varMap] do
			if item1.type == item2.type then
				nExist = 1
				break
			end
		end
		
		if nExist == 0 then
			nOkTypeIdx = nOkTypeIdx + 1
			tblOkType[nOkTypeIdx] = item1.type
		end
	end

	
	if getn(tblOkType) == 0 then
		return
	end

	
	for varI = 1, nPosNum do
		if x303104_var_curGrowPonitInfoTbl[varMap][varI].exist == 0 then
			nOkPointIdx = nOkPointIdx + 1
			tblOkPoint[nOkPointIdx] = x303104_var_curGrowPonitInfoTbl[varMap][varI]
		
			
			tblOkPoint[nOkPointIdx].tmp = varI
		else
			nExistNum = nExistNum + 1
		end
	end
	
	
	if nExistNum >= nTypeNum then
		return
	end
	
	
	if nOkPointIdx > 0 then
		local nIndex1 = random(1, nOkPointIdx)
		if nIndex1 < 1 then nIndex1 = 1 end
		if nIndex1 > nOkPointIdx then nIndex1 = nOkPointIdx end		
		
		local nIndex2 = random(1, nOkTypeIdx)
		if nIndex2 < 1 then nIndex2 = 1 end
		if nIndex2 > nOkTypeIdx then nIndex2 = nOkTypeIdx end		

		
		RecycleGrowPointByType(varMap, tblOkType[nIndex2], 0)
		SetGrowPointPos(varMap, tblOkType[nIndex2], tblOkPoint[nIndex1].varX, tblOkPoint[nIndex1].varY)

		
		x303104_var_curGrowPonitInfoTbl[varMap][tblOkPoint[nIndex1].tmp].type = tblOkType[nIndex2]	
		x303104_var_curGrowPonitInfoTbl[varMap][tblOkPoint[nIndex1].tmp].exist = 1	
	end		
end




function x303104_ProcGpCreate(varMap, growPointType, varX, varY)

	
	local varBoxId = ItemBoxEnterScene(varX, varY, growPointType, varMap, 0, -1)
	SetGrowPointObjID(varMap, growPointType, varX, varY, varBoxId)
	
	
	if x303104_var_curExistAllGrowPonitTbl[varMap] == nil then
		x303104_var_curExistAllGrowPonitTbl[varMap] = {}
	end
	
	x303104_var_curExistAllGrowPonitTbl[varMap][varBoxId] = growPointType
end




function x303104_ProcGpOpen(varMap, varPlayer, varTalknpc)

	
	if x303104_var_curSceneInit[varMap] == nil then
		return 1
	end
	
	if getn(x303104_var_GrowPonitTypeAry) == 0 then
		return 1
	end

	if x303104_var_curExistAllGrowPonitTbl[varMap][varTalknpc] == nil then
		return 1
	end
	
	
	RecycleGrowPointByType(varMap, x303104_var_curExistAllGrowPonitTbl[varMap][varTalknpc], -1)

	
	local nPosNum = getn(x303104_var_curGrowPonitInfoTbl[varMap])

	for varI = 1, nPosNum do
		if x303104_var_curGrowPonitInfoTbl[varMap][varI].type == x303104_var_curExistAllGrowPonitTbl[varMap][varTalknpc] then
			x303104_var_curGrowPonitInfoTbl[varMap][varI].type = 0
			x303104_var_curGrowPonitInfoTbl[varMap][varI].exist = 0
			break
		end
	end
	
	
	for varI, item in x303104_var_GrowPonitTypeAry do
		if item.type == x303104_var_curExistAllGrowPonitTbl[varMap][varTalknpc] then
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, item.bufid, 0)
			if x303104_var_GrowPonitBufName[item.bufid] ~= nil then
				Msg2Player(varMap, varPlayer, format("您采集到了【%s】效果", x303104_var_GrowPonitBufName[item.bufid]), 8, 2)
				Msg2Player(varMap, varPlayer, format("您采集到了【%s】效果", x303104_var_GrowPonitBufName[item.bufid]), 8, 3)	
				WriteLog(1, format("MP2BL:x303104_ProcGpOpen 1 varMap=%d PlayerGUID=%u varParam1=%d", varMap, GetGUID(varMap, varPlayer), item.bufid))			
			end
			break
		end
	end
	
	
    return 1
end




function x303104_ProcGpRecycle(varMap, varPlayer, varTalknpc)
	return 1
end




function x303104_ProcGpProcOver(varMap,varPlayer,varTalknpc)
end




function x303104_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
end




function x303104_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
	return 0
end
