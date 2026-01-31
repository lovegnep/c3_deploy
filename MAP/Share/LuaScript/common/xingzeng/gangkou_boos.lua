--蓬莱岛BOSS


x588017_var_FileId = 588017


x588017_var_CreatePositions = {
								{varMap= 570 ,posX= 115 ,posZ= 195 ,MonsterType= 18403 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K爆近攻型坐骑"},--蓬莱岛
								{varMap= 570 ,posX= 197 ,posZ= 168 ,MonsterType= 18404 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K爆远攻型坐骑"},--蓬莱岛
								{varMap= 570 ,posX= 148 ,posZ= 64 ,MonsterType= 18405 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K爆魔攻型坐骑"},--蓬莱岛
								{varMap= 570 ,posX= 210 ,posZ= 110 ,MonsterType= 18406 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K爆近攻型坐骑"},--蓬莱岛
								{varMap= 570 ,posX= 213 ,posZ= 49 ,MonsterType= 18407 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K爆远攻型坐骑"},--蓬莱岛
								{varMap= 570 ,posX= 199 ,posZ= 206 ,MonsterType= 18408 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K爆魔攻型坐骑"},--蓬莱岛
										
							}

function x588017_ProcTimerDoingStart( varMap, varParam1, varParam2, varParam3 )
	--if varMap ~= 51 and varMap ~= 151 and varMap ~= 251 and varMap ~= 351 then
		--	return
	--end
	for varI, item in x588017_var_CreatePositions do
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
					local varObj, objGuid =CreateMonster( varMap, item.MonsterType, varX, z, item.ai, item.aiscript, x588017_var_FileId, -1, 21, 60*60*1000, 0, "", item.title)
			end	
		end
	end
end


function x588017_ProcDie(varMap, varPlayer, varKiller)
	
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
	local varMsg1 = "【海都大王】"..title.."#kY#K已经被"..countryName..killerName.."#c8000FF在"..scenename.."#kj#K击败！"

	
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
