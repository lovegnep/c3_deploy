x311100_var_FileId = 311100

x311100_var_TuTengInMapId	= {
	[0]= {varWaiCheng = 50, varGuDao =51},   --楼兰	
	[1]= {varWaiCheng = 150, varGuDao =151}, --天山
	[2]= {varWaiCheng = 250, varGuDao =251}, --昆仑
	[3]= {varWaiCheng = 350, varGuDao =351}, --敦煌
}

--保存图腾国家排名
x311100_var_TopFourCountry = {
[0]= -1,
[1]= -1,
[2]= -1,
[3]= -1,
}

--保存图腾对象id
x311100_var_TuTengObjId = {
[50]=-1,
[51]=-1,
[150]=-1,
[151]=-1,
[250]=-1,
[251]=-1,
[350]=-1,
[351]=-1,
}

x311100_var_TuTengTypeId = {
[0] = 937, 				-- 第1名图腾类型(紫色)
[1] = 934,				-- 第2名图腾类型(红色)
[2] = 931,				-- 第3名图腾类型(黄色)
[3] = 935,				-- 第4名图腾类型(绿色)
}


function x311100_ProcToplistUpdate(varMap)
	local nCountry = x311100_GetCountryByMapId(varMap)

	if -1 == nCountry or nCountry < 0 or nCountry > 3 then
		WriteLog(1, "x311100 tuteng not in this Country  varMap="..varMap)
		return
	end
	
	x311100_DeleteTuTeng(varMap, nCountry)
	x311100_CreateTuTeng(varMap, nCountry)
end

function x311100_CreateTuTeng(varMap, varCountry)
	if -1 == varCountry or varCountry < 0 or varCountry > 3 then
		WriteLog(1, "x311100 tuteng not in this Country  varMap="..varMap)
		return
	end

	local nOrder = x311100_GetOrderByCountryId(varMap, varCountry)

	if -1 ~= nOrder then
		SetGrowPointIntervalContainer(varMap, x311100_var_TuTengTypeId[nOrder], 1000)	
	end
end


function x311100_DeleteTuTeng(varMap, varCountry)
	for i=0, 3 do
		RecycleGrowPointByType(varMap, x311100_var_TuTengTypeId[i], -1)
		x311100_var_TuTengObjId[varMap]  = -1
		LuaCallNoclosure(311101, "SaveTuTengObjId", varMap, varCountry, -1)
	end
end


function x311100_GetOrderByCountryId(varMap, varCountry)
	if -1 == varCountry or varCountry < 0 or varCountry > 3 then
		WriteLog(1, "x311100 tuteng not in this Country  varMap="..varMap)
		return
	end

	local nWorldId = GetWorldIdEx()
	local nCountTopList = GetToplistCount(nWorldId, WORLDCUP_TOPLIST_A)
	local nCount = 0
	
	if nCountTopList <= 4 then
		nCount = nCountTopList
	else
		nCount = 4
	end

	if nCount <=0 then
		WriteLog(1, "x311100_ProcTuTengUpdate WorldCup TopList Count < 0 nCount="..nCount)
		return -1
	end

	for i=0, 3 do
		x311100_var_TopFourCountry[i] = -1
	end

	for i=0, nCount-1 do
		local snid, key, country = GetToplistInfo(nWorldId, WORLDCUP_TOPLIST_A, i)
		if nil == country or country < 0 or country > 3 then
			WriteLog(1, "x311100_ProcTuTengUpdate country not validate varMap ="..varMap)
		elseif -1 == x311100_var_TopFourCountry[country] then
			x311100_var_TopFourCountry[country] = i
		end
	end
	return x311100_var_TopFourCountry[varCountry]
end

function x311100_GetCountryByMapId(varMap)
	for i, item in x311100_var_TuTengInMapId do
		if item.varWaiCheng == varMap or item.varGuDao == varMap then
			return i
		end
	end
	return -1
end

function x311100_SaveTuTengObjId(varMap,varCountry, varObjId)
	x311100_var_TuTengObjId[varMap] = varObjId
end
