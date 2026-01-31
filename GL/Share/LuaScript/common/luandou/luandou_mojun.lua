--´óÂÒ¶·±©¾ý


x589005_var_FileId = 589005


x589005_var_CreatePositions = {
								{varMap= 545 ,posX= 148 ,posZ= 113 ,MonsterType= 18415 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K±©¾ý"},--´óÂÒ¶·±©¾ý
								{varMap= 545 ,posX= 113 ,posZ= 108 ,MonsterType= 18415 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K±©¾ý"},--´óÂÒ¶·±©¾ý
								{varMap= 545 ,posX= 55 ,posZ= 113 ,MonsterType= 18415 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K±©¾ý"},--´óÂÒ¶·±©¾ý
								{varMap= 545 ,posX= 126 ,posZ= 166 ,MonsterType= 18415 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K±©¾ý"},--´óÂÒ¶·±©¾ý
								{varMap= 545 ,posX= 160 ,posZ= 188 ,MonsterType= 18415 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K±©¾ý"},--´óÂÒ¶·±©¾ý
								{varMap= 545 ,posX= 123 ,posZ= 203 ,MonsterType= 18415 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K±©¾ý"},--´óÂÒ¶·±©¾ý
							    {varMap= 545 ,posX= 46 ,posZ= 46 ,MonsterType= 18415 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K±©¾ý"},--´óÂÒ¶·±©¾ý
								{varMap= 545 ,posX= 126 ,posZ= 33 ,MonsterType= 18415 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K±©¾ý"},--´óÂÒ¶·±©¾ý
								{varMap= 545 ,posX= 206 ,posZ= 62 ,MonsterType= 18415 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K±©¾ý"},--´óÂÒ¶·±©¾ý
								{varMap= 545 ,posX= 214 ,posZ= 96 ,MonsterType= 18415 ,varCount= 1 ,ai=1,aiscript=	754, title="#kj#K±©¾ý"},--´óÂÒ¶·±©¾ý
										
							}

function x589005_ProcTimerDoingStart( varMap, varParam1, varParam2, varParam3 )
	--if varMap ~= 51 and varMap ~= 151 and varMap ~= 251 and varMap ~= 351 then
		--	return
	--end
	for varI, item in x589005_var_CreatePositions do
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
					local varObj, objGuid =CreateMonster( varMap, item.MonsterType, varX, z, item.ai, item.aiscript, x589005_var_FileId, -1, 21, 60*60*1000, 0, "", item.title)
			end	
		end
	end
end


function x589005_ProcDie(varMap, varPlayer, varKiller)
	
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
	local varMsg1 = "¡¾±©¾ý¡¿"..title.."#kY#KÒÑ¾­±»"..countryName..killerName.."#c8000FFÔÚ"..scenename.."#kj#K»÷°Ü£¡"

	
	LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
	
	--local varHumanCount = GetScenePlayerCount(varMap)
	--for varI=0,varHumanCount do
  		--local varObj = GetScenePlayerObjId(varMap,varI)
  		--if GetCurCountry(varMap,varKiller) == GetCurCountry(varMap,varObj)  then
			--AddExp(varMap,varObj,15000000)
		
		--	Msg2Player(varMap,varObj,"#G±¾¹ú½«Ê¿³É¹¦»÷É±BOSS»ñµÃ¸ß¶î¾­Ñé½±Àø£¡",8,2)
	--		Msg2Player(varMap,varObj,"#G±¾¹ú½«Ê¿³É¹¦»÷É±BOSS»ñµÃ¸ß¶î¾­Ñé½±Àø£¡",8,3)
	
  		--end
	--end


	GamePlayScriptLog(varMap, varKiller, 501)	
end
