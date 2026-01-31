-- 负责处理monster对象初始化后特殊属性的相关处理

x310999_var_FileId 										= 310999
x310999_var_MapId											=	{0, 41}	-- 相关场景Id
x310999_var_MonsterToplist						= {
	{varObjSnid = 138911, varTopListId = 19},	-- 战场积分
	{varObjSnid = 138912, varTopListId = 59},	-- 轮回台
	{varObjSnid = 138913, varTopListId = 51},	-- 囚龙岛
	{varObjSnid = 138914, varTopListId = 63},	-- 夏王墓
	{varObjSnid = 138915, varTopListId = 61},	-- 大教堂
	{varObjSnid = 138916, varTopListId = 65},	-- 印度河
	{varObjSnid = 138917, varTopListId = 57},	-- 祝家庄
	{varObjSnid = 138918, varTopListId = 55},	-- 赤血号
	{varObjSnid = 138919, varTopListId = 53},	-- 和氏璧
	{varObjSnid = 138900, varTopListId = 45},	-- 屠龙
	{varObjSnid = 138901, varTopListId = 37},	-- 智力竞赛
	{varObjSnid = 138902, varTopListId = 15},	-- 杀敌
	{varObjSnid = 138903, varTopListId = 17},	-- 战场等级
	{varObjSnid = 138920, varTopListId = 31},	-- 玫瑰
	{varObjSnid = 138921, varTopListId = 47},	-- 小喇叭
	{varObjSnid = 138922, varTopListId = 49}	-- 烟花			
	
}

x310999_var_TopN											= 0 --取toplist的第一个位置的信息
x310999_var_INVALID 									= 4294967295

function x310999_ProcMonsterSpecialAttr( varMap, varMonster, varSnid)
	local result = -1
	if (x310999_IsCorrectMap(varMap) == 1) then 
		-- 返回需要重置名字
		result = x310999_ResetMonsterName(varMap, varMonster, varSnid) 
	end
	
	return result
end

--重置名字
function x310999_ResetMonsterName(varMap, varMonster, varSnid)
	local nWorldId = GetWorldIdEx()
	for i, value in x310999_var_MonsterToplist do
	
		if (varSnid == value.varObjSnid) then
			local rankSnid, rank, country, newName, guildName, snid = 
									GetToplistInfo(nWorldId, value.varTopListId, x310999_var_TopN)
									
			local initName = GetName(varMap, varMonster)
						
			if (snid ~= x310999_var_INVALID and snid ~= -1) then
				if (initName ~= newName) then -- 如果名字有改变,则替换名字
					SetName(varMap, varMonster, newName)
					ChangeMonsterNameBroadcast(varMap, varMonster)
				end
			end
			
			return varMap
		end
		
	end
	return -1
end

--处理toplist更新的逻辑
function x310999_ProcToplistUpdate(varMap)	
	if (x310999_IsCorrectMap(varMap) == 1) then
		
		--遍历地图上的Monster对象,查找要更改的对象 
		local nMonsterCount = GetMonsterCount(varMap)
		
		WriteLog(1, format("x310999_ProcToplistUpdate --- varMap = %d, nMonsterCount = %d",
						varMap, nMonsterCount))
		
		for varI=1,nMonsterCount do
	    local varObj = GetMonsterObjID(varMap,varI-1)
	    if -1 == varObj then
	    	WriteLog(1, "x310999_ProcToplistUpdate error varObj = %d", varObj)
	    end

	    if -1 ~= varObj then
				local varSnid = GetMonsterGUID(varMap,varObj)
				x310999_ResetMonsterName(varMap, varObj, varSnid)
			end
		end
		
	end
end

--判断是否是正确的场景
function x310999_IsCorrectMap(varMap)
	for i, mapId in x310999_var_MapId do
		if (mapId == varMap) then
			return 1
		end
	end
	return 0
end
