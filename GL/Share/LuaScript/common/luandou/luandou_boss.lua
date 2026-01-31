--大乱斗BOSS


x589004_var_FileId = 589004


x589004_var_CreatePositions = {
								{varMap= 545 ,posX= 146 ,posZ= 110 ,MonsterType= 18409 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K爆近攻型坐骑"},--大乱斗BOSS
								{varMap= 545 ,posX= 112 ,posZ= 107 ,MonsterType= 18410 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K爆远攻型坐骑"},--大乱斗BOSS
								{varMap= 545 ,posX= 54 ,posZ= 110 ,MonsterType= 18411 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K爆魔攻型坐骑"},--大乱斗BOSS
								{varMap= 545 ,posX= 129 ,posZ= 168 ,MonsterType= 18412 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K爆近攻型坐骑"},--大乱斗BOSS
								{varMap= 545 ,posX= 163 ,posZ= 185 ,MonsterType= 18413 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K爆远攻型坐骑"},--大乱斗BOSS
								{varMap= 545 ,posX= 125 ,posZ= 201 ,MonsterType= 18414 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K爆魔攻型坐骑"},--大乱斗BOSS
							    {varMap= 545 ,posX= 44 ,posZ= 42 ,MonsterType= 18412 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K爆近攻型坐骑"},--大乱斗BOSS
								{varMap= 545 ,posX= 129 ,posZ= 29 ,MonsterType= 18413 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K爆远攻型坐骑"},--大乱斗BOSS
								{varMap= 545 ,posX= 209 ,posZ= 60 ,MonsterType= 18414 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K爆魔攻型坐骑"},--大乱斗BOSS
								{varMap= 545 ,posX= 216 ,posZ= 99 ,MonsterType= 18412 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K爆近攻型坐骑"},--大乱斗BOSS
										
							}

function x589004_ProcTimerDoingStart( varMap, varParam1, varParam2, varParam3 )
	--if varMap ~= 51 and varMap ~= 151 and varMap ~= 251 and varMap ~= 351 then
		--	return
	--end
	for varI, item in x589004_var_CreatePositions do
		if item.varMap == varMap then
			
			for j=1, item.varCount do
					local r = random(1,3)
					if r < 1 then 
						r = 1 
					end
					if r > 3 then 
						r = 3
					end
					
					local rx = random(-3,3)
					local varX = item.posX + rx
					local rz = random(-3,3)
					local z = item.posZ + rz
					local varObj, objGuid =CreateMonster( varMap, item.MonsterType, varX, z, item.ai, item.aiscript, x589004_var_FileId, -1, 21, 60*60*1000, 0, "", item.title)
			end	
		end
	end
end


function x589004_ProcDie(varMap, varPlayer, varKiller)
	
	if IsObjValid( varMap,varKiller ) ~=1 then
		return
	end
	
	
	if GetObjType(varMap, varKiller) == 3 then
		varKiller = GetMasterObjId(varMap, varKiller)
		if varKiller == nil then
			return
		end
	end
	local title = GetName(varMap,varPlayer)
	local killerName = GetName(varMap,varKiller)
	local countryId = GetCurCountry(varMap, varKiller)
	local countryName = GetCountryName(countryId)
	local scenename = GetSceneInfo(varMap,"NAME")
	local varMsg1 = "【大乱斗BOSS】"..title.."#kY#K已经被"..countryName..killerName.."#c8000FF在"..scenename.."#kj#K击败！"

	
	LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
	
	--local varHumanCount = GetScenePlayerCount(varMap)
	--for varI=0,varHumanCount do
  		--local varObj = GetScenePlayerObjId(varMap,varI)
  		--if GetCurCountry(varMap,varKiller) == GetCurCountry(varMap,varObj)  then
			--AddExp(varMap,varObj,15000000)
		
		--	Msg2Player(varMap,varObj,"#G本国将士成功击杀BOSS获得高额经验奖励！",8,2)
	--		Msg2Player(varMap,varObj,"#G本国将士成功击杀BOSS获得高额经验奖励！",8,3)
	
  		--end
	--end


	GamePlayScriptLog(varMap, varKiller, 501)	
end
