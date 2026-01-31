
x310832_var_FileId = 310832

x310832_var_IsEnableId = 1095

x310832_var_Tick  = -1
x310832_var_Index = 1

x310832_var_DebugToggle  = 0

x310832_var_MonsterTable = {}

x310832_var_Yulebi = 12500307  --仲夏娱乐币

x310832_var_Dropcangbaotu = {
12035016,  --骑乘·黄金藏宝图
12035041,  --秘钻·黄金藏宝图
12035042,	 --洗石·黄金藏宝图
12035043,	 --外装·黄金藏宝图
}

x310832_var_DropZifu = {12500311,12500312,12500313,12500314,12500305,12500306,12500315,12500316}   --纪念章

x310832_var_MonType = {4721,4703,4704,4709,4710,4714,4717,4726,4728,4811,4802,4804,4836,4727,4810,4831,4808,4803,4830,4815,4840,4713}

x310832_var_BuffTable = {
8318, --单凤求凰
8319, --五彩缤纷 
8320, --芳香四溢
8321, --火树银花
8322, --心心相映
8323, --一见钟情
8329, --翩翩年少
8330, --秋水伊人
8331, --玫瑰之约
8332, --情有独钟
}

x310832_var_MonTable = {
{MonsterType = 4830, PosX = 252, PosZ = 335, AI = 6, AIscript = -1, Livetime = 200*1000, Dir = 0, Patrol =16, Title = "仲夏狂欢团" },	--霸气尾行的怪
{MonsterType = 4815, PosX = 258, PosZ = 335, AI = 6, AIscript = -1, Livetime = 200*1000, Dir = 0, Patrol =17, Title = "仲夏狂欢团" },	--霸气尾行的怪
{MonsterType = 4803, PosX = 255, PosZ = 335, AI = 6, AIscript = -1, Livetime = 200*1000, Dir = 0, Patrol =18, Title = "仲夏狂欢团" },	--霸气尾行的怪
{MonsterType = 4840, PosX = 258, PosZ = 331, AI = 6, AIscript = -1, Livetime = 200*1000, Dir = 0, Patrol =17, Title = "仲夏狂欢团" }, --掉落物品的怪
{MonsterType = 4808, PosX = 252, PosZ = 331, AI = 6, AIscript = -1, Livetime = 200*1000, Dir = 0, Patrol =16, Title = "仲夏狂欢团" },	--掉落物品的怪
{MonsterType = 4831, PosX = 255, PosZ = 331, AI = 6, AIscript = -1, Livetime = 200*1000, Dir = 0, Patrol =18, Title = "仲夏狂欢团" },	--掉落物品的怪
{MonsterType = 4810, PosX = 255, PosZ = 328, AI = 6, AIscript = -1, Livetime = 200*1000, Dir = 0, Patrol =18, Title = "仲夏狂欢团" },	--掉落物品的怪
}

function x310832_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4,Param5 )
	if x310832_var_DebugToggle == 1 then
		print("x310832_ProcTimerDoingStart----------varParam1=="..varParam1)
	end
	local year, month, day = GetYearMonthDay();
	local varday = GetDayOfYear()
	if year ~= 2012 or varday < 207 or varday > 242 then    --2011年7月12日到8月15日(体服从2011-7-9开放)
				return
	end
	if GetGameOpenById( x310832_var_IsEnableId) <= 0 then
        return
  end
  x310832_var_MonsterTable = {}  
  x310832_var_Index = 1
  SetWorldTimer( varMap, x310832_var_FileId, "ProcTimerTick", 0, "0", varParam1, varParam2, varParam3 )

	varMsg = "携带大量礼物的仲夏狂欢团出现在大都中心城"
	LuaAllScenceM2Wrold(varMap, varMsg, 5, 0)
	LuaAllScenceM2Wrold(varMap, varMsg, 1, 0)

end

function x310832_ProcTimerTick ( varMap, varParam1, varParam2, varParam3 )

	local minute = GetMinOfDay()
	if varParam1 == 0 then
		if minute > (930 + 2) then     --延迟2分钟关闭timer,给删最后的怪一些时间
			return
		end
	elseif varParam1 == 1 then
		if minute > (1290 + 2) then    --延迟2分钟关闭timer,给删最后的怪一些时间
			return
		end
	end
	
	x310832_var_Tick = x310832_var_Tick + 1
	
	if x310832_var_DebugToggle == 1 then
		print("x310832_var_Tick=="..x310832_var_Tick)
	end
	
	if x310832_var_Tick ~= 0 and mod(x310832_var_Tick, 15) == 0 then
  	x310832_DropItem( varMap)
  end
  
	if mod(x310832_var_Tick, 60) == 0 then
		x310832_CreateMoster (varMap,varParam1)
	end

  
  x310832_DelMoster (varMap)
  SetWorldTimer( varMap, x310832_var_FileId, "ProcTimerTick", 1 * 1000, "0", varParam1, varParam2, varParam3 )
end

function x310832_CreateMoster (varMap,varParam1)

	local minute = GetMinOfDay()
	if varParam1 == 0 then
		if minute > 930 then   --15:31停止刷怪
			return
		end
	elseif varParam1 == 1 then
		if minute > 1290 then  --21:31停止刷怪
			return
		end
	end
	
	local index = 1
	x310832_var_MonsterTable[x310832_var_Index] = {}
	x310832_var_MonType = x310832_GetRandomMonType(varMap)
	for i , item in x310832_var_MonTable do 
		local varObj =CreateMonster( varMap, x310832_var_MonType[i], item.PosX, item.PosZ, item.AI, item.AIscript, -1, -1, 20, item.Livetime, item.Dir, "", item.Title)
		SetPatrolId(varMap, varObj, item.Patrol)
		x310832_var_MonsterTable[x310832_var_Index][index] = {}
		x310832_var_MonsterTable[x310832_var_Index][index] = varObj
		index = index + 1
	end
	
	x310832_var_Index = x310832_var_Index + 1 

end

function x310832_DelMoster (varMap)

	for i, item in x310832_var_MonsterTable do
		for j , k in item do 
	
			if x310832_var_DebugToggle == 1 then
				print(format("j==%d,k==%d",j,k))
			end
		
			if IsObjValid(varMap,k) == 1 and GetHp(varMap,k) > 0 then
				local varX,varZ = GetWorldPos(varMap, k)
				if varZ <= 110 then
					DeleteMonster(varMap, k)
					if x310832_var_DebugToggle == 1 then
						print("------------------------->DeleteMonster")
					end			
					x310832_var_MonsterTable[i][j] = nil
				end						
			end	
		end					
	end
	
end

function x310832_DropItem( varMap)
	local which = random(4,7)
	local probability  = random(1,12)    --1/12几率掉落一个黄金藏宝图
	local probability1 = random(1,2)    --1/2	几率掉落一个仲夏娱乐币
	local varRandom = random(1,600)
	local buff  = x310832_var_BuffTable[random(getn(x310832_var_BuffTable))]
	local index = 0
	for i, item in x310832_var_MonsterTable do
		for j, k in item do
			if IsObjValid(varMap,k) == 1 and GetHp(varMap,k) > 0 then
				if mod(j , which) == 0 then
					StartItemTask(varMap)
					ItemAppend( varMap, 12030074, 2 )   --仲夏薄荷糖
					ItemAppend( varMap, 12030075, 2 )   --仲夏冰激凌
					ItemAppend( varMap, 12030076, 2 )		--狂欢珍宝盒
					
					if probability == 1 then
						ItemAppend( varMap, x310832_var_Dropcangbaotu[random(getn(x310832_var_Dropcangbaotu))], 1 )   --掉落藏宝图
					end
					
					
					DropItemListToScene(varMap, k, 1)
--------------------下面为掉落不绑定道具：字符	-----------------------				
					StartItemTask(varMap)  
					
					if probability1 == 1 then
						ItemAppend( varMap, x310832_var_Yulebi, 1 )   --掉落仲夏娱乐币
					end
					
					if varRandom <= 1 then     -- 1/1200  两天掉一个典字  
						if random(1,2) == 1 then
							index = 8	
						end
					elseif varRandom <= 9 then  -- 8/600
						index = 7
					elseif varRandom <= 19 then		--10/600
						index = 6
					elseif varRandom <= 39 then   -- 20/600
						index = 5
					elseif varRandom <= 99 then  -- 60/600
						index = random(1,4)
					end
					
					if index >= 1 and index <= 8 then
						ItemAppend( varMap, x310832_var_DropZifu[index], 1 )   --掉落字符
					end
					
					DropItemListToScene(varMap, k, 0)
					
					SendSpecificImpactToUnit(varMap, k, k, k,buff, 0);
				end
			end
		end
	end
	
end

function x310832_GetRandomMonType(varMap)

	local Num = getn(x310832_var_MonType)
	for j = 1, Num do
		local n = random(1, Num)
		local m =  random(1, Num)
		if n ~= m then
			local t = x310832_var_MonType[n]
			x310832_var_MonType[n] = x310832_var_MonType[m]
			x310832_var_MonType[m] = t
		end
	end
	return x310832_var_MonType
end
