


x302521_var_FileId = 302521

x302521_var_Createdragonboat = {
	[1] ={id = 8035,x=405,y=455, baseAI = 3, highAI =-1,obj = 400777, campId = 20, liveTime = 115* 1000, name = "   ", title = "", dir = 9,patrol=75, }, 
	[2] ={id = 8036,x=405,y=452, baseAI = 3, highAI =-1,obj = 400778, campId = 20, liveTime = 115* 1000, name = "   ", title = "", dir = 9,patrol=76, }, 
	[3] ={id = 8037,x=405,y=447, baseAI = 3, highAI =-1,obj = 400779, campId = 20, liveTime = 115* 1000, name = "   ", title = "", dir = 9,patrol=78, }, 
	[4] ={id = 8038,x=405,y=450, baseAI = 3, highAI =-1,obj = 400780, campId = 20, liveTime = 115* 1000, name = "   ", title = "", dir = 9,patrol=77, }, 
}

x302521_var_OBJ = {}
--记录创建时候的GUID
x302521_var_GUIDTEMP = {}

--赛龙舟进程
x302521_var_State = 0

x302521_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}

function x302521_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4,Param5 )
	if varParam1 == 1 then
		local objId = {-1,-1,-1,-1}
		--开始创建
		x302521_CreateMon(varMap,varAct)
		
		SetSystemTimerTick( varMap, x302521_var_FileId, "x302521_ProcTimerTick", varAct, 1000)
	elseif varParam1 == 2 then
		local teamname= {"烈火队","宝蓝队","翠杉队","岩峰队"}
		local winteam = GetCountryParam(varMap, 0, CD_COUNTRY_CAIPIAO_COUNT1)
		WriteLog(1, " ------------------------- x302524_ProcEventEntry " .. winteam)
		if winteam <=0 or winteam>4 then return 0 end
		local varMsg = "恭喜"..teamname[winteam].."勇夺龙舟飞渡大赛冠军"
		LuaAllScenceM2Wrold( varMap, varMsg, 5, 1)
	end
end

function x302521_CreateMon(varMap)
	--在大都创建龙舟
	if varMap ~= 0 then return end
	
	--计算名次
	local mingci = {}
--	for a=1,4,1 do
--	for b=1,4,1 do
--	for c=1,4,1 do
--	for d=1,4,1 do
--		if a~=b and a~=c and a~=d and b~=c and b~=d and c~= d then
--			mingci[getn(mingci)+1]={a,b,c,d}
--		end
--	end
--	end
--	end
--	end
	
	local totalcountry = {1,2,3,4}
	local temptable = {}
	local tempCountry = 0
	for i = 1, 4 do
		tempCountry = totalcountry[random(getn(totalcountry))]
		mingci[i] = tempCountry
		local temptableindex = 1
		for countryIndex, country in totalcountry do
			if (country  ~= tempCountry) then
				temptable[temptableindex] = country
				temptableindex = temptableindex + 1
			end
		end
	
		totalcountry = temptable
		temptable = {}
	end

	local tempNum = mingci[1]
	WriteLog(1, format("x302521_CreateMon ---tempNum = %d, aa = %d, bb = %d, cc = %d, dd = %d", 
					tempNum, 
					mingci[1], 
					mingci[2], 
					mingci[3], 
					mingci[4]))
					
	SetCountryParam(varMap, 0, CD_COUNTRY_CAIPIAO_COUNT1, tempNum)
	
		if tempNum == 0 then
		GamePlayScriptLog( varMap, varPlayer, 3816)
		elseif country == 1 then
		GamePlayScriptLog( varMap, varPlayer, 3817)
		elseif country == 2 then
		GamePlayScriptLog( varMap, varPlayer, 3818)
		elseif country == 3 then
		GamePlayScriptLog( varMap, varPlayer, 3819)
		end
	
	
	local countryId = -1
	--创建龙舟
	for i=1,getn(x302521_var_Createdragonboat) do
		 countryId = mingci[i]
		 WriteLog(1, format("x302521_CreateMon --- countryId = %d, i = %d", countryId, i))
		 x302521_var_GUIDTEMP[i] = CreateMonster(varMap,
		 x302521_var_Createdragonboat[countryId].id,
		 x302521_var_Createdragonboat[countryId].x,  
		 x302521_var_Createdragonboat[countryId].y,  
		 x302521_var_Createdragonboat[countryId].baseAI,
		 x302521_var_Createdragonboat[countryId].highAI,
		 x302521_var_FileId, 
		 x302521_var_Createdragonboat[countryId].obj,  
		 x302521_var_Createdragonboat[countryId].campId,                       
		 x302521_var_Createdragonboat[countryId].liveTime, 
		 x302521_var_Createdragonboat[countryId].dir,
		 x302521_var_Createdragonboat[countryId].name,
		 x302521_var_Createdragonboat[countryId].title)
		 x302521_var_OBJ[i]= x302521_var_Createdragonboat[countryId].patrol
	end
	
	
	
end

function x302521_ProcTimerTick(varMap,varAct)
	if x302521_var_State == 0 then
	
		for k,v in x302521_var_GUIDTEMP do
			SetPatrolId(varMap,v,x302521_var_OBJ[k] )
		end
	elseif x302521_var_State == 5 then
		for k,v in x302521_var_GUIDTEMP do
			x302521_buff(varMap,v,k)
		end
	elseif x302521_var_State == 10 then
		for k,v in x302521_var_GUIDTEMP do
			x302521_buff(varMap,v,k)
		end
	elseif x302521_var_State == 15 then
		for k,v in x302521_var_GUIDTEMP do
			x302521_buff(varMap,v,k)
		end
	elseif x302521_var_State == 20 then
		for k,v in x302521_var_GUIDTEMP do
			x302521_buff(varMap,v,k)
		end
	elseif x302521_var_State == 25 then
		for k,v in x302521_var_GUIDTEMP do
			x302521_buff(varMap,v,k)
		end
	elseif x302521_var_State == 30 then
		for k,v in x302521_var_GUIDTEMP do
			x302521_buff(varMap,v,k)
		end
	elseif x302521_var_State == 35 then
		for k,v in x302521_var_GUIDTEMP do
			x302521_buff(varMap,v,k)
		end
	elseif x302521_var_State == 40 then
		for k,v in x302521_var_GUIDTEMP do
			x302521_buff(varMap,v,k)
		end
	elseif x302521_var_State == 45 then
		for k,v in x302521_var_GUIDTEMP do
			x302521_buff(varMap,v,k)
		end
	elseif x302521_var_State == 50 then
		for k,v in x302521_var_GUIDTEMP do
			x302521_buff(varMap,v,k)
		end
	elseif x302521_var_State == 55 then
		for k,v in x302521_var_GUIDTEMP do
			x302521_buff(varMap,v,k)
		end
	elseif x302521_var_State == 60 then
		for k,v in x302521_var_GUIDTEMP do
			x302521_buff(varMap,v,k)
		end
	elseif x302521_var_State == 80 then
		for k,v in x302521_var_GUIDTEMP do
			x302521_buff(varMap,v,k)
		end
	elseif x302521_var_State == 90 then
		for k,v in x302521_var_GUIDTEMP do
			x302521_buff(varMap,v,k)
		end
	elseif x302521_var_State == 100 then
		for k,v in x302521_var_GUIDTEMP do
			x302521_buff(varMap,v,k)
		end
	elseif x302521_var_State == 110 then
		for k,v in x302521_var_GUIDTEMP do
			x302521_buff(varMap,v,k)
		end
	end
	if 	x302521_var_State < 110 then
		SetSystemTimerTick( varMap, x302521_var_FileId, "x302521_ProcTimerTick", varAct, 1000)
		x302521_var_State = x302521_var_State + 1
	else
		x302521_CloseTimer( varMap )
	end
 end
 
--**********************************
--关闭计时器
--**********************************
function x302521_CloseTimer( varMap )
	x302521_var_State = 0
	x302521_var_GUIDTEMP = {}
	x302521_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}   --初试时间置为零
	--演员信息清空
	
end

--**********************************
--随机buff
--**********************************
function x302521_buff(varMap,obj,mingci)
	local buffzengyi = {}
	local buffjianyi = {}
	local gailv = {100,0,0,0}
	local temp = random(100)
	if temp < gailv[mingci] then
		SendSpecificImpactToUnit(varMap, obj, obj, obj, 32613, 0)
	end
	
end
